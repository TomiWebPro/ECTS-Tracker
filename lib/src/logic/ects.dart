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

/// Required daily pace (hours/day) to hit the deadline.
///
/// Uses the **actual time remaining** to the deadline (not whole calendar days)
/// so a deadline 14 hours away yields an honest pace rather than treating it as
/// a full day.
///
/// Null when there is no deadline, when the deadline has already passed, or
/// when the deadline day has arrived ([remainingDays] == 0 on the same calendar
/// day): no finite pace can still hit it, so there is no number to report
/// (avoids a divide by zero). The status engine still reports such a course as
/// [CourseStatus.behind] while hours remain.
double? requiredDailyHours(double remaining, DateTime? deadline, DateTime now) {
  if (deadline == null) return null;
  // Preserve the ECTS-022/AGENTS.md §4 deadline-day semantic: same calendar day
  // with hours outstanding => no finite pace (status reports behind).
  if (remainingDays(deadline, now) == 0) return null;
  final minutesLeft = deadline.difference(now).inMinutes;
  if (minutesLeft <= 0) return null;
  return remaining / (minutesLeft / (60 * 24));
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

/// Time actually elapsed from the course [startDate] to [now], in days
/// (fractional, so a same-day start is a small positive number, not 0).
///
/// Returns 0 when there is no start date or the start date is not yet reached.
double elapsedDays(DateTime? startDate, DateTime now) {
  if (startDate == null) return 0;
  final minutes = now.difference(startDate).inMinutes;
  return minutes > 0 ? minutes / (60 * 24) : 0;
}

/// The pace (hours/day) the student has actually *finished* so far, measured
/// from the start date: `completedHours / elapsedDays`. Null when the start
/// date has not been reached yet (pace undefined, never a divide by 0). A start
/// that coincides with [now] yields 0 h/day.
///
/// Without a start date the baseline falls back to the earliest logged
/// [sessions] date when present (zero-duration sessions are ignored); with no
/// baseline at all the pace is null.
double? finishedDailyPace(
  double completed,
  DateTime? startDate,
  DateTime now, {
  Iterable<StudySession> sessions = const [],
}) {
  final baseline = _paceBaseline(startDate, sessions);
  if (baseline == null) return null;
  final minutes = now.difference(baseline).inMinutes;
  if (minutes < 0) return null;
  if (minutes == 0) return 0;
  return completed / (minutes / (60 * 24));
}

/// Which instant the achieved pace of a course is measured from.
///
/// The start date when the course has one; otherwise the **first logged
/// session** — a course with no start date still has evidence of when study
/// actually began (AGENTS.md §4: the normal case is a user who sets only a
/// deadline). Using the logged history keeps a single early session from
/// masquerading as a full elapsed period. Null when there is neither (nothing
/// can be said about pace).
DateTime? _paceBaseline(DateTime? startDate, Iterable<StudySession> sessions) {
  if (startDate != null) return startDate;
  DateTime? first;
  for (final s in sessions) {
    if (s.minutes <= 0) continue;
    if (first == null || s.date.isBefore(first)) first = s.date;
  }
  return first;
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
  /// has arrived (no finite pace exists and no division by zero) — such a
  /// course is [CourseStatus.behind] while hours remain outstanding.
  final double? requiredDailyHours;
  final double? requiredWeeklyHours;
}

/// Computes the full derived summary for one course (AGENTS.md §4).
///
/// The decision order is deliberate:
/// 1. remaining ≤ 0 → [CourseStatus.completed] (an over-completed past-deadline
///    course is still completed, not overdue).
/// 2. deadline strictly before [now] → [CourseStatus.overdue].
/// 3. deadline day has arrived (0 days left) with hours still outstanding →
///    [CourseStatus.behind]: no finite pace can hit a deadline that is already
///    today, so the shortfall is unbounded, never healthy `onTrack`
///    (`requiredDailyHours` stays null there — reporting only, no divide by 0).
/// 4. no deadline → [CourseStatus.onTrack] (no schedule to be behind).
/// 5. logged hours above the linear expectation to date → [CourseStatus.ahead].
/// 6. otherwise the course finishes on time at the pace it has *actually*
///    achieved so far ([finishedDailyPace]) → [CourseStatus.onTrack].
/// 7. when the achieved pace is below the [requiredDailyHours] needed to hit
///    the deadline → [CourseStatus.behind]. This is the only way a course can
///    be behind: the finished-hours baseline is measured against the pace
///    actually required from here on, not the linear expectation.
///
/// A course without a start date has no linear expectation (step 5 is skipped),
/// but it is **not** therefore always [CourseStatus.onTrack]: its achieved pace
/// is measured from its first logged session, so a deadline-only course — the
/// normal case, a user who sets just a deadline — that logs too little, or
/// nothing at all, is correctly reported [CourseStatus.behind].
CourseProgress courseProgress({
  required double ectsCredits,
  required double hoursPerEcts,
  required Iterable<StudySession> sessions,
  DateTime? startDate,
  DateTime? deadline,
  required DateTime now,
}) {
  final required = requiredHours(ectsCredits, hoursPerEcts);
  final logged = sessions.toList(growable: false);
  final done = completedHours(logged);
  final left = remainingHours(required, done);
  final daysLeft = remainingDays(deadline, now);

  final status = _status(
    remaining: left,
    completed: done,
    required: required,
    sessions: logged,
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
  required Iterable<StudySession> sessions,
  required DateTime? startDate,
  required DateTime? deadline,
  required DateTime now,
}) {
  if (remaining <= 0) return CourseStatus.completed;
  if (isPastDeadline(deadline, now)) return CourseStatus.overdue;

  // Deadline day itself: hours still outstanding means no pace, however large,
  // forms a valid schedule from here on — a deadline-day shortfall is `behind`,
  // never `onTrack`. Past deadlines are already handled above.
  final daysLeft = remainingDays(deadline, now);
  if (daysLeft != null && daysLeft == 0) return CourseStatus.behind;

  // No deadline → nothing to fall behind; there is no required pace to compare.
  if (deadline == null) return CourseStatus.onTrack;

  final expected = expectedHoursToDate(required, startDate, deadline, now);
  if (expected != null && completed > expected) return CourseStatus.ahead;

  // Level with (or without) the linear expectation: the course is on track only
  // if the pace it has actually achieved so far would still finish in time. The
  // baseline is the start date, or the first logged session when there is none.
  final achieved = finishedDailyPace(completed, startDate, now, sessions: sessions);
  final needed = requiredDailyHours(remaining, deadline, now);
  // No finished-pace baseline (no start date and nothing logged yet) or a
  // deadline day that has arrived → cannot prove a shortfall → on track.
  if (achieved == null || needed == null) return CourseStatus.onTrack;
  return achieved + _paceEpsilon >= needed
      ? CourseStatus.onTrack
      : CourseStatus.behind;
}

/// Tolerance so floating-point noise on an exact-pace course is not labelled
/// `behind` (pace is in hours/day).
const double _paceEpsilon = 1e-9;

DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);
