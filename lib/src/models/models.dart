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
    this.startEarly = false,
  });

  final int id;
  final String name;
  final double ectsCredits;
  final DateTime? startDate;
  final DateTime? deadline;
  final String? notes;
  final int? colorValue;
  final bool isSample;

  /// When [startDate] lies in the future, `true` means the student opted to
  /// start now anyway: pace/status are measured from today (or first log),
  /// and the course counts toward today's required pace. `false` (default)
  /// respects the future start: no pressure today, pace is quoted from the
  /// start date, excluded from the hero's today sum.
  final bool startEarly;
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

/// Display size preference: scales text via [TextScaler.linear].
/// Persisted as int (0/1/2). Compact 0.9, Comfortable 1.0, Large 1.15.
enum AppDisplaySize { compact, comfortable, large }

int displaySizeToInt(AppDisplaySize size) => switch (size) {
      AppDisplaySize.compact => 0,
      AppDisplaySize.comfortable => 1,
      AppDisplaySize.large => 2,
    };

AppDisplaySize displaySizeFromInt(int value) => switch (value) {
      0 => AppDisplaySize.compact,
      2 => AppDisplaySize.large,
      _ => AppDisplaySize.comfortable,
    };

extension AppDisplaySizeX on AppDisplaySize {
  double get scale => switch (this) {
        AppDisplaySize.compact => 0.9,
        AppDisplaySize.comfortable => 1.0,
        AppDisplaySize.large => 1.15,
      };

  String get label => switch (this) {
        AppDisplaySize.compact => 'Compact',
        AppDisplaySize.comfortable => 'Comfortable',
        AppDisplaySize.large => 'Large',
      };
}

/// Theme accent preference (persisted as int 0..4). Deliberately avoids the
/// Flutter Material defaults (indigo/blue/purple) — deep teal default.
enum AppAccent { teal, forest, clay, slate, berry }

int accentToInt(AppAccent accent) => switch (accent) {
      AppAccent.teal => 0,
      AppAccent.forest => 1,
      AppAccent.clay => 2,
      AppAccent.slate => 3,
      AppAccent.berry => 4,
    };

AppAccent accentFromInt(int value) => switch (value) {
      1 => AppAccent.forest,
      2 => AppAccent.clay,
      3 => AppAccent.slate,
      4 => AppAccent.berry,
      _ => AppAccent.teal,
    };

extension AppAccentX on AppAccent {
  /// ARGB seed used for `ColorScheme.fromSeed`.
  int get seedValue => switch (this) {
        AppAccent.teal => 0xFF0F766E,
        AppAccent.forest => 0xFF2D5A3D,
        AppAccent.clay => 0xFFB8542E,
        AppAccent.slate => 0xFF51606E,
        AppAccent.berry => 0xFF8E3A5B,
      };

  String get label => switch (this) {
        AppAccent.teal => 'Teal',
        AppAccent.forest => 'Forest',
        AppAccent.clay => 'Clay',
        AppAccent.slate => 'Slate',
        AppAccent.berry => 'Berry',
      };
}

/// App-wide settings (single row).
class AppSettings {
  const AppSettings({
    this.hoursPerEcts = defaultHoursPerEcts,
    this.dailyTargetMinutes = 0,
    this.firstWeekday = DateTime.monday,
    this.themeMode = AppThemeMode.system,
    this.paceToleranceDays = defaultPaceToleranceDays,
    this.weeklyOverloadHours = defaultWeeklyOverloadHours,
    this.displaySize = AppDisplaySize.comfortable,
    this.accent = AppAccent.teal,
  });

  /// Default ECTS conversion factor per AGENTS.md §4.
  static const double defaultHoursPerEcts = 30;

  /// Default ahead/behind tolerance: surplus/deficit must reach this many
  /// days of current need before the label flips (user-agreed 5-day band).
  static const double defaultPaceToleranceDays = 5;

  /// Default Coming-load overload cutoff (hours/week). Weeks above this are
  /// flagged red. Full-time study ≈ 35–40 h/week; adjustable in Settings.
  static const double defaultWeeklyOverloadHours = 35;

  final double hoursPerEcts;
  final int dailyTargetMinutes;
  /// ISO weekday (DateTime.monday..DateTime.sunday) used for weekly totals.
  final int firstWeekday;
  final AppThemeMode themeMode;

  /// Days of current daily need that ahead/behind must accumulate.
  /// 0 = sensitive (any surplus/deficit flips), 5 = stable band.
  final double paceToleranceDays;

  /// Coming-load weeks above this many hours are flagged as overload.
  /// Range 5..100 h/week.
  final double weeklyOverloadHours;

  /// Display size (text scale). Compact 0.9, Comfortable 1.0, Large 1.15.
  final AppDisplaySize displaySize;

  /// Theme accent seed (away from Material indigo/blue/purple defaults).
  final AppAccent accent;

  AppSettings copyWith({
    double? hoursPerEcts,
    int? dailyTargetMinutes,
    int? firstWeekday,
    AppThemeMode? themeMode,
    double? paceToleranceDays,
    double? weeklyOverloadHours,
    AppDisplaySize? displaySize,
    AppAccent? accent,
  }) {
    return AppSettings(
      hoursPerEcts: hoursPerEcts ?? this.hoursPerEcts,
      dailyTargetMinutes: dailyTargetMinutes ?? this.dailyTargetMinutes,
      firstWeekday: firstWeekday ?? this.firstWeekday,
      themeMode: themeMode ?? this.themeMode,
      paceToleranceDays: paceToleranceDays ?? this.paceToleranceDays,
      weeklyOverloadHours: weeklyOverloadHours ?? this.weeklyOverloadHours,
      displaySize: displaySize ?? this.displaySize,
      accent: accent ?? this.accent,
    );
  }
}
