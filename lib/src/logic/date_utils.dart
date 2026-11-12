/// Shared calendar-day helpers (single home for date-boundary math).
///
/// Several logic modules previously cloned a private `_dateOnly`; all
/// date-flooring must go through [dateOnly] so day boundaries cannot diverge.
library;

/// Strips the time of day, flooring [d] to its calendar date (local).
DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// Whole days from [from] to [to] on calendar dates, floored at 0.
int daysBetweenDates(DateTime from, DateTime to) {
  final diff = dateOnly(to).difference(dateOnly(from)).inDays;
  return diff > 0 ? diff : 0;
}

/// Earliest / latest date the course/session pickers offer. Single home so
/// both forms agree (backup validation has its own range with its own copy,
/// pinned by contract tests — keep the messages there untouched).
final DateTime minPickerDate = DateTime(2000);
final DateTime maxPickerDate = DateTime(2100);

/// Compact `MM/DD` for chart axis labels (not locale-aware by design —
/// axis ticks stay fixed-width; full dates use [formatYmd]).
String formatMonthDay(DateTime d) =>
    '${d.month.toString().padLeft(2, '0')}/${d.day.toString().padLeft(2, '0')}';

/// `yyyy-MM-dd` (zero-padded), for stable snapshot keys and debug output.
String formatYmd(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
