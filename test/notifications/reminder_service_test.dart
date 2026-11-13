import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/logic/custom_reminders.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:ects_tracker/src/notifications/reminder_prefs.dart';
import 'package:ects_tracker/src/notifications/reminder_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

final DateTime now = DateTime(2026, 11, 11, 19, 0);

/// English copy for scheduler assertions (logic pins English; localized
/// rendering is covered by reminder_text_test.dart).
AppLocalizations get en => lookupAppLocalizations(const Locale('en'));

Course course({
  required int id,
  required String name,
  required double ects,
  DateTime? start,
  DateTime? deadline,
}) =>
    Course(id: id, name: name, ectsCredits: ects, startDate: start, deadline: deadline);

StudySession session({
  required int courseId,
  required int minutes,
  required DateTime date,
}) =>
    StudySession(id: 0, courseId: courseId, minutes: minutes, date: date);

class RecordedCall {
  RecordedCall(this.kind, this.id, this.title, this.body, this.when);
  final String kind;
  final int id;
  final String? title;
  final String? body;
  final Object? when;
}

class FakeBackend implements NotificationBackend {
  final calls = <RecordedCall>[];
  var granted = true;
  var cancelAllCount = 0;

  @override
  Future<bool> requestPermissions() async => granted;

  @override
  Future<void> showNow({required int id, required String title, required String body, String? payload}) async {
    calls.add(RecordedCall('show', id, title, body, null));
  }

  @override
  Future<void> scheduleDaily({required int id, required String title, required String body, required int timeMinutes, String? payload}) async {
    calls.add(RecordedCall('daily', id, title, body, timeMinutes));
  }

  @override
  Future<void> scheduleOnce({required int id, required String title, required String body, required DateTime fireAt, String? payload}) async {
    calls.add(RecordedCall('once', id, title, body, fireAt));
  }

  @override
  Future<void> cancel(int id) async {
    calls.add(RecordedCall('cancel', id, null, null, null));
  }

  @override
  Future<void> cancelAll() async {
    cancelAllCount++;
  }

  Iterable<RecordedCall> get scheduled => calls.where((c) => c.kind == 'daily' || c.kind == 'once');
}

Future<ReminderPrefsRepository> prefsWith(Map<String, Object> values) async {
  SharedPreferences.setMockInitialValues(values);
  return ReminderPrefsRepository();
}

