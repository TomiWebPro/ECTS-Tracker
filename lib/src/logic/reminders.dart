/// Reminder-content computation for study nudges (M9, ECTS-070).
///
/// Pure Dart: only `models.dart` + `ects.dart`. No plugins, no
/// `BuildContext`, no database — so this runs under `flutter test` on any
/// OS (including Windows, where OS notifications cannot be exercised).
/// Copy is English v1; localization follows the M7 pattern later.
/// Full rules: `docs/reminders-spec.md`.
library;

import '../models/models.dart';
import 'date_utils.dart';
import 'ects.dart';
import 'locale_format.dart';
import 'pace_format.dart';
import 'session_totals.dart';

/// Stable notification IDs for the platform layer (ECTS-072).
const int dailyReminderId = 1000;
const int deadlineReminderIdBase = 2000;
const int overdueReminderIdBase = 3000;
const int streakReminderId = 4000;

/// Stable per-course/per-schedule notification ID.
///
/// Course and schedule IDs are small autoincrement ints, but a bare
/// `% 100000` folds distinct rows onto one platform ID (one course cancels
/// another's alarm). Mix [base] and [id] into the 31-bit positive range
/// instead: deterministic, no collisions in practice, still a valid
/// Android notification ID.
int notificationId(int base, int id) =>
    ((base * 1000033) ^ (id * 2654435761)) & 0x7fffffff;

/// Max courses named inline in one message before folding into "+N more".
const int maxNamedCourses = 2;

/// Max behind/overdue courses given their own nudge in one schedule pass.
const int maxNudgedCourses = 2;

/// Max upcoming deadlines listed in one countdown/summary.
const int maxCountdownCourses = 3;

/// Sort key pushing deadline-less courses last ("no deadline sorts last").
const int noDeadlineSortLast = 1 << 30;

/// Default deadline countdown window (days).
const int defaultDeadlineWarnDays = 3;

enum ReminderKind { daily, behind, deadline, overdue, streak, custom }

/// One nudge the app may show. [courseId] set for per-course messages so a
/// tap can deep-link to the course; null for aggregate (daily/streak).
///
/// [messageId]/[args] carry the same content in structured form so the
/// presentation layer can localize it (`reminder_text.dart`):
/// `title`/`body` stay English v1 (pinned by logic tests) while the preview
/// feed and the OS scheduler render the localized variant. Numbers in
/// [args] are raw (`double` hours, `int` counts/days); names are [String];
/// the daily per-course breakdown is parallel `names`/`durations` lists plus
/// a folded `rest` count.
class ReminderContent {
  const ReminderContent({
    required this.kind,
    required this.title,
    required this.body,
    this.courseId,
    required this.messageId,
    this.args = const {},
  });

  final ReminderKind kind;
  final String title;
  final String body;
  final int? courseId;
  final String messageId;
  final Map<String, Object> args;
}

/// Consecutive-day logging streak + hours logged in the last 7 calendar
/// days (inclusive of today).
class StreakInfo {
  const StreakInfo({required this.days, required this.weekHours});

  final int days;
  final double weekHours;
}

