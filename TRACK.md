# ECTS Tracker — Task Tracker

Standalone Flutter ECTS study-progress tracker (separate from StudyKing).
Spec: ECTS workload (`required = credits × hoursPerEcts`, default 30),
course management, fast session logging, pace/status engine, dashboard,
statistics, settings with import/export/reset.

## Milestones

| ID | Scope | State |
|----|-------|-------|
| M1 | Scaffold, models, local DB, ECTS math core | not-started |
| M2 | Course management (CRUD, sort/filter, progress visuals) | not-started |
| M3 | Session logging + history + daily/weekly totals | not-started |
| M4 | Pace/status engine + dashboard | not-started |
| M5 | Statistics/charts + settings/data management | not-started |
| M6 | Themes, nav, empty states, polish, seed data | not-started |

`current: M1` — advance only when the milestone's last task is `done` with evidence.
Verified 2026-11-04 22:28 against repo contents: no `lib/`, no `test/`, no
`pubspec.yaml` — only `AGENTS.md` + `TRACK.md`. All milestones `not-started` is accurate.
Note: `flutter`/`dart` not on PATH on this machine — ECTS-001 builders must
install/locate the SDK before `flutter analyze`/`flutter test` evidence is possible.

## Open tasks (claim ONE per build run)

| ID | Milestone | Title | Status | Evidence |
|----|-----------|-------|--------|----------|
| ECTS-001 | M1 | Scaffold Flutter project, clean architecture, Riverpod + Drift/SQLite wired | done | `flutter analyze` clean; `flutter test` 28/28 pass (2026-11-04) |
| ECTS-002 | M1 | Course/Session/Settings models + DB + seed sample data (clearable) | open | |
| ECTS-003 | M1 | ECTS math core (`required = credits × hours`, recalc on setting change) + unit tests | open | |
| ECTS-004 | M2 | Course CRUD (name, ECTS, hours auto-calc, dates, notes, color) | open | |
| ECTS-005 | M2 | Course list: sort/filter (deadline, progress, name, status) + progress visuals | open | |
| ECTS-006 | M3 | Fast session logging (course, duration h/min, date, notes) updating all totals | open | |
| ECTS-007 | M3 | Session history: view/edit/delete + daily/weekly totals | open | |
| ECTS-008 | M4 | Pace/status engine (ahead/on-track/behind/completed/overdue + all edge cases) + tests | open | |
| ECTS-009 | M4 | Dashboard (totals, overall progress, per-course cards, deadlines, needs-attention) | open | |
| ECTS-010 | M5 | Statistics (7/30-day + overall, per-course, consistency) with charts | open | |
| ECTS-011 | M5 | Settings (hours-per-ECTS, targets, first weekday, display prefs, import/export/reset) | open | |
| ECTS-012 | M6 | Bottom nav + log action, light/dark themes, empty states, animations, final polish | open | |
| ECTS-013 | M1 | Database schema + migrations + `AppDatabase` wiring (full table definitions incl. settings singleton row) | open | |
| ECTS-014 | M1 | Repository layer (courses/sessions/settings) returning errors as values + contract tests against in-memory DB | open | |

## Progress log (newest on top)

- `2026-11-04`: ECTS-001 done — Flutter scaffold (`ects_tracker`), clean layers
  (`lib/src/{models,data,state,ui,logic}`), Riverpod providers over Drift/SQLite
  (courses, sessions, settings tables + `PRAGMA foreign_keys` cascade), plain
  models with all derived values computed (never stored), ECTS math core
  scaffolded in `logic/ects.dart` with 23 unit tests, repository tests (28 total).
  analyze clean.

- 2026-11-04 21:31 ects-gate — clean (no defect rows filed). Inspected: M1 "done" rows (none exist — ECTS-001 still `claimed` by ects-build at 21:28:53Z, all scaffold code untracked/uncommitted), ECTS formula (`required = credits × hoursPerEcts`, default 30, recalc preserves sessions), status engine (ahead/on-track/behind/completed/overdue + no-deadline/no-sessions/deadline-today/zero-hours/past-deadline), `flutter analyze`. Findings: (1) `lib/src/logic/ects.dart` absent; no models/status engine/repositories — ECTS math + status engine unbuilt, already tracked by open ECTS-003/ECTS-008; nothing to verify. (2) `flutter analyze` on the in-progress scaffold reports 6 issues/3 errors (part_of_non_part, super_formal_parameter_without_associated_positional in lib/src/data/app_database.dart:3,44,47). NOT filed: belongs to uncommitted, in-flight ECTS-001 (still `claimed`, not `done`) — filing would race the running builder and gate unfinished work. Re-check on the next gate run once ECTS-001 is `done` with evidence. ECTS-001 claim left untouched. Verdict: no done row falsely claimed dirty; app does not yet meet spec (0 completed features).
- 2026-11-04 22:28 ects-plan — verified M1–M6 states vs repo (all `not-started`, accurate; empty repo, no toolchain on PATH); kept `current: M1`; filed ECTS-013, ECTS-014 (DB schema/migrations, repository layer) as the immediate M1 sub-steps under ECTS-001/ECTS-002.
- `2026-11-04`: tracker created; 12 tasks filed across M1–M6; scheduler loop
  (ects-plan/build/gate, every 40m, 1h timeout, deepseek-v4.1-flash) configured.
