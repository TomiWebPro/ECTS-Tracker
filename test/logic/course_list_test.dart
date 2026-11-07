import 'package:ects_tracker/src/logic/course_list.dart';
import 'package:ects_tracker/src/logic/ects.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 11, 4, 12);

  Course course(
    int id,
    String name, {
    double ects = 5,
    DateTime? startDate,
    DateTime? deadline,
  }) =>
      Course(
        id: id,
        name: name,
        ectsCredits: ects,
        startDate: startDate,
        deadline: deadline,
      );

  StudySession session(int courseId, int minutes, {DateTime? date}) =>
      StudySession(
        id: courseId * 1000 + minutes,
        courseId: courseId,
        minutes: minutes,
        date: date ?? DateTime(2026, 11, 3, 12),
      );

  group('coursesWithProgress', () {
    test('groups sessions by course and computes derived progress', () {
      final courses = [
        course(1, 'A', ects: 5), // 150h required
        course(2, 'B', ects: 2), // 60h required
      ];
      final sessions = [
        session(1, 30 * 60),
        session(1, 15 * 60),
        session(2, 60 * 60), // completes course 2
      ];
      final result = coursesWithProgress(
        courses,
        sessions,
        hoursPerEcts: 30,
        now: now,
      );
      expect(result, hasLength(2));
      expect(result[0].course.id, 1);
      expect(result[0].progress.completedHours, closeTo(45, 1e-9));
      expect(result[0].progress.requiredHours, 150);
      expect(result[1].progress.status, CourseStatus.completed);
    });

    test('course with no sessions gets zero progress', () {
      final result = coursesWithProgress(
        [course(1, 'Empty', deadline: DateTime(2026, 12, 1))],
        const [],
        hoursPerEcts: 30,
        now: now,
      );
      expect(result.single.progress.completedHours, 0);
      expect(result.single.progress.progressFraction, 0);
    });
  });

  group('sortAndFilterCourses', () {
    late List<CourseWithProgress> items;

    setUp(() {
      // Build a deterministic set covering name/deadline/progress/status.
      // 5-day band: behind needs deficit ≥ 5*need, so Zulu uses start 10-01
      // (expected ≈126 h) with 1 h logged → behind.
      final cBehind = course(
        1,
        'Zulu',
        ects: 5,
        startDate: DateTime(2026, 10, 1),
        deadline: DateTime(2026, 11, 11),
      );
      final cAhead = course(
        2,
        'Alpha',
        ects: 5,
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      );
      final cOverdue = course(
        3,
        'Mike',
        ects: 5,
        deadline: DateTime(2026, 10, 1),
      );
      final cNoDeadline = course(4, 'Bravo', ects: 2); // onTrack, no deadline
      items = coursesWithProgress(
        [cBehind, cAhead, cOverdue, cNoDeadline],
        [
          session(1, 60), // 1h of 150h, behind
          session(2, 100 * 60), // ahead
          // cOverdue: no sessions, past deadline -> overdue
          session(4, 30 * 60), // 30h of 60h = 50%
        ],
        hoursPerEcts: 30,
        now: now,
      );
    });

    test('sort by name A→Z (case-insensitive)', () {
      final sorted = sortAndFilterCourses(items, sort: CourseSort.name);
      expect(sorted.map((e) => e.course.name).toList(),
          ['Alpha', 'Bravo', 'Mike', 'Zulu']);
    });

    test('sort by deadline soonest first, null deadlines last', () {
      final sorted = sortAndFilterCourses(items, sort: CourseSort.deadline);
      final names = sorted.map((e) => e.course.name).toList();
      expect(names.last, 'Bravo'); // no deadline
      // Oct 1 (overdue) comes before Nov 11 entries.
      expect(names.indexOf('Mike') < names.indexOf('Zulu'), isTrue);
      expect(names.indexOf('Mike') < names.indexOf('Alpha'), isTrue);
    });

    test('sort by progress highest first', () {
      final sorted = sortAndFilterCourses(items, sort: CourseSort.progress);
      // Ahead course logged 100/150; Bravo 30/60 = 0.5; behind ~0.0067; overdue 0.
      expect(sorted.first.course.name, 'Alpha');
      expect(sorted.last.course.name, 'Mike');
      // Verify descending fractions.
      for (var i = 1; i < sorted.length; i++) {
        expect(
          sorted[i - 1].progress.progressFraction >=
              sorted[i].progress.progressFraction,
          isTrue,
          reason: 'index $i not descending',
        );
      }
    });

    test('sort by status puts needs-attention first', () {
      final sorted = sortAndFilterCourses(items, sort: CourseSort.status);
      final statuses = sorted.map((e) => e.progress.status).toList();
      expect(statuses.first, CourseStatus.overdue);
      expect(statuses[1], CourseStatus.behind);
      expect(statuses.last, CourseStatus.ahead);
    });

    test('sortByViewPriority orders behind, onTrack, ahead', () {
      final sorted = sortByViewPriority(items);
      final names = sorted.map((e) => e.course.name).toList();
      // Overdue (Mike) + behind (Zulu) first, ahead (Alpha) last.
      expect(names.indexOf('Mike') < names.indexOf('Bravo'), isTrue);
      expect(names.indexOf('Zulu') < names.indexOf('Bravo'), isTrue);
      expect(sorted.last.course.name, 'Alpha');
      expect(sorted.last.progress.status, CourseStatus.ahead);
    });

    test('dashboardItems excludes completed and scheduled, keeps priority', () {
      final done = course(5, 'Done', ects: 2); // no dates, completed
      final future = course(
        6,
        'Future',
        ects: 5,
        startDate: DateTime(2026, 12, 1),
        deadline: DateTime(2027, 2, 1),
      );
      final all = coursesWithProgress(
        [done, future],
        [session(5, 60 * 60)], // completes Done (60/60h)
        hoursPerEcts: 30,
        now: now,
      );
      expect(
        all.firstWhere((e) => e.course.name == 'Done').progress.status,
        CourseStatus.completed,
      );
      final dash = dashboardItems([...items, ...all], now);
      final names = dash.map((e) => e.course.name).toList();
      expect(names, isNot(contains('Done')));
      expect(names, isNot(contains('Future')));
      // Priority order preserved: overdue/behind before onTrack before ahead.
      expect(names.indexOf('Zulu') < names.indexOf('Bravo'), isTrue);
      expect(dash.last.course.name, 'Alpha');
    });

    test('filter by status returns only matching courses', () {
      final filtered = sortAndFilterCourses(
        items,
        sort: CourseSort.name,
        statusFilter: CourseStatus.behind,
      );
      expect(filtered, hasLength(1));
      expect(filtered.single.course.name, 'Zulu');
    });

    test('filter with no matches returns empty list', () {
      final filtered = sortAndFilterCourses(
        items,
        statusFilter: CourseStatus.completed,
      );
      expect(filtered, isEmpty);
    });

    test('null filter returns all courses', () {
      final filtered = sortAndFilterCourses(items, statusFilter: null);
      expect(filtered, hasLength(items.length));
    });
  });

  group('labels', () {
    test('courseSortLabel covers all values', () {
      for (final s in CourseSort.values) {
        expect(courseSortLabel(s), isNotEmpty);
      }
    });

    test('courseStatusLabel covers all values', () {
      for (final s in CourseStatus.values) {
        expect(courseStatusLabel(s), isNotEmpty);
      }
    });
  });
}
