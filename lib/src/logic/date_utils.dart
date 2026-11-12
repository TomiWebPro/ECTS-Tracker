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

/// `yyyy-MM-dd` (zero-padded), for stable snapshot keys and debug output.
String formatYmd(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
