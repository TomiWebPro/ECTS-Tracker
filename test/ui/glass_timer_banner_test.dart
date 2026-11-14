import 'package:drift/native.dart';
import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/data/study_timer_prefs.dart';
import 'package:ects_tracker/src/logic/study_timer.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/state/study_timer_provider.dart';
import 'package:ects_tracker/src/ui/glass.dart';
import 'package:ects_tracker/src/ui/study_timer_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

/// Glass timer banner contract (M11, ECTS-100): the running-timer pill
/// renders as a floating liquid-glass lens in glass mode (page content
/// scrolls underneath) and keeps the legacy Material pill otherwise.
/// Tapping the pill opens the shared active-timer controls in both modes.
class MemoryTimerPrefs extends StudyTimerPrefsRepository {
  MemoryTimerPrefs([this.initial]);

  final StudyTimerState? initial;
  StudyTimerState? current;

  bool _seeded = false;

  @override
  Future<StudyTimerState?> load() async {
    if (!_seeded) {
      _seeded = true;
      current = initial;
    }
    return current;
  }

  @override
  Future<Result<void>> save(StudyTimerState timer) async {
    _seeded = true;
    current = timer;
    return const Ok(null);
  }

  @override
  Future<Result<void>> clear() async {
    _seeded = true;
    current = null;
    return const Ok(null);
  }
}

void main() {
  late AppDatabase db;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
  });

  Future<void> finishDb(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(milliseconds: 200));
    await db.close();
  }

  Future<void> pumpBanner(
    WidgetTester tester,
    MemoryTimerPrefs mem, {
    required bool glass,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(db),
          studyTimerPrefsProvider.overrideWithValue(mem),
          glassEnabledProvider.overrideWithValue(glass),
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: const Scaffold(body: StudyTimerBanner()),
        ),
      ),
    );
    await tester.pump();
  }

  StudyTimerState runningTimer() {
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    return StudyTimerState(
      courseId: 1,
      initialStartedAtMs: nowMs - 60000,
      runningSinceMs: nowMs - 60000,
      courseName: 'A',
    );
  }

  testWidgets('legacy banner keeps the Material pill, no lens',
      (tester) async {
    await pumpBanner(tester, MemoryTimerPrefs(runningTimer()), glass: false);

    expect(find.byKey(const Key('studyTimerBanner')), findsOneWidget);
    expect(find.byType(LiquidGlassLens), findsNothing);
    expect(find.byKey(const Key('studyTimerBannerToggle')), findsOneWidget);

    // Tapping the pill opens the shared active-timer controls.
    await tester.tap(find.byKey(const Key('studyTimerBanner')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('pauseResumeTimerButton')), findsOneWidget);

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    await finishDb(tester);
  });

  testWidgets('glass banner floats as a lens and still opens controls',
      (tester) async {
    await pumpBanner(tester, MemoryTimerPrefs(runningTimer()), glass: true);

    expect(find.byKey(const Key('studyTimerBanner')), findsOneWidget);
    expect(find.byType(LiquidGlassLens), findsOneWidget);
    expect(find.byKey(const Key('studyTimerBannerToggle')), findsOneWidget);

    await tester.tap(find.byKey(const Key('studyTimerBanner')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('pauseResumeTimerButton')), findsOneWidget);

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    await finishDb(tester);
  });
}
