import 'package:drift/native.dart';
import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/bootstrap.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/data/study_timer_prefs.dart';
import 'package:ects_tracker/src/logic/study_timer.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/state/study_timer_provider.dart';
import 'package:ects_tracker/src/ui/app_sizes.dart';
import 'package:ects_tracker/src/ui/glass.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:ects_tracker/src/ui/study_timer_sheet.dart';
import 'package:ects_tracker/src/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Timer banner spacing (ECTS-102):
/// - glass: the floating pill overlays the page, so the shell reserves the
///   measured pill height at the page top while a timer runs — scrolled to
///   the top, content starts below the pill instead of under it.
/// - classic: the in-flow pill sits flush under the AppBar (the page below
///   carries its own top air) with breathing room below, so scrolled
///   content never touches it.
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

StudyTimerState runningTimer() {
  final nowMs = DateTime.now().millisecondsSinceEpoch;
  return StudyTimerState(
    courseId: 1,
    initialStartedAtMs: nowMs - 60000,
    runningSinceMs: nowMs - 60000,
    courseName: 'A',
  );
}

Future<AppDatabase> openDb() async {
  final db = AppDatabase(NativeDatabase.memory());
  // Bootstrap creates the settings singleton row; without it the
  // settings stream never emits and the UI stays on loading.
  await bootstrapDatabase(db);
  return db;
}

Future<void> pumpBanner(
  WidgetTester tester,
  MemoryTimerPrefs mem, {
  required bool glass,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(await openDb()),
        studyTimerPrefsProvider.overrideWithValue(mem),
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
        home: Scaffold(body: StudyTimerBanner()),
      ),
    ),
  );
  // Fixed frames, not settle: the banner ticks every second.
  for (var i = 0; i < 5; i++) {
    await tester.pump(const Duration(milliseconds: 200));
  }
}

Future<void> pumpShell(
  WidgetTester tester,
  AppDatabase db,
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
  // Fixed frames, not settle: the banner ticks every second, and the
  // glass reserve arrives via a post-frame height report.
  for (var i = 0; i < 8; i++) {
    await tester.pump(const Duration(milliseconds: 200));
  }
}

Future<void> finishDb(WidgetTester tester, AppDatabase db) async {
  await tester.pumpWidget(const SizedBox());
  await tester.pump(const Duration(milliseconds: 200));
  await db.close();
}

void main() {
  testWidgets('classic banner sits flush under the AppBar with room below',
      (tester) async {
    await pumpBanner(tester, MemoryTimerPrefs(runningTimer()), glass: false);

    final banner = find.byKey(const Key('studyTimerBanner'));
    expect(banner, findsOneWidget);
    final padding =
        tester.widget<Padding>(banner).padding.resolve(TextDirection.ltr);
    expect(padding.left, AppSizes.pageHPad);
    expect(padding.right, AppSizes.pageHPad);
    expect(padding.top, 0);
    expect(padding.bottom, AppSizes.sectionInnerGap);

    await finishDb(
      tester,
      ProviderScope.containerOf(tester.element(banner)).read(databaseProvider),
    );
  });

  testWidgets('glass banner reports its height for the shell reserve',
      (tester) async {
    await pumpBanner(tester, MemoryTimerPrefs(runningTimer()), glass: true);

    final banner = find.byKey(const Key('studyTimerBanner'));
    expect(banner, findsOneWidget);
    final container = ProviderScope.containerOf(tester.element(banner));
    // Post-frame report flushed by the pumps above; the shell reads this
    // to keep scrolled-to-top content below the overlay pill.
    expect(container.read(timerBannerHeightProvider), greaterThan(0));

    await finishDb(tester, container.read(databaseProvider));
  });

  testWidgets('glass shell keeps top content below the overlay pill',
      (tester) async {
    final db = await openDb();
    await pumpShell(tester, db, MemoryTimerPrefs(runningTimer()), glass: true);

    // Settings tab (same tap pattern as glass_chrome_test).
    await tester.tap(find.text('Settings').last);
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }

    final bannerRect =
        tester.getRect(find.byKey(const Key('studyTimerBanner')));
    final headerTop =
        tester.getTopLeft(find.byType(SectionHeader).first).dy;
    // Content starts below the pill with at least the chrome gap to spare
    // (list + header pads add more on top).
    expect(
      headerTop - bannerRect.bottom,
      greaterThanOrEqualTo(AppSizes.glassChromeGap - 0.5),
    );

    await finishDb(tester, db);
  });

  testWidgets('classic shell keeps scrolled content off the pill',
      (tester) async {
    final db = await openDb();
    await pumpShell(tester, db, MemoryTimerPrefs(runningTimer()), glass: false);

    await tester.tap(find.text('Settings').last);
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }

    final banner = find.byKey(const Key('studyTimerBanner'));
    final bannerRect = tester.getRect(banner);
    // Flush under the AppBar (default toolbar height, no top pad).
    expect(bannerRect.top, closeTo(56.0, 1.0));

    final pillRect = tester
        .getRect(
          find.descendant(
            of: banner,
            matching: find.byType(Material),
          ).first,
        );
    final listTop = tester.getRect(find.byType(ListView).first).top;
    // The pill keeps its bottom breathing room against page content.
    expect(listTop - pillRect.bottom, closeTo(AppSizes.sectionInnerGap, 0.5));

    await finishDb(tester, db);
  });
}
