import 'package:ects_tracker/src/logic/reminders.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

/// Fixed reference instant for deterministic pace math.
final DateTime now = DateTime(2026, 11, 11, 19, 0);

Course course({
  required int id,
  required String name,
  required double ects,
  DateTime? start,
  DateTime? deadline,
}) =>
    Course(id: id, name: name, ectsCredits: ects, startDate: start, deadline: deadline);

StudySession session({
  required int courseId,
  required int minutes,
  required DateTime date,
}) =>
    StudySession(id: 0, courseId: courseId, minutes: minutes, date: date);

void main() {
  group('formatHours', () {
    test('trims whole hours, one decimal otherwise', () {
      expect(formatHours(27.0), '27');
      expect(formatHours(2.5), '2.5');
      expect(formatHours(0), '0');
    });
  });

  group('computeDailyPlan', () {
    test('empty courses returns null', () {
      expect(
        computeDailyPlan(courses: const [], sessions: const [], hoursPerEcts: 30, now: now),
        isNull,
      );
    });

    test('sums finite paces, biggest need first', () {
      final courses = [
        course(id: 1, name: 'Linear Algebra', ects: 5, deadline: DateTime(2026, 11, 21, 19)),
        course(id: 2, name: 'Statistics', ects: 2, deadline: DateTime(2026, 11, 16, 19)),
      ];
      final plan = computeDailyPlan(courses: courses, sessions: const [], hoursPerEcts: 30, now: now)!;
      expect(plan.kind, ReminderKind.daily);
      // 150 h / 10 d = 15 h/day + 60 h / 5 d = 12 h/day.
      expect(plan.title, '📚 Tonight: 27 h to stay on track');
      expect(plan.body.indexOf('Linear Algebra'), lessThan(plan.body.indexOf('Statistics')));
      expect(plan.body, contains('Log a session'));
    });

    test('skips scheduled-future and completed courses', () {
      final courses = [
        course(id: 1, name: 'Future', ects: 5, start: DateTime(2026, 12, 1), deadline: DateTime(2026, 12, 20)),
        course(id: 2, name: 'Done', ects: 1, deadline: DateTime(2026, 11, 21, 19)),
      ];
      final sessions = [
        // 30 h logged of 30 h required -> completed.
        session(courseId: 2, minutes: 30 * 60, date: DateTime(2026, 11, 10, 10)),
      ];
      expect(
        computeDailyPlan(courses: courses, sessions: sessions, hoursPerEcts: 30, now: now),
        isNull,
      );
    });

    test('folds third course into +N more', () {
      final courses = [
        course(id: 1, name: 'A', ects: 5, deadline: DateTime(2026, 11, 21, 19)),
        course(id: 2, name: 'B', ects: 4, deadline: DateTime(2026, 11, 21, 19)),
        course(id: 3, name: 'C', ects: 3, deadline: DateTime(2026, 11, 21, 19)),
      ];
      final plan = computeDailyPlan(courses: courses, sessions: const [], hoursPerEcts: 30, now: now)!;
      expect(plan.body, contains('(+1 more)'));
    });
  });

  group('computeBehindNudges', () {
    test('flags a slipped course with a recovery figure', () {
      final courses = [
        course(id: 1, name: 'Linear Algebra', ects: 5, start: DateTime(2026, 10, 1), deadline: DateTime(2026, 12, 1)),
      ];
      final sessions = [session(courseId: 1, minutes: 60, date: DateTime(2026, 10, 5, 10))];
      final nudges = computeBehindNudges(courses: courses, sessions: sessions, hoursPerEcts: 30, now: now);
      expect(nudges, hasLength(1));
      expect(nudges.first.kind, ReminderKind.behind);
      expect(nudges.first.title, contains('slipped to Behind'));
      expect(nudges.first.body, contains('h/day'));
      expect(nudges.first.courseId, 1);
    });

    test('caps at two, most urgent first', () {
      final courses = [
        course(id: 1, name: 'Late', ects: 5, start: DateTime(2026, 10, 1), deadline: DateTime(2026, 11, 20)),
        course(id: 2, name: 'Mid', ects: 5, start: DateTime(2026, 10, 1), deadline: DateTime(2026, 12, 1)),
        course(id: 3, name: 'Later', ects: 5, start: DateTime(2026, 10, 1), deadline: DateTime(2026, 12, 20)),
      ];
      final nudges = computeBehindNudges(courses: courses, sessions: const [], hoursPerEcts: 30, now: now);
      expect(nudges, hasLength(2));
      expect(nudges.first.courseId, 1);
    });

    test('deadline-day shortfall reports action, not a pace number', () {
      final courses = [
        course(id: 1, name: 'Due Today', ects: 5, deadline: DateTime(2026, 11, 11, 20)),
      ];
      final nudges = computeBehindNudges(courses: courses, sessions: const [], hoursPerEcts: 30, now: now);
      expect(nudges, hasLength(1));
      expect(nudges.first.body, contains('Anything you log now counts.'));
    });
  });

  group('computeDeadlineCountdowns', () {
    test('warns inside the window with tomorrow variant', () {
      final courses = [
        course(id: 1, name: 'Soon', ects: 5, deadline: DateTime(2026, 11, 13, 19)),
        course(id: 2, name: 'Tomorrow', ects: 5, deadline: DateTime(2026, 11, 12, 19)),
        course(id: 3, name: 'Far', ects: 5, deadline: DateTime(2026, 11, 30, 19)),
      ];
      final countdowns = computeDeadlineCountdowns(
          courses: courses, sessions: const [], hoursPerEcts: 30, now: now, warnDays: 3);
      expect(countdowns, hasLength(2));
      // Soonest first.
      expect(countdowns.first.courseId, 2);
      expect(countdowns.first.title, contains('due tomorrow'));
      expect(countdowns.last.title, contains('in 2 days'));
    });

    test('skips completed courses', () {
      final courses = [
        course(id: 1, name: 'Done Soon', ects: 1, deadline: DateTime(2026, 11, 13, 19)),
      ];
      final sessions = [session(courseId: 1, minutes: 30 * 60, date: DateTime(2026, 11, 10, 10))];
      expect(
        computeDeadlineCountdowns(courses: courses, sessions: sessions, hoursPerEcts: 30, now: now),
        isEmpty,
      );
    });
  });

  group('computeOverdue', () {
    test('lists overdue courses oldest first', () {
      final courses = [
        course(id: 1, name: 'Late', ects: 5, deadline: DateTime(2026, 11, 1, 12)),
        course(id: 2, name: 'Okay', ects: 5, deadline: DateTime(2026, 12, 1, 12)),
      ];
      final overdue = computeOverdue(courses: courses, sessions: const [], hoursPerEcts: 30, now: now);
      expect(overdue, hasLength(1));
      expect(overdue.first.kind, ReminderKind.overdue);
      expect(overdue.first.title, startsWith('❌ Late'));
      expect(overdue.first.courseId, 1);
    });
  });

  group('streak', () {
    test('counts consecutive days back from today', () {
      final sessions = [
        session(courseId: 1, minutes: 30, date: DateTime(2026, 11, 11, 10)),
        session(courseId: 1, minutes: 30, date: DateTime(2026, 11, 10, 10)),
        session(courseId: 1, minutes: 30, date: DateTime(2026, 11, 9, 10)),
        session(courseId: 1, minutes: 30, date: DateTime(2026, 11, 7, 10)),
      ];
      final streak = computeStreak(sessions: sessions, now: now);
      expect(streak.days, 3);
      expect(streak.weekHours, closeTo(2.0, 1e-9));
    });

    test('streak stays alive when today is still empty', () {
      final sessions = [
        session(courseId: 1, minutes: 30, date: DateTime(2026, 11, 10, 10)),
        session(courseId: 1, minutes: 30, date: DateTime(2026, 11, 9, 10)),
      ];
      expect(computeStreak(sessions: sessions, now: now).days, 2);
    });

    test('celebrates only when all clear', () {
      final calm = [course(id: 1, name: 'Steady', ects: 5)];
      final streakSessions = [
        session(courseId: 1, minutes: 60, date: DateTime(2026, 11, 11, 10)),
        session(courseId: 1, minutes: 60, date: DateTime(2026, 11, 10, 10)),
      ];
      final nudge = computeStreakNudge(
          courses: calm, sessions: streakSessions, hoursPerEcts: 30, now: now)!;
      expect(nudge.title, contains('2-day streak'));

      final behind = [
        course(id: 1, name: 'Slipping', ects: 5, start: DateTime(2026, 10, 1), deadline: DateTime(2026, 12, 1)),
      ];
      final old = [session(courseId: 1, minutes: 60, date: DateTime(2026, 10, 5, 10))];
      final withRecent = [
        ...old,
        session(courseId: 1, minutes: 60, date: DateTime(2026, 11, 11, 10)),
        session(courseId: 1, minutes: 60, date: DateTime(2026, 11, 10, 10)),
      ];
      expect(
        computeStreakNudge(courses: behind, sessions: withRecent, hoursPerEcts: 30, now: now),
        isNull,
      );
    });
  });

  group('todayLoggedHours', () {
    test('sums only today', () {
      final sessions = [
        session(courseId: 1, minutes: 60, date: DateTime(2026, 11, 11, 8)),
        session(courseId: 1, minutes: 30, date: DateTime(2026, 11, 11, 20)),
        session(courseId: 1, minutes: 60, date: DateTime(2026, 11, 10, 8)),
      ];
      expect(todayLoggedHours(sessions: sessions, now: now), 1.5);
    });
  });

  group('computeReminders', () {
    test('disabled returns nothing', () {
      final courses = [course(id: 1, name: 'A', ects: 5, deadline: DateTime(2026, 11, 1, 12))];
      expect(
        computeReminders(courses: courses, sessions: const [], hoursPerEcts: 30, now: now, enabled: false),
        isEmpty,
      );
    });

    test('orders overdue before daily', () {
      final courses = [
        course(id: 1, name: 'Late', ects: 5, deadline: DateTime(2026, 11, 1, 12)),
        course(id: 2, name: 'Current', ects: 2, deadline: DateTime(2026, 11, 21, 19)),
      ];
      final all = computeReminders(courses: courses, sessions: const [], hoursPerEcts: 30, now: now);
      expect(all.first.kind, ReminderKind.overdue);
      expect(all.any((r) => r.kind == ReminderKind.daily), isTrue);
    });

    test('quiet when everything is completed', () {
      final courses = [course(id: 1, name: 'Done', ects: 1, deadline: DateTime(2026, 11, 21, 19))];
      final sessions = [session(courseId: 1, minutes: 30 * 60, date: DateTime(2026, 11, 10, 10))];
      expect(
        computeReminders(courses: courses, sessions: sessions, hoursPerEcts: 30, now: now),
        isEmpty,
      );
    });
  });
}
