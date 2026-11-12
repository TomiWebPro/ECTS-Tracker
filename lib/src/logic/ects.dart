/// The single home for all ECTS formulas (AGENTS.md §3/§4).
///
/// Nothing here stores state: every function takes raw inputs and returns a
/// freshly computed value.
library;

import '../models/models.dart';
import 'date_utils.dart';

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
  final diff = dateOnly(deadline).difference(dateOnly(now)).inDays;
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

/// "Current pace" used by the status engine (AGENTS.md §4, ECTS-008): hours/day
/// achieved so far from the study baseline (start date, or earliest logged
/// session when there is no start date). ECTS-031 policy: this is the
/// cumulative achieved pace over the elapsed baseline period — a burst of
/// logging in a single sitting is reflected as the rate over that elapsed time.
/// Returns null when no pace baseline exists (start date not reached and nothing
/// logged) so the status engine cannot prove a shortfall (ECTS-037).
double? currentDailyPace(
  double completed,
  DateTime? startDate,
  DateTime now, {
  Iterable<StudySession> sessions = const [],
}) =>
    finishedDailyPace(completed, startDate, now, sessions: sessions);

/// True when [startDate] lies on a calendar day after [now]: the course has
/// not started yet.
bool isFutureStart(DateTime? startDate, DateTime now) {
  if (startDate == null) return false;
  return dateOnly(startDate).isAfter(dateOnly(now));
}

/// Effective pace baseline for a course.
///
/// Past/today starts are unchanged. A future start respected by the student
/// (`startEarly == false`) stays in the future so pace stays undefined until
/// then. Opting to start now (`startEarly == true`) moves the baseline to the
/// earliest log (when present) or to [now], so time is divided until now and
/// early work counts toward status.
DateTime? effectivePaceStart({
  required DateTime? startDate,
  required bool startEarly,
  required DateTime now,
  required Iterable<StudySession> sessions,
}) {
  if (startDate == null) return null;
  if (!isFutureStart(startDate, now)) return startDate;
  if (!startEarly) return startDate;
  DateTime? first;
  for (final s in sessions) {
    if (s.minutes <= 0) continue;
    if (first == null || s.date.isBefore(first)) first = s.date;
  }
  if (first != null && !first.isAfter(now)) return first;
  return now;
}

/// Required daily pace quoted from the (future) start date instead of today:
/// `remaining / (deadline - startDate)`. Null unless both bounds exist and the
/// start precedes the deadline. Used for `Scheduled` display ("2.1 h/day from
/// Mar 10") so a future course is not divided by today's longer runway.
double? requiredDailyHoursFromStart(
  double remaining,
  DateTime? startDate,
  DateTime? deadline,
) {
  if (startDate == null || deadline == null || remaining <= 0) return null;
  final minutes = deadline.difference(startDate).inMinutes;
  if (minutes <= 0) return null;
  return remaining / (minutes / (60 * 24));
}

/// True when a course is scheduled for the future and the student chose NOT to
/// start early: excluded from today's required pace, shown under Upcoming.
bool isScheduledCourse(Course course, DateTime now) =>
    isFutureStart(course.startDate, now) && !course.startEarly;

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
/// 5. running schedule with a linear expectation → 5-day workload band:
///    `surplus = completed - expected`, `need = remaining / timeLeft`,
///    `buffer = 5 * need`. `surplus >= +buffer` → [CourseStatus.ahead],
///    `surplus <= -buffer` → [CourseStatus.behind], else [CourseStatus.onTrack].
///    A single session (e.g. 1.5 h of 360 h) cannot flip the label — it takes
///    five full days of over/under-work.
/// 6. no linear expectation (e.g. deadline-only course) → pace comparison:
///    [finishedDailyPace] vs [requiredDailyHours]. This is the only way a
///    deadline-only course can be behind. `ahead` is unreachable here (no
///    expectation to be ahead of).
///
/// A course without a start date has no linear expectation (step 5 is skipped),
/// but it is **not** therefore always [CourseStatus.onTrack]: its achieved pace
/// is measured from its first logged session, so a deadline-only course — the
/// normal case, a user who sets just a deadline — that logs too little, or
/// nothing at all, is correctly reported [CourseStatus.behind].
/// Default ahead/behind tolerance (days of current need). Exposed in Settings.
const double defaultPaceToleranceDays = 5;

