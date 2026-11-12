/// Reminder-content computation for study nudges (M9, ECTS-070).
///
/// Pure Dart: only `models.dart` + `ects.dart`. No plugins, no
/// `BuildContext`, no database — so this runs under `flutter test` on any
/// OS (including Windows, where OS notifications cannot be exercised).
/// Copy is English v1; localization follows the M7 pattern later.
/// Full rules: `docs/reminders-spec.md`.
library;

import '../models/models.dart';
import 'ects.dart';

/// Stable notification IDs for the platform layer (ECTS-072).
const int dailyReminderId = 1000;
const int deadlineReminderIdBase = 2000;
const int overdueReminderIdBase = 3000;
const int streakReminderId = 4000;

/// Max courses named inline in one message before folding into "+N more".
const int maxNamedCourses = 2;

/// Default deadline countdown window (days).
const int defaultDeadlineWarnDays = 3;

enum ReminderKind { daily, behind, deadline, overdue, streak, custom }

/// One nudge the app may show. [courseId] set for per-course messages so a
/// tap can deep-link to the course; null for aggregate (daily/streak).
class ReminderContent {
  const ReminderContent({
    required this.kind,
    required this.title,
    required this.body,
    this.courseId,
  });

  final ReminderKind kind;
  final String title;
  final String body;
  final int? courseId;
}

/// Consecutive-day logging streak + hours logged in the last 7 calendar
/// days (inclusive of today).
class StreakInfo {
  const StreakInfo({required this.days, required this.weekHours});

  final int days;
  final double weekHours;
}

/// Hours formatted for notification copy: `2` not `2.0`, else one decimal.
String formatHours(double hours) =>
    hours % 1 == 0 ? hours.toStringAsFixed(0) : hours.toStringAsFixed(1);

Map<int, List<StudySession>> _sessionsByCourse(
    Iterable<StudySession> sessions) {
  final byCourse = <int, List<StudySession>>{};
  for (final s in sessions) {
    (byCourse[s.courseId] ??= <StudySession>[]).add(s);
  }
  return byCourse;
}

class _PaceNeed {
  const _PaceNeed(this.course, this.pace);
  final Course course;
  final double pace;
}

