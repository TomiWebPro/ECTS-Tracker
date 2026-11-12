import 'package:ects_tracker/src/logic/pace_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('pace_format (ECTS-078)', () {
    test('hours >= 1 stay as one-decimal hours', () {
      expect(formatPaceValue(1.0), '1.0');
      expect(formatPaceValue(4.6), '4.6');
      expect(formatPaceValue(4.3), '4.3');
      expect(isSubHourPace(1.0), isFalse);
      expect(isSubHourPace(4.6), isFalse);
    });

    test('sub-hour converts to whole minutes', () {
      expect(isSubHourPace(0.6), isTrue);
      expect(formatPaceValue(0.6), '36');
      expect(paceMinutes(0.6), 36);
      // 0.5 h -> 30 min, 0.1 h -> 6 min, 0.99 h -> 59 min.
      expect(formatPaceValue(0.5), '30');
      expect(formatPaceValue(0.1), '6');
      expect(formatPaceValue(0.99), '59');
    });

    test('weekly follows the same rule', () {
      expect(formatWeeklyPaceValue(4.6), '4.6');
      expect(formatWeeklyPaceValue(0.7), '42');
    });

    test('zero and tiny paces never show 0 min for positive input', () {
      expect(formatPaceValue(0.0), '0');
      expect(paceMinutes(0.0), 0);
      expect(paceMinutes(0.001), 1);
    });
  });
}
