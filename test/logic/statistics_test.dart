import 'package:ects_tracker/src/logic/statistics.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('computeStatistics computes totals and ranges', () {
    final now = DateTime(2026, 11, 6);
    final sessions = [
      StudySession(id: 1, courseId: 1, minutes: 120, date: DateTime(2026, 11, 6)), // today
      StudySession(id: 2, courseId: 1, minutes: 60, date: DateTime(2026, 11, 5)), // yesterday
      StudySession(id: 3, courseId: 2, minutes: 90, date: DateTime(2026, 10, 10)), // old
    ];
    final stats = computeStatistics(sessions, now: now);
    expect(stats.totalMinutes, 270);
    expect(stats.last7DaysMinutes, 180); // today + yesterday
    expect(stats.last30DaysMinutes, 270); // all within 30 days
    expect(stats.sessionsCount, 3);
    expect(stats.perCourseMinutes[1], 180);
    expect(stats.perCourseMinutes[2], 90);
    expect(stats.consistencyScore, greaterThan(0));
  });

  test('consistency score based on active days in last 30 days', () {
    final now = DateTime(2026, 11, 6);
    final sessions = [
      StudySession(id: 1, courseId: 1, minutes: 60, date: DateTime(2026, 11, 1)),
      StudySession(id: 2, courseId: 1, minutes: 60, date: DateTime(2026, 11, 2)),
      StudySession(id: 3, courseId: 1, minutes: 60, date: DateTime(2026, 11, 3)),
    ];
    final stats = computeStatistics(sessions, now: now);
    expect(stats.consistencyScore, closeTo(3/30, 1e-9));
    expect(stats.activeDays, 3);
  });

  group('buildStatisticsView', () {
    test('aggregates need, forecast peak, ordering, and gap', () {
      final now = DateTime(2026, 11, 6, 12);
      final courses = [
        Course(
            id: 1,
            name: 'Heavy',
            ectsCredits: 5,
            startDate: DateTime(2026, 11, 1),
            deadline: DateTime(2026, 11, 20)),
        Course(id: 2, name: 'NoDeadline', ectsCredits: 1),
      ];
      final sessions = [
        StudySession(id: 1, courseId: 1, minutes: 60, date: DateTime(2026, 11, 6)),
      ];
      final view = buildStatisticsView(
        courses: courses,
        sessions: sessions,
        hoursPerEcts: 30,
        toleranceDays: 5,
        now: now,
      );
      // 150 h required, 1 h done, deadline in 14 days with tolerance band.
      expect(view.withProgress, hasLength(2));
      expect(view.needSum, greaterThan(0));
      expect(view.pastAvg, closeTo(1 / 14, 1e-9));
      expect(view.gap, view.needSum - view.pastAvg);
      expect(view.forecast, isNotEmpty);
      expect(view.peak, greaterThanOrEqualTo(view.forecast.first.hours));
      // Only the deadline course is listed, soonest first.
      expect(view.sortedByDeadline.map((e) => e.course.id), [1]);
    });

    test('empty input yields zeros, never NaN', () {
      final view = buildStatisticsView(
        courses: const [],
        sessions: const [],
        hoursPerEcts: 30,
        toleranceDays: 5,
        now: DateTime(2026, 11, 6),
      );
      expect(view.needSum, 0);
      expect(view.pastAvg, 0);
      expect(view.gap, 0);
      expect(view.peak, 0);
      expect(view.forecast, isNotEmpty);
      expect(view.sortedByDeadline, isEmpty);
    });
  });
}
