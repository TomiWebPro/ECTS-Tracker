import 'package:ects_tracker/src/data/result.dart';
import 'package:ects_tracker/src/models/reminder_settings.dart';
import 'package:ects_tracker/src/notifications/reminder_prefs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Reminder prefs contract (ECTS-072/083): defaults, clamping on load,
/// validation on save, overdue counters. Uses the SharedPreferences mock —
/// no device needed, Windows-safe.
void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues(const {});
  });

  ReminderPrefsRepository prefs() => ReminderPrefsRepository();

  test('load returns defaults on empty store', () async {
    final loaded = await prefs().load();
    expect(loaded.enabled, isFalse);
    expect(loaded.timeMinutes, ReminderSettings.defaultReminderTimeMinutes);
    expect(loaded.warnDays, ReminderSettings.defaultDeadlineWarnDays);
  });

  test('save then load round-trips', () async {
    final repo = prefs();
    final saved =
        await repo.save(const ReminderSettings(enabled: true, timeMinutes: 480, warnDays: 2));
    expect(saved, isA<Ok>());
    final loaded = await repo.load();
    expect(loaded.enabled, isTrue);
    expect(loaded.timeMinutes, 480);
    expect(loaded.warnDays, 2);
  });

  test('save rejects out-of-range time and window', () async {
    final repo = prefs();
    expect(
      await repo.save(const ReminderSettings(timeMinutes: 1440)),
      isA<Err>(),
    );
    expect(
      await repo.save(const ReminderSettings(timeMinutes: -1)),
      isA<Err>(),
    );
    expect(
      await repo.save(const ReminderSettings(warnDays: 15)),
      isA<Err>(),
    );
    // Rejected saves leave the stored row untouched.
    expect((await repo.load()).timeMinutes,
        ReminderSettings.defaultReminderTimeMinutes);
  });

  test('load clamps hand-edited out-of-range values', () async {
    SharedPreferences.setMockInitialValues(const {
      'reminder.timeMinutes': 9999,
      'reminder.warnDays': -5,
    });
    final loaded = await prefs().load();
    expect(loaded.timeMinutes, 1439);
    expect(loaded.warnDays, 0);
  });

  test('overdue fire counts start at 0 and increment', () async {
    final repo = prefs();
    expect(await repo.overdueCount('c1'), 0);
    await repo.recordOverdueFire('c1');
    await repo.recordOverdueFire('c1');
    expect(await repo.overdueCount('c1'), 2);
    // Keys are per course-deadline.
    expect(await repo.overdueCount('c2'), 0);
  });
}
