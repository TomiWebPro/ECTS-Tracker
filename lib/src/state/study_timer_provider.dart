import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../data/study_timer_prefs.dart';
import '../logic/date_utils.dart';
import '../logic/study_timer.dart';
import 'providers.dart';

/// Shared prefs handle for the timer blob (single home, like reminder prefs).
final studyTimerPrefsProvider = Provider<StudyTimerPrefsRepository>(
  (ref) => StudyTimerPrefsRepository(),
);

/// The single active study timer, restored from disk on first build.
///
/// Wall-clock source of truth lives in [StudyTimerState]; the UI ticks with
/// its own 1s `Timer` for display only. Survives app kill + system restart
/// because every transition persists before updating state.
class StudyTimerNotifier extends Notifier<StudyTimerState?> {
  @override
  StudyTimerState? build() {
    _restore();
    return null;
  }

  Future<void> _restore() async {
    var alive = true;
    ref.onDispose(() => alive = false);
    final loaded = await ref.read(studyTimerPrefsProvider).load();
    if (!alive) return;
    // Drop timers whose course is gone is handled lazily at finish time
    // (banner shows the fallback name); restoring is never fatal.
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
    );
    final saved = await ref.read(studyTimerPrefsProvider).save(timer);
    if (saved is Err<void>) return saved;
    state = timer;
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
    );
    final saved = await ref.read(studyTimerPrefsProvider).save(timer);
    if (saved is Err<void>) return saved;
    state = timer;
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
        return Ok(value);
      case Err<int>(:final message):
        return Err(message);
    }
  }
}

final studyTimerProvider =
    NotifierProvider<StudyTimerNotifier, StudyTimerState?>(
  StudyTimerNotifier.new,
);