CourseProgress courseProgress({
  required double ectsCredits,
  required double hoursPerEcts,
  required Iterable<StudySession> sessions,
  DateTime? startDate,
  DateTime? deadline,
  required DateTime now,
  bool startEarly = false,
  double toleranceDays = defaultPaceToleranceDays,
}) {
  final required = requiredHours(ectsCredits, hoursPerEcts);
  final logged = sessions.toList(growable: false);
  final done = completedHours(logged);
  final left = remainingHours(required, done);
  final daysLeft = remainingDays(deadline, now);
  final effectiveStart = effectivePaceStart(
    startDate: startDate,
    startEarly: startEarly,
    now: now,
    sessions: logged,
  );

  final status = _status(
    remaining: left,
    completed: done,
    required: required,
    sessions: logged,
    startDate: effectiveStart,
    deadline: deadline,
    now: now,
    toleranceDays: toleranceDays,
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
  double toleranceDays = defaultPaceToleranceDays,
}) =>
    courseProgress(
      ectsCredits: course.ectsCredits,
      hoursPerEcts: hoursPerEcts,
      sessions: sessions,
      startDate: course.startDate,
      deadline: course.deadline,
      now: now,
      startEarly: course.startEarly,
      toleranceDays: toleranceDays,
    );

/// True when the deadline *day* is already before today — the deadline day
/// itself is never "past". Null deadline is never past.
bool isPastDeadline(DateTime? deadline, DateTime now) {
  if (deadline == null) return false;
  return dateOnly(deadline).isBefore(dateOnly(now));
}

CourseStatus _status({
  required double remaining,
  required double completed,
  required double required,
  required Iterable<StudySession> sessions,
  required DateTime? startDate,
  required DateTime? deadline,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
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

  // Workload band (Settings → tolerance, default 5 days): ahead/behind
  // require ±toleranceDays of normal workload (need), not a single session.
  // surplus = completed - expected. Middle band → onTrack (stable).
  final scheduleActive =
      startDate == null || !dateOnly(startDate).isAfter(dateOnly(now));
  if (scheduleActive) {
    final expected = expectedHoursToDate(required, startDate, deadline, now);
    final needForBuffer = requiredDailyHours(remaining, deadline, now);
    if (expected != null && needForBuffer != null) {
      final surplus = completed - expected;
      final buffer = toleranceDays * needForBuffer;
      if (surplus >= buffer) return CourseStatus.ahead;
      if (surplus <= -buffer) return CourseStatus.behind;
      return CourseStatus.onTrack;
    }
  }

  // No linear expectation (e.g. deadline-only course): fall back to the
  // achieved vs needed pace check. Ahead is unreachable here.
  final achieved = currentDailyPace(completed, startDate, now, sessions: sessions);
  final needed = requiredDailyHours(remaining, deadline, now);
  // ECTS-037 policy (AGENTS.md §4 "no sessions logged"): with a start date the
  // achieved pace is 0 h/day, so a running schedule is `behind` — a provable
  // shortfall. With no start date, no sessions, and no provable pace baseline at
  // all, a shortfall cannot be established; such a course is reported `onTrack`
  // (nothing to measure "needs higher pace" against). Deadline day with hours
  // outstanding is already handled above (`behind`, pace null).
  if (achieved == null || needed == null) return CourseStatus.onTrack;
  return achieved + _paceEpsilon >= needed
      ? CourseStatus.onTrack
      : CourseStatus.behind;
}

/// Tolerance so floating-point noise on an exact-pace course is not labelled
/// `behind` (pace is in hours/day).
const double _paceEpsilon = 1e-9;
