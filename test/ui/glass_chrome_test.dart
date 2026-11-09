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

/// Floating glass chrome (ECTS-062): off renders the legacy Material
/// chrome, on renders the LiquidGlass chrome with the same Keys, labels,
/// icons and taps.
void main() {
  Future<AppDatabase> openDb() async {
    final db = AppDatabase(NativeDatabase.memory());
    // Bootstrap creates the settings singleton row; without it the
    // settings stream never emits and the UI stays on loading.
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
  Finder tabLabel(String label) => find.descendant(
        of: find.byType(LiquidGlassTabBar),
        matching: find.text(label),
      );

  group('glass off (legacy chrome)', () {
    testWidgets('renders Material chrome, no glass', (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: false);

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(NavigationBar), findsOneWidget);
      expect(find.byType(FilledButton), findsWidgets);
      expect(
        find.byKey(const Key('dashboardLogSessionAction')),
        findsOneWidget,
      );
      expect(
        tester.widget<FilledButton>(
          find.byKey(const Key('dashboardLogSessionAction')),
        ),
        isNotNull,
      );

      expect(find.byType(LiquidGlassAppBar), findsNothing);
      expect(find.byType(LiquidGlassTabBar), findsNothing);
      expect(find.byType(LiquidGlassButton), findsNothing);
      expect(find.byType(LiquidGlassFab), findsNothing);
      expect(find.byType(LiquidGlassBatch), findsNothing);
      expect(find.byType(LiquidGlassScrollEdge), findsNothing);

      await closeDb(tester, db);
    });

    testWidgets('FABs keep Keys and open dialogs', (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: false);

      await tester.tap(find.text('Courses').last);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('addCourseFab')), findsOneWidget);
      await tester.tap(find.byKey(const Key('addCourseFab')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('courseNameField')), findsOneWidget);
      await tester.tap(find.text('Cancel').last);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Study Log').last);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('logSessionFab')), findsOneWidget);
      await tester.tap(find.byKey(const Key('logSessionFab')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('sessionHoursField')), findsOneWidget);

      await closeDb(tester, db);
    });
  });

  group('glass on (floating chrome)', () {
    testWidgets('renders glass chrome, no Material chrome', (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: true);

      expect(find.byType(LiquidGlassAppBar), findsOneWidget);
      expect(find.byType(LiquidGlassTabBar), findsOneWidget);
      expect(find.byType(LiquidGlassBatch), findsWidgets);
      // Top + bottom legibility bands.
      expect(find.byType(LiquidGlassScrollEdge), findsNWidgets(2));
      // Dashboard log action keeps its Key on the glass button.
      final action = find.byKey(const Key('dashboardLogSessionAction'));
      expect(action, findsOneWidget);
      expect(
        tester.widget<LiquidGlassButton>(action),
        isNotNull,
      );

      expect(find.byType(AppBar), findsNothing);
      expect(find.byType(NavigationBar), findsNothing);
      expect(find.byType(FilledButton), findsNothing);

      await closeDb(tester, db);
    });

    testWidgets('tab taps navigate, select state follows', (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: true);

      expect(find.byType(LiquidGlassTabBar), findsOneWidget);
      expect(
        tester
            .widget<LiquidGlassTabBar>(find.byType(LiquidGlassTabBar))
            .selectedIndex,
        0,
      );

      await tester.tap(tabLabel('Courses'));
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<LiquidGlassTabBar>(find.byType(LiquidGlassTabBar))
            .selectedIndex,
        1,
      );
      expect(find.byKey(const Key('addCourseFab')), findsOneWidget);
      expect(
        tester.widget<LiquidGlassFab>(find.byKey(const Key('addCourseFab'))),
        isNotNull,
      );

      await tester.tap(tabLabel('Study Log'));
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<LiquidGlassTabBar>(find.byType(LiquidGlassTabBar))
            .selectedIndex,
        2,
      );
      expect(find.byKey(const Key('logSessionFab')), findsOneWidget);

      await tester.tap(tabLabel('Dashboard'));
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<LiquidGlassTabBar>(find.byType(LiquidGlassTabBar))
            .selectedIndex,
        0,
      );
      expect(
        find.byKey(const Key('dashboardLogSessionAction')),
        findsOneWidget,
      );

      await closeDb(tester, db);
    });

    testWidgets('FABs keep Keys and open dialogs', (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: true);

      await tester.tap(tabLabel('Courses'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('addCourseFab')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('courseNameField')), findsOneWidget);
      await tester.tap(find.text('Cancel').last);
      await tester.pumpAndSettle();

      await tester.tap(tabLabel('Study Log'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('logSessionFab')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('sessionHoursField')), findsOneWidget);

      await closeDb(tester, db);
    });

    testWidgets('dashboard log action opens the session dialog',
        (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: true);

      await tester.tap(find.byKey(const Key('dashboardLogSessionAction')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('sessionHoursField')), findsOneWidget);

      await closeDb(tester, db);
    });

    testWidgets('app-bar dashboard action opens the session dialog',
        (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: true);

      final action = find.descendant(
        of: find.byType(LiquidGlassAppBar),
        matching: find.byType(IconButton),
      );
      expect(action, findsOneWidget);
      await tester.tap(action);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('sessionHoursField')), findsOneWidget);

      await closeDb(tester, db);
    });
  });
}
