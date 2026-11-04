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

## Open tasks (claim ONE per build run)

| ID | Milestone | Title | Status | Evidence |
|----|-----------|-------|--------|----------|
| ECTS-001 | M1 | Scaffold Flutter project, clean architecture, Riverpod + Drift/SQLite wired | open | |
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

## Progress log (newest on top)

- `2026-11-04`: tracker created; 12 tasks filed across M1–M6; scheduler loop
  (ects-plan/build/gate, every 40m, 1h timeout, deepseek-v4.1-flash) configured.
