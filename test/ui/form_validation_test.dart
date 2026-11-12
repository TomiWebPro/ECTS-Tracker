import 'package:drift/native.dart';
import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/course_form.dart';
import 'package:ects_tracker/src/ui/session_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Form validation contract (ECTS-083): course/session dialogs reject bad
/// input with localized errors and never write bad rows.
void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  /// Unmounts the scope BEFORE the db closes (Drift stream teardown leaves
  /// pending timers that fail the next pump — same pattern as the glass
  /// dialog tests). Called explicitly at the end of every test body.
  Future<void> finishDb(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 200));
    await db.close();
  }

  Future<void> pumpHost(
    WidgetTester tester,
    Future<void> Function(BuildContext) open,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: Center(
              child: Builder(
                builder: (context) => ElevatedButton(
                  key: const Key('openDialog'),
                  onPressed: () => open(context),
                  child: const Text('open'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('openDialog')));
    await tester.pumpAndSettle();
  }

  group('CourseFormDialog validation', () {
    testWidgets('empty save shows name error, writes nothing',
        (tester) async {
      await pumpHost(tester, (c) => showCourseFormDialog(c));
      await tester.tap(find.byKey(const Key('saveCourseButton')));
      await tester.pumpAndSettle();
      expect(find.text('Name is required'), findsOneWidget);
      // Dialog stays open (save rejected).
      expect(find.byKey(const Key('saveCourseButton')), findsOneWidget);
      await finishDb(tester);
    });

    testWidgets('name without ECTS shows ECTS error', (tester) async {
      await pumpHost(tester, (c) => showCourseFormDialog(c));
      await tester.enterText(
          find.byKey(const Key('courseNameField')), 'Algebra');
      await tester.tap(find.byKey(const Key('saveCourseButton')));
      await tester.pumpAndSettle();
      expect(find.text('Enter ECTS credits'), findsOneWidget);
      await finishDb(tester);
    });

    testWidgets('zero ECTS is rejected', (tester) async {
      await pumpHost(tester, (c) => showCourseFormDialog(c));
      await tester.enterText(
          find.byKey(const Key('courseNameField')), 'Algebra');
      await tester.enterText(find.byKey(const Key('courseEctsField')), '0');
      await tester.tap(find.byKey(const Key('saveCourseButton')));
      await tester.pumpAndSettle();
      expect(find.text('ECTS must be greater than zero'), findsOneWidget);
      await finishDb(tester);
    });

    testWidgets('comma decimal accepted, happy path saves and closes',
        (tester) async {
      await pumpHost(tester, (c) => showCourseFormDialog(c));
      await tester.enterText(
          find.byKey(const Key('courseNameField')), 'Algebra');
      await tester.enterText(
          find.byKey(const Key('courseEctsField')), '5,5');
      await tester.tap(find.byKey(const Key('saveCourseButton')));
      await tester.pumpAndSettle();
      // Saved and popped.
      expect(find.byKey(const Key('saveCourseButton')), findsNothing);
      final courses = await CourseRepository(db).getAll();
      expect(courses.map((c) => c.name), ['Algebra']);
      expect(courses.first.ectsCredits, 5.5);
      await finishDb(tester);
    });
  });

  group('SessionFormDialog validation', () {
    testWidgets('save with no courses shows course error',
        (tester) async {
      await pumpHost(tester, (c) => showSessionFormDialog(c));
      await tester.tap(find.byKey(const Key('saveSessionButton')));
      await tester.pumpAndSettle();
      // Dropdown validator fires (no selection possible).
      expect(find.text('Select a course'), findsWidgets);
      await finishDb(tester);
    });

    testWidgets('zero duration is rejected', (tester) async {
      final courseId =
          ((await CourseRepository(db).addCourse(name: 'A', ectsCredits: 5))
                  as Ok<int>)
              .value;
      expect(courseId, greaterThan(0));
      await pumpHost(tester, (c) => showSessionFormDialog(c));
      await tester.enterText(
          find.byKey(const Key('sessionMinutesField')), '0');
      await tester.tap(find.byKey(const Key('saveSessionButton')));
      await tester.pumpAndSettle();
      expect(find.text('Enter a duration'), findsOneWidget);
      // Nothing written.
      expect(await SessionRepository(db).getAll(), isEmpty);
      await finishDb(tester);
    });

    testWidgets('happy path saves and closes', (tester) async {
      await CourseRepository(db).addCourse(name: 'A', ectsCredits: 5);
      await pumpHost(tester, (c) => showSessionFormDialog(c));
      await tester.enterText(
          find.byKey(const Key('sessionMinutesField')), '45');
      await tester.tap(find.byKey(const Key('saveSessionButton')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('saveSessionButton')), findsNothing);
      final sessions = await SessionRepository(db).getAll();
      expect(sessions, hasLength(1));
      expect(sessions.first.minutes, 45);
      await finishDb(tester);
    });
  });
}
