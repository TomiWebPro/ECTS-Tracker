# ECTS Tracker

A local-first Flutter app for tracking university study progress in ECTS credits:
log study sessions, see per-course pace and on-track/behind status, and manage
your workload across deadlines. No backend, no account — all data stays on device
(Drift/SQLite) and survives restarts.

## Core formula

`requiredHours = ectsCredits × hoursPerEcts` (default `hoursPerEcts = 30`,
configurable in Settings; changing it recalculates every course requirement
without touching logged sessions).

Per-course status is computed from logged hours vs elapsed time: `completed`,
`overdue`, `ahead`, `on track`, `behind` — plus the required daily pace
(`remainingHours / remaining time`) so you always know what "caught up" means.

## Screens (bottom nav)

- **Dashboard** — totals, overall progress, per-course cards, needs-attention
  (behind/overdue), prominent "Log session" action.
- **Courses** — CRUD (name, ECTS with auto-calculated hours, dates, notes,
  color), sort/filter (deadline, progress, name, status), progress visuals.
- **Study Log** — fast session logging (course, duration, date, notes),
  history with edit/delete, daily/weekly totals.
- **Statistics** — 7/30-day and overall charts, per-course breakdown,
  consistency score.
- **Settings** — hours-per-ECTS, daily target, first weekday, theme
  (light/dark), JSON import/export, reset settings, reset all data,
  clear sample data.

First launch seeds a few sample courses + sessions (clearly marked, removable
per row or all at once) so the app never looks empty.

## Getting started

Requires the Flutter SDK:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

If `flutter` is not on PATH, use `~/flutter/bin/flutter`.
