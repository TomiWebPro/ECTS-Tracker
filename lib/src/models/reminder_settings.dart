/// Reminder preferences (M9, ECTS-072).
///
/// Plain-Dart value object. Persisted in SharedPreferences (see
/// `lib/src/notifications/reminder_prefs.dart`) — deliberately NOT in the
/// Drift Settings table, so this ships without touching `models.dart` /
/// a schema migration.
library;

class ReminderSettings {
  const ReminderSettings({
    this.enabled = false,
    this.timeMinutes = defaultReminderTimeMinutes,
    this.warnDays = defaultDeadlineWarnDays,
  });

  static const int defaultReminderTimeMinutes = 19 * 60;
  static const int defaultDeadlineWarnDays = 3;

  final bool enabled;

  /// Minutes since midnight (local) for the daily ping. 0..1439.
  final int timeMinutes;

  /// Deadline countdown window (days). 0..14, 0 disables countdowns.
  final int warnDays;

  ReminderSettings copyWith({
    bool? enabled,
    int? timeMinutes,
    int? warnDays,
  }) {
    return ReminderSettings(
      enabled: enabled ?? this.enabled,
      timeMinutes: timeMinutes ?? this.timeMinutes,
      warnDays: warnDays ?? this.warnDays,
    );
  }
}
