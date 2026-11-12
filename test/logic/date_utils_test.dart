import 'package:ects_tracker/src/logic/date_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('dateOnly', () {
    test('strips time of day, keeps the calendar date', () {
      expect(dateOnly(DateTime(2026, 11, 12, 23, 59, 59)),
          DateTime(2026, 11, 12));
    });

    test('midnight input is unchanged', () {
      expect(
          dateOnly(DateTime(2026, 1, 5)), DateTime(2026, 1, 5));
    });
  });

  group('daysBetweenDates', () {
    test('same calendar day is 0 even across times', () {
      expect(
          daysBetweenDates(
              DateTime(2026, 11, 12, 8), DateTime(2026, 11, 12, 20)),
          0);
    });

    test('counts whole calendar days', () {
      expect(daysBetweenDates(DateTime(2026, 11, 12), DateTime(2026, 11, 15)),
          3);
    });

    test('past dates floor at 0, never negative', () {
      expect(daysBetweenDates(DateTime(2026, 11, 15), DateTime(2026, 11, 12)),
          0);
    });
  });

  group('formatYmd', () {
    test('zero-pads month and day', () {
      expect(formatYmd(DateTime(2026, 1, 5)), '2026-01-05');
    });

    test('round-trips through DateTime.parse', () {
      final d = DateTime(2026, 11, 12, 14, 30);
      expect(DateTime.parse(formatYmd(d)), dateOnly(d));
    });
  });
}
