import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../data/study_timer_prefs.dart';
import '../logic/date_utils.dart';
import '../logic/study_timer.dart';
import '../notifications/study_timer_alerts.dart';
import 'providers.dart';

/// Shared prefs handle for the timer blob (single home, like reminder prefs).
final studyTimerPrefsProvider = Provider<StudyTimerPrefsRepository>(
  (ref) => StudyTimerPrefsRepository(),
);

/// Phone notification surface for the timer. No-op by default (tests,
/// headless); main overrides with the real backend.
final timerAlertBackendProvider = Provider<TimerAlertBackend>(
  (ref) => const NoopTimerAlertBackend(),
);

/// Foreground timer-action taps from the phone notification (`timer_*`).
/// The app routes them to the notifier (see `_ThemedApp`).
final timerActionEventsProvider = StreamProvider<String>(
  (ref) => ref.watch(timerAlertBackendProvider).actionEvents,
);

/// The single active study timer, restored from disk on first build.
///
/// Wall-clock source of truth lives in [StudyTimerState]; the UI ticks with
/// its own 1s `Timer` for display only. Survives app kill + system restart
/// because every transition persists before updating state.
class StudyTimerNotifier extends Notifier<StudyTimerState?> {
  bool _restored = false;

  @override
  StudyTimerState? build() {
    // Restore once: build reruns on every notify, so an unconditional
    // restore-then-assign here would ping-pong forever (each assignment
    // notifies, each notify rebuilds). That loop also starves
    // pumpAndSettle in widget tests.
    if (!_restored) {
      _restored = true;
      _restore();
    }
    return null;
  }

  Future<void> _restore() async {
    var alive = true;
    ref.onDispose(() => alive = false);
    final loaded = await ref.read(studyTimerPrefsProvider).load();
    if (!alive) return;
    // Runs once (see build), so this single assignment always settles.
    state = loaded;
  }

  /// Starts a new timer. Fails when one is already active (discard first).
  Future<Result<void>> start(int courseId, {String? notes}) async {
    if (state != null) {
      return const Err('A timer is already running.');
    }
    if (courseId <= 0) return const Err('Select a course.');
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final timer = StudyTimerState(
      courseId: courseId,
      initialStartedAtMs: nowMs,
      runningSinceMs: nowMs,
      notes: notes?.trim().isEmpty ?? true ? null : notes!.trim(),
      courseName: await _resolveCourseName(courseId),
    );
    final saved = await ref.read(studyTimerPrefsProvider).save(timer);
    if (saved is Err<void>) return saved;
    state = timer;
    await _syncAlert();
    return const Ok(null);
  }

  /// Starts a timer for [courseId] even when another timer exists, replacing
  /// it. Used by per-course quick-start; the start sheet uses [start].
  Future<Result<void>> startReplacing(int courseId) async {
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final timer = StudyTimerState(
      courseId: courseId,
      initialStartedAtMs: nowMs,
      runningSinceMs: nowMs,
      courseName: await _resolveCourseName(courseId),
    );
    final saved = await ref.read(studyTimerPrefsProvider).save(timer);
    if (saved is Err<void>) return saved;
    state = timer;
    await _syncAlert();
    return const Ok(null);
  }

  Future<Result<void>> pause() async {
    final current = state;
    if (current == null) return const Err('No active timer.');
    if (!current.isRunning) return const Ok(null);
    final paused =
        current.pausedAt(DateTime.now().millisecondsSinceEpoch);
    final saved = await ref.read(studyTimerPrefsProvider).save(paused);
    if (saved is Err<void>) return saved;
    state = paused;
    await _syncAlert();
    return const Ok(null);
  }

  Future<Result<void>> resume() async {
    final current = state;
    if (current == null) return const Err('No active timer.');
    if (current.isRunning) return const Ok(null);
    final resumed =
        current.resumedAt(DateTime.now().millisecondsSinceEpoch);
    final saved = await ref.read(studyTimerPrefsProvider).save(resumed);
    if (saved is Err<void>) return saved;
    state = resumed;
    await _syncAlert();
    return const Ok(null);
  }

