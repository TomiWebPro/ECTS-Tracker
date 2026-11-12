/// Shared pace formatting (ECTS-078).
///
/// Pace rates >= 1 h stay in hours (one decimal, e.g. `4.6`);
/// sub-hour paces render as whole minutes (e.g. `36` for 0.6 h).
/// Single home for the threshold so dashboard + courses list stay in sync.
library;

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
/// decimal (matches the pre-078 `toStringAsFixed(1)` display for hours).
String formatPaceValue(double hours) =>
    isSubHourPace(hours) ? '${paceMinutes(hours)}' : hours.toStringAsFixed(1);

/// Number string for weekly pace (same rule; weekly = daily * 7 so weekly
/// minutes only happen when daily is also minutes).
String formatWeeklyPaceValue(double hours) => formatPaceValue(hours);
