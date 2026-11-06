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

    test('on track with a deadline but no start date and nothing logged', () {
      // No start date ⇒ no linear expectation and no pace baseline at all
      // (nothing logged), so no shortfall can be proven: on track. The
      // deadline-only course that *has* logged time is covered by the
      // ECTS-021 group below.
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
      // 5 ECTS = 150 h, start 3 days ago, deadline 2026-11-11 00:00 and now is
      // 2026-11-04 12:00 → 6.5 actual days left. 0 h finished → 0 h/day achieved
      // vs 150/6.5 ≈ 23.08 h/day needed (ECTS-032: pace uses actual time left).
      final p = progress(
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.behind);
      expect(p.completedHours, 0);
      final actualDays =
          DateTime(2026, 11, 11).difference(now).inMinutes / (60 * 24);
      expect(p.requiredDailyHours, closeTo(150 / actualDays, 1e-9));
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

    test('no start date and nothing logged: no pace baseline ⇒ on track', () {
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
      // Deadline 2026-11-05 00:00 (midnight), now 2026-11-04 12:00 => 12h left.
      // No sessions/baseline => onTrack; pace is time-aware (ECTS-032).
      final p = progress(deadline: DateTime(2026, 11, 5));
      expect(p.status, CourseStatus.onTrack);
      expect(p.remainingDays, 1); // calendar days (UI/status semantic)
      final actualDays =
          DateTime(2026, 11, 5).difference(now).inMinutes / (60 * 24);
      expect(p.requiredDailyHours, closeTo(150 / actualDays, 1e-9));
    });

    test('deadline-day notice never fires when the deadline hour is later today', () {
      // now is 12:00; a deadline at 23:00 today is still the same calendar day.
      final p = progress(deadline: DateTime(2026, 11, 4));
      expect(p.remainingDays, 0);
      expect(p.status, CourseStatus.behind);
    });
  });

  group('courseProgress — behind without a start date (ECTS-021)', () {
    test('the row probe: deadline-only course with 1 h of 150 h is behind', () {
      // 5 ECTS = 150 h, 1 h logged 1 day ago (first-session baseline), deadline
      // 2026-12-01 00:00, now 2026-11-04 12:00 => 26.5 actual days left.
      // 149h / 26.5d ≈ 5.62 h/day needed vs 1 h/day achieved => behind.
      // Pace is time-aware (ECTS-032); calendar remainingDays stays 27.
      final p = progress(
        sessions: [s(60, date: DateTime(2026, 11, 3, 12))],
        deadline: DateTime(2026, 12, 1),
      );
      expect(p.status, CourseStatus.behind);
      expect(p.remainingDays, 27);
      final actualDays =
          DateTime(2026, 12, 1).difference(now).inMinutes / (60 * 24);
      expect(p.requiredDailyHours, closeTo(149 / actualDays, 1e-9));
      final achieved =
          finishedDailyPace(p.completedHours, null, now, sessions: [
        StudySession(id: 0, courseId: 1, minutes: 60, date: DateTime(2026, 11, 3, 12)),
      ]);
      expect(achieved, closeTo(1, 1e-9));
      expect(achieved! < p.requiredDailyHours!, isTrue);
    });

    test('deadline-only course on pace is on track', () {
      // First session 1 day ago, 15 h logged → 15 h/day achieved. Deadline
      // 2026-11-14 00:00, now 2026-11-04 12:00 => 9.5 actual days left.
      // 135 h / 9.5 d ≈ 14.21 h/day needed; achieved (15) >= needed => onTrack.
      // (ECTS-032: pace uses actual time left.)
      final p = progress(
        sessions: [s(15 * 60, date: DateTime(2026, 11, 3, 12))],
        deadline: DateTime(2026, 11, 14),
      );
      expect(p.status, CourseStatus.onTrack);
      final actualDays =
          DateTime(2026, 11, 14).difference(now).inMinutes / (60 * 24);
      expect(p.requiredDailyHours, closeTo(135 / actualDays, 1e-9));
    });

    test('deadline-only course logging more than the required pace is on track', () {
      final p = progress(
        sessions: [s(40 * 60, date: DateTime(2026, 11, 3, 12))],
        deadline: DateTime(2026, 12, 1),
      );
      expect(p.status, CourseStatus.onTrack);
    });

    test('baseline is the earliest session, not the latest', () {
      // Sessions on 11-01 (1 h) and 11-03 (1 h): pace measured from 11-01
      // (3 d) = 2/3 h/day, not from 11-03 (1 d) = 2 h/day.
      final sessions = [
        s(60, date: DateTime(2026, 11, 3, 12)),
        s(60, date: DateTime(2026, 11, 1, 12)),
      ];
      final p = progress(sessions: sessions, deadline: DateTime(2026, 12, 1));
      expect(p.status, CourseStatus.behind);
      expect(
        finishedDailyPace(p.completedHours, null, now, sessions: sessions),
        closeTo(2 / 3, 1e-9),
      );
    });

    test('a start date still wins over the logged-session baseline', () {
      // Start 2026-11-01 with 1 h logged 1 day ago: pace from the start date is
      // 1/3.5 h/day, so both baselines put the course behind — but the start
      // date is what is used (elapsed 3.5 d, not 1 d).
      final sessions = [s(60, date: DateTime(2026, 11, 3, 12))];
      expect(
        finishedDailyPace(1, DateTime(2026, 11, 1), now, sessions: sessions),
        closeTo(1 / 3.5, 1e-9),
      );
    });

    test('no deadline: never behind, even with a logged shortfall', () {
      final p = progress(sessions: [s(60, date: DateTime(2026, 11, 3, 12))]);
      expect(p.status, CourseStatus.onTrack);
      expect(p.requiredDailyHours, isNull);
    });

    test('zero credits with a deadline and logged time stays completed', () {
      final p = progress(
        credits: 0,
        sessions: [s(60, date: DateTime(2026, 11, 3, 12))],
        deadline: DateTime(2026, 12, 1),
      );
      expect(p.status, CourseStatus.completed);
    });

    test('ahead is unreachable without a start date (no expectation)', () {
      // 100 h logged 1 day ago: well above the linear expectation a start date
      // would have produced, but with no start date `ahead` cannot fire — the
      // sufficient achieved pace (100 h/day ≫ 50/27 h/day) means on track.
      final p = progress(
        sessions: [s(100 * 60, date: DateTime(2026, 11, 3, 12))],
        deadline: DateTime(2026, 12, 1),
      );
      expect(p.status, CourseStatus.onTrack);
    });

    test('zero-duration sessions are ignored by the pace baseline', () {
      final sessions = [
        s(0, date: DateTime(2026, 10, 1)), // ignored: no study happened
        s(60, date: DateTime(2026, 11, 3, 12)),
      ];
      expect(
        finishedDailyPace(1, null, now, sessions: sessions),
        closeTo(1, 1e-9),
      );
    });

    test('a session dated in the future gives no pace baseline ⇒ on track', () {
      final p = progress(
        sessions: [s(60, date: DateTime(2026, 11, 10))],
        deadline: DateTime(2026, 12, 1),
      );
      expect(p.status, CourseStatus.onTrack);
    });
  });

  group('courseProgress — derived pace', () {
    test('daily/weekly pace from remaining hours and actual time left', () {
      // 150 h required, 0 done, deadline 2026-11-11 00:00, now 2026-11-04 12:00
      // => 6.5 actual days. Pace is time-aware (ECTS-032); calendar days = 7.
      final p = progress(deadline: DateTime(2026, 11, 11));
      expect(p.remainingDays, 7);
      final actualDays =
          DateTime(2026, 11, 11).difference(now).inMinutes / (60 * 24);
      expect(p.requiredDailyHours, closeTo(150 / actualDays, 1e-9));
      expect(p.requiredWeeklyHours, closeTo((150 / actualDays) * 7, 1e-9));
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

  group('courseProgress — pre-start schedule is not ahead (ECTS-041, ECTS-008)', () {
    test('future start date with 1 h logged is not ahead (no pre-start ahead)', () {
      // ECTS-041 probe: 5 ECTS/150h, start 2026-12-01 (future), deadline 2027-01-15,
      // 1 h logged today. Linear expectation before start is 0, but §4 "ahead" is
      // only meaningful once the schedule is active.
      final p = progress(
        sessions: [s(60)],
        startDate: DateTime(2026, 12, 1),
        deadline: DateTime(2027, 1, 15),
      );
      expect(p.status, isNot(CourseStatus.ahead));
      expect(p.status, CourseStatus.onTrack);
      expect(expectedHoursToDate(150, DateTime(2026, 12, 1), DateTime(2027, 1, 15), now), 0);
    });

    test('future start date with substantial logging still not ahead', () {
      final p = progress(
        sessions: [s(50 * 60)],
        startDate: DateTime(2026, 12, 1),
        deadline: DateTime(2027, 1, 15),
      );
      expect(p.status, isNot(CourseStatus.ahead));
    });

    test('future start date with no sessions remains on track', () {
      final p = progress(
        startDate: DateTime(2026, 12, 1),
        deadline: DateTime(2027, 1, 15),
      );
      expect(p.status, CourseStatus.onTrack);
    });
  });

  group('courseProgress — ECTS-031 cumulative achieved pace policy (ECTS-008)', () {
    test('single sitting: small log is behind, large same-sitting log can be on track', () {
      // ECTS-031/053 probe (policy documented): cumulative achieved pace from
      // earliest-session baseline. 5 ECTS=150h, deadline 2026-12-01, single
      // session 2026-11-03T12:00, now 2026-11-04T12:00 (~1 day elapsed).
      final sessionAt = DateTime(2026, 11, 3, 12);
      final deadline = DateTime(2026, 12, 1);
      final behind = progress(
        sessions: [s(60, date: sessionAt)],
        deadline: deadline,
      );
      expect(behind.status, CourseStatus.behind);

      final onTrack = progress(
        sessions: [s(15 * 60, date: sessionAt)],
        deadline: deadline,
      );
      // Cumulative pace (15h / ~1 day) exceeds required forward pace (~5 h/day).
      expect(onTrack.status, CourseStatus.onTrack);
    });

    test('currentDailyPace matches finishedDailyPace (ECTS-008 policy)', () {
      final sessions = [s(10 * 60, date: DateTime(2026, 11, 1))];
      expect(
        currentDailyPace(10, DateTime(2026, 11, 1), now, sessions: sessions),
        finishedDailyPace(10, DateTime(2026, 11, 1), now, sessions: sessions),
      );
    });
  });

  group('courseProgress — no-sessions edge cases policy (ECTS-037, ECTS-008)', () {
    test('start-dated course with running schedule and no sessions is behind', () {
      // Provable shortfall: achieved pace is 0 h/day against a required pace.
      final p = progress(
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      expect(p.status, CourseStatus.behind);
      expect(p.completedHours, 0);
    });

    test('no start date, no sessions, no pace baseline: on track (cannot prove shortfall)', () {
      // ECTS-037 policy: no provable baseline => cannot establish "needs higher
      // pace" (AGENTS.md §4 behind definition). Deadline-only, nothing logged.
      final p = progress(deadline: DateTime(2026, 12, 1));
      expect(p.status, CourseStatus.onTrack);
      expect(finishedDailyPace(0, null, now, sessions: const []), isNull);
    });

    test('no start date, no sessions, past deadline is overdue', () {
      final p = progress(deadline: DateTime(2026, 10, 1));
      expect(p.status, CourseStatus.overdue);
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
