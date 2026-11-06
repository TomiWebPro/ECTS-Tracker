import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/logic/course_list.dart';
import 'package:ects_tracker/src/logic/ects.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Course list sort/filter + progress visuals (ECTS-005)', () {
    late AppDatabase db;
    final now = DateTime(2026, 11, 4, 12);

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
    });

    tearDown(() async {
      await db.close();
    });

    Future<void> flush(WidgetTester tester) async {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
    }

    Widget app() => ProviderScope(
          overrides: [databaseProvider.overrideWithValue(db)],
          child: MaterialApp(home: HomeShell(now: now)),
        );

    Future<void> goToCourses(WidgetTester tester) async {
      await tester.tap(find.text('Courses'));
      await tester.pumpAndSettle();
    }

    Future<void> seedCourses(CourseRepository repo) async {
      // Behind: 5 ECTS=150h, 1h logged, running behind pace.
      final behindId = (await repo.addCourse(
        name: 'Zulu Behind',
        ectsCredits: 5,
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      ) as Ok<int>)
          .value;
      await SessionRepository(db).addSession(
        courseId: behindId,
        minutes: 60,
        date: DateTime(2026, 11, 3, 12),
      );
      // Ahead: 100h logged.
      final aheadId = (await repo.addCourse(
        name: 'Alpha Ahead',
        ectsCredits: 5,
        startDate: DateTime(2026, 11, 1),
        deadline: DateTime(2026, 11, 11),
      ) as Ok<int>)
          .value;
      await SessionRepository(db).addSession(
        courseId: aheadId,
        minutes: 100 * 60,
        date: DateTime(2026, 11, 3, 12),
      );
      // Overdue: past deadline, no sessions.
      await repo.addCourse(
        name: 'Mike Overdue',
        ectsCredits: 5,
        deadline: DateTime(2026, 10, 1),
      );
      // On track, no deadline: 50% progress.
      final ndId = (await repo.addCourse(
        name: 'Bravo Open',
        ectsCredits: 2,
      ) as Ok<int>)
          .value;
      await SessionRepository(db).addSession(
        courseId: ndId,
        minutes: 30 * 60,
        date: DateTime(2026, 11, 3, 12),
      );
    }

    testWidgets('shows progress visuals (bar, hours, status) per course',
        (tester) async {
      final repo = CourseRepository(db);
      final id = (await repo.addCourse(
        name: 'Visuals',
        ectsCredits: 5,
        deadline: DateTime(2026, 12, 1),
      ) as Ok<int>)
          .value;
      await SessionRepository(db).addSession(
        courseId: id,
        minutes: 30 * 60,
        date: DateTime(2026, 11, 3, 12),
      );

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      expect(find.byKey(Key('courseProgressBar_$id')), findsOneWidget);
      expect(find.byKey(Key('courseProgressText_$id')), findsOneWidget);
      expect(find.textContaining('30.0 / 150.0 h'), findsOneWidget);
      expect(find.textContaining(courseStatusLabel(CourseStatus.onTrack)),
          findsOneWidget);
      await flush(tester);
    });

    testWidgets('sort controls and status filter are present', (tester) async {
      await CourseRepository(db)
          .addCourse(name: 'Solo', ectsCredits: 1);

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      expect(find.byKey(const Key('courseSortDropdown')), findsOneWidget);
      expect(find.byKey(const Key('courseStatusFilterDropdown')), findsOneWidget);
      await flush(tester);
    });

    testWidgets('sorts by name by default (A→Z)', (tester) async {
      final repo = CourseRepository(db);
      await repo.addCourse(name: 'Zulu', ectsCredits: 1);
      await repo.addCourse(name: 'Alpha', ectsCredits: 1);
      await repo.addCourse(name: 'Mike', ectsCredits: 1);

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      final tiles = tester.widgetList<ListTile>(find.byType(ListTile)).toList();
      final titles = tiles
          .map((t) => ((t.title as Row).children.first as Expanded).child as Text)
          .map((t) => t.data)
          .toList();
      expect(titles, ['Alpha', 'Mike', 'Zulu']);
      await flush(tester);
    });

    testWidgets('filters by status', (tester) async {
      await seedCourses(CourseRepository(db));

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      // All 4 visible initially.
      expect(find.text('Zulu Behind'), findsOneWidget);
      expect(find.text('Alpha Ahead'), findsOneWidget);
      expect(find.text('Mike Overdue'), findsOneWidget);
      expect(find.text('Bravo Open'), findsOneWidget);

      // Open filter dropdown and select Overdue.
      await tester.tap(find.byKey(const Key('courseStatusFilterDropdown')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('courseFilter_${CourseStatus.overdue.name}')).last);
      await tester.pumpAndSettle();

      expect(find.text('Mike Overdue'), findsOneWidget);
      expect(find.text('Zulu Behind'), findsNothing);
      expect(find.text('Alpha Ahead'), findsNothing);
      expect(find.text('Bravo Open'), findsNothing);
      await flush(tester);
    });

    testWidgets('shows empty message when filter matches nothing', (tester) async {
      await CourseRepository(db).addCourse(
        name: 'Only Course',
        ectsCredits: 1,
        deadline: DateTime(2026, 12, 1),
      );

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      await tester.tap(find.byKey(const Key('courseStatusFilterDropdown')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('courseFilter_${CourseStatus.completed.name}')).last);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('coursesFilterEmpty')), findsOneWidget);
      expect(find.text('No courses match this filter'), findsOneWidget);
      await flush(tester);
    });

    testWidgets('sorts by status (needs attention first)', (tester) async {
      await seedCourses(CourseRepository(db));

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      await tester.tap(find.byKey(const Key('courseSortDropdown')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(Key('courseSort_${CourseSort.status.name}')).last);
      await tester.pumpAndSettle();

      final tiles = tester.widgetList<ListTile>(find.byType(ListTile)).toList();
      final titles = tiles
          .map((t) => ((t.title as Row).children.first as Expanded).child as Text)
          .map((t) => t.data)
          .toList();
      expect(titles.first, 'Mike Overdue');
      expect(titles[1], 'Zulu Behind');
      expect(titles.last, 'Alpha Ahead');
      await flush(tester);
    });
  });
}