/// Hours formatted for notification copy: `2` not `2.0`, else one decimal.
/// [locale] selects the decimal separator (`2,9` in de); default `en`
/// keeps the historical rendering byte-identical.
String formatHours(double hours, {String? locale}) =>
    formatHoursLocalized(hours, locale: locale);

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
  final byCourse = groupSessionsByCourse(sessions);
  // Hours already logged today per course: the nudge states what is STILL
  // needed (ECTS-075) — "studied 3 h of a 4 h day ⇒ 1 h left", never the
  // full need on top of today's work.
  final today = dateOnly(now);
  double todayHoursFor(int courseId) {
    var minutes = 0;
    for (final s in byCourse[courseId] ?? const <StudySession>[]) {
      if (s.minutes <= 0) continue;
      final day = dateOnly(s.date);
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
      '${n.course.name} ${formatDuration(n.pace)} left today',
  ];
  final detail = rest > 0 ? '${parts.join(' · ')} (+$rest more)' : parts.join(' · ');
  return ReminderContent(
    kind: ReminderKind.daily,
    title: '📚 Tonight: ${formatDuration(total)} to stay on track',
    body: '$detail. Log a session to clear today.',
    messageId: 'daily',
    args: {
      'total': total,
      'names': [for (final n in named) n.course.name],
      'durations': [for (final n in named) n.pace],
      'rest': rest,
    },
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
  final byCourse = groupSessionsByCourse(sessions);
  final out = <ReminderContent>[];
  final behind = <Course>[];
  final seen = <Course, CourseProgress>{};
  for (final course in courses) {
    if (isScheduledCourse(course, now)) continue;
    final progress = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    if (progress.status == CourseStatus.behind) {
      behind.add(course);
      seen[course] = progress;
    }
  }
  behind.sort((a, b) {
    int daysOf(Course c) => remainingDays(c.deadline, now) ?? noDeadlineSortLast;
    final cmp = daysOf(a).compareTo(daysOf(b));
    if (cmp != 0) return cmp;
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  });
  for (final course in behind.take(maxNudgedCourses)) {
    // Reuse the progress from the collect pass above (same inputs).
    // Defensive: a missing entry is skipped instead of throwing.
    final progress = seen[course];
    if (progress == null) continue;
    final left = progress.remainingHours;
    final days = progress.remainingDays;
    final pace = progress.requiredDailyHours;
    final sessions = byCourse[course.id] ?? const <StudySession>[];
    String body;
    String messageId;
    // Behind implies a deadline (ects.dart `_status`: no deadline is
    // onTrack, past deadline is overdue), so days is non-null here.
    // Defensive: without a day count there is no nudge to compose.
    final dayCount = days;
    if (dayCount == null) continue;
    final Map<String, Object> args = {
      'course': course.name,
      'left': left,
      'days': dayCount,
    };
    if (pace == null) {
      // Deadline-day (or past) with hours outstanding: no finite pace
      // exists, so report action instead of a number (ects.dart rule).
      body =
          '${formatDuration(left)} still open and the deadline is here. Anything you log now counts.';
      messageId = 'behindDeadlineDay';
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
      args['pace'] = pace;
      if (catchUp >= left - 1e-9) {
        body =
            '${formatDuration(left)} left, $days days to go — ${formatDuration(pace)}/day from here. Only finishing the full ${formatDuration(left)} clears this — start tonight.';
        messageId = 'behindFull';
      } else {
        // Round UP so the promise holds (hi sits on the flip boundary).
        final display = (catchUp * 10).ceil() / 10;
        body =
            '${formatDuration(left)} left, $days days to go — ${formatDuration(pace)}/day from here. Log ${formatDuration(display)} to get back On track.';
        messageId = 'behindPace';
        args['catchUp'] = display;
      }
    }
    out.add(ReminderContent(
      kind: ReminderKind.behind,
      title: '🔻 ${course.name} slipped to Behind',
      body: body,
      courseId: course.id,
      messageId: messageId,
      args: args,
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
  final byCourse = groupSessionsByCourse(sessions);
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
    // `due` only holds courses with a deadline (filtered above), so the
    // day counts exist; missing ones sort last instead of throwing.
    final cmp = (remainingDays(a.deadline, now) ?? noDeadlineSortLast)
        .compareTo(remainingDays(b.deadline, now) ?? noDeadlineSortLast);
    if (cmp != 0) return cmp;
    return a.name.toLowerCase().compareTo(b.name.toLowerCase());
  });
  final out = <ReminderContent>[];
  for (final course in due.take(maxCountdownCourses)) {
    final progress = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    final left = progress.remainingHours;
    // Defensive: the filter above only lets 1..warnDays through, so this
    // is non-null in practice; skip instead of throwing if it ever is.
    final days = progress.remainingDays;
    if (days == null) continue;
    final pace = progress.requiredDailyHours;
    if (days == 1) {
      out.add(ReminderContent(
        kind: ReminderKind.deadline,
        title: '🚨 ${course.name} is due tomorrow and still has ${formatDuration(left)} open',
        body: 'Anything you log today counts double.',
        courseId: course.id,
        messageId: 'deadlineTomorrow',
        args: {'course': course.name, 'left': left},
      ));
    } else {
      final Map<String, Object> countdownArgs = {
        'course': course.name,
        'days': days,
        'left': left,
      };
      final countdownPace = pace;
      if (countdownPace != null) countdownArgs['pace'] = countdownPace;
      out.add(ReminderContent(
        kind: ReminderKind.deadline,
        title: '⏳ ${course.name} exam in $days days — ${formatDuration(left)} left',
        body: pace == null
            ? 'Every hour you log now counts.'
            : "That's ${formatDuration(pace)}/day. Split it: 2 sessions a day beats one marathon.",
        courseId: course.id,
        messageId: pace == null ? 'deadlineSoonNoPace' : 'deadlineSoon',
        args: countdownArgs,
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
  final byCourse = groupSessionsByCourse(sessions);
  final late = <Course, CourseProgress>{};
  for (final course in courses) {
    final progress = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    if (progress.status == CourseStatus.overdue) late[course] = progress;
  }
  final ordered = late.keys.toList()
    ..sort((a, b) {
      final da = a.deadline;
      final db = b.deadline;
      if (da == null && db == null) return 0;
      if (da == null) return 1;
      if (db == null) return -1;
      final cmp = da.compareTo(db);
      if (cmp != 0) return cmp;
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
  final nudges = <ReminderContent>[];
  for (final course in ordered.take(maxNudgedCourses)) {
    // Defensive: entries come from the collect pass above; skip instead
    // of throwing if one is ever missing.
    final progress = late[course];
    if (progress == null) continue;
    nudges.add(ReminderContent(
      kind: ReminderKind.overdue,
      title:
          '❌ ${course.name} passed its deadline with ${formatDuration(progress.remainingHours)} open',
      body: 'Move the deadline or finish the hours — the course stays in Needs attention until then.',
      courseId: course.id,
      messageId: 'overdue',
      args: {
        'course': course.name,
        'left': progress.remainingHours,
      },
    ));
  }
  return nudges;
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
    final day = dateOnly(s.date);
    dayTotals[day] = (dayTotals[day] ?? 0) + s.minutes;
  }
  final today = dateOnly(now);
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
  final byCourse = groupSessionsByCourse(sessions);
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
        '🔥 ${streak.days}-day streak — ${formatDuration(streak.weekHours)} this week',
    body: 'All courses On track or Ahead. Nice run.',
    messageId: 'streak',
    args: {'days': streak.days, 'week': streak.weekHours},
  );
}

/// Hours logged on [now]'s calendar day. Lets the caller compose the
/// "Today is covered" variant when [computeDailyPlan] returns null.
double todayLoggedHours({
  required List<StudySession> sessions,
  required DateTime now,
}) {
  final today = dateOnly(now);
  var minutes = 0;
  for (final s in sessions) {
    if (s.minutes <= 0) continue;
    final day = dateOnly(s.date);
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
