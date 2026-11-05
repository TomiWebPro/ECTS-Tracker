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
      // 10-day span, 3.5 days elapsed → expected 52.5 h; exactly 52.5 h logged,
      // so the achieved pace (15 h/day) still finishes in time.
      final p = progress(
        sessions: [s((15 * 3.5 * 60).round())],
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.onTrack);
    });

    test('behind when the finished pace will not finish in time', () {
      // 10-day span, 3 days elapsed → expected 45 h; only 5 h logged, so the
      // achieved pace (5/3 ≈ 1.67 h/day) is far under the 145/7 ≈ 20.7 h/day
      // still needed. Below the linear expectation with a real shortfall.
      final p = progress(
        sessions: [s(5 * 60)],
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.behind);
      final achieved = finishedDailyPace(p.completedHours, DateTime(2026, 11, 1), now);
      expect(achieved, isNotNull);
      expect(achieved! < p.requiredDailyHours!, isTrue);
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

    test('no sessions logged: 0 completed, full remaining, behind (0 h/day)', () {
      // 3.5 days in with nothing logged: achieved pace 0 h/day cannot finish.
      final p = progress(
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.completedHours, 0);
      expect(p.remainingHours, 150);
      expect(p.progressFraction, 0);
      expect(p.status, CourseStatus.behind);
    });

    test('deadline today: not overdue, null pace, behind (no division by zero)', () {
      final p = progress(
        sessions: [s(60 * 60)],
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 4, 23, 59),
      );
      // 90 h still needed with 0 days left: not overdue (the deadline day itself
      // is not past) but the shortfall is unbounded, so not on track either.
      expect(p.status, CourseStatus.behind);
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

  group('courseProgress — behind reachable (ECTS-017)', () {
    test('all five AGENTS.md §4 states fire from courseProgress', () {
      final states = <CourseStatus>{
        // completed: remaining hits zero.
        progress(sessions: [s(150 * 60)]).status,
        // overdue: deadline day already past, hours outstanding.
        progress(deadline: DateTime(2026, 10, 1)).status,
        // ahead: above the linear expectation.
        progress(
          sessions: [s(60 * 60)],
          startDate: DateTime(2026, 11, 1),
          deadline: DateTime(2026, 11, 11),
        ).status,
        // onTrack: exactly level with the expectation (and on pace).
        progress(
          sessions: [s((15 * 3.5 * 60).round())],
          startDate: DateTime(2026, 11, 1),
          deadline: DateTime(2026, 11, 11),
        ).status,
        // behind: finished pace below the required daily pace.
        progress(
          sessions: [s(60)],
          startDate: DateTime(2026, 11, 1),
          deadline: DateTime(2026, 11, 11),
        ).status,
      };
      expect(states, hasLength(CourseStatus.values.length));
      expect(states, containsAll(CourseStatus.values));
    });

    test('behind when nothing is logged and the course is already running', () {
      // 5 ECTS = 150 h, start 3 days ago, 7 days left, 0 h finished → 0 h/day
      // achieved vs 150/7 ≈ 21.4 h/day needed.
      final p = progress(
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.behind);
      expect(p.completedHours, 0);
      expect(p.requiredDailyHours, closeTo(150 / 7, 1e-9));
    });

    test('on track when the achieved pace exactly matches the required pace', () {
      // 150 h over a 10-day span ⇒ 15 h/day required throughout. Started 3 days
      // ago (3 days and 12 h elapsed = 3.5 d) ⇒ 52.5 h finished = exact pace.
      final p = progress(
        sessions: [s((15 * 3.5 * 60).round())],
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.onTrack);
    });

    test('ahead still wins over the pace check', () {
      final p = progress(
        sessions: [s(100 * 60)],
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.ahead);
    });

    test('deadline today with hours outstanding: behind, not on track', () {
      final p = progress(
        sessions: [s(10 * 60)],
        startDate: DateTime(2026, 11, 1),
        deadline: now,
      );
      expect(p.requiredDailyHours, isNull);
      expect(p.status, CourseStatus.behind);
    });

    test('no start date: no finished-pace baseline ⇒ never behind', () {
      final p = progress(deadline: DateTime(2026, 12, 1));
      expect(finishedDailyPace(p.completedHours, null, now), isNull);
      expect(p.status, CourseStatus.onTrack);
    });

    test('finishedDailyPace is 0 at a same-instant start and null before it', () {
      expect(finishedDailyPace(10, now, now), 0);
      expect(finishedDailyPace(10, DateTime(2026, 11, 10), now), isNull);
    });

    test('finishedDailyPace divides finished hours by elapsed days', () {
      expect(
        finishedDailyPace(48, DateTime(2026, 10, 30), now),
        closeTo(48 / 5.5, 1e-9),
      );
    });
  });

  group('courseProgress — deadline-day shortfall is behind (ECTS-022)', () {
    test('deadline today with 1 h of 150 h logged is behind, pace null', () {
      // The probe from the task row: start 2026-10-01, deadline today 23:00,
      // 1 h logged of 150 h required.
      final p = progress(
        sessions: [s(60)],
        startDate: DateTime(2026, 10, 1),
        deadline: DateTime(2026, 11, 4, 23),
      );
      expect(p.status, CourseStatus.behind);
      expect(p.remainingDays, 0);
      expect(p.remainingHours, 149);
      expect(p.requiredDailyHours, isNull);
    });

    test('deadline today with nothing logged is behind', () {
      final p = progress(deadline: DateTime(2026, 11, 4, 23, 59));
      expect(p.status, CourseStatus.behind);
      expect(p.remainingHours, 150);
      expect(p.requiredDailyHours, isNull);
    });

    test('deadline today but requirement already met stays completed', () {
      // completed outranks the deadline-day branch.
      final p = progress(
        sessions: [s(150 * 60)],
        startDate: DateTime(2026, 10, 1),
        deadline: now,
      );
      expect(p.status, CourseStatus.completed);
    });

    test('deadline yesterday with hours outstanding stays overdue, not behind', () {
      final p = progress(
        sessions: [s(60)],
        startDate: DateTime(2026, 10, 1),
        deadline: DateTime(2026, 11, 3, 23),
      );
      expect(p.status, CourseStatus.overdue);
      expect(p.remainingDays, 0);
    });

    test('a future deadline is untouched by the deadline-day branch', () {
      // Deadline tomorrow, exactly on pace: still on track, pace reported.
      final p = progress(deadline: DateTime(2026, 11, 5));
      expect(p.status, CourseStatus.onTrack);
      expect(p.remainingDays, 1);
      expect(p.requiredDailyHours, closeTo(150, 1e-9));
    });

    test('deadline-day notice never fires when the deadline hour is later today', () {
      // now is 12:00; a deadline at 23:00 today is still the same calendar day.
      final p = progress(deadline: DateTime(2026, 11, 4));
      expect(p.remainingDays, 0);
      expect(p.status, CourseStatus.behind);
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