/// Tonight's total still needed, aggregated over started, incomplete
/// courses with a finite required pace. Null when nothing is due (all
/// completed/ahead, no deadlines, or only scheduled-future courses).
ReminderContent? computeDailyPlan({
  required List<Course> courses,
  required List<StudySession> sessions,
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
}) {
  final byCourse = _sessionsByCourse(sessions);
  // Hours already logged today per course: the nudge states what is STILL
  // needed (ECTS-075) — "studied 3 h of a 4 h day ⇒ 1 h left", never the
  // full need on top of today's work.
  final today = DateTime(now.year, now.month, now.day);
  double todayHoursFor(int courseId) {
    var minutes = 0;
    for (final s in byCourse[courseId] ?? const <StudySession>[]) {
      if (s.minutes <= 0) continue;
      final day = DateTime(s.date.year, s.date.month, s.date.day);
      if (day == today) minutes += s.minutes;
    }
    return minutes / 60.0;
  }

  final needs = <_PaceNeed>[];
  for (final course in courses) {
    if (isScheduledCourse(course, now)) continue;
    final sessionsForCourse =
        byCourse[course.id] ?? const <StudySession>[];
    final progress = courseProgressFor(
      course,
      sessionsForCourse,
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    // Skip when no finite pace exists today (no deadline, deadline-day,
    // completed) — checked on live remaining first.
    if (progress.requiredDailyHours == null ||
        progress.requiredDailyHours! <= 0) {
      continue;
    }
    final loggedToday = todayHoursFor(course.id);
    // Today's target is the start-of-day pace: remaining as if nothing had
    // been logged today. Still needed = target − logged today.
    final target = requiredDailyHours(
            progress.remainingHours + loggedToday, course.deadline, now) ??
        0;
    final share = target - loggedToday;
    if (share <= 1e-9) continue;
    needs.add(_PaceNeed(course, share));
  }
  if (needs.isEmpty) return null;
  needs.sort((a, b) => b.pace.compareTo(a.pace));
  final total = needs.fold(0.0, (sum, n) => sum + n.pace);
  final named = needs.take(maxNamedCourses).toList();
  final rest = needs.length - named.length;
  final parts = [
    for (final n in named)
      '${n.course.name} ${formatHours(n.pace)} h left today',
  ];
  final detail = rest > 0 ? '${parts.join(' · ')} (+$rest more)' : parts.join(' · ');
  return ReminderContent(
    kind: ReminderKind.daily,
    title: '📚 Tonight: ${formatHours(total)} h to stay on track',
    body: '$detail. Log a session to clear today.',
  );
}

/// Per-course "slipped to Behind" nudges (folded into the daily ping by the
/// scheduler — no extra push). Capped at 2, most urgent first.
List<ReminderContent> computeBehindNudges({
  required List<Course> courses,
  required List<StudySession> sessions,
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
}) {
  final byCourse = _sessionsByCourse(sessions);
  final out = <ReminderContent>[];
  final behind = <Course>[];
  for (final course in courses) {
    if (isScheduledCourse(course, now)) continue;
    final progress = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    if (progress.status == CourseStatus.behind) behind.add(course);
  }
  behind.sort((a, b) {
    int daysOf(Course c) => remainingDays(c.deadline, now) ?? 1 << 30;
    final cmp = daysOf(a).compareTo(daysOf(b));
    if (cmp != 0) return cmp;
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  });
  for (final course in behind.take(2)) {
    final progress = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    final left = progress.remainingHours;
    final days = progress.remainingDays;
    final pace = progress.requiredDailyHours;
    final sessions = byCourse[course.id] ?? const <StudySession>[];
    String body;
    if (pace == null) {
      // Deadline-day (or past) with hours outstanding: no finite pace
      // exists, so report action instead of a number (ects.dart rule).
      body =
          '${formatHours(left)} h still open and the deadline is here. Anything you log now counts.';
    } else {
      // Honest catch-up: the hours that provably flip status back out of
      // behind (ECTS-075 — never a hardcoded session size).
      final catchUp = catchUpHoursToOnTrack(
        course,
        sessions,
        hoursPerEcts: hoursPerEcts,
        now: now,
        toleranceDays: toleranceDays,
      );
      if (catchUp >= left - 1e-9) {
        body =
            '${formatHours(left)} h left, $days days to go — ${formatHours(pace)} h/day from here. Only finishing the full ${formatHours(left)} h clears this — start tonight.';
      } else {
        // Round UP so the promise holds (hi sits on the flip boundary).
        final display = (catchUp * 10).ceil() / 10;
        body =
            '${formatHours(left)} h left, $days days to go — ${formatHours(pace)} h/day from here. Log ${formatHours(display)} h to get back On track.';
      }
    }
    out.add(ReminderContent(
      kind: ReminderKind.behind,
      title: '⚠️ ${course.name} slipped to Behind',
      body: body,
      courseId: course.id,
    ));
  }
  return out;
}

/// Minimal extra hours that flip a `behind` course back out of it.
///
/// Found by bisection over the engine itself ([courseProgressFor] with a
/// synthetic session dated [now]): exact by construction, so this can never
/// drift from the status rules. The synthetic session never moves the pace
/// baseline (it is dated [now], never earlier than real history), and
/// status is monotonic in logged hours (more work only raises the surplus
/// and lowers the need), so the bisection converges. Returns 0 when the
/// course is not currently behind; returns the full remaining hours when
/// only finishing clears it (deadline-day, or less time left than the
/// tolerance band absorbs).
double catchUpHoursToOnTrack(
  Course course,
  Iterable<StudySession> sessions, {
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
}) {
  final base = sessions.toList(growable: false);
  final progress = courseProgressFor(
    course,
    base,
    hoursPerEcts: hoursPerEcts,
    now: now,
    toleranceDays: toleranceDays,
  );
  if (progress.status != CourseStatus.behind) return 0;
  var lo = 0.0;
  var hi = progress.remainingHours;
  for (var i = 0; i < 40; i++) {
    final mid = (lo + hi) / 2;
    final trial = [
      ...base,
      StudySession(
          id: -1,
          courseId: course.id,
          minutes: (mid * 60).round(),
          date: now),
    ];
    final status = courseProgressFor(
      course,
      trial,
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    ).status;
    if (status == CourseStatus.behind) {
      lo = mid;
    } else {
      hi = mid;
    }
  }
  return hi;
}

/// Deadline countdown pings for courses due within [warnDays] (1..warnDays,
/// soonest first, max 3). Skips completed and scheduled-future courses.
List<ReminderContent> computeDeadlineCountdowns({
  required List<Course> courses,
  required List<StudySession> sessions,
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
  int warnDays = defaultDeadlineWarnDays,
}) {
  final byCourse = _sessionsByCourse(sessions);
  final due = <Course>[];
  for (final course in courses) {
    if (course.deadline == null || isScheduledCourse(course, now)) continue;
    final progress = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    if (progress.status == CourseStatus.completed) continue;
    final days = progress.remainingDays;
    if (days != null && days >= 1 && days <= warnDays) due.add(course);
  }
  due.sort((a, b) {
    final cmp = remainingDays(a.deadline, now)!
        .compareTo(remainingDays(b.deadline, now)!);
    if (cmp != 0) return cmp;
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  });
  final out = <ReminderContent>[];
  for (final course in due.take(3)) {
    final progress = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    final left = progress.remainingHours;
    final days = progress.remainingDays!;
    final pace = progress.requiredDailyHours;
    if (days == 1) {
      out.add(ReminderContent(
        kind: ReminderKind.deadline,
        title: '🚨 ${course.name} is due tomorrow and still has ${formatHours(left)} h open',
        body: 'Anything you log today counts double.',
        courseId: course.id,
      ));
    } else {
      out.add(ReminderContent(
        kind: ReminderKind.deadline,
        title: '⏳ ${course.name} exam in $days days — ${formatHours(left)} h left',
        body: pace == null
            ? 'Every hour you log now counts.'
            : "That's ${formatHours(pace)} h/day. Split it: 2 sessions a day beats one marathon.",
        courseId: course.id,
      ));
    }
  }
  return out;
}

/// Overdue escalations (max 2 returned; the max-2-ever-per-deadline gate
/// lives in the platform layer with persistence). Oldest deadline first.
List<ReminderContent> computeOverdue({
  required List<Course> courses,
  required List<StudySession> sessions,
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
}) {
  final byCourse = _sessionsByCourse(sessions);
  final late = <Course>[];
  for (final course in courses) {
    final progress = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    if (progress.status == CourseStatus.overdue) late.add(course);
  }
  late.sort((a, b) {
    final da = a.deadline;
    final db = b.deadline;
    if (da == null && db == null) return 0;
    if (da == null) return 1;
    if (db == null) return -1;
    final cmp = da.compareTo(db);
    if (cmp != 0) return cmp;
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  });
  return [
    for (final course in late.take(2))
      ReminderContent(
        kind: ReminderKind.overdue,
        title:
            '❌ ${course.name} passed its deadline with ${formatHours(courseProgressFor(course, byCourse[course.id] ?? const <StudySession>[], hoursPerEcts: hoursPerEcts, now: now, toleranceDays: toleranceDays).remainingHours)} h open',
        body: 'Move the deadline or finish the hours — the course stays in Needs attention until then.',
        courseId: course.id,
      ),
  ];
}

/// Consecutive calendar days with >0 logged minutes. Counts back from
/// today; when today is still empty the streak starts at yesterday (still
/// alive). [weekHours] covers the last 7 calendar days including today.
StreakInfo computeStreak({
  required List<StudySession> sessions,
  required DateTime now,
}) {
  final dayTotals = <DateTime, int>{};
  for (final s in sessions) {
    if (s.minutes <= 0) continue;
    final day = DateTime(s.date.year, s.date.month, s.date.day);
    dayTotals[day] = (dayTotals[day] ?? 0) + s.minutes;
  }
  final today = DateTime(now.year, now.month, now.day);
  var cursor =
      (dayTotals[today] ?? 0) > 0 ? today : today.subtract(const Duration(days: 1));
  var days = 0;
  while ((dayTotals[cursor] ?? 0) > 0) {
    days++;
    cursor = cursor.subtract(const Duration(days: 1));
  }
  var weekMinutes = 0;
  for (var i = 0; i < 7; i++) {
    weekMinutes += dayTotals[today.subtract(Duration(days: i))] ?? 0;
  }
  return StreakInfo(days: days, weekHours: weekMinutes / 60.0);
}

/// Weekly celebration ping. Returns null unless [streak.days] >= 2 and
/// every non-scheduled course is on track or better. The at-most-1-per-week
/// gate lives in the platform layer.
ReminderContent? computeStreakNudge({
  required List<Course> courses,
  required List<StudySession> sessions,
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
}) {
  final streak = computeStreak(sessions: sessions, now: now);
  if (streak.days < 2) return null;
  final byCourse = _sessionsByCourse(sessions);
  for (final course in courses) {
    if (isScheduledCourse(course, now)) continue;
    final status = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    ).status;
    if (status == CourseStatus.behind || status == CourseStatus.overdue) {
      return null;
    }
  }
  return ReminderContent(
    kind: ReminderKind.streak,
    title:
        '🔥 ${streak.days}-day streak — ${formatHours(streak.weekHours)} h this week',
    body: 'All courses On track or Ahead. Nice run.',
  );
}

