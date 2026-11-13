/// Shared pace formatting (ECTS-078).
///
/// Pace rates >= 1 h stay in hours (one decimal, e.g. `4.6`);
/// sub-hour paces render as whole minutes (e.g. `36` for 0.6 h).
/// Single home for the threshold so dashboard + courses list stay in sync.
library;

import 'locale_format.dart';

/// Below this (in hours) a pace is shown in minutes.
const double kSubHourPaceThresholdHours = 1.0;

/// Daily pace above this is "elevated" (dashboard emphasis tier 1).
const double elevatedDailyPaceHours = 4.0;

/// Daily pace above this is "unrealistic" (dashboard error + warning copy).
const double unrealisticDailyPaceHours = 6.0;

/// Daily pace above this marks a course tile urgent. Higher than the
/// dashboard bands: a single tile shouts only when extreme.
const double courseTileUrgentDailyHours = 8.0;

/// True when [hours] should render as minutes.
bool isSubHourPace(double hours) => hours < kSubHourPaceThresholdHours;

/// Whole minutes for a sub-hour pace. Clamps tiny-but-positive paces to at
/// least 1 min so `0.01 h` never renders as `0 min`; zero stays zero.
int paceMinutes(double hours) {
  if (hours <= 0) return 0;
  final mins = (hours * 60).round();
  return mins <= 0 ? 1 : mins;
}

/// Number string for an hours pace: minutes int when sub-hour, else one
/// decimal — with the locale's own separator when [locale] is given
/// (default `en` keeps the historical rendering byte-identical).
String formatPaceValue(double hours, {String? locale}) => isSubHourPace(hours)
    ? '${paceMinutes(hours)}'
    : formatDecimal(hours, 1, locale: locale);

/// Number string for weekly pace (same rule; weekly = daily * 7 so weekly
/// minutes only happen when daily is also minutes).
String formatWeeklyPaceValue(double hours, {String? locale}) =>
    formatPaceValue(hours, locale: locale);

/// Full duration with unit for notification copy (ECTS-084).
///
/// Sub-hour durations render as whole minutes (`42 min` for 0.7 h);
/// hours keep the reminders trim (`27 h`, not `27.0 h`; else one decimal).
/// [locale] localizes the decimal separator of the hour figure
/// (`2,9 h` in de); the unit words stay English here — the fully localized
/// rendering lives in `notifDuration` (`reminder_text.dart`).
/// Single home so daily/behind/deadline/overdue/streak/custom stay in sync
/// with the dashboard/courses minutes rule (ECTS-078 threshold).
String formatDuration(double hours, {String? locale}) {
  if (isSubHourPace(hours)) return '${paceMinutes(hours)} min';
  return '${formatHoursLocalized(hours, locale: locale)} h';
}
