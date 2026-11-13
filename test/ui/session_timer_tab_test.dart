import 'package:drift/native.dart';
import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/data/study_timer_prefs.dart';
import 'package:ects_tracker/src/logic/study_timer.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/state/study_timer_provider.dart';
import 'package:ects_tracker/src/ui/session_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Log-dialog timer tab contract (M11, ECTS-092): Manual stays default, the
/// Timer tab starts a restart-proof timer, and an active timer shows
/// pause/finish inline with a backdated start-to-log round trip.
///
/// The timer blob is an in-memory fake here (widget tests never touch
/// `SharedPreferences`); the real prefs round-trip is pinned by
/// `test/data/study_timer_prefs_test.dart`.
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

  Future<void> pumpHost(
    WidgetTester tester,
    MemoryTimerPrefs mem,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(db),
          studyTimerPrefsProvider.overrideWithValue(mem),
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
          home: Scaffold(
            body: Center(
              child: Builder(
                builder: (context) => ElevatedButton(
                  key: const Key('openDialog'),
                  onPressed: () => showSessionFormDialog(context),
                  child: const Text('open'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('openDialog')));
    await tester.pumpAndSettle();
  }

  Future<void> openTimerTab(WidgetTester tester) async {
    await tester.tap(find.text('Timer'));
    await tester.pump();
  }

  testWidgets('manual is default, timer tab starts a timer', (tester) async {
    await CourseRepository(db).addCourse(name: 'A', ectsCredits: 5);
    await pumpHost(tester, MemoryTimerPrefs());

    // Manual form unchanged and default.
    expect(find.byKey(const Key('sessionModeSwitch')), findsOneWidget);
    expect(find.byKey(const Key('saveSessionButton')), findsOneWidget);

    // Switch to the timer tab (single course auto-selects).
    await openTimerTab(tester);
    expect(
        find.byKey(const Key('sessionStartTimerButton')), findsOneWidget);

    await tester.tap(find.byKey(const Key('sessionStartTimerButton')));
    await tester.pumpAndSettle();

    // Dialog closed, banner takes over: reopening shows live controls,
    // which only exist while a timer is running.
    expect(find.byKey(const Key('sessionStartTimerButton')), findsNothing);
    await tester.tap(find.byKey(const Key('openDialog')));
    await tester.pumpAndSettle();
    await openTimerTab(tester);
    expect(find.byKey(const Key('pauseResumeTimerButton')), findsOneWidget);
    expect(find.byKey(const Key('studyTimerElapsed')), findsOneWidget);
    await finishDb(tester);
  });

  testWidgets('seeded running timer shows pause/finish, logs on finish',
      (tester) async {
    final courseId =
        ((await CourseRepository(db).addCourse(name: 'A', ectsCredits: 5))
                as Ok<int>)
            .value;
    // Backdate 150 s: the wall-clock timer is already loggable on open.
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    await pumpHost(
      tester,
      MemoryTimerPrefs(StudyTimerState(
        courseId: courseId,
        initialStartedAtMs: nowMs - 150000,
        runningSinceMs: nowMs - 150000,
        courseName: 'A',
      )),
    );
    await openTimerTab(tester);

    expect(find.byKey(const Key('pauseResumeTimerButton')), findsOneWidget);
    expect(find.byKey(const Key('finishTimerButton')), findsOneWidget);
    expect(find.byKey(const Key('studyTimerElapsed')), findsOneWidget);

    // Pause freezes the run (button flips to Resume).
    await tester.tap(find.byKey(const Key('pauseResumeTimerButton')));
    await tester.pump();
    expect(find.text('Resume'), findsWidgets);

    // Resume, then finish logs ceil(150 s / 60) = 3 min and closes.
    await tester.tap(find.byKey(const Key('pauseResumeTimerButton')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('finishTimerButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('finishTimerButton')), findsNothing);
    final sessions = await SessionRepository(db).getAll();
    expect(sessions, hasLength(1));
    expect(sessions.first.minutes, 3);
    await finishDb(tester);
  });

  testWidgets('timer tab with no courses explains itself', (tester) async {
    await pumpHost(tester, MemoryTimerPrefs());
    await openTimerTab(tester);
    expect(find.byKey(const Key('studyTimerNoCoursesHint')), findsOneWidget);
    await tester.tap(find.byKey(const Key('sessionStartTimerButton')));
    await tester.pump();
    expect(find.byKey(const Key('studyTimerFormError')), findsOneWidget);
    // Back to manual before settling + teardown.
    await tester.tap(find.text('Manual'));
    await tester.pumpAndSettle();
    await finishDb(tester);
  });
}