Future<ReminderPrefsRepository> enabledPrefs() => prefsWith({
      'reminder.enabled': true,
      'reminder.timeMinutes': 19 * 60,
      'reminder.warnDays': 3,
    });

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ReminderService.reschedule', () {
    test('disabled cancels everything', () async {
      final backend = FakeBackend();
      final prefs = await prefsWith({});
      await ReminderService(backend, prefs).reschedule(
        courses: const [],
        sessions: const [],
        hoursPerEcts: 30,
                toleranceDays: 5,
        now: now,
        l10n: en,
      );
      expect(backend.cancelAllCount, 1);
      expect(backend.scheduled, isEmpty);
    });

    test('schedules the daily plan when work is due', () async {
      final backend = FakeBackend();
      final prefs = await enabledPrefs();
      await ReminderService(backend, prefs).reschedule(
        courses: [course(id: 1, name: 'Linear Algebra', ects: 5, deadline: DateTime(2026, 11, 21, 19))],
        sessions: const [],
        hoursPerEcts: 30,
                toleranceDays: 5,
        now: now,
        l10n: en,
      );
      final daily = backend.calls.where((c) => c.kind == 'daily').toList();
      expect(daily, hasLength(1));
      expect(daily.first.id, 1000);
      expect(daily.first.title, contains('Tonight:'));
      expect(daily.first.when, 19 * 60);
    });

    test('cancels the daily ping when nothing is due', () async {
      final backend = FakeBackend();
      final prefs = await enabledPrefs();
      await ReminderService(backend, prefs).reschedule(
        courses: [course(id: 1, name: 'Done', ects: 1, deadline: DateTime(2026, 11, 21, 19))],
        sessions: [session(courseId: 1, minutes: 30 * 60, date: DateTime(2026, 11, 10, 10))],
        hoursPerEcts: 30,
                toleranceDays: 5,
        now: now,
        l10n: en,
      );
      expect(backend.calls.where((c) => c.kind == 'daily'), isEmpty);
      expect(backend.calls.any((c) => c.kind == 'cancel' && c.id == 1000), isTrue);
    });

    test('overdue escalates immediately, max twice ever', () async {
      final backend = FakeBackend();
      final prefs = await enabledPrefs();
      final courses = [course(id: 1, name: 'Late', ects: 5, deadline: DateTime(2026, 11, 1, 12))];
      Future<void> run() => ReminderService(backend, prefs).reschedule(
            courses: courses,
            sessions: const [],
            hoursPerEcts: 30,
                        toleranceDays: 5,
            now: now,
            l10n: en,
          );
      await run();
      await run();
      await run();
      final shows = backend.calls.where((c) => c.kind == 'show').toList();
      expect(shows, hasLength(2));
      expect(shows.first.title, startsWith('❌ Late'));
    });

    test('same-day countdown fires at reminder time', () async {
      final backend = FakeBackend();
      final prefs = await enabledPrefs();
      await ReminderService(backend, prefs).reschedule(
        courses: [course(id: 1, name: 'Soon', ects: 5, deadline: DateTime(2026, 11, 13, 19))],
        sessions: const [],
        hoursPerEcts: 30,
        toleranceDays: 5,
        now: DateTime(2026, 11, 11, 18, 0),
        l10n: en,
      );
      final once = backend.calls.where((c) => c.kind == 'once').toList();
      expect(once, hasLength(1));
      expect(once.first.id, 2001);
      expect(once.first.when, DateTime(2026, 11, 11, 19, 0));
    });

    test('custom once schedules at its fire time; past is skipped', () async {
      final backend = FakeBackend();
      final prefs = await enabledPrefs();
      await prefs.saveCustom([
        CustomSchedule.once(id: 7, fireAt: DateTime(2026, 11, 12, 8), courseId: 1),
        CustomSchedule.once(id: 8, fireAt: DateTime(2026, 11, 10, 8), courseId: 1),
      ]);
      await ReminderService(backend, prefs).reschedule(
        courses: [course(id: 1, name: 'Steady', ects: 1)],
        sessions: const [],
        hoursPerEcts: 30,
                toleranceDays: 5,
        now: now,
        l10n: en,
      );
      final once = backend.calls.where((c) => c.kind == 'once').toList();
      expect(once, hasLength(1));
      expect(once.first.id, 5007);
      expect(once.first.when, DateTime(2026, 11, 12, 8));
    });

    test('custom weekly schedules its next fire', () async {
      final backend = FakeBackend();
      final prefs = await enabledPrefs();
      await prefs.saveCustom([
        CustomSchedule.weekly(id: 9, weekdays: {now.weekday}, timeMinutes: 20 * 60, courseId: 1),
      ]);
      await ReminderService(backend, prefs).reschedule(
        courses: [course(id: 1, name: 'Steady', ects: 1)],
        sessions: const [],
        hoursPerEcts: 30,
                toleranceDays: 5,
        now: now,
        l10n: en,
      );
      final once = backend.calls.where((c) => c.kind == 'once').toList();
      expect(once, hasLength(1));
      expect(once.first.when, DateTime(2026, 11, 11, 20, 0));
    });
  });

  group('ReminderPrefsRepository', () {
    test('save rejects out-of-range prefs', () async {
      final prefs = await prefsWith({});
      final current = await prefs.load();
      expect(current.enabled, isFalse);
      expect(
        await prefs.save(current.copyWith(timeMinutes: 1440)),
        isA<Err>(),
      );
      expect(
        await prefs.save(current.copyWith(warnDays: 99)),
        isA<Err>(),
      );
    });

    test('custom round-trip keeps good rows, skips malformed', () async {
      final prefs = await prefsWith({
        'reminder.custom':
            '[{"id":1,"recurrence":"weekly","weekdays":[3],"timeMinutes":1140},'
                '{"id":"bad"},{"id":2,"recurrence":"once"}]',
      });
      final loaded = await prefs.loadCustom();
      expect(loaded.map((s) => s.id), [1]);
    });
  });
}



