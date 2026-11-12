import 'package:ects_tracker/src/logic/session_totals.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('sessionTotals (ECTS-007)', () {
    test('computes daily and weekly totals (week starts Monday)', () {
      final now = DateTime(2026, 11, 6, 12); // Fri
      final sessions = [
        StudySession(id: 1, courseId: 1, minutes: 60, date: DateTime(2026, 11, 6)), // today
        StudySession(id: 2, courseId: 1, minutes: 30, date: DateTime(2026, 11, 2)), // Mon, same week
        StudySession(id: 3, courseId: 1, minutes: 45, date: DateTime(2026, 11, 1)), // Sun, previous week
        StudySession(id: 4, courseId: 2, minutes: 15, date: DateTime(2026, 11, 6, 23)), // today (time ignored by day)
      ];
      final totals = sessionTotals(sessions, now: now);
      expect(totals.dailyMinutes, 75);
      expect(totals.weeklyMinutes, 105); // Mon 30 + Fri 60+15
      expect(totals.dailyHours, closeTo(1.25, 1e-9));
      expect(totals.weeklyHours, closeTo(1.75, 1e-9));
    });

    test('empty sessions yield zero', () {
      final totals = sessionTotals(const [], now: DateTime(2026, 11, 6));
      expect(totals.dailyMinutes, 0);
      expect(totals.weeklyMinutes, 0);
    });
  });

  group('sessionsByDateDesc', () {
    test('sorts newest first', () {
      final sessions = [
        StudySession(id: 1, courseId: 1, minutes: 10, date: DateTime(2026, 1, 1)),
        StudySession(id: 2, courseId: 1, minutes: 10, date: DateTime(2026, 1, 3)),
        StudySession(id: 3, courseId: 1, minutes: 10, date: DateTime(2026, 1, 2)),
      ];
      final sorted = sessionsByDateDesc(sessions);
      expect(sorted.map((s) => s.id).toList(), [2, 3, 1]);
    });
  });

  group('groupSessionsByCourse', () {
    test('buckets by course id, empty input yields empty map', () {
      final sessions = [
        StudySession(id: 1, courseId: 1, minutes: 10, date: DateTime(2026, 1, 1)),
        StudySession(id: 2, courseId: 2, minutes: 10, date: DateTime(2026, 1, 2)),
        StudySession(id: 3, courseId: 1, minutes: 10, date: DateTime(2026, 1, 3)),
      ];
      final grouped = groupSessionsByCourse(sessions);
      expect(grouped.keys.toSet(), {1, 2});
      expect(grouped[1]!.map((s) => s.id).toList(), [1, 3]);
      expect(groupSessionsByCourse(const []), isEmpty);
    });
  });
}
