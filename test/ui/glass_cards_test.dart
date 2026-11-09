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

/// Liquid glass cards (ECTS-063): off renders the identical keyed legacy
/// Cards, on renders keyed lite [LiquidGlassLens] surfaces grouped in one
/// [LiquidGlassBatch] per page, with the same Keys and working taps.
void main() {
  Future<AppDatabase> openDb() async {
    final db = AppDatabase(NativeDatabase.memory());
    // Bootstrap seeds the settings row plus three sample courses with
    // sessions (ids 1-3 / 1-6), so every card section has content.
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

  /// Surfaces carrying [key] filtered by type: [GlassCard] forwards its key
  /// to the underlying [Card]/[LiquidGlassLens] (ECTS-061), so `find.byKey`
  /// matches the gate plus the surface — and `widgetList<T>` cannot cast the
  /// gate. Filters by type instead, without casting the rest.
  List<T> surfacesWithKey<T extends Widget>(Key key) => find
      .byKey(key)
      .evaluate()
      .where((e) => e.widget is T)
      .map((e) => e.widget as T)
      .toList();

  /// Scrolls [finder] into view: lazily built list rows below the fold are
  /// not in the tree until scrolled to.
  Future<void> reveal(WidgetTester tester, Finder finder) async {
    await tester.scrollUntilVisible(finder, 400.0);
    await tester.pumpAndSettle();
  }

  group('glass off (legacy cards)', () {
    testWidgets('cards render as Card with the same Keys, no lens/batch',
        (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: false);

      // Dashboard hero + one course row keep every Key (rows below the fold
      // are built on scroll).
      expect(find.byKey(const Key('dashboardOverallPct')), findsOneWidget);
      expect(find.byKey(const Key('dashboardTodayPace')), findsOneWidget);
      expect(find.byKey(const Key('dashboardTotals')), findsOneWidget);
      expect(find.byKey(const Key('dashboardCourseCount')), findsOneWidget);
      await reveal(tester, find.byKey(const Key('dashboardCourseCard_1')));
      // The row Key sits on _DashboardCourseCard above the surface: the
      // legacy surface is the Card below it.
      expect(
        find.descendant(
          of: find.byKey(const Key('dashboardCourseCard_1')),
          matching: find.byType(Card),
        ),
        findsOneWidget,
      );
      expect(find.byKey(const Key('dashboardProgress_1')), findsOneWidget);
      expect(find.byKey(const Key('dashboardHours_1')), findsOneWidget);
      expect(find.byType(Card), findsWidgets);
      expect(find.byType(LiquidGlassLens), findsNothing);
      expect(find.byType(LiquidGlassBatch), findsNothing);

      // Courses tab: rows + filter controls keep Keys.
      await tester.tap(find.text('Courses').last);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('coursesList')), findsOneWidget);
      expect(find.byKey(const Key('courseTile_1')), findsOneWidget);
      expect(find.byKey(const Key('courseProgressText_1')), findsOneWidget);
      expect(find.byKey(const Key('courseProgressBar_1')), findsOneWidget);
      expect(find.byKey(const Key('courseSortDropdown')), findsOneWidget);
      expect(
        find.byKey(const Key('courseStatusFilterDropdown')),
        findsOneWidget,
      );
      expect(find.byType(Card), findsWidgets);
      expect(find.byType(LiquidGlassLens), findsNothing);

      // Study tab: totals card + session rows keep Keys.
      await tester.tap(find.text('Study Log').last);
      await tester.pumpAndSettle();
      expect(
        surfacesWithKey<Card>(const Key('studyTotalsCard')),
        hasLength(1),
      );
      expect(find.byKey(const Key('dailyTotal')), findsOneWidget);
      expect(find.byKey(const Key('weeklyTotal')), findsOneWidget);
      expect(find.byKey(const Key('studyLogList')), findsOneWidget);
      expect(find.byKey(const Key('sessionTile_1')), findsOneWidget);
      expect(find.byType(LiquidGlassLens), findsNothing);

      // Statistics tab: section cards render, still Cards.
      await tester.tap(find.text('Statistics').last);
      await tester.pumpAndSettle();
      expect(find.text('Overview'), findsOneWidget);
      await reveal(tester, find.text('Algorithms & Data Structures'));
      expect(find.text('Algorithms & Data Structures'), findsOneWidget);
      expect(find.byType(Card), findsWidgets);
      expect(find.byType(LiquidGlassLens), findsNothing);
      expect(find.byType(LiquidGlassBatch), findsNothing);

      await closeDb(tester, db);
    });
  });

  group('glass on (lite card lenses)', () {
    testWidgets('hero is a tinted lite lens keeping its Keys', (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: true);

      final heroLens = find.ancestor(
        of: find.byKey(const Key('dashboardOverallPct')),
        matching: find.byType(LiquidGlassLens),
      );
      expect(heroLens, findsOneWidget);
      final style = tester.widget<LiquidGlassLens>(heroLens).style;
      expect(style.liteGlass, isTrue);
      expect(style.shadow, isNotNull);
      // Tinted with the legacy hero fill.
      final scheme = Theme.of(
        tester.element(find.byKey(const Key('dashboardOverallPct'))),
      ).colorScheme;
      expect(style.color, scheme.primaryContainer);

      // Same inner Keys as the legacy hero.
      expect(find.byKey(const Key('dashboardTodayPace')), findsOneWidget);
      expect(find.byKey(const Key('dashboardTotals')), findsOneWidget);
      expect(find.byKey(const Key('dashboardCourseCount')), findsOneWidget);

      // One dashboard course row: the row Key sits on _DashboardCourseCard
      // above the surface; the lens renders below it.
      await reveal(tester, find.byKey(const Key('dashboardCourseCard_1')));
      final rowLens = find.descendant(
        of: find.byKey(const Key('dashboardCourseCard_1')),
        matching: find.byType(LiquidGlassLens),
      );
      expect(rowLens, findsOneWidget);
      expect(
        tester.widget<LiquidGlassLens>(rowLens).style.liteGlass,
        isTrue,
      );
      expect(find.byKey(const Key('dashboardProgress_1')), findsOneWidget);
      expect(find.byKey(const Key('dashboardHours_1')), findsOneWidget);

      // One batch per page (plus the floating-chrome batch).
      expect(find.byType(LiquidGlassBatch), findsWidgets);

      await closeDb(tester, db);
    });

    testWidgets('course rows, chips, totals and stats cards are lenses',
        (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: true);

      // Courses tab: one row + both filter chips sit in lenses.
      await tester.tap(tabLabel('Courses'));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('coursesList')), findsOneWidget);
      expect(
        find.ancestor(
          of: find.byKey(const Key('courseTile_1')),
          matching: find.byType(LiquidGlassLens),
        ),
        findsOneWidget,
      );
      expect(find.byKey(const Key('courseProgressText_1')), findsOneWidget);
      expect(find.byKey(const Key('courseProgressBar_1')), findsOneWidget);
      expect(
        find.ancestor(
          of: find.byKey(const Key('courseSortDropdown')),
          matching: find.byType(LiquidGlassLens),
        ),
        findsOneWidget,
      );
      expect(
        find.ancestor(
          of: find.byKey(const Key('courseStatusFilterDropdown')),
          matching: find.byType(LiquidGlassLens),
        ),
        findsOneWidget,
      );

      // Study tab: totals card Key sits on the lens; session rows in lenses.
      await tester.tap(tabLabel('Study Log'));
      await tester.pumpAndSettle();
      expect(
        surfacesWithKey<LiquidGlassLens>(const Key('studyTotalsCard')),
        hasLength(1),
      );
      expect(find.byKey(const Key('dailyTotal')), findsOneWidget);
      expect(find.byKey(const Key('weeklyTotal')), findsOneWidget);
      expect(
        find.ancestor(
          of: find.byKey(const Key('sessionTile_1')),
          matching: find.byType(LiquidGlassLens),
        ),
        findsOneWidget,
      );

      // Statistics tab: one per-course card sits in a lens (below the fold).
      await tester.tap(tabLabel('Statistics'));
      await tester.pumpAndSettle();
      expect(find.text('Overview'), findsOneWidget);
      await reveal(tester, find.text('Algorithms & Data Structures'));
      expect(
        find.ancestor(
          of: find.text('Algorithms & Data Structures'),
          matching: find.byType(LiquidGlassLens),
        ),
        findsOneWidget,
      );

      await closeDb(tester, db);
    });

    testWidgets('batch does not break taps', (tester) async {
      final db = await openDb();
      await pumpShell(tester, db, glass: true);

      // Sort dropdown inside a chip lens still opens and selects.
      await tester.tap(tabLabel('Courses'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('courseSortDropdown')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('courseSort_deadline')), findsOneWidget);
      await tester.tap(find.byKey(const Key('courseSort_deadline')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('coursesList')), findsOneWidget);

      // Dashboard log action still opens the session dialog.
      await tester.tap(tabLabel('Dashboard'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('dashboardLogSessionAction')));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('sessionHoursField')), findsOneWidget);
      await tester.tap(find.text('Cancel').last);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('dashboardOverallPct')), findsOneWidget);

      await closeDb(tester, db);
    });
  });
}
