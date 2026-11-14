import 'package:drift/native.dart';
import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/bootstrap.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/creator_egg.dart';
import 'package:ects_tracker/src/ui/glass.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('creatorEggNext streak', () {
    test('first tap starts at 1', () {
      final now = DateTime(2026, 11, 14, 12);
      final step = creatorEggNext(count: 0, lastTap: null, now: now);
      expect(step.count, 1);
      expect(step.unlocked, isFalse);
    });

    test('consecutive taps increment', () {
      final first = DateTime(2026, 11, 14, 12);
      final second = first.add(const Duration(milliseconds: 500));
      final step = creatorEggNext(count: 1, lastTap: first, now: second);
      expect(step.count, 2);
      expect(step.unlocked, isFalse);
    });

    test('gap beyond timeout restarts at 1', () {
      final first = DateTime(2026, 11, 14, 12);
      final late = first.add(const Duration(seconds: 5));
      final step = creatorEggNext(count: 7, lastTap: first, now: late);
      expect(step.count, 1);
      expect(step.unlocked, isFalse);
    });

    test('20th tap unlocks and resets', () {
      final first = DateTime(2026, 11, 14, 12);
      final now = first.add(const Duration(milliseconds: 300));
      final step = creatorEggNext(count: 19, lastTap: first, now: now);
      expect(step.unlocked, isTrue);
      expect(step.count, 0);
    });
  });

  testWidgets('20 taps on AppBar icon open the tribute dialog',
      (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    await bootstrapDatabase(db);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(db),
          glassEnabledProvider.overrideWithValue(false),
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

    final button = find.byKey(const Key('creatorEggButton'));
    expect(button, findsOneWidget);
    for (var i = 0; i < 20; i++) {
      await tester.tap(button);
      await tester.pump();
    }
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('creatorEggDialog')), findsOneWidget);
    expect(find.byType(GraffitiTitle), findsOneWidget);
    expect(find.byKey(const Key('creatorEggGithubButton')), findsOneWidget);
    expect(find.byKey(const Key('creatorEggLinkedinButton')), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 200));
    await db.close();
  }, timeout: const Timeout(Duration(minutes: 3)));
}
