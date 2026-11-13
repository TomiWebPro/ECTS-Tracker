/// Locale-aware number/date formatting (M13, ECTS-097).
///
/// Pure Dart + `intl` (no widgets): UI and notification copy format through
/// here so non-English locales get their own decimal separators and date
/// order. Output is byte-identical to the old `toStringAsFixed` rendering
/// for the `en` locale (grouping off), so existing tests pinning English
/// strings keep passing unchanged.
library;

import 'package:intl/intl.dart';

/// Decimal rendering with [fractionDigits], honoring the locale's decimal
/// separator. Grouping stays off (patterns below carry no `,`): `1500.5`
/// never becomes `1,500.5`, matching the historical display.
String formatDecimal(num value, int fractionDigits, {String? locale}) {
  final digits = fractionDigits < 0 ? 0 : fractionDigits;
  final pattern = digits <= 0 ? '#0' : '#0.${'0' * digits}';
  return NumberFormat(pattern, locale ?? 'en').format(value);
}

/// Trimmed hours figure: whole hours render without decimals (`27`, not
/// `27.0`), else one decimal — the historical `formatHours` shape, now
/// with the locale's own separator (`2,9` in de).
String formatHoursLocalized(double hours, {String? locale}) =>
    formatDecimal(hours, hours % 1 == 0 ? 0 : 1, locale: locale);

/// Locale short date for user surfaces (buttons, rows, preview headers):
/// `7/31/2026` in en, `31.7.2026` in de, etc.
///
/// The spec-pinned ISO `formatYmd` (`date_utils.dart`) stays for storage,
/// tests, and ARB examples; this is the display twin.
String formatDateLocalized(DateTime date, {String? locale}) =>
    DateFormat.yMd(locale ?? 'en').format(date);

/// Compact month/day for narrow chart axes, locale-ordered (`7/31` en).
/// Replaces the fixed `MM/DD` on rendered surfaces only.
String formatMonthDayLocalized(DateTime date, {String? locale}) =>
    DateFormat.Md(locale ?? 'en').format(date);
