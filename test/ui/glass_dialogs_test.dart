import 'package:drift/native.dart';
import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/bootstrap.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/glass.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

/// Liquid glass dialogs (ECTS-064): off renders the identical legacy
/// [AlertDialog]/[SimpleDialog] tree, on renders a [LiquidGlassAlertDialog]
/// with the same title/content/actions/Keys. Form inputs stay plain
/// Material (solid, never glass).
void main() {
  Future<AppDatabase> openDb() async {
    final db = AppDatabase(NativeDatabase.memory());
    // Bootstrap seeds the settings row plus three sample courses with
    // sessions (ids 1-3 / 1-6), so dropdowns and lists have content.
    await bootstrapDatabase(db);
    return db;
  }

  Future<void> pumpShell(
    WidgetTester tester,
    AppDatabase db, {
    required bool glass,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(db),
          glassEnabledProvider.overrideWithValue(glass),
        ],
        child: const MaterialApp(
          locale: Locale('en'),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en')],
          home: HomeShell(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> closeDb(WidgetTester tester, AppDatabase db) async {
    // Tear down in dependency order (see l10n_smoke_test.dart).
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 200));
    await db.close();
  }

  /// Tab-bar label tap scoped to the glass tab bar (the same strings
  /// also appear as the app-bar title / page headers).
  Finder glassTab(String label) => find.descendant(
        of: find.byType(LiquidGlassTabBar),
        matching: find.text(label),
      );

  /// Adds a user course through the course dialog (works in both modes:
  /// same Keys and taps by contract). The dialog scrolls in both modes,
  /// so the save action is brought into view before tapping.
  Future<void> addCourseViaDialog(
    WidgetTester tester,
    String name,
    String ects,
  ) async {
    await tester.enterText(find.byKey(const Key('courseNameField')), name);
    await tester.enterText(find.byKey(const Key('courseEctsField')), ects);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('saveCourseButton')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('saveCourseButton')));
    await tester.pumpAndSettle();
  }

  /// Tile title scoped to the courses list (the same name also sits in the
  /// dialog's text field while the dialog is open, so a bare `find.text`
  /// would match twice).
  Finder courseTileText(String name) => find.descendant(
        of: find.byKey(const Key('coursesList')),
        matching: find.text(name),
      );

  group('glass off (legacy dialogs)', () {
    testWidgets(
      'course dialog is a legacy AlertDialog with the same field Keys',
      (tester) async {
        final db = await openDb();
        await pumpShell(tester, db, glass: false);

        await tester.tap(find.text('Courses').last);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('addCourseFab')));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.byType(LiquidGlassAlertDialog), findsNothing);
        expect(find.byKey(const Key('courseNameField')), findsOneWidget);
        expect(find.byKey(const Key('courseEctsField')), findsOneWidget);
        expect(find.byKey(const Key('courseAutoHours')), findsOneWidget);
        expect(
          find.byKey(const Key('courseStartDateButton')),
          findsOneWidget,
        );
        expect(find.byKey(const Key('courseDeadlineButton')), findsOneWidget);
        expect(find.byKey(const Key('courseNotesField')), findsOneWidget);
        expect(find.byKey(const Key('saveCourseButton')), findsOneWidget);

        await tester.tap(find.text('Cancel').last);
        await tester.pumpAndSettle();

        await closeDb(tester, db);
      },
    );

    testWidgets(
      'session dialog + delete-confirm are legacy AlertDialogs',
      (tester) async {
        final db = await openDb();
        await pumpShell(tester, db, glass: false);

        // Session dialog keeps every Key on the legacy surface.
        await tester.tap(find.text('Study Log').last);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('logSessionFab')));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.byType(LiquidGlassAlertDialog), findsNothing);
        expect(
          find.byKey(const Key('sessionCourseDropdown')),
          findsOneWidget,
        );
        expect(find.byKey(const Key('sessionHoursField')), findsOneWidget);
        expect(find.byKey(const Key('sessionMinutesField')), findsOneWidget);
        expect(find.byKey(const Key('sessionTotalDuration')), findsOneWidget);
        expect(find.byKey(const Key('sessionDateButton')), findsOneWidget);
        expect(find.byKey(const Key('sessionNotesField')), findsOneWidget);
        expect(find.byKey(const Key('saveSessionButton')), findsOneWidget);

        await tester.tap(find.text('Cancel').last);
        await tester.pumpAndSettle();

        // A user course gets the legacy delete confirm with the same Key.
        await tester.tap(find.text('Courses').last);
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('addCourseFab')));
        await tester.pumpAndSettle();
        await addCourseViaDialog(tester, 'Doomed Legacy', '3');
        await tester.scrollUntilVisible(courseTileText('Doomed Legacy'), 300.0);
        await tester.pumpAndSettle();
        expect(courseTileText('Doomed Legacy'), findsOneWidget);

        await tester.tap(find.byType(PopupMenuButton<String>));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Delete'));
        await tester.pumpAndSettle();

        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.byType(LiquidGlassAlertDialog), findsNothing);
        expect(find.byKey(const Key('confirmDeleteCourse')), findsOneWidget);

        await closeDb(tester, db);
      },
    );
  });

  group('glass on (liquid glass dialogs)', () {
    testWidgets(
      'course dialog shows glass with same field Keys + save works',
      (tester) async {
        final db = await openDb();
        await pumpShell(tester, db, glass: true);

        await tester.tap(glassTab('Courses'));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('addCourseFab')));
        await tester.pumpAndSettle();

        expect(find.byType(LiquidGlassAlertDialog), findsOneWidget);
        expect(find.byType(AlertDialog), findsNothing);
        expect(find.byKey(const Key('courseNameField')), findsOneWidget);
        expect(find.byKey(const Key('courseEctsField')), findsOneWidget);
        expect(find.byKey(const Key('courseAutoHours')), findsOneWidget);
        expect(
          find.byKey(const Key('courseStartDateButton')),
          findsOneWidget,
        );
        expect(find.byKey(const Key('courseDeadlineButton')), findsOneWidget);
        expect(find.byKey(const Key('courseNotesField')), findsOneWidget);
        expect(find.byKey(const Key('saveCourseButton')), findsOneWidget);

        // Save works through the glass surface: the dialog closes and
        // the new course lists with the same Keys as legacy.
        await addCourseViaDialog(tester, 'Glass 101', '5');
        expect(find.byKey(const Key('courseNameField')), findsNothing);
        await tester.scrollUntilVisible(courseTileText('Glass 101'), 300.0);
        await tester.pumpAndSettle();
        expect(courseTileText('Glass 101'), findsOneWidget);

        await closeDb(tester, db);
      },
    );

    testWidgets(
      'session dialog shows glass with same field Keys + save works',
      (tester) async {
        final db = await openDb();
        await pumpShell(tester, db, glass: true);

        await tester.tap(glassTab('Study Log'));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('logSessionFab')));
        await tester.pumpAndSettle();

        expect(find.byType(LiquidGlassAlertDialog), findsOneWidget);
        expect(find.byType(AlertDialog), findsNothing);
        expect(
          find.byKey(const Key('sessionCourseDropdown')),
          findsOneWidget,
        );
        expect(find.byKey(const Key('sessionHoursField')), findsOneWidget);
        expect(find.byKey(const Key('sessionMinutesField')), findsOneWidget);
        expect(find.byKey(const Key('sessionTotalDuration')), findsOneWidget);
        expect(find.byKey(const Key('sessionDateButton')), findsOneWidget);
        expect(find.byKey(const Key('sessionNotesField')), findsOneWidget);
        expect(find.byKey(const Key('saveSessionButton')), findsOneWidget);

        // Pick a seeded course (its name also renders in the session
        // rows behind the menu route, so take the overlay's `.last`).
        await tester.tap(find.byKey(const Key('sessionCourseDropdown')));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Calculus II').last);
        await tester.pumpAndSettle();

        // Defaults are 0 h / 30 min, already a valid duration.
        await tester.ensureVisible(find.byKey(const Key('saveSessionButton')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('saveSessionButton')));
        await tester.pumpAndSettle();

        // Save works: the glass dialog closes with no form error and
        // the study log still lists sessions.
        expect(find.byKey(const Key('sessionHoursField')), findsNothing);
        expect(find.byKey(const Key('sessionFormError')), findsNothing);
        expect(find.byKey(const Key('studyLogList')), findsOneWidget);

        await closeDb(tester, db);
      },
    );

    testWidgets(
      'delete-confirm shows glass with the same confirm Key',
      (tester) async {
        final db = await openDb();
        await pumpShell(tester, db, glass: true);

        await tester.tap(glassTab('Courses'));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('addCourseFab')));
        await tester.pumpAndSettle();
        await addCourseViaDialog(tester, 'Doomed Glass', '3');
        await tester.scrollUntilVisible(
          courseTileText('Doomed Glass'),
          300.0,
        );
        await tester.pumpAndSettle();

        // Only the user course has a popup menu (sample rows keep
        // their own remove affordance).
        await tester.tap(find.byType(PopupMenuButton<String>));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Delete'));
        await tester.pumpAndSettle();

        expect(find.byType(LiquidGlassAlertDialog), findsOneWidget);
        expect(find.byType(AlertDialog), findsNothing);
        expect(find.byKey(const Key('confirmDeleteCourse')), findsOneWidget);

        // Confirming through glass deletes the course.
        await tester.tap(find.byKey(const Key('confirmDeleteCourse')));
        await tester.pumpAndSettle();
        expect(find.text('Doomed Glass'), findsNothing);

        await closeDb(tester, db);
      },
    );
  });
}
