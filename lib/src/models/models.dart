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

/// App-wide settings (single row).
class AppSettings {
  const AppSettings({
    this.hoursPerEcts = defaultHoursPerEcts,
    this.dailyTargetMinutes = 0,
  });

  /// Default ECTS conversion factor per AGENTS.md §4.
  static const double defaultHoursPerEcts = 30;

  final double hoursPerEcts;
  final int dailyTargetMinutes;
}
