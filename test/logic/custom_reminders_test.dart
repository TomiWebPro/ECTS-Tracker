import 'package:ects_tracker/src/logic/custom_reminders.dart';
import 'package:ects_tracker/src/logic/reminders.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

/// Tuesday.
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
  group('nextFireAt once', () {
    test('future fires, past is null', () {
      final future = CustomSchedule.once(id: 1, fireAt: DateTime(2026, 11, 12, 8));
      expect(nextFireAt(future, now), DateTime(2026, 11, 12, 8));
      final past = CustomSchedule.once(id: 2, fireAt: DateTime(2026, 11, 10, 8));
      expect(nextFireAt(past, now), isNull);
    });
  });

  group('nextFireAt weekly', () {
    test('later today wins', () {
      final s = CustomSchedule.weekly(id: 1, weekdays: {3}, timeMinutes: 20 * 60);
      // 2026-11-11 is a Wednesday (weekday 3).
      expect(nextFireAt(s, now), DateTime(2026, 11, 11, 20));
    });

    test('earlier today rolls to next week', () {
      final s = CustomSchedule.weekly(id: 1, weekdays: {3}, timeMinutes: 8 * 60);
      expect(nextFireAt(s, now), DateTime(2026, 11, 18, 8));
    });

    test('picks the nearest listed weekday', () {
      final s = CustomSchedule.weekly(id: 1, weekdays: {1, 5}, timeMinutes: 9 * 60);
      // Wednesday -> Friday 2026-11-13.
      expect(nextFireAt(s, now), DateTime(2026, 11, 13, 9));
    });

    test('rejects empty weekdays and bad minutes', () {
      expect(() => CustomSchedule.weekly(id: 1, weekdays: const {}, timeMinutes: 60),
          throwsArgumentError);
      expect(() => CustomSchedule.weekly(id: 1, weekdays: const {8}, timeMinutes: 60),
          throwsArgumentError);
      expect(() => CustomSchedule.weekly(id: 1, weekdays: const {1}, timeMinutes: 1440),
          throwsArgumentError);
    });
  });

  group('nextFireAt monthly', () {
    test('later this month wins', () {
      final s = CustomSchedule.monthly(id: 1, dayOfMonth: 15, timeMinutes: 18 * 60);
      expect(nextFireAt(s, now), DateTime(2026, 11, 15, 18));
    });

    test('earlier this month rolls to next month', () {
      final s = CustomSchedule.monthly(id: 1, dayOfMonth: 5, timeMinutes: 18 * 60);
      expect(nextFireAt(s, now), DateTime(2026, 12, 5, 18));
    });

    test('clamps to short months', () {
      // November has 30 days: a 31st fires on the 30th.
      final s = CustomSchedule.monthly(id: 1, dayOfMonth: 31, timeMinutes: 8 * 60);
      expect(nextFireAt(s, now), DateTime(2026, 11, 30, 8));
    });
  });

  group('automaticTopic', () {
    test('prefers behind over soonest deadline', () {
      final courses = [
        course(id: 1, name: 'Soon', ects: 1, deadline: DateTime(2026, 11, 13, 19)),
        course(id: 2, name: 'Slipping', ects: 5, start: DateTime(2026, 10, 1), deadline: DateTime(2026, 12, 1)),
      ];
      final sessions = [session(courseId: 2, minutes: 60, date: DateTime(2026, 10, 5, 10))];
      final topic = automaticTopic(courses: courses, sessions: sessions, hoursPerEcts: 30, now: now)!;
      expect(topic.id, 2);
    });

    test('falls back to soonest deadline, null when all done', () {
      final courses = [
        course(id: 1, name: 'Later', ects: 1, deadline: DateTime(2026, 12, 1, 19)),
        course(id: 2, name: 'Sooner', ects: 1, deadline: DateTime(2026, 11, 20, 19)),
      ];
      expect(
        automaticTopic(courses: courses, sessions: const [], hoursPerEcts: 30, now: now)!.id,
        2,
      );
      final done = [course(id: 1, name: 'Done', ects: 1, deadline: DateTime(2026, 12, 1, 19))];
      final sessions = [session(courseId: 1, minutes: 30 * 60, date: DateTime(2026, 11, 10, 10))];
      expect(
        automaticTopic(courses: done, sessions: sessions, hoursPerEcts: 30, now: now),
        isNull,
      );
    });
  });

  group('composeCustomContent', () {
    test('specific course uses live numbers', () {
      final courses = [
        course(id: 7, name: 'Linear Algebra', ects: 5, start: DateTime(2026, 10, 1), deadline: DateTime(2026, 12, 1)),
      ];
      final sessions = [session(courseId: 7, minutes: 60, date: DateTime(2026, 10, 5, 10))];
      final content = composeCustomContent(
        schedule: CustomSchedule.weekly(id: 1, weekdays: {3}, timeMinutes: 1140, courseId: 7),
        courses: courses,
        sessions: sessions,
        hoursPerEcts: 30,
        now: now,
      )!;
      expect(content.kind, ReminderKind.custom);
      expect(content.title, contains('Linear Algebra'));
      expect(content.body, contains('h/day'));
      expect(content.courseId, 7);
    });

    test('custom label wins, deleted/completed target is null', () {
      final courses = [course(id: 7, name: 'Linear Algebra', ects: 5, deadline: DateTime(2026, 12, 1))];
      final labeled = composeCustomContent(
        schedule: CustomSchedule.once(id: 1, fireAt: DateTime(2026, 11, 12, 8), courseId: 7, label: '📚 Gym? No — study!'),
        courses: courses,
        sessions: const [],
        hoursPerEcts: 30,
        now: now,
      )!;
      expect(labeled.title, '📚 Gym? No — study!');
      expect(
        composeCustomContent(
          schedule: CustomSchedule.once(id: 2, fireAt: DateTime(2026, 11, 12, 8), courseId: 999),
          courses: courses,
          sessions: const [],
          hoursPerEcts: 30,
          now: now,
        ),
        isNull,
      );
      final doneCourses = [course(id: 7, name: 'Done', ects: 1, deadline: DateTime(2026, 12, 1))];
      final doneSessions = [session(courseId: 7, minutes: 30 * 60, date: DateTime(2026, 11, 10, 10))];
      expect(
        composeCustomContent(
          schedule: CustomSchedule.once(id: 3, fireAt: DateTime(2026, 11, 12, 8), courseId: 7),
          courses: doneCourses,
          sessions: doneSessions,
          hoursPerEcts: 30,
          now: now,
        ),
        isNull,
      );
    });

    test('automatic resolves the behind course', () {
      final courses = [
        course(id: 1, name: 'Calm', ects: 1),
        course(id: 2, name: 'Slipping', ects: 5, start: DateTime(2026, 10, 1), deadline: DateTime(2026, 12, 1)),
      ];
      final sessions = [session(courseId: 2, minutes: 60, date: DateTime(2026, 10, 5, 10))];
      final content = composeCustomContent(
        schedule: CustomSchedule.once(id: 1, fireAt: DateTime(2026, 11, 12, 8)),
        courses: courses,
        sessions: sessions,
        hoursPerEcts: 30,
        now: now,
      )!;
      expect(content.courseId, 2);
      expect(content.title, contains('Slipping'));
    });
  });
}
