/// Plain-Dart domain models.
///
/// Only raw persisted data lives here. Every derived value (required hours,
/// completed hours, remaining hours, progress, pace, status) is computed in
/// `lib/src/logic/ects.dart` — never stored on these objects.
library;

/// A single course the student is tracking.
class Course {
  const Course({
    required this.id,
    required this.name,
    required this.ectsCredits,
    this.startDate,
    this.deadline,
    this.notes,
    this.colorValue,
    this.isSample = false,
  });

  final int id;
  final String name;
  final double ectsCredits;
  final DateTime? startDate;
  final DateTime? deadline;
  final String? notes;
  final int? colorValue;
  final bool isSample;
}

/// A logged study session (duration in minutes).
class StudySession {
  const StudySession({
    required this.id,
    required this.courseId,
    required this.minutes,
    required this.date,
    this.notes,
    this.isSample = false,
  });

  final int id;
  final int courseId;
  final int minutes;
  final DateTime date;
  final String? notes;
  final bool isSample;

  /// Hours derived from minutes.
  double get hours => minutes / 60.0;
}

/// Display theme preference (persisted as int for a simple schema).
enum AppThemeMode { system, light, dark }

int themeModeToInt(AppThemeMode mode) => switch (mode) {
      AppThemeMode.system => 0,
      AppThemeMode.light => 1,
      AppThemeMode.dark => 2,
    };

AppThemeMode themeModeFromInt(int value) => switch (value) {
      1 => AppThemeMode.light,
      2 => AppThemeMode.dark,
      _ => AppThemeMode.system,
    };

/// App-wide settings (single row).
class AppSettings {
  const AppSettings({
    this.hoursPerEcts = defaultHoursPerEcts,
    this.dailyTargetMinutes = 0,
    this.firstWeekday = DateTime.monday,
    this.themeMode = AppThemeMode.system,
  });

  /// Default ECTS conversion factor per AGENTS.md §4.
  static const double defaultHoursPerEcts = 30;

  final double hoursPerEcts;
  final int dailyTargetMinutes;
  /// ISO weekday (DateTime.monday..DateTime.sunday) used for weekly totals.
  final int firstWeekday;
  final AppThemeMode themeMode;

  AppSettings copyWith({
    double? hoursPerEcts,
    int? dailyTargetMinutes,
    int? firstWeekday,
    AppThemeMode? themeMode,
  }) {
    return AppSettings(
      hoursPerEcts: hoursPerEcts ?? this.hoursPerEcts,
      dailyTargetMinutes: dailyTargetMinutes ?? this.dailyTargetMinutes,
      firstWeekday: firstWeekday ?? this.firstWeekday,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
