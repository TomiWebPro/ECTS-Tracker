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

DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);
