import '../models/models.dart';
import 'course_list.dart';
import 'date_utils.dart';
import 'ects.dart';

/// Aggregated statistics for study sessions.
class StudyStatistics {
  const StudyStatistics({
    required this.totalMinutes,
    required this.last7DaysMinutes,
    required this.last30DaysMinutes,
    required this.sessionsCount,
    required this.activeDays,
    required this.consistencyScore,
    required this.perCourseMinutes,
  });

  final int totalMinutes;
  final int last7DaysMinutes;
  final int last30DaysMinutes;
  final int sessionsCount;
  final int activeDays;
  final double consistencyScore;
  final Map<int, int> perCourseMinutes;

  double get totalHours => totalMinutes / 60.0;
  double get last7DaysHours => last7DaysMinutes / 60.0;
  double get last30DaysHours => last30DaysMinutes / 60.0;
}

/// Compute study statistics from [sessions] relative to [now].
StudyStatistics computeStatistics(
  List<StudySession> sessions, {
  required DateTime now,
}) {
  final today = dateOnly(now);
  final sevenDaysAgo = today.subtract(const Duration(days: 6)); // last 7 days including today
  final thirtyDaysAgo = today.subtract(const Duration(days: 29)); // last 30 days including today

  var totalMinutes = 0;
  var last7DaysMinutes = 0;
  var last30DaysMinutes = 0;
  final perCourseMinutes = <int, int>{};
  final activeDaysSet = <DateTime>{};

  for (final s in sessions) {
    totalMinutes += s.minutes;
    final day = dateOnly(s.date);
    activeDaysSet.add(day);
    perCourseMinutes[s.courseId] = (perCourseMinutes[s.courseId] ?? 0) + s.minutes;

    if (!day.isBefore(sevenDaysAgo)) {
      last7DaysMinutes += s.minutes;
    }
    if (!day.isBefore(thirtyDaysAgo)) {
      last30DaysMinutes += s.minutes;
    }
  }

  // Consistency score: proportion of last 30 days with at least one session (0-1)
  double consistencyScore = 0.0;
  if (activeDaysSet.isNotEmpty) {
    final activeIn30Days = activeDaysSet.where((d) => !d.isBefore(thirtyDaysAgo)).length;
    consistencyScore = (activeIn30Days / 30.0).clamp(0.0, 1.0);
  }

  return StudyStatistics(
    totalMinutes: totalMinutes,
    last7DaysMinutes: last7DaysMinutes,
    last30DaysMinutes: last30DaysMinutes,
    sessionsCount: sessions.length,
    activeDays: activeDaysSet.length,
    consistencyScore: consistencyScore,
    perCourseMinutes: perCourseMinutes,
  );
}

/// Average h/day over the trailing [days] (default 14) — past performance.
double averageDailyHours(
  List<StudySession> sessions, {
  required DateTime now,
  int days = 14,
}) {
  if (days <= 0) return 0;
  final today = dateOnly(now);
  final start = today.subtract(Duration(days: days - 1));
  var minutes = 0;
  for (final s in sessions) {
    final day = dateOnly(s.date);
    if (!day.isBefore(start) && !day.isAfter(today)) minutes += s.minutes;
  }
  return minutes / 60.0 / days;
}

/// One weekly bucket of forecast load.
class WeeklyLoad {
  const WeeklyLoad({required this.weekStart, required this.hours});

  final DateTime weekStart;
  final double hours;
}

/// Precomputed inputs for the statistics page: the page's data-join + math in
/// one pure function, unit-testable without pumping widgets (the page only
/// renders [StatisticsView]).
class StatisticsView {
  const StatisticsView({
    required this.withProgress,
    required this.pastAvg,
    required this.needSum,
    required this.forecast,
    required this.peak,
    required this.sortedByDeadline,
  });

  final List<CourseWithProgress> withProgress;
  final double pastAvg;
  final double needSum;

  /// Today's required pace minus the trailing-14-day average (> 0 = behind
  /// the recent run-rate, must step up).
  double get gap => needSum - pastAvg;

