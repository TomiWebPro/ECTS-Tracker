# ECTS Tracker — Task Tracker

Standalone Flutter ECTS study-progress tracker (separate from StudyKing).
Spec: ECTS workload (`required = credits × hoursPerEcts`, default 30),
course management, fast session logging, pace/status engine, dashboard,
statistics, settings with import/export/reset.

## Milestones

| ID | Scope | State |
|----|-------|-------|
| M1 | Scaffold, models, local DB, ECTS math core | partial |
| M2 | Course management (CRUD, sort/filter, progress visuals) | partial |
| M3 | Session logging + history + daily/weekly totals | partial |
| M4 | Pace/status engine + dashboard | partial |
| M5 | Statistics/charts + settings/data management | partial |
| M6 | Themes, nav, empty states, polish, seed data | partial |

`current: M1` — advance only when the milestone's last task is `done` with evidence.
M1 is `partial`: ECTS-001 is `done` but the ECTS-002 seed-data slice is unbuilt
(no seeding / "clear sample data" anywhere in `lib/`) and ECTS-003's unit-test
evidence is thin (any hoursPerEcts ≤ 0 is rejected, incl. the AGENTS.md
"required hours zero" edge case; no recalc-preserves-sessions test).
M2–M6 are `partial` — each milestone's scaffold slice exists (nav shell, courses
list, session/settings repositories, ECTS math, light/dark theme) but its own
task rows are all `open` with no UI/workflow built. None may be flagged `done`.
Verified 2026-11-04 22:12 against repo (commit `a13955a`): `flutter analyze`
clean, `flutter test` 28/28 green. Toolchain lives at `~/flutter/bin`
(not on default PATH — export it before analyze/test).

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
| ECTS-015 | M4 | `CourseStatus` enum + `courseStatus(...)`/per-course progress summary in `logic/ects.dart` covering all five states (completed/overdue/ahead/on-track/behind) and every AGENTS.md §4 edge case, with full unit-test matrix | done | `flutter analyze` clean; `flutter test` 46/46 pass (2026-11-04). `CourseStatus` enum + `CourseProgress` + `courseProgress(...)`/`courseProgressFor(Course,…)`/`isPastDeadline` in `logic/ects.dart` (pure, all values derived); matrix in `test/logic/course_status_test.dart` (18 tests: 5 states, no-deadline/no-sessions/deadline-today/zero-required/past-deadline/no-start-date edges, pace, hoursPerEcts recalc) |
| ECTS-016 | M1 | Seed sample data on first run (few courses + sessions, `isSample = true`) + one-tap "clear sample data" path, with tests | open | |

## Progress log (newest on top)

- 2026-11-04 22:52 ects-build — **ECTS-015 done** (M4 status engine). Added to `lib/src/logic/ects.dart`: `CourseStatus` enum (completed/overdue/ahead/onTrack/behind), immutable `CourseProgress` summary (required/completed/remaining/progress/status/remainingDays/requiredDailyHours/requiredWeeklyHours — all derived, nothing stored), `courseProgress(...)` raw-input function and `courseProgressFor(Course, sessions, hoursPerEcts, now)`, plus `isPastDeadline`. Decision order: remaining ≤ 0 → completed (over-completed past-deadline stays completed); deadline *day* strictly before today → overdue (deadline day itself is not overdue); no start date/deadline → no linear expectation → onTrack; else ahead when logged > expectation, onTrack at/below. **Notable domain finding for the loop:** `behind` is unreachable from logged-hours-vs-elapsed-time alone — with start+deadline set the course is either ahead or level-with-expectation (onTrack), and without bounds there is no expectation. Firing `behind` needs finished-study-hours-pace (e.g. recent daily pace vs `requiredDailyHours`) or a start-date-less elapsed-time baseline; that design decision is left to ECTS-008, which owns the full pace/status engine and should reconcile/absorb this enum. Evidence: `flutter analyze` "No issues found!", `flutter test` 46/46 pass (was 28; +18 in new `test/logic/course_status_test.dart`). Next: ECTS-008 (absorb `behind` + dashboard wiring) or close out M1 with ECTS-002/ECTS-003/ECTS-016.

- 2026-11-05 ects-gate — clean (no defect rows filed; ECTS-017 left free). Inspected vs `a13955a` (+TRACK.md local edit): (1) **ECTS formula PASS** — `requiredHours = credits × hoursPerEcts` at `logic/ects.dart:10-16`, default 30 at `models.dart:61` and DB default `app_database.dart:38`; credits ≤ 0 → 0; non-positive hoursPerEcts throws at the boundary and is rejected in both the DB layer (`repositories.dart:146`) and the UI/state layer, neither of which can persist a bad factor. Recalc-preserves-sessions holds structurally: required hours are derived, never stored (`models.dart:4-5`, `ects.dart:1-5`), and the only settings write (`repositories.dart:145-156`) touches the `settings` row alone with no session delete path — so no sessions can be lost on a factor change. (2) **Status engine: not a defect to file** — zero matches for `CourseStatus`/`courseStatus`/ahead/on-track/behind/overdue in `lib/`; the five-state engine and all §4 edge cases are unbuilt, but this is already tracked verbatim by **open ECTS-015** (M4) plus **ECTS-008**, and it is not a `done` row anywhere (M4 has no done rows). Filing would duplicate a tracked concern, so NOT filed. (3) **`flutter analyze` PASS** — "No issues found!" (4.3s); `flutter test` 28/28 green. No M1 row is falsely marked `done`: ECTS-001's evidence is accurate, and ECTS-002/003 stay `open`, correctly reflecting the unbuilt seed slice (`:11-13`) and the missing recalc-preserves-sessions / zero-hours tests (`:14-15`); the zero-hours test gap is a coverage gap inside an already-open row, not a new defect, since the shipped `requiredHours(0, 30) => 0` behavior at `ects.dart:14` is correct. Verdict: PASS on all three inspected areas; app does not yet meet spec (M1 partial — ECTS-002/003 unbuilt, M4–M6 mostly scaffolds) but no regressions, no falsely-done rows, nothing to file. Toolchain: `export PATH="$HOME/flutter/bin:$PATH"`.

- 2026-11-04 22:12 ects-plan — verified M1–M6 vs code at `a13955a` (`flutter analyze` clean, `flutter test` 28/28): all six milestones were stale `not-started`, corrected to `partial` (scaffold slices exist, own task rows still open); kept `current: M1`; filed ECTS-015 (status engine over existing pure `ects.dart` helpers) and ECTS-016 (seed/clear sample data). Next: ECTS-015, then ECTS-002/003 completion, then ECTS-016.

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
