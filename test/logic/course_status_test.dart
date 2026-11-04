import 'package:ects_tracker/src/logic/ects.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 11, 4, 12);

  StudySession s(int minutes, {DateTime? date}) => StudySession(
        id: 0,
        courseId: 1,
        minutes: minutes,
        date: date ?? now,
      );

  /// 5 ECTS × 30 = 150 h required.
  CourseProgress progress({
    double credits = 5,
    double hoursPerEcts = 30,
    List<StudySession> sessions = const [],
    DateTime? startDate,
    DateTime? deadline,
  }) =>
      courseProgress(
        ectsCredits: credits,
        hoursPerEcts: hoursPerEcts,
        sessions: sessions,
        startDate: startDate,
        deadline: deadline,
        now: now,
      );

  group('courseProgress — five states', () {
    test('completed when remaining is zero', () {
      final p = progress(
        sessions: [s(150 * 60)],
        startDate: DateTime(2026, 10, 1),
        deadline: DateTime(2026, 12, 1),
      );
      expect(p.status, CourseStatus.completed);
      expect(p.remainingHours, 0);
      expect(p.progressFraction, 1.0);
    });

    test('completed when over-logged', () {
      final p = progress(sessions: [s(200 * 60)]);
      expect(p.status, CourseStatus.completed);
      expect(p.remainingHours, 0);
    });

    test('overdue when past deadline and incomplete', () {
      final p = progress(
        sessions: [s(10 * 60)],
        startDate: DateTime(2026, 9, 1),
        deadline: DateTime(2026, 10, 1),
      );
      expect(p.status, CourseStatus.overdue);
      expect(p.remainingDays, 0);
    });

    test('completed wins over overdue for an over-done past-deadline course', () {
      final p = progress(
        sessions: [s(150 * 60)],
        deadline: DateTime(2026, 10, 1),
      );
      expect(p.status, CourseStatus.completed);
    });

    test('ahead when logged hours exceed the linear expectation', () {
      // 10-day span, 3 days elapsed → expected 45 h; 60 h logged.
      final p = progress(
        sessions: [s(60 * 60)],
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.ahead);
    });

    test('on track when level with the linear expectation', () {
      // 10-day span, 3 days elapsed → expected 45 h; exactly 45 h logged.
      final p = progress(
        sessions: [s(45 * 60)],
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.onTrack);
    });

    test('on track when behind the linear expectation but time remains', () {
      // Behind the *linear* expectation, but no "behind" state is reachable
      // from logged-hours-vs-time alone, so the course stays on track.
      final p = progress(
        sessions: [s(5 * 60)],
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.onTrack);
    });

    test('on track with a deadline but no start date (no expectation)', () {
      final p = progress(deadline: DateTime(2026, 12, 1));
      expect(p.status, CourseStatus.onTrack);
    });
  });

  group('courseProgress — AGENTS.md §4 edge cases', () {
    test('no deadline: on track, null days and null pace', () {
      final p = progress(sessions: [s(30 * 60)]);
      expect(p.status, CourseStatus.onTrack);
      expect(p.remainingDays, isNull);
      expect(p.requiredDailyHours, isNull);
      expect(p.requiredWeeklyHours, isNull);
    });

    test('no sessions logged: 0 completed, full remaining, on track', () {
      final p = progress(
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.completedHours, 0);
      expect(p.remainingHours, 150);
      expect(p.progressFraction, 0);
      expect(p.status, CourseStatus.onTrack);
    });

    test('deadline today: not overdue, null pace (no division by zero)', () {
      final p = progress(
        sessions: [s(60 * 60)],
        deadline: DateTime(2026, 11, 4, 23, 59),
      );
      expect(p.status, CourseStatus.onTrack);
      expect(p.remainingDays, 0);
      expect(p.requiredDailyHours, isNull);
      expect(p.requiredWeeklyHours, isNull);
    });

    test('deadline yesterday is overdue', () {
      final p = progress(deadline: DateTime(2026, 11, 3, 23, 59));
      expect(isPastDeadline(DateTime(2026, 11, 3, 23, 59), now), isTrue);
      expect(p.status, CourseStatus.overdue);
    });

    test('required hours zero (zero credits) is never overdue or behind', () {
      final p = progress(
        credits: 0,
        deadline: DateTime(2026, 10, 1),
      );
      expect(p.requiredHours, 0);
      expect(p.status, CourseStatus.completed);
      expect(p.progressFraction, 0);
    });

    test('deadline passed but no sessions: overdue', () {
      final p = progress(
        startDate: DateTime(2026, 9, 1),
        deadline: DateTime(2026, 10, 1),
      );
      expect(p.status, CourseStatus.overdue);
    });

    test('start date after now yields full expectation still unbounded to 0', () {
      final p = progress(
        startDate: DateTime(2026, 11, 20),
        deadline: DateTime(2026, 12, 1),
      );
      expect(p.status, CourseStatus.onTrack);
    });
  });

  group('courseProgress — derived pace', () {
    test('daily/weekly pace from remaining hours and days', () {
      // 150 h required, 0 done, deadline in 7 days → 150/7 per day.
      final p = progress(deadline: DateTime(2026, 11, 11));
      expect(p.remainingDays, 7);
      expect(p.requiredDailyHours, closeTo(150 / 7, 1e-9));
      expect(p.requiredWeeklyHours, closeTo(150, 1e-9));
    });

    test('hoursPerEcts change rescales required and remaining', () {
      final sessions = [s(60 * 60)];
      final at30 = progress(sessions: sessions, hoursPerEcts: 30);
      final at25 = progress(sessions: sessions, hoursPerEcts: 25);
      expect(at30.requiredHours, 150);
      expect(at25.requiredHours, 125);
      expect(at30.completedHours, at25.completedHours);
      expect(at25.remainingHours, 65);
    });
  });

  group('courseProgressFor (Course model)', () {
    test('feeds course fields through to the summary', () {
      final course = Course(
        id: 1,
        name: 'Databases',
        ectsCredits: 5,
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      final p = courseProgressFor(
        course,
        [s(60 * 60)],
        hoursPerEcts: 30,
        now: now,
      );
      expect(p.status, CourseStatus.ahead);
      expect(p.requiredHours, 150);
      expect(p.remainingHours, 90);
      expect(p.remainingDays, 7);
    });
  });
}