/// Hours logged on [now]'s calendar day. Lets the caller compose the
/// "Today is covered" variant when [computeDailyPlan] returns null.
double todayLoggedHours({
  required List<StudySession> sessions,
  required DateTime now,
}) {
  final today = DateTime(now.year, now.month, now.day);
  var minutes = 0;
  for (final s in sessions) {
    if (s.minutes <= 0) continue;
    final day = DateTime(s.date.year, s.date.month, s.date.day);
    if (day == today) minutes += s.minutes;
  }
  return minutes / 60.0;
}

/// Full ordered nudge set for one scheduling moment: overdue first, then
/// deadline countdowns, behind nudges, the daily plan, and the streak
/// celebration. Empty when [enabled] is false.
List<ReminderContent> computeReminders({
  required List<Course> courses,
  required List<StudySession> sessions,
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
  int warnDays = defaultDeadlineWarnDays,
  bool enabled = true,
}) {
  if (!enabled) return const [];
  final out = <ReminderContent>[
    ...computeOverdue(
      courses: courses,
      sessions: sessions,
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    ),
    ...computeDeadlineCountdowns(
      courses: courses,
      sessions: sessions,
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
      warnDays: warnDays,
    ),
    ...computeBehindNudges(
      courses: courses,
      sessions: sessions,
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    ),
  ];
  final daily = computeDailyPlan(
    courses: courses,
    sessions: sessions,
    hoursPerEcts: hoursPerEcts,
    now: now,
    toleranceDays: toleranceDays,
  );
  if (daily != null) out.add(daily);
  final streak = computeStreakNudge(
    courses: courses,
    sessions: sessions,
    hoursPerEcts: hoursPerEcts,
    now: now,
    toleranceDays: toleranceDays,
  );
  if (streak != null) out.add(streak);
  return out;
}
