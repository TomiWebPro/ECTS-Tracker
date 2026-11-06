import '../models/models.dart';

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

DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// Compute study statistics from [sessions] relative to [now].
StudyStatistics computeStatistics(
  List<StudySession> sessions, {
  required DateTime now,
}) {
  final today = _dateOnly(now);
  final sevenDaysAgo = today.subtract(const Duration(days: 6)); // last 7 days including today
  final thirtyDaysAgo = today.subtract(const Duration(days: 29)); // last 30 days including today

  var totalMinutes = 0;
  var last7DaysMinutes = 0;
  var last30DaysMinutes = 0;
  final perCourseMinutes = <int, int>{};
  final activeDaysSet = <DateTime>{};

  for (final s in sessions) {
    totalMinutes += s.minutes;
    final day = _dateOnly(s.date);
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