  final List<WeeklyLoad> forecast;
  final double peak;
  final List<CourseWithProgress> sortedByDeadline;
}

/// Builds the [StatisticsView] for [courses]/[sessions] at [now].
StatisticsView buildStatisticsView({
  required List<Course> courses,
  required List<StudySession> sessions,
  required double hoursPerEcts,
  required double toleranceDays,
  required DateTime now,
  int weeks = 8,
  int firstWeekday = DateTime.monday,
}) {
  final withProgress = coursesWithProgress(
    courses,
    sessions,
    hoursPerEcts: hoursPerEcts,
    now: now,
    toleranceDays: toleranceDays,
  );
  final pastAvg = averageDailyHours(sessions, now: now, days: 14);
  var needSum = 0.0;
  for (final e in withProgress) {
    if (isScheduledCourse(e.course, now)) continue;
    needSum += e.progress.requiredDailyHours ?? 0;
  }
  final forecast = forecastWeeklyLoad(
    withProgress,
    now: now,
    weeks: weeks,
    firstWeekday: firstWeekday,
  );
  final peak = forecast.isEmpty
      ? 0.0
      : forecast.map((w) => w.hours).reduce((a, b) => a > b ? a : b);
  final sortedByDeadline = withProgress
      .where((e) => e.course.deadline != null)
      .toList()
    ..sort((a, b) => a.course.deadline!.compareTo(b.course.deadline!));
  return StatisticsView(
    withProgress: withProgress,
    pastAvg: pastAvg,
    needSum: needSum,
    forecast: forecast,
    peak: peak,
    sortedByDeadline: sortedByDeadline,
  );
}

/// Forecast: for each of the next [weeks] weeks (Mon-anchored), sum over
/// courses of `remaining / remainingDays * activeDaysInThatWeek`.
///
/// Courses without deadlines spread nothing (no schedule). Scheduled future
/// courses (`!startEarly`) contribute only from their start date. Past
/// deadlines contribute only to the first week (overdue catch-up).
List<WeeklyLoad> forecastWeeklyLoad(
  List<CourseWithProgress> items, {
  required DateTime now,
  int weeks = 8,
  int firstWeekday = DateTime.monday,
}) {
  final today = dateOnly(now);
  // Anchor to week start containing today.
  final delta = (today.weekday - firstWeekday + 7) % 7;
  final anchor = today.subtract(Duration(days: delta));
  final loads = <WeeklyLoad>[];
  for (var w = 0; w < weeks; w++) {
    final weekStart = anchor.add(Duration(days: w * 7));
    final weekEnd = weekStart.add(const Duration(days: 7));
    var hours = 0.0;
    for (final item in items) {
      final course = item.course;
      final p = item.progress;
      if (p.remainingHours <= 0) continue;
      final deadline = course.deadline;
      if (deadline == null) continue;
      final start = course.startDate ?? today;
      // Skip weeks entirely before the (effective) start.
      final effectiveStart =
          isScheduledCourse(course, now) ? dateOnly(start) : today;
      final effectiveEnd = dateOnly(deadline);
      // Overlap of [weekStart, weekEnd) with [effectiveStart, effectiveEnd].
      final overlapStart = effectiveStart.isAfter(weekStart)
          ? effectiveStart
          : weekStart;
      // Deadline day itself is inclusive: study can happen that day.
      final overlapEnd = effectiveEnd.add(const Duration(days: 1)).isBefore(
            weekEnd,
          )
          ? effectiveEnd.add(const Duration(days: 1))
          : weekEnd;
      final overlapDays = overlapEnd.difference(overlapStart).inDays;
      if (overlapDays <= 0) continue;
      final totalDays = effectiveEnd.difference(effectiveStart).inDays + 1;
      if (totalDays <= 0) {
        // Overdue: all remaining crams into this week.
        if (w == 0) hours += p.remainingHours;
        continue;
      }
      hours += p.remainingHours * overlapDays / totalDays;
    }
    loads.add(WeeklyLoad(weekStart: weekStart, hours: hours));
  }
  return loads;
}
