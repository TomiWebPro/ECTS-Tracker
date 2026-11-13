import 'package:ects_tracker/src/logic/study_timer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StudyTimerState elapsed', () {
    test('running accumulates wall-clock', () {
      const timer = StudyTimerState(
        courseId: 1,
        initialStartedAtMs: 1000000,
        runningSinceMs: 1000000,
      );
      expect(timer.isRunning, isTrue);
      expect(timer.elapsedSecAt(1000000 + 90000), 90);
    });

    test('paused freezes at banked seconds', () {
      const timer = StudyTimerState(
        courseId: 1,
        initialStartedAtMs: 1000000,
        accumulatedSec: 120,
      );
      expect(timer.isRunning, isFalse);
      expect(timer.elapsedSecAt(1000000 + 999999000), 120);
    });

    test('pause then resume keeps banking across restart', () {
      const running = StudyTimerState(
        courseId: 2,
        initialStartedAtMs: 5000,
        runningSinceMs: 5000,
      );
      // Pause after 60s.
      final paused = running.pausedAt(65000);
      expect(paused.isRunning, isFalse);
      expect(paused.elapsedSecAt(999999999), 60);
      // Resume later; elapsed grows again from the resume point.
      final resumed = paused.resumedAt(125000);
      expect(resumed.elapsedSecAt(185000), 120);
    });

    test('backwards clock clamps to zero', () {
      const timer = StudyTimerState(
        courseId: 1,
        initialStartedAtMs: 1000000,
        runningSinceMs: 1000000,
      );
      expect(timer.elapsedSecAt(999000), 0);
    });
  });

  group('studyTimerLogMinutes', () {
    test('ceil behavior, zero stays zero', () {
      expect(studyTimerLogMinutes(0), 0);
      expect(studyTimerLogMinutes(1), 1);
      expect(studyTimerLogMinutes(60), 1);
      expect(studyTimerLogMinutes(61), 2);
      expect(studyTimerLogMinutes(3599), 60);
    });
  });

  group('formatTimerHms', () {
    test('pads MM and SS', () {
      expect(formatTimerHms(0), '0:00:00');
      expect(formatTimerHms(5), '0:00:05');
      expect(formatTimerHms(65), '0:01:05');
      expect(formatTimerHms(3661), '1:01:01');
    });
  });

  group('session date + json', () {
    test('session date is the run start day', () {
      final start =
          DateTime(2026, 11, 13, 23, 50).millisecondsSinceEpoch;
      const acc = 0;
      final timer = StudyTimerState(
        courseId: 1,
        initialStartedAtMs: start,
        accumulatedSec: acc,
      );
      expect(studyTimerSessionDate(timer), DateTime(2026, 11, 13));
    });

    test('json round-trips running and paused', () {
      const running = StudyTimerState(
        courseId: 3,
        initialStartedAtMs: 111,
        accumulatedSec: 7,
        runningSinceMs: 222,
        notes: 'hi',
      );
      final back = StudyTimerState.tryFromJson(running.toJson());
      expect(back?.courseId, 3);
      expect(back?.runningSinceMs, 222);
      expect(back?.notes, 'hi');

      const paused = StudyTimerState(
        courseId: 3,
        initialStartedAtMs: 111,
        accumulatedSec: 7,
      );
      expect(
        StudyTimerState.tryFromJson(paused.toJson())?.isRunning,
        isFalse,
      );
    });

    test('corrupt blobs return null', () {
      expect(StudyTimerState.tryFromJson(const {}), isNull);
      expect(
        StudyTimerState.tryFromJson(const {
          'courseId': -1,
          'initialStartedAtMs': 5,
        }),
        isNull,
      );
      expect(
        StudyTimerState.tryFromJson(const {
          'courseId': 1,
          'initialStartedAtMs': 'x',
        }),
        isNull,
      );
    });
  });
}
