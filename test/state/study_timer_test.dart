import 'dart:convert';

import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/notifications/study_timer_alerts.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/state/study_timer_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Study-timer provider contract (M11, ECTS-092): start/pause/resume/
/// discard, reboot-restore finishing with ceil minutes on the start day.
void main() {
  late AppDatabase db;

  setUp(() async {
    SharedPreferences.setMockInitialValues(const {});
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  ProviderContainer container() => ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(db)],
      );

  test('start rejects a second timer, pause/resume/discard work',
      () async {
    final c = container();
    addTearDown(c.dispose);
    var r = await c.read(studyTimerProvider.notifier).start(1);
    expect(r.toString(), contains('Ok'));
    expect(c.read(studyTimerProvider)?.isRunning, isTrue);

    r = await c.read(studyTimerProvider.notifier).start(2);
    expect(r.toString(), contains('Err'));

    await c.read(studyTimerProvider.notifier).pause();
    expect(c.read(studyTimerProvider)?.isRunning, isFalse);

    await c.read(studyTimerProvider.notifier).resume();
    expect(c.read(studyTimerProvider)?.isRunning, isTrue);

    await c.read(studyTimerProvider.notifier).discard();
    expect(c.read(studyTimerProvider), isNull);
  });

  test('finish restores a pre-reboot running timer, logs ceil minutes',
      () async {
    final courseId =
        ((await CourseRepository(db).addCourse(name: 'A', ectsCredits: 5))
                as Ok<int>)
            .value;
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    SharedPreferences.setMockInitialValues({
      'studyTimer.json': jsonEncode({
        'courseId': courseId,
        // Run started 5s ago; the pre-kill segment ran 150s.
        'initialStartedAtMs': nowMs - 5000,
        'accumulatedSec': 0,
        'runningSinceMs': nowMs - 150 * 1000,
        'notes': 'rev',
      }),
    });
    final c = container();
    addTearDown(c.dispose);
    for (var i = 0;
        i < 40 && c.read(studyTimerProvider) == null;
        i++) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
    }
    final restored = c.read(studyTimerProvider);
    expect(restored, isNotNull);
    expect(restored!.isRunning, isTrue);

    final res =
        await c.read(studyTimerProvider.notifier).finishAndLog();
    expect(res.toString(), contains('Ok'));
    final sessions = await SessionRepository(db).getAll();
    expect(sessions, hasLength(1));
    expect(sessions.first.minutes, 3); // ceil(150s / 60)
    expect(sessions.first.notes, 'rev');
    expect(c.read(studyTimerProvider), isNull);
  });

  group('phone alerts (ECTS-093)', () {
    ProviderContainer alertContainer(RecordingTimerAlerts rec) =>
        ProviderContainer(overrides: [
          databaseProvider.overrideWithValue(db),
          timerAlertBackendProvider.overrideWithValue(rec),
        ]);

    test('start pushes a running frame with the course name', () async {
      await CourseRepository(db).addCourse(name: 'Algebra', ectsCredits: 5);
      final rec = RecordingTimerAlerts();
      final c = alertContainer(rec);
      addTearDown(c.dispose);
      await c.read(studyTimerProvider.notifier).start(1);
      expect(rec.shows, hasLength(1));
      expect(rec.shows.first.running, isTrue);
      expect(rec.shows.first.title, 'Timing Algebra');
      expect(rec.shows.first.chronometerBaseMs, isNotNull);
      expect(rec.cancels, 0);
    });

    test('pause/resume re-push frozen/running frames, discard cancels',
        () async {
      await CourseRepository(db).addCourse(name: 'A', ectsCredits: 5);
      final rec = RecordingTimerAlerts();
      final c = alertContainer(rec);
      addTearDown(c.dispose);
      await c.read(studyTimerProvider.notifier).start(1);
      await c.read(studyTimerProvider.notifier).pause();
      expect(rec.shows.last.running, isFalse);
      expect(rec.shows.last.body, contains('Paused'));
      await c.read(studyTimerProvider.notifier).resume();
      expect(rec.shows.last.running, isTrue);
      await c.read(studyTimerProvider.notifier).discard();
      expect(rec.cancels, 1);
    });

    test('finish cancels the alert after logging', () async {
      final courseId =
          ((await CourseRepository(db).addCourse(name: 'A', ectsCredits: 5))
                  as Ok<int>)
              .value;
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      SharedPreferences.setMockInitialValues({
        'studyTimer.json': jsonEncode({
          'courseId': courseId,
          'initialStartedAtMs': nowMs - 5000,
          'accumulatedSec': 0,
          'runningSinceMs': nowMs - 150 * 1000,
        }),
      });
      final rec = RecordingTimerAlerts();
      final c = alertContainer(rec);
      addTearDown(c.dispose);
      for (var i = 0;
          i < 40 && c.read(studyTimerProvider) == null;
          i++) {
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
      await c.read(studyTimerProvider.notifier).finishAndLog();
      expect((await SessionRepository(db).getAll()), hasLength(1));
      expect(rec.cancels, 1);
    });
  });
}

/// Recording phone-alert backend (ECTS-093): asserts the notifier pushes
/// the right frames without touching the OS.
class RecordingTimerAlerts implements TimerAlertBackend {
  final shows = <TimerAlertVisuals>[];
  var cancels = 0;

  @override
  Stream<String> get actionEvents => const Stream.empty();

  @override
  Future<bool> requestPermissions() async => true;

  @override
  Future<void> showTimer(TimerAlertVisuals visuals) async {
    shows.add(visuals);
  }

  @override
  Future<void> cancelTimer() async {
    cancels++;
  }
}
