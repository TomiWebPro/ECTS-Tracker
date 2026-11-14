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

/// Timer banner spacing (ECTS-102/103):
/// - glass: the floating pill overlays the page, content flows under it
///   while scrolling, and at scroll-top a small gap sits between pill and
///   first content (the page drops its own top air while a timer runs and
///   carries the measured pill height inside the scrollable instead).
/// - classic: the in-flow pill sits flush under the AppBar with breathing
///   room below, page top air dropped while a timer runs.
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
  // glass inner reserve arrives via a post-frame height report.
  for (var i = 0; i < 8; i++) {
    await tester.pump(const Duration(milliseconds: 200));
  }
}

Future<void> openSettingsTab(WidgetTester tester) async {
  // Same tab pattern as glass_chrome_test.
  await tester.tap(find.text('Settings').last);
  for (var i = 0; i < 5; i++) {
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

  testWidgets('glass banner reports its height for the inner reserve',
      (tester) async {
    await pumpBanner(tester, MemoryTimerPrefs(runningTimer()), glass: true);

    final banner = find.byKey(const Key('studyTimerBanner'));
    expect(banner, findsOneWidget);
    final container = ProviderScope.containerOf(tester.element(banner));
    // Post-frame report flushed by the pumps above; the glass pages read
    // this to size their inner top reserve while a timer runs.
    expect(container.read(timerBannerHeightProvider), greaterThan(0));

    await finishDb(tester, container.read(databaseProvider));
  });

  testWidgets('glass shell keeps a small gap at scroll-top', (tester) async {
    final db = await openDb();
    await pumpShell(tester, db, MemoryTimerPrefs(runningTimer()), glass: true);
    await openSettingsTab(tester);

    final bannerRect =
        tester.getRect(find.byKey(const Key('studyTimerBanner')));
    // Reserve gap only: list top air is dropped while timing and the
    // header's own pad sits inside its box.
    final headerTop = tester.getTopLeft(find.byType(SectionHeader).first).dy;
    expect(headerTop - bannerRect.bottom, closeTo(8.0, 2.0));

    await finishDb(tester, db);
  });

  testWidgets('glass content flows under the overlay pill', (tester) async {
    final db = await openDb();
    await pumpShell(tester, db, MemoryTimerPrefs(runningTimer()), glass: true);
    await openSettingsTab(tester);

    final bannerRect =
        tester.getRect(find.byKey(const Key('studyTimerBanner')));
    final tile = find.byKey(const Key('hoursPerEctsTile'));
    expect(tile, findsOneWidget);
    await tester.drag(
      find.byType(ListView).first,
      const Offset(0, -400),
    );
    for (var i = 0; i < 3; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }

    // The first card slides underneath the floating pill instead of
    // clipping against its bottom edge.
    expect(tester.getTopLeft(tile).dy, lessThan(bannerRect.bottom));

    await finishDb(tester, db);
  });

  testWidgets('classic shell keeps a small gap above content', (tester) async {
    final db = await openDb();
    await pumpShell(tester, db, MemoryTimerPrefs(runningTimer()), glass: false);
    await openSettingsTab(tester);

    final banner = find.byKey(const Key('studyTimerBanner'));
    final bannerRect = tester.getRect(banner);
    // Flush under the AppBar (default toolbar height, no top pad).
    expect(bannerRect.top, closeTo(56.0, 1.0));

    final pillRect = tester.getRect(
      find
          .descendant(of: banner, matching: find.byType(Material))
          .first,
    );
    final listTop = tester.getRect(find.byType(ListView).first).top;
    // Pill breathing room only (page top air dropped while timing).
    expect(listTop - pillRect.bottom, closeTo(AppSizes.sectionInnerGap, 0.5));

    final headerTop = tester.getTopLeft(find.byType(SectionHeader).first).dy;
    // 8 (pill room) + 0 (list) + header box starts here (its own pad inside).
    expect(headerTop - pillRect.bottom, closeTo(8.0, 2.0));

    await finishDb(tester, db);
  });
}
