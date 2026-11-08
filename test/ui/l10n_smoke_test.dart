import 'package:drift/native.dart';
import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/bootstrap.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Localization smoke test (English ARB readiness): every bottom-nav tab
/// must build with the l10n delegates wired, rendering English strings.
void main() {
  testWidgets(
    'l10n smoke: all five tabs render English strings',
    (tester) async {
      final db = AppDatabase(NativeDatabase.memory());
      // Bootstrap creates the settings singleton row; without it the settings
      // stream never emits and the UI stays on the loading spinner.
      // This also seeds sample courses used by the assertions below.
      await bootstrapDatabase(db);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [databaseProvider.overrideWithValue(db)],
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

      // Dashboard with seeded sample courses (English ARB values).
      expect(find.text('Dashboard'), findsWidgets);
      expect(find.text('Algorithms & Data Structures'), findsOneWidget);

      // Courses tab lists the seeded courses.
      await tester.tap(find.text('Courses').last);
      await tester.pumpAndSettle();
      expect(find.text('Calculus II'), findsOneWidget);

      // Study Log tab renders.
      await tester.tap(find.text('Study Log').last);
      await tester.pumpAndSettle();
      expect(find.byType(NavigationBar), findsOneWidget);

      // Statistics tab renders English section headers.
      await tester.tap(find.text('Statistics').last);
      await tester.pumpAndSettle();
      expect(find.text('Statistics'), findsWidgets);
      expect(find.text('Overview'), findsOneWidget);

      // Settings tab renders English section headers.
      await tester.tap(find.text('Settings').last);
      await tester.pumpAndSettle();
      expect(find.text('Settings'), findsWidgets);
      expect(find.text('Study settings'), findsOneWidget);

      // Tear down in dependency order: dispose the widget tree (and its
      // Riverpod stream subscriptions) first, flush Drift's zero-duration
      // stream-cancel timers, then close the database. Otherwise the test
      // binding reports pending timers at teardown.
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 200));
      await db.close();
    },
    timeout: const Timeout(Duration(minutes: 3)),
  );
}
