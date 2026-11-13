import 'package:ects_tracker/src/data/study_timer_prefs.dart';
import 'package:ects_tracker/src/logic/study_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues(const {});
  });

  StudyTimerPrefsRepository prefs() => StudyTimerPrefsRepository();

  test('empty store loads null', () async {
    expect(await prefs().load(), isNull);
  });

  test('save then load round-trips a running timer', () async {
    final repo = prefs();
    final timer = StudyTimerState(
      courseId: 4,
      initialStartedAtMs: DateTime.now().millisecondsSinceEpoch,
      runningSinceMs: DateTime.now().millisecondsSinceEpoch,
      notes: 'Ch. 3',
    );
    final saved = await repo.save(timer);
    expect(saved.toString(), contains('Ok'));
    final loaded = await repo.load();
    expect(loaded?.courseId, 4);
    expect(loaded?.isRunning, isTrue);
    expect(loaded?.notes, 'Ch. 3');
  });

  test('save then load round-trips a paused timer', () async {
    final repo = prefs();
    const timer = StudyTimerState(
      courseId: 5,
      initialStartedAtMs: 123456,
      accumulatedSec: 300,
    );
    await repo.save(timer);
    final loaded = await repo.load();
    expect(loaded?.isRunning, isFalse);
    expect(loaded?.accumulatedSec, 300);
  });

  test('clear removes the timer', () async {
    final repo = prefs();
    const timer = StudyTimerState(
      courseId: 1,
      initialStartedAtMs: 999,
      runningSinceMs: 999,
    );
    await repo.save(timer);
    expect(await repo.load(), isNotNull);
    await repo.clear();
    expect(await repo.load(), isNull);
  });

  test('corrupt blob loads null', () async {
    SharedPreferences.setMockInitialValues(const {
      'studyTimer.json': 'not-json{{{',
    });
    expect(await prefs().load(), isNull);
  });

  test('rejects invalid course id', () async {
    const bad = StudyTimerState(courseId: 0, initialStartedAtMs: 1);
    final result = await prefs().save(bad);
    expect(result.toString(), contains('Err'));
    expect(await prefs().load(), isNull);
  });
}
