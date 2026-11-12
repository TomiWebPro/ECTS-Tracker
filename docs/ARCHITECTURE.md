# Architecture (what we have)

Local-first Flutter tracker: ECTS workload math, session logging, pace/status
engine, dashboard, statistics, settings. No backend, no auth. Drift/SQLite
persists everything across restarts. Human overview: `../README.md`.
Agent workflow: `../AGENTS.md`. Task state: `../TRACK.md`.

## Module map

| Path | Owns | Rules |
|------|------|-------|
| `lib/src/models/` | `Course`, `StudySession`, `AppSettings` — plain Dart, raw rows only | Derived values are computed, never stored |
| `lib/src/logic/` | All formulas: `ects.dart` (required/completed/remaining/progress/pace/status), `statistics.dart` (+ `buildStatisticsView`), `session_totals.dart` (+ `groupSessionsByCourse`), `reminders.dart`, `custom_reminders.dart`, `course_list.dart`, `pace_format.dart`, `date_utils.dart` | Pure Dart, no Flutter imports (UI labels live in `ui/course_labels.dart`); repositories return errors as values, never throw (except documented programming-error `ArgumentError`s) |
| `lib/src/data/` | Drift tables (`app_database.dart`), repositories (`repositories/` parts), bootstrap/seed (`bootstrap.dart`), `Result` (`result.dart`) | One-shot `getAll()` for snapshot uses; `watch*()` streams for UI |
| `lib/src/state/` | Riverpod providers, notification prefs wiring | `select()` narrow rebuilds; test fakes via provider overrides |
| `lib/src/ui/` | 5 tabs + dialogs; `pages/` (dashboard/courses/study-log), `settings/` (tiles/dialogs), shared `widgets.dart`/`glass.dart`/`app_sizes.dart` | God-files were split via `part`/`part of` (verbatim); same library, private names stay private |
| `lib/src/notifications/` | Reminder prefs + OS scheduling backend + service | Windows-testable via fakes; dev preview feed in-app |
| `lib/l10n/` | `app_en.arb` source of truth | New keys English-only (AGENTS.md §6); other locales fall back to English until a bulk pass |

## ECTS math (single home: `lib/src/logic/ects.dart`)

`requiredHours = ectsCredits × hoursPerEcts` (default 30). Status decision
order: completed → overdue → deadline-day behind → no-deadline onTrack →
ahead (linear expectation) → achieved-pace onTrack/behind. Tolerance band
(default 5 days of need) keeps labels stable. Edge cases (no deadline,
no sessions, deadline today, zero hours, past deadline) are pinned in
`test/logic/course_status_test.dart`.

## Test map

- `test/logic/` — pure engine + view-model + helpers (fast, platform-free)
- `test/data/`, `test/notifications/`, `test/state/`, `test/startup_test.dart` — contracts with in-memory DB / SharedPreferences mocks
- `test/ui/` — glass chrome/dialogs, l10n smoke (all five tabs), reminder preview, shared widgets, form validation
- Widget tests unmount the scope before closing the DB (Drift stream
  teardown leaves pending fake-async timers otherwise).
