# ECTS Tracker — Agent Conventions (binding)

Standalone Flutter app: university study progress tracker. ECTS-based workload,
study-session logging, on-track/behind deadline math, dashboard, statistics,
settings. Local-first, no backend, no auth. All data persists across restarts.

## 1. Source of truth

- `TRACK.md` in this repo root is the task tracker: milestones, task rows
  (`ECTS-xxx`), Open rows. Update it in every run you change state.
- This `AGENTS.md` defines how to work. The scheduler prompt defines your role
  for this run (plan = never implement, build = implement one task, gate =
  never fix, only file).

## 2. Claim protocol (builders MUST do this)

One run owns ONE task. No sidecars, no tooling — the `TRACK.md` row is the lock:

1. BEFORE editing code, mark exactly one `open` row as
   `claimed by <job-name> at <UTC iso>` in its Status cell.
2. If you stop without finishing, set it back to `open`.
3. When done and verified, set it to `done` + evidence
   (`flutter analyze` + tests run) in the same row.
4. Never touch another run's `claimed` row. Claims older than 2h are stale and
   may be taken over (max run is 60min).

## 3. Architecture

- `lib/src/models/` — Course, StudySession, AppSettings. Plain Dart.
  **Derived values are computed, never stored** (requiredHours, completedHours,
  remainingHours, progress, pace, status).
- `lib/src/data/` — local database (Drift/SQLite; Hive acceptable if justified
  in TRACK.md). Repositories return errors as values, never throw across layers.
- `lib/src/state/` — Riverpod providers (recommended) or documented alternative.
- `lib/src/ui/` — screens + reusable widgets. Bottom nav: Dashboard, Courses,
  Study Log, Statistics, Settings. Prominent "log session" action.
- `lib/src/logic/ects.dart` — the ECTS math (single home for all formulas).

## 4. Domain rules (non-negotiable)

- `requiredHours = ectsCredits * hoursPerEcts`, default `hoursPerEcts = 30`.
  Changing the setting recalculates every course requirement; logged sessions
  are never deleted by a recalculation.
- Per-course status, computed transparently from logged hours vs elapsed time:
  `completed` (remaining ≤ 0), `overdue` (past deadline, incomplete),
  `ahead` (done more than the linear expectation to date), `on track`
  (current pace finishes on time), `behind` (needs higher pace).
  Show required daily/weekly pace: `remainingHours / remainingDays`.
- Edge cases must be handled: no deadline, completed, no sessions logged,
  deadline today, required hours zero, deadline passed.
- Seed sample data on first run (a few courses + sessions) with a one-tap
  "clear sample data" path. Never ship an empty-looking first run.

## 5. Definition of done (build tasks)

- `flutter analyze` clean, affected `flutter test` green.
- One task per run. Small commit for code only (`git commit`, explicit paths).
- NEVER `git push`. NEVER commit anything outside this repo.
- Update the TRACK.md row to `done` with test evidence.
