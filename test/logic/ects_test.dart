import 'package:ects_tracker/src/logic/ects.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('requiredHours', () {
    test('credits × hoursPerEcts with default 30', () {
      expect(requiredHours(5, AppSettings.defaultHoursPerEcts), 150);
    });

    test('respects a changed hoursPerEcts setting', () {
      expect(requiredHours(5, 25), 125);
      expect(requiredHours(6, 25), 150);
    });

    test('zero credits yields zero', () {
      expect(requiredHours(0, 30), 0);
    });

    test('rejects non-positive hoursPerEcts', () {
      expect(() => requiredHours(5, 0), throwsArgumentError);
    });
  });

  group('completedHours', () {
    StudySession s(int minutes) => StudySession(
          id: 0,
          courseId: 1,
          minutes: minutes,
          date: DateTime(2026, 1, 1),
        );

    test('sums minutes into hours', () {
      expect(completedHours([s(60), s(90), s(30)]), 3.0);
    });

    test('empty list is zero', () {
      expect(completedHours(const []), 0);
    });

    test('ignores non-positive minutes', () {
      expect(completedHours([s(60), s(-30), s(0)]), 1.0);
    });
  });

  group('remainingHours', () {
    test('subtracts completed from required', () {
      expect(remainingHours(150, 100), 50);
    });

    test('never goes negative when over-completed', () {
      expect(remainingHours(150, 200), 0);
    });

    test('zero requirement gives zero remaining', () {
      expect(remainingHours(0, 0), 0);
    });
  });

  group('progressFraction', () {
    test('mid progress', () {
      expect(progressFraction(100, 25), 0.25);
    });

    test('clamps to 1 when over-complete', () {
      expect(progressFraction(100, 150), 1.0);
    });

    test('zero requirement gives 0 progress', () {
      expect(progressFraction(0, 10), 0);
    });
  });

  group('remainingDays', () {
    final now = DateTime(2026, 11, 4);

    test('null deadline returns null', () {
      expect(remainingDays(null, now), isNull);
    });

    test('counts whole days ahead', () {
      expect(remainingDays(DateTime(2026, 11, 11), now), 7);
    });

    test('deadline today returns 0', () {
      expect(remainingDays(DateTime(2026, 11, 4, 23), now), 0);
    });

    test('deadline passed returns 0', () {
      expect(remainingDays(DateTime(2026, 10, 1), now), 0);
    });
  });

  group('requiredDailyHours', () {
    final now = DateTime(2026, 11, 4);

    test('remaining / remainingDays', () {
      expect(requiredDailyHours(70, DateTime(2026, 11, 11), now), 10);
    });

    test('weekly is 7× daily', () {
      expect(requiredWeeklyHours(70, DateTime(2026, 11, 11), now), 70);
    });

    test('no deadline yields null pace', () {
      expect(requiredDailyHours(70, null, now), isNull);
    });

    test('deadline today yields null (division guarded)', () {
      expect(requiredDailyHours(70, DateTime(2026, 11, 4), now), isNull);
    });
  });

  group('expectedHoursToDate', () {
    final start = DateTime(2026, 1, 1);
    final end = DateTime(2026, 1, 11);

    test('null bounds yield null', () {
      expect(expectedHoursToDate(100, null, end, start), isNull);
      expect(expectedHoursToDate(100, start, null, start), isNull);
    });

    test('halfway through yields half the requirement', () {
      expect(expectedHoursToDate(100, start, end, DateTime(2026, 1, 6)), 50);
    });

    test('past the deadline yields full requirement', () {
      expect(expectedHoursToDate(100, start, end, DateTime(2026, 2, 1)), 100);
    });
  });
}
