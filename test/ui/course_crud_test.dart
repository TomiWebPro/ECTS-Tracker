import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Course CRUD UI (ECTS-004)', () {
    late AppDatabase db;

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
          child: const MaterialApp(home: HomeShell()),
        );

    Future<void> goToCourses(WidgetTester tester) async {
      await tester.tap(find.text('Courses'));
      await tester.pumpAndSettle();
    }

    testWidgets('adds a course with auto-calculated hours (default 30 h/ECTS)',
        (tester) async {
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      expect(find.byKey(const Key('addCourseFab')), findsOneWidget);
      await tester.tap(find.byKey(const Key('addCourseFab')));
      await tester.pumpAndSettle();

      expect(find.text('Add course'), findsOneWidget);
      // Auto-hours shows placeholder before ECTS entered.
      expect(find.byKey(const Key('courseAutoHours')), findsOneWidget);
      expect(find.textContaining('Required hours (auto): —'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('courseNameField')), 'Linear Algebra');
      await tester.enterText(find.byKey(const Key('courseEctsField')), '5');
      await tester.pump();

      // 5 ECTS * 30 h/ECTS = 150.0 h
      expect(find.textContaining('Required hours (auto): 150.0 h'), findsOneWidget);
      expect(find.textContaining('30 h/ECTS'), findsOneWidget);

      await tester.tap(find.byKey(const Key('saveCourseButton')));
      await tester.pumpAndSettle();

      // Dialog closed, course appears in list with computed hours.
      expect(find.text('Add course'), findsNothing);
      expect(find.text('Linear Algebra'), findsOneWidget);
      expect(find.textContaining('5.0 ECTS'), findsOneWidget);
      expect(find.textContaining('/ 150.0 h'), findsOneWidget);

      final rows = await db.select(db.courses).get();
      expect(rows, hasLength(1));
      expect(rows.single.name, 'Linear Algebra');
      expect(rows.single.ectsCredits, 5);
      expect(rows.single.isSample, isFalse);
      await flush(tester);
    });

    testWidgets('adds course with notes and color', (tester) async {
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      await tester.tap(find.byKey(const Key('addCourseFab')));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('courseNameField')), 'Physics');
      await tester.enterText(find.byKey(const Key('courseEctsField')), '6');
      await tester.enterText(find.byKey(const Key('courseNotesField')), 'Lab on Tuesdays');
      await tester.pump();

      // Select a color (blue preset 0xFF64B5F6). Ensure visible in scrollable dialog.
      final blueChip = find.byKey(Key('courseColor_${0xFF64B5F6}'));
      await tester.ensureVisible(blueChip);
      await tester.pumpAndSettle();
      await tester.tap(blueChip);
      await tester.pump();

      await tester.tap(find.byKey(const Key('saveCourseButton')));
      await tester.pumpAndSettle();

      final rows = await db.select(db.courses).get();
      expect(rows.single.name, 'Physics');
      expect(rows.single.notes, 'Lab on Tuesdays');
      expect(rows.single.colorValue, 0xFF64B5F6);
      await flush(tester);
    });

    testWidgets('surfaces validation error for invalid ECTS on save attempt',
        (tester) async {
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      await tester.tap(find.byKey(const Key('addCourseFab')));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('courseNameField')), 'Bad');
      // Leave ECTS empty -> form validator blocks save (no repo call needed).
      await tester.tap(find.byKey(const Key('saveCourseButton')));
      await tester.pumpAndSettle();

      expect(find.text('Enter ECTS credits'), findsOneWidget);
      expect(await db.select(db.courses).get(), isEmpty);
      await flush(tester);
    });

    testWidgets('edits an existing course and updates computed hours', (tester) async {
      await CourseRepository(db).addCourse(
        name: 'Original',
        ectsCredits: 3,
        notes: 'old',
      );

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      expect(find.text('Original'), findsOneWidget);
      expect(find.textContaining('/ 90.0 h'), findsOneWidget); // 3*30

      // Tap course to edit.
      await tester.tap(find.text('Original'));
      await tester.pumpAndSettle();
      expect(find.text('Edit course'), findsOneWidget);
      expect(find.byKey(const Key('courseAutoHours')), findsOneWidget);

      await tester.enterText(find.byKey(const Key('courseNameField')), 'Renamed');
      await tester.enterText(find.byKey(const Key('courseEctsField')), '4');
      await tester.enterText(find.byKey(const Key('courseNotesField')), '');
      await tester.pump();
      expect(find.textContaining('Required hours (auto): 120.0 h'), findsOneWidget);

      await tester.tap(find.byKey(const Key('saveCourseButton')));
      await tester.pumpAndSettle();

      expect(find.text('Renamed'), findsOneWidget);
      expect(find.text('Original'), findsNothing);
      expect(find.textContaining('/ 120.0 h'), findsOneWidget);

      final rows = await db.select(db.courses).get();
      expect(rows.single.name, 'Renamed');
      expect(rows.single.ectsCredits, 4);
      expect(rows.single.notes, isNull); // cleared
      await flush(tester);
    });

    testWidgets('deletes a user course via menu after confirmation', (tester) async {
      final add = await CourseRepository(db).addCourse(name: 'To Delete', ectsCredits: 2);
      final id = (add as Ok<int>).value;

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      expect(find.text('To Delete'), findsOneWidget);
      await tester.tap(find.byKey(Key('courseMenu_$id')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      expect(find.text('Delete course?'), findsOneWidget);
      await tester.tap(find.byKey(const Key('confirmDeleteCourse')));
      await tester.pumpAndSettle();

      expect(find.text('To Delete'), findsNothing);
      expect(await db.select(db.courses).get(), isEmpty);
      await flush(tester);
    });

    testWidgets('cancel delete keeps course', (tester) async {
      await CourseRepository(db).addCourse(name: 'Keep Me', ectsCredits: 1);

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToCourses(tester);

      final rows = await db.select(db.courses).get();
      final id = rows.single.id;
      await tester.tap(find.byKey(Key('courseMenu_$id')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.text('Keep Me'), findsOneWidget);
      expect(await db.select(db.courses).get(), hasLength(1));
      await flush(tester);
    });
  });
}
