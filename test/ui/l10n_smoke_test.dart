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
  testWidgets('l10n smoke: all five tabs render English strings', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(() async => db.close());
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
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Dashboard with seeded sample courses (English ARB values).
    expect(find.text('Dashboard'), findsWidgets);
    expect(find.text('Algorithms & Data Structures'), findsOneWidget);

    // Courses tab lists the seeded courses.
    await tester.tap(find.text('Courses').last);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text('Calculus II'), findsOneWidget);

    // Study Log tab renders.
    await tester.tap(find.text('Study Log').last);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.byType(NavigationBar), findsOneWidget);

    // Statistics tab renders English section headers.
    await tester.tap(find.text('Statistics').last);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text('Statistics'), findsWidgets);
    expect(find.text('Overview'), findsOneWidget);

    // Settings tab renders English section headers.
    await tester.tap(find.text('Settings').last);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text('Settings'), findsWidgets);
    expect(find.text('Study settings'), findsOneWidget);
  });
}
