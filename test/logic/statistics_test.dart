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
}
