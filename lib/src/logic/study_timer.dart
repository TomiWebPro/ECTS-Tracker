/// Restart-proof study-timer core (M11, ECTS-091).
///
/// The timer is wall-clock math, never a live counter: persisted state holds
/// `initialStartedAtMs + accumulatedSec + runningSinceMs?`, elapsed is always
/// `accumulated + (running ? now - runningSince : 0)`. App kill / reboot just
/// re-reads the blob and keeps counting. Pure Dart, no Flutter imports.
library;

import 'date_utils.dart';

/// Single active timer. Null `runningSinceMs` means paused.
class StudyTimerState {
  const StudyTimerState({
    required this.courseId,
    required this.initialStartedAtMs,
    this.accumulatedSec = 0,
    this.runningSinceMs,
    this.notes,
    this.courseName,
  });

  final int courseId;

  /// Wall-clock start of the whole timing run (for the session `date`).
  final int initialStartedAtMs;

  /// Seconds banked before the current running segment.
  final int accumulatedSec;

  /// Wall-clock start of the current running segment, null when paused.
  final int? runningSinceMs;

  final String? notes;

  /// Course name snapshot taken at start: notification surfaces (including
  /// the background handler, which has no database access) display this.
  /// In-app UI always resolves the live course and falls back without it.
  final String? courseName;

  bool get isRunning => runningSinceMs != null;

  /// Elapsed seconds at [nowMs], clamped at 0 (clock jumps backwards).
  int elapsedSecAt(int nowMs) {
    var total = accumulatedSec;
    final runningSince = runningSinceMs;
    if (runningSince != null) {
      total += (nowMs - runningSince) ~/ 1000;
    }
    return total < 0 ? 0 : total;
  }

  /// Elapsed seconds at [now].
  int elapsedSec(DateTime now) =>
      elapsedSecAt(now.millisecondsSinceEpoch);

  StudyTimerState copyWith({
    int? courseId,
    int? initialStartedAtMs,
    int? accumulatedSec,
    int? Function()? runningSinceMs,
    String? Function()? notes,
    String? Function()? courseName,
  }) {
    return StudyTimerState(
      courseId: courseId ?? this.courseId,
      initialStartedAtMs: initialStartedAtMs ?? this.initialStartedAtMs,
      accumulatedSec: accumulatedSec ?? this.accumulatedSec,
      runningSinceMs:
          runningSinceMs != null ? runningSinceMs() : this.runningSinceMs,
      notes: notes != null ? notes() : this.notes,
      courseName: courseName != null ? courseName() : this.courseName,
    );
  }

  /// Pause at [nowMs]: banks the running segment, stops counting.
  StudyTimerState pausedAt(int nowMs) {
    if (runningSinceMs == null) return this;
    final banked = accumulatedSec + (nowMs - runningSinceMs!) ~/ 1000;
    return copyWith(
      accumulatedSec: banked < 0 ? 0 : banked,
      runningSinceMs: () => null,
    );
  }

  /// Resume at [nowMs]: starts a new running segment.
  StudyTimerState resumedAt(int nowMs) {
    if (runningSinceMs != null) return this;
    return copyWith(runningSinceMs: () => nowMs);
  }

  Map<String, Object?> toJson() => {
        'courseId': courseId,
        'initialStartedAtMs': initialStartedAtMs,
        'accumulatedSec': accumulatedSec,
        'runningSinceMs': runningSinceMs,
        'notes': notes,
        'courseName': courseName,
      };

  /// Lenient parse: corrupt / wrong-typed blobs return null (no timer).
  static StudyTimerState? tryFromJson(Map<String, Object?> json) {
    try {
      final courseId = json['courseId'];
      final initial = json['initialStartedAtMs'];
      if (courseId is! int || initial is! int) return null;
      if (courseId <= 0 || initial <= 0) return null;
      final accumulated = json['accumulatedSec'];
      final running = json['runningSinceMs'];
      final notes = json['notes'];
      final courseName = json['courseName'];
      if (accumulated != null && accumulated is! int) return null;
      if (running != null && running is! int) return null;
      if (notes != null && notes is! String) return null;
      if (courseName != null && courseName is! String) return null;
      final acc = (accumulated as int?) ?? 0;
      if (acc < 0) return null;
      return StudyTimerState(
        courseId: courseId,
        initialStartedAtMs: initial,
        accumulatedSec: acc,
        runningSinceMs: running as int?,
        notes: notes as String?,
        courseName: courseName as String?,
      );
    } catch (_) {
      return null;
    }
  }
}

/// Loggable minutes for [elapsedSec]: ceil to whole minutes, 0 when nothing
/// elapsed. 5s -> 1min, 61s -> 2min.
int studyTimerLogMinutes(int elapsedSec) {
  if (elapsedSec <= 0) return 0;
  return (elapsedSec + 59) ~/ 60;
}

/// `H:MM:SS` for the timer readouts (hours unpadded, MM/SS zero-padded).
String formatTimerHms(int totalSec) {
  final s = totalSec < 0 ? 0 : totalSec;
  final h = s ~/ 3600;
  final m = (s % 3600) ~/ 60;
  final sec = s % 60;
  final mStr = m.toString().padLeft(2, '0');
  final sStr = sec.toString().padLeft(2, '0');
  return '$h:$mStr:$sStr';
}

/// Calendar day the finished session is logged on: the run's start day.
DateTime studyTimerSessionDate(StudyTimerState timer) =>
    dateOnly(DateTime.fromMillisecondsSinceEpoch(timer.initialStartedAtMs));
