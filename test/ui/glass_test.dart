import 'package:drift/native.dart';
import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/bootstrap.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/app_sizes.dart';
import 'package:ects_tracker/src/ui/glass.dart';
import 'package:ects_tracker/src/ui/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

/// Liquid glass infra + Display opt-in (ECTS-061): [GlassCard] gate,
/// [glassEnabledProvider] wiring, and the `liquidGlassTile` switch.
void main() {
  Future<void> pumpGlassCard(
    WidgetTester tester, {
    required bool enabled,
    Key cardKey = const Key('testCard'),
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [glassEnabledProvider.overrideWithValue(enabled)],
        child: MaterialApp(
          home: Scaffold(
            body: GlassCard(
              key: cardKey,
              child: const Text('card body'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets(
    'glass off: GlassCard renders a keyed Card, no lens',
    (tester) async {
      await pumpGlassCard(tester, enabled: false);

      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(LiquidGlassLens), findsNothing);
      // Key forwarded to the underlying Card so lookups keep passing.
      expect(
        tester.widget<Card>(find.byType(Card)).key,
        const Key('testCard'),
      );
      expect(find.text('card body'), findsOneWidget);
    },
  );

  testWidgets(
    'glass on: GlassCard renders a keyed LiquidGlassLens, no Card',
    (tester) async {
      await pumpGlassCard(tester, enabled: true);

      expect(find.byType(LiquidGlassLens), findsOneWidget);
      expect(find.byType(Card), findsNothing);
      // Same key now sits on the lens.
      expect(
        tester.widget<LiquidGlassLens>(find.byType(LiquidGlassLens)).key,
        const Key('testCard'),
      );
      expect(find.text('card body'), findsOneWidget);
    },
  );

  test(
    'glassEnabledProvider follows settingsProvider liquidGlass',
    () async {
      Future<bool> readGlass(AppSettings settings) async {
        final container = ProviderContainer(
          overrides: [
            settingsProvider.overrideWith(
              (ref) => Stream.value(settings),
            ),
          ],
        );
        addTearDown(container.dispose);
        // Wait for the settings stream to emit before reading the gate.
        await container.read(settingsProvider.future);
        return container.read(glassEnabledProvider);
      }

      expect(
        await readGlass(const AppSettings(liquidGlass: false)),
        isFalse,
      );
      expect(
        await readGlass(const AppSettings(liquidGlass: true)),
        isTrue,
      );
    },
  );

  testWidgets(
    'glassStyle uses the app card radius with lite glass',
    (tester) async {
      LiquidGlassStyle? style;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              style = glassStyle(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(style, isNotNull);
      expect(style!.liteGlass, isTrue);
      expect(style!.shape?.cornerRadius, AppSizes.cardRadius);
      expect(style!.refractionIndex, closeTo(1.02, 1e-9));
      expect(style!.blur, 2.5);
    },
  );

  testWidgets(
    'liquidGlassTile switch flips the persisted opt-in',
    (tester) async {
      final db = AppDatabase(NativeDatabase.memory());
      // Bootstrap creates the settings singleton row; without it the
      // settings stream never emits and the UI stays on loading.
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
            home: Scaffold(body: SettingsPage()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final tile = find.byKey(const Key('liquidGlassTile'));
      // Scrolls (the Study section grew in M9, so the Display section can
      // start outside the list's build cache and `ensureVisible` would find
      // no element — same class of fix as ECTS-068).
      await tester.scrollUntilVisible(tile, 300);
      await tester.pumpAndSettle();
      expect(tile, findsOneWidget);
      expect(
        find.descendant(of: tile, matching: find.text('Liquid glass')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: tile, matching: find.text('Off')),
        findsNothing,
      );

      final toggle =
          find.descendant(of: tile, matching: find.byType(Switch));
      expect(toggle, findsOneWidget);
      expect(tester.widget<Switch>(toggle).value, isFalse);

      // On: persists via the repository, subtitle flips, SnackBar shows.
      await tester.tap(toggle);
      await tester.pumpAndSettle();

      expect((await SettingsRepository(db).get()).liquidGlass, isTrue);
      // The glass-on rebuild re-measures the list (M9 tiles + airier
      // spacing), so the tile can fall out of the built window again —
      // scroll back before reading (same class of fix as above).
      await tester.scrollUntilVisible(tile, 300);
      await tester.pumpAndSettle();
      expect(tester.widget<Switch>(toggle).value, isTrue);
      expect(
        find.descendant(of: tile, matching: find.text('On')),
        findsNothing,
      );
      expect(find.text('Liquid glass updated.'), findsOneWidget);

      // Off again: persistence flips back.
      await tester.scrollUntilVisible(toggle, 300);
      await tester.pumpAndSettle();
      await tester.tap(toggle);
      await tester.pumpAndSettle();

      expect((await SettingsRepository(db).get()).liquidGlass, isFalse);
      await tester.scrollUntilVisible(tile, 300);
      await tester.pumpAndSettle();
      expect(tester.widget<Switch>(toggle).value, isFalse);
      expect(
        find.descendant(of: tile, matching: find.text('Off')),
        findsNothing,
      );

      // Tear down in dependency order (see l10n_smoke_test.dart).
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 200));
      await db.close();
    },
    timeout: const Timeout(Duration(minutes: 3)),
  );
}
