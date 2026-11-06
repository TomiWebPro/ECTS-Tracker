import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Fast session logging UI (ECTS-006)', () {
    late AppDatabase db;
    late int courseId;

    setUp(() async {
      db = AppDatabase(NativeDatabase.memory());
      final repo = CourseRepository(db);
      final add = await repo.addCourse(name: 'Algorithms', ectsCredits: 5);
      courseId = (add as Ok<int>).value;
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

    Future<void> goToStudyLog(WidgetTester tester) async {
      await tester.tap(find.text('Study Log'));
      await tester.pumpAndSettle();
    }

    testWidgets('logs a session via FAB (course, h/min, date, notes) and updates totals',
        (tester) async {
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToStudyLog(tester);

      expect(find.byKey(const Key('logSessionFab')), findsOneWidget);
      await tester.tap(find.byKey(const Key('logSessionFab')));
      await tester.pumpAndSettle();

      expect(find.text('Log study session'), findsOneWidget);
      // Single course is auto-selected.
      expect(find.byKey(const Key('sessionCourseDropdown')), findsOneWidget);
      expect(find.byKey(const Key('sessionTotalDuration')), findsOneWidget);

      await tester.enterText(find.byKey(const Key('sessionHoursField')), '1');
      await tester.enterText(find.byKey(const Key('sessionMinutesField')), '30');
      await tester.enterText(find.byKey(const Key('sessionNotesField')), 'Chapter 3');
      await tester.pump();

      expect(find.textContaining('Total: 1.50 h'), findsOneWidget);

      await tester.tap(find.byKey(const Key('saveSessionButton')));
      await tester.pumpAndSettle();

      // Dialog closed and session appears in Study Log.
      expect(find.text('Log study session'), findsNothing);
      expect(find.text('Algorithms'), findsWidgets);
      // ECTS-007 adds daily/weekly totals; match the session row, not totals.
      expect(
        find.descendant(
          of: find.byKey(const Key('studyLogList')),
          matching: find.textContaining('1.5 h'),
        ),
        findsOneWidget,
      );

      final rows = await db.select(db.studySessions).get();
      expect(rows, hasLength(1));
      expect(rows.single.courseId, courseId);
      expect(rows.single.minutes, 90);
      expect(rows.single.notes, 'Chapter 3');
      expect(rows.single.isSample, isFalse);

      // Totals update reactively: overview reflects logged hours.
      await tester.tap(find.text('Dashboard'));
      await tester.pumpAndSettle();
      expect(find.textContaining('1.5 h of 150 h'), findsOneWidget);

      await flush(tester);
    });

    testWidgets('validates duration must be greater than zero', (tester) async {
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToStudyLog(tester);

      await tester.tap(find.byKey(const Key('logSessionFab')));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('sessionHoursField')), '0');
      await tester.enterText(find.byKey(const Key('sessionMinutesField')), '0');
      await tester.pump();

      await tester.tap(find.byKey(const Key('saveSessionButton')));
      await tester.pumpAndSettle();

      expect(find.text('Enter a duration'), findsOneWidget);
      expect(await db.select(db.studySessions).get(), isEmpty);
      await flush(tester);
    });

    testWidgets('shows hint and blocks save when no courses exist', (tester) async {
      // Empty DB (no courses).
      final emptyDb = AppDatabase(NativeDatabase.memory());
      addTearDown(emptyDb.close);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [databaseProvider.overrideWithValue(emptyDb)],
          child: const MaterialApp(home: HomeShell()),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Study Log'));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('logSessionFab')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('sessionNoCoursesHint')), findsOneWidget);
      expect(find.text('Add a course first to log a session.'), findsOneWidget);

      await tester.tap(find.byKey(const Key('saveSessionButton')));
      await tester.pumpAndSettle();

      expect(find.text('Select a course'), findsOneWidget);
      await flush(tester);
    });

    testWidgets('allows choosing a course when multiple exist', (tester) async {
      final repo = CourseRepository(db);
      final add2 = await repo.addCourse(name: 'Physics', ectsCredits: 6);
      final physicsId = (add2 as Ok<int>).value;

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToStudyLog(tester);

      await tester.tap(find.byKey(const Key('logSessionFab')));
      await tester.pumpAndSettle();

      // Open dropdown and select Physics.
      await tester.tap(find.byKey(const Key('sessionCourseDropdown')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Physics').last);
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const Key('sessionHoursField')), '0');
      await tester.enterText(find.byKey(const Key('sessionMinutesField')), '45');
      await tester.tap(find.byKey(const Key('saveSessionButton')));
      await tester.pumpAndSettle();

      final rows = await db.select(db.studySessions).get();
      expect(rows.single.courseId, physicsId);
      expect(rows.single.minutes, 45);
      await flush(tester);
    });

    testWidgets('study log shows newly added session (reactive)', (tester) async {
      final sessionRepo = SessionRepository(db);
      await sessionRepo.addSession(
        courseId: courseId,
        minutes: 60,
        date: DateTime(2026, 5, 1),
      );

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToStudyLog(tester);

      expect(find.text('Algorithms'), findsWidgets);
      expect(find.textContaining('1.0 h'), findsOneWidget);

      // Add another via repo (simulating save) - UI should react.
      await sessionRepo.addSession(
        courseId: courseId,
        minutes: 30,
        date: DateTime(2026, 5, 2),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('0.5 h'), findsOneWidget);
      await flush(tester);
    });
  });
}
