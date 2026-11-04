/// The single home for all ECTS formulas (AGENTS.md §3/§4).
///
/// Nothing here stores state: every function takes raw inputs and returns a
/// freshly computed value.
library;

import '../models/models.dart';

/// `requiredHours = ectsCredits * hoursPerEcts` (default hoursPerEcts = 30).
double requiredHours(double ectsCredits, double hoursPerEcts) {
  if (hoursPerEcts <= 0) {
    throw ArgumentError.value(hoursPerEcts, 'hoursPerEcts', 'must be > 0');
  }
  if (ectsCredits <= 0) return 0;
  return ectsCredits * hoursPerEcts;
}

/// Hours logged so far, derived from session minutes.
double completedHours(Iterable<StudySession> sessions) {
  var total = 0.0;
  for (final s in sessions) {
    if (s.minutes > 0) total += s.minutes / 60.0;
  }
  return total;
}

/// Hours left to reach the requirement (never negative).
double remainingHours(double required, double completed) {
  final left = required - completed;
  return left > 0 ? left : 0;
}

/// Fraction complete in `[0, 1]`. Returns 0 when [required] is zero.
double progressFraction(double required, double completed) {
  if (required <= 0) return 0;
  final p = completed / required;
  if (p < 0) return 0;
  if (p > 1) return 1;
  return p;
}

/// Whole days from [now] to [deadline], floored at 0. Null when no deadline.
int? remainingDays(DateTime? deadline, DateTime now) {
  if (deadline == null) return null;
  final diff = _dateOnly(deadline).difference(_dateOnly(now)).inDays;
  return diff > 0 ? diff : 0;
}

/// Required daily pace (hours/day) to hit the deadline. Null / 0 handled.
double? requiredDailyHours(double remaining, DateTime? deadline, DateTime now) {
  final days = remainingDays(deadline, now);
  if (days == null || days == 0) return null;
  return remaining / days;
}

/// Required weekly pace (hours/week).
double? requiredWeeklyHours(double remaining, DateTime? deadline, DateTime now) {
  final daily = requiredDailyHours(remaining, deadline, now);
  return daily == null ? null : daily * 7;
}

/// Expected hours completed by linear interpolation from [startDate] to
/// [deadline]. Null when either bound is missing or the span is non-positive.
double? expectedHoursToDate(
  double required,
  DateTime? startDate,
  DateTime? deadline,
  DateTime now,
) {
  if (startDate == null || deadline == null || required <= 0) return null;
  final span = deadline.difference(startDate).inMinutes;
  if (span <= 0) return null;
  final elapsed = now.difference(startDate).inMinutes;
  if (elapsed <= 0) return 0;
  if (elapsed >= span) return required;
  return required * (elapsed / span);
}

/// Where a course stands against its deadline, computed from logged hours and
/// elapsed time (AGENTS.md §4). Never stored.
enum CourseStatus {
  /// Requirement met (remaining hours ≤ 0).
  completed,

  /// Past the deadline with hours still outstanding.
  overdue,

  /// More hours logged than the linear expectation to date.
  ahead,

  /// Current pace finishes on time.
  onTrack,

  /// Needs a higher pace than the current one to finish on time.
  behind,
}

/// Everything the UI needs to render one course, all of it derived.
class CourseProgress {
  const CourseProgress({
    required this.requiredHours,
    required this.completedHours,
    required this.remainingHours,
    required this.progressFraction,
    required this.status,
    required this.remainingDays,
    required this.requiredDailyHours,
    required this.requiredWeeklyHours,
  });

  final double requiredHours;
  final double completedHours;
  final double remainingHours;
  final double progressFraction;
  final CourseStatus status;

  /// Days left to the deadline, floored at 0. Null when the course has none.
  final int? remainingDays;

  /// Hours/day still needed. Null without a deadline or once the deadline day
  /// is reached (no division by zero).
  final double? requiredDailyHours;
  final double? requiredWeeklyHours;
}

/// Computes the full derived summary for one course (AGENTS.md §4).
///
/// The decision order is deliberate:
/// 1. remaining ≤ 0 → [CourseStatus.completed] (an over-completed past-deadline
///    course is still completed, not overdue).
/// 2. deadline strictly before [now] → [CourseStatus.overdue].
/// 3. no deadline / no start date (no linear expectation exists) → [CourseStatus.onTrack].
/// 4. logged hours above expectation to date → [CourseStatus.ahead], otherwise
///    [CourseStatus.onTrack] — a course is never "behind" while it is ahead of
///    or level with the linear expectation.
CourseProgress courseProgress({
  required double ectsCredits,
  required double hoursPerEcts,
  required Iterable<StudySession> sessions,
  DateTime? startDate,
  DateTime? deadline,
  required DateTime now,
}) {
  final required = requiredHours(ectsCredits, hoursPerEcts);
  final done = completedHours(sessions);
  final left = remainingHours(required, done);
  final daysLeft = remainingDays(deadline, now);

  final status = _status(
    remaining: left,
    completed: done,
    required: required,
    startDate: startDate,
    deadline: deadline,
    now: now,
  );

  final daily = requiredDailyHours(left, deadline, now);

  return CourseProgress(
    requiredHours: required,
    completedHours: done,
    remainingHours: left,
    progressFraction: progressFraction(required, done),
    status: status,
    remainingDays: daysLeft,
    requiredDailyHours: daily,
    requiredWeeklyHours: daily == null ? null : daily * 7,
  );
}

/// Convenience overload for a [Course] model plus its [sessions].
CourseProgress courseProgressFor(
  Course course,
  Iterable<StudySession> sessions, {
  required double hoursPerEcts,
  required DateTime now,
}) =>
    courseProgress(
      ectsCredits: course.ectsCredits,
      hoursPerEcts: hoursPerEcts,
      sessions: sessions,
      startDate: course.startDate,
      deadline: course.deadline,
      now: now,
    );

/// True when the deadline *day* is already before today — the deadline day
/// itself is never "past". Null deadline is never past.
bool isPastDeadline(DateTime? deadline, DateTime now) {
  if (deadline == null) return false;
  return _dateOnly(deadline).isBefore(_dateOnly(now));
}

CourseStatus _status({
  required double remaining,
  required double completed,
  required double required,
  required DateTime? startDate,
  required DateTime? deadline,
  required DateTime now,
}) {
  if (remaining <= 0) return CourseStatus.completed;
  if (isPastDeadline(deadline, now)) return CourseStatus.overdue;

  final expected = expectedHoursToDate(required, startDate, deadline, now);
  if (expected == null || completed <= expected) return CourseStatus.onTrack;
  return CourseStatus.ahead;
}

DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);