  Future<Result<void>> updateNotes(String? notes) async {
    final current = state;
    if (current == null) return const Err('No active timer.');
    final trimmed = notes?.trim();
    final updated = current.copyWith(
      notes: () => trimmed == null || trimmed.isEmpty ? null : trimmed,
    );
    final saved = await ref.read(studyTimerPrefsProvider).save(updated);
    if (saved is Err<void>) return saved;
    state = updated;
    return const Ok(null);
  }

  Future<Result<void>> discard() async {
    final cleared = await ref.read(studyTimerPrefsProvider).clear();
    if (cleared is Err<void>) return cleared;
    state = null;
    await _syncAlert();
    return const Ok(null);
  }

  /// Converts the elapsed time to a session (ceil to minutes, min 1) and
  /// clears the timer. The session date is the run's start day.
  Future<Result<int>> finishAndLog() async {
    final current = state;
    if (current == null) return const Err('No active timer.');
    final elapsed =
        current.elapsedSec(DateTime.now());
    final minutes = studyTimerLogMinutes(elapsed);
    if (minutes <= 0) return const Err('Timer has not run yet.');
    final repo = ref.read(sessionRepositoryProvider);
    final result = await repo.addSession(
      courseId: current.courseId,
      minutes: minutes,
      date: dateOnly(
        DateTime.fromMillisecondsSinceEpoch(current.initialStartedAtMs),
      ),
      notes: current.notes,
    );
    switch (result) {
      case Ok<int>(:final value):
        await ref.read(studyTimerPrefsProvider).clear();
        state = null;
        await _syncAlert();
        return Ok(value);
      case Err<int>(:final message):
        return Err(message);
    }
  }

  /// Best-effort display-name snapshot for notification surfaces (the
  /// background handler has no database access, so it reuses this).
  Future<String?> _resolveCourseName(int courseId) async {
    try {
      final courses = await ref.read(courseRepositoryProvider).getAll();
      for (final c in courses) {
        if (c.id == courseId) return c.name;
      }
    } catch (_) {
      // Falls through to null; alerts fall back to the C{id} label.
    }
    return null;
  }

  /// Pushes the current timer frame to the phone notification (or clears
  /// it). Alerts never break timer ops: every failure is swallowed.
  Future<void> _syncAlert() async {
    try {
      final backend = ref.read(timerAlertBackendProvider);
      final timer = state;
      if (timer == null) {
        await backend.cancelTimer();
        return;
      }
      await backend.requestPermissions();
      final settings = await ref.read(settingsRepositoryProvider).get();
      final l10n = timerAlertL10n(settings.localeCode);
      String name = timer.courseName ??
          l10n.studyLogUnknownCourse('${timer.courseId}');
      if (timer.courseName == null) {
        name = await _resolveCourseName(timer.courseId) ?? name;
      }
      final now = DateTime.now();
      final content = buildTimerAlertContent(
        courseName: name,
        timer: timer,
        l10n: l10n,
        now: now,
      );
      await backend.showTimer(
        TimerAlertVisuals(
          title: content.title,
          body: content.body,
          running: content.useChronometer,
          chronometerBaseMs: content.chronometerBaseMs,
          pauseLabel: l10n.studyTimerPause,
          resumeLabel: l10n.studyTimerResume,
          finishLabel: l10n.studyTimerFinishLog(
            '${studyTimerLogMinutes(timer.elapsedSec(now))}',
          ),
          discardLabel: l10n.studyTimerDiscard,
        ),
      );
    } catch (_) {
      // Best-effort.
    }
  }
}

final studyTimerProvider =
    NotifierProvider<StudyTimerNotifier, StudyTimerState?>(
  StudyTimerNotifier.new,
);
