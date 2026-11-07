# ECTS Tracker

I'm a student at TUM, and I built this tracker for one simple reason: I wanted
to stay on top of my studies. Deadlines pile up, lectures blur together, and
"how much work is this course, really?" is a question I kept getting wrong. So
I coded this app — a local-first Flutter tracker that turns my courses into
concrete numbers and tells me every day whether I'm on track or falling behind.
No backend, no account, everything stays on my device (Drift/SQLite) and
survives restarts.

## The formula

`requiredHours = ectsCredits × hoursPerEcts`

One ECTS credit point represents 25–30 hours of total student workload. That
range comes straight from the Bologna framework behind the European credit
system, and if you search around online, it's the version nearly everyone
lands on: 1 ECTS ≈ 25–30 hours, including lectures, exercises, and self-study.
I agree with it — it's the honest, widely approved way to convert abstract
credit points into real hours you can plan against.

This app defaults to **30 hours per ECTS** (the upper, safer end of the range)
and you can change it in Settings — every course requirement recalculates
instantly, without ever touching your logged sessions.

From there, each course gets a computed status — `completed`, `overdue`,
`ahead`, `on track`, or `behind` — plus the required daily and weekly pace
(`remaining hours ÷ remaining time`), so you always know exactly what
"caught up" means.

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

## License

MIT — see [LICENSE](LICENSE). Do whatever you want with the code; if it helps
you stay on top of your studies too, even better.
