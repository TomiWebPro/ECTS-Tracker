import 'dart:convert';

import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/logic/study_timer.dart';
import 'package:ects_tracker/src/notifications/study_timer_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Timer phone-alert contract (M11, ECTS-093): pure content/details
/// builders plus the background action handler's prefs behavior.
void main() {
  AppLocalizations en() => lookupAppLocalizations(const Locale('en'));

  StudyTimerState runningAt(int runningSinceMs) => StudyTimerState(
        courseId: 7,
        initialStartedAtMs: runningSinceMs - 5000,
        runningSinceMs: runningSinceMs,
        courseName: 'Algebra',
      );

  group('buildTimerAlertContent', () {
    test('running uses the chronometer base, tap-to-open body', () {
      final now = DateTime.now();
      final c = buildTimerAlertContent(
        courseName: 'Algebra',
        timer: runningAt(now.millisecondsSinceEpoch),
        l10n: en(),
        now: now,
      );
      expect(c.title, 'Timing Algebra');
      expect(c.body, isNotEmpty);
      expect(c.useChronometer, isTrue);
      expect(c.chronometerBaseMs, now.millisecondsSinceEpoch);
    });

    test('paused freezes into a static elapsed body', () {
      const timer = StudyTimerState(
        courseId: 7,
        initialStartedAtMs: 1000000,
        accumulatedSec: 372,
      );
      final c = buildTimerAlertContent(
        courseName: 'Algebra',
        timer: timer,
        l10n: en(),
        now: DateTime.now(),
      );
      expect(c.useChronometer, isFalse);
      expect(c.chronometerBaseMs, isNull);
      expect(c.body, 'Paused · 0:06:12');
    });
  });

  group('timerAlertDetails', () {
    NotificationDetails details(bool running) => timerAlertDetails(
          running: running,
          chronometerBaseMs: running ? 123456 : null,
          pauseLabel: 'Pause',
          resumeLabel: 'Resume',
          finishLabel: 'Finish & log 3 min',
          discardLabel: 'Discard',
        );

    test('running frame: chronometer + pause action', () {
      final d = details(true).android!;
      expect(d.ongoing, isTrue);
      expect(d.autoCancel, isFalse);
      expect(d.usesChronometer, isTrue);
      expect(d.when, 123456);
      expect(d.actions!.map((a) => a.id).toList(), [
        studyTimerActionPause,
        studyTimerActionFinish,
        studyTimerActionDiscard,
      ]);
    });

    test('paused frame: static time + resume action', () {
      final d = details(false).android!;
      expect(d.usesChronometer, isFalse);
      expect(d.actions!.map((a) => a.id).toList(), [
        studyTimerActionResume,
        studyTimerActionFinish,
        studyTimerActionDiscard,
      ]);
    });

    test('finish opens the app, others stay in the shade', () {
      final actions = details(true).android!.actions!;
      final finish = actions.firstWhere(
          (a) => a.id == studyTimerActionFinish);
      expect(finish.showsUserInterface, isTrue);
      for (final a in actions.where(
          (a) => a.id != studyTimerActionFinish)) {
        expect(a.showsUserInterface, isFalse);
        expect(a.cancelNotification, isFalse);
      }
    });

    test('iOS category follows the running state', () {
      expect(
        details(true).iOS!.categoryIdentifier,
        'study_timer_running',
      );
      expect(
        details(false).iOS!.categoryIdentifier,
        'study_timer_paused',
      );
    });
  });

  group('handleTimerActionBackground (prefs-only)', () {
    NotificationResponse action(String id) => NotificationResponse(
          id: studyTimerNotificationId,
          actionId: id,
          notificationResponseType:
              NotificationResponseType.selectedNotificationAction,
        );

    test('pause banks the running segment', () async {
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      SharedPreferences.setMockInitialValues({
        'studyTimer.json': jsonEncode(StudyTimerState(
          courseId: 7,
          initialStartedAtMs: nowMs - 5000,
          runningSinceMs: nowMs - 60000,
          courseName: 'Algebra',
        ).toJson()),
      });
      handleTimerActionBackground(action(studyTimerActionPause));
      for (var i = 0; i < 40; i++) {
        final loaded = await StudyTimerPrefsLoad.load();
        if (loaded != null && !loaded.isRunning) break;
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
      final loaded = await StudyTimerPrefsLoad.load();
      expect(loaded, isNotNull);
      expect(loaded!.isRunning, isFalse);
      expect(loaded.accumulatedSec, greaterThanOrEqualTo(60));
    });

    test('resume restarts a paused timer', () async {
      SharedPreferences.setMockInitialValues({
        'studyTimer.json': jsonEncode(const StudyTimerState(
          courseId: 7,
          initialStartedAtMs: 1000000,
          accumulatedSec: 120,
          courseName: 'Algebra',
        ).toJson()),
      });
      handleTimerActionBackground(action(studyTimerActionResume));
      for (var i = 0; i < 40; i++) {
        final loaded = await StudyTimerPrefsLoad.load();
        if (loaded != null && loaded.isRunning) break;
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
      expect((await StudyTimerPrefsLoad.load())?.isRunning, isTrue);
    });

    test('discard clears without needing the plugin', () async {
      SharedPreferences.setMockInitialValues({
        'studyTimer.json': jsonEncode(const StudyTimerState(
          courseId: 7,
          initialStartedAtMs: 1000000,
          runningSinceMs: 1000000,
        ).toJson()),
      });
      handleTimerActionBackground(action(studyTimerActionDiscard));
      for (var i = 0; i < 40; i++) {
        if (await StudyTimerPrefsLoad.load() == null) break;
        await Future<void>.delayed(const Duration(milliseconds: 50));
      }
      expect(await StudyTimerPrefsLoad.load(), isNull);
    });

    test('finish is left for the foreground (no-op in background)',
        () async {
      final blob = jsonEncode(const StudyTimerState(
        courseId: 7,
        initialStartedAtMs: 1000000,
        runningSinceMs: 1000000,
      ).toJson());
      SharedPreferences.setMockInitialValues({'studyTimer.json': blob});
      handleTimerActionBackground(action(studyTimerActionFinish));
      await Future<void>.delayed(const Duration(milliseconds: 200));
      // Untouched: opening the app completes the finish there.
      expect(await StudyTimerPrefsLoad.load(), isNotNull);
    });
  });
}

/// Test-only loader sharing the production prefs key.
abstract class StudyTimerPrefsLoad {
  static Future<StudyTimerState?> load() async {
    final s = await SharedPreferences.getInstance();
    final raw = s.getString('studyTimer.json');
    if (raw == null || raw.isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return StudyTimerState.tryFromJson(
        Map<String, Object?>.from(decoded),
      );
    } catch (_) {
      return null;
    }
  }
}
