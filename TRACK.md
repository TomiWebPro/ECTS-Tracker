# ECTS Tracker — Task Tracker

Standalone Flutter university study-progress tracker: ECTS workload, session logging, pace/status engine, dashboard, statistics, settings. Local-first, no backend.
Conventions: `AGENTS.md` (binding, incl. new-locale policy §6) · `README.md` (human overview) · `docs/reminders-spec.md` (reminders copy/behavior spec).

`current: release/stability` - M1-M11 done; all task rows done, **open rows: none**.

## Milestones

| ID | Scope | State |
|----|-------|-------|
| M1 | Scaffold, models, local DB, ECTS math core | done |
| M2 | Course management (CRUD, sort/filter, progress visuals) | done |
| M3 | Session logging + history + daily/weekly totals | done |
| M4 | Pace/status engine + dashboard | done (engine 008/009/015/017/021/022/032/052; 031/037/041 policy-resolved, 035/036/040 superseded/stale; repo-layer 042/043) |
| M5 | Statistics/charts + settings/data management | done (010/011) |
| M6 | Themes, nav, empty states, polish, seed data | done (012) |
| M7 | Localization readiness (English-only ARB, locale locked to en) | done (054-059, app_en.arb 305 keys) |
| M8 | Liquid-glass chrome (gated opt-in) | done (060-065/068/073/074; 066/067 done-unverified per screenshot review; 069 not reproducible — mapping correct, test-pinned) |
| M9 | Study reminders (Windows-testable dev preview + platform wiring) | done (070-078 per docs/reminders-spec.md) |
| M10 | Docs hygiene + structural refactors | done (079 TRACK compaction + AGENTS.md §6 locale policy + docs cleanup/index/ARCHITECTURE.md; 080 date_utils/result split; 081 part-file splits; 082 correctness pass; 083 coverage + config + 069 closure) |
| M11 | Study timer (start/pause/resume/finish, restart-proof) | done (ECTS-091/092/093) |

## Open tasks (claim ONE per build run)

| ID | Milestone | Title | Status | Evidence |
|----|-----------|-------|--------|----------|
| ECTS-001 | M1 | Scaffold project, clean arch, Riverpod + Drift wired | done | analyze clean; tests 28/28; 2026-11-04 |
| ECTS-002 | M1 | Course/Session/Settings models + DB + seed, clearable (umbrella) | done | umbrella satisfied by constituent rows; analyze clean, 146/146 @2170322 |
| ECTS-003 | M1 | ECTS math core (required = credits x hours, recalc) + tests | done | analyze clean; tests 46/46; 2026-11-05 |
| ECTS-004 | M2 | Course CRUD UI | done | analyze clean; full suite 152/152; 2026-11-06 |
| ECTS-005 | M2 | Course list sort/filter + progress visuals | done | analyze clean; full suite 169/169; 2026-11-06 |
| ECTS-006 | M3 | Fast session logging | done | analyze clean; full suite 174/174; 2026-11-06 |
| ECTS-007 | M3 | Session history edit/delete + daily/weekly totals | done | analyze clean; affected 16/16; 2026-11-06 |
| ECTS-008 | M4 | Pace/status engine (5 states + edges) + tests | done | analyze clean; logic 90/90; 2026-11-06 |
| ECTS-009 | M4 | Dashboard (totals, cards, deadlines, needs-attention) | done | analyze clean; affected 8/8; 2026-11-06 |
| ECTS-010 | M5 | Statistics (7/30-day + overall, consistency) + charts | done | analyze clean; affected 3/3; 2026-11-06 |
| ECTS-011 | M5 | Settings (hours-per-ECTS, targets, import/export/reset) | done | analyze clean; full 203/203; 2026-11-07 |
| ECTS-012 | M6 | Bottom nav + log action, themes, empty states, polish | done | analyze clean; full 203/203; 2026-11-07 |
| ECTS-013 | M1 | DB schema + migrations + AppDatabase wiring | done | analyze clean; tests 54/54; 2026-11-04 |
| ECTS-014 | M1 | Repository layer + contract tests | done | analyze clean; tests 98/98; 2026-11-05 |
| ECTS-015 | M4 | CourseStatus enum + progress summary + test matrix | done | analyze clean; tests 46/46; 2026-11-04 |
| ECTS-016 | M1 | Seed sample data + one-tap clear | done | analyze clean; tests 140/140; 2026-11-06 |
| ECTS-017 | M4 | behind reachable via pace baseline | done | analyze clean; tests 54/54; 2026-11-04 |
| ECTS-018 | M1 | Recalc-preserves-sessions integration test | done | analyze clean; repos 61/61; 2026-11-06 |
| ECTS-019 | M1 | setDailyTargetMinutes write path | done | analyze clean; repos 24/24; 2026-11-05 |
| ECTS-020 | M1 | First-run bootstrap guard | done | analyze clean; full 133/133; 2026-11-06 |
| ECTS-021 | M4 | behind without start date (earliest-session baseline) | done | analyze clean; tests 70/70; 2026-11-05 |
| ECTS-022 | M4 | Deadline-day shortfall -> behind | done | analyze clean; tests 60/60; 2026-11-05 |
| ECTS-023 | M1 | Bootstrap boundary before first frame | done | analyze clean; full 137/137; 2026-11-06 |
| ECTS-024 | M1 | First-run loading state | done | reason: superseded by ECTS-023 (bootstrap resolves before first frame; no dashboard-pre-bootstrap window) |
| ECTS-025 | M1 | addCourse boundary validation | done | analyze clean; tests 78/78; 2026-11-05 |
| ECTS-026 | M1 | addSession course-reference validation | done | analyze clean; tests 84/84; 2026-11-05 |
| ECTS-027 | M1 | Sample-scoped read/delete API | done | analyze clean; tests 111/111; 2026-11-05 |
| ECTS-028 | M1 | DB-open failure branch, never fake-empty | done | analyze clean; full 144/144; 2026-11-06 |
| ECTS-029 | M1 | Sample-aware read side + provider | done | analyze clean; repos 60/60 + providers 3/3; 2026-11-05 |
| ECTS-030 | M1 | Sample markers + per-row removal in UI | done | analyze clean; tests 146/146; 2026-11-06 |
| ECTS-031 | M4 | Current-pace semantics (cumulative achieved pace) | done | reason: policy resolved under ECTS-008; analyze clean, logic 90/90; 2026-11-06 |
| ECTS-032 | M4 | Time-aware requiredDailyHours | done | analyze clean; logic 82/82; 2026-11-06 |
| ECTS-035 | M4 | Red-tree gate snapshot filed on WIP | done | reason: stale snapshot, resolved by green tree 146/146 @2170322 |
| ECTS-036 | M4 | Trailing-window pace flip | done | reason: superseded by ECTS-053 re-triage (mechanism absent from committed code); logic 82/82 |
| ECTS-037 | M4 | No-sessions edge policy | done | reason: policy resolved under ECTS-008 (start-dated no-sessions is behind; no-baseline is onTrack); logic 90/90 |
| ECTS-038 | M1 | Deadline-before-start rejection | done | analyze clean; repos 37/37; 2026-11-05 |
| ECTS-039 | M1 | DB-fault Err contract tests (base) | done | analyze clean; full 118/118; 2026-11-05 |
| ECTS-040 | M4 | Fixed-horizon projection defect | done | reason: superseded by ECTS-053 re-triage (stale projection mechanism); logic 82/82 |
| ECTS-041 | M4 | Pre-start ahead guard | done | reason: resolved under ECTS-008; analyze clean, logic 90/90; 2026-11-06 |
| ECTS-042 | M4 | delete not-found contract | done | analyze clean; repos 74/74; 2026-11-07 |
| ECTS-043 | M4 | deleteCourse transaction boundary/guard | done | analyze clean; repos 77/77; 2026-11-07 |
| ECTS-044 | M1 | updateCourse date-order guard | done | reason: satisfied by ECTS-038 shared validation (d8a3cfa); repos 37/37 |
| ECTS-045 | M1 | SettingsRepository.get() one-shot read | done | analyze clean; repos 40/40; 2026-11-05 |
| ECTS-046 | M1 | DB-fault Err tests for newer methods | done | analyze clean; repos 56/56; 2026-11-05 |
| ECTS-047 | M1 | hasSampleDataProvider regression | done | reason: resolved in ECTS-016 build; analyze clean, full 140/140; 2026-11-06 |
| ECTS-048 | M1 | Startup-owned DB lifecycle/dispose | done | analyze clean; full 140/140; 2026-11-06 |
| ECTS-049 | M1 | Clear-sample Err surfacing | done | analyze clean; full 145/145; 2026-11-06 |
| ECTS-050 | M1 | ECTS-030 WIP compile break | done | reason: stale, resolved by 2170322; analyze clean, 146/146 |
| ECTS-051 | M2 | Unused import in course_crud_test | done | reason: resolved during ECTS-005; analyze clean, full 169/169 |
| ECTS-052 | M4 | Full-suite UI/startup failures (173/12) | done | analyze clean; full 185/185; 2026-11-06 |
| ECTS-053 | M4 | Re-triage M4 rows vs committed engine | done | analyze clean; logic 82/82; 2026-11-06 |
| ECTS-054 | M7 | l10n infra (EN-only readiness) | done | analyze clean; startup 2/2; committed 317116d; 2026-11-08 |
| ECTS-055 | M7 | Localize home shell + widgets | done | analyze clean; full green; committed 317116d |
| ECTS-056 | M7 | Localize settings page | done | analyze clean; full green; committed 317116d |
| ECTS-057 | M7 | Localize statistics + status/sort labels | done | analyze clean; legacy labels intact; committed 317116d |
| ECTS-058 | M7 | Localize forms + l10n smoke test | done | analyze clean; full 206/206; 2026-11-08 |
| ECTS-059 | M7 | l10n EN residue close-out | done | analyze clean; full 206/206; 2026-11-08 |
| ECTS-060 | M8 | Liquid-glass persistence (settings flag) | done | analyze clean; full 216/216; 2026-11-09 |
| ECTS-061 | M8 | Glass infra + Display opt-in | done | analyze clean; full 221/221; 2026-11-09 |
| ECTS-062 | M8 | Floating glass chrome | done | analyze clean; full 228/228; 2026-11-09 |
| ECTS-063 | M8 | Glass cards (lite-only scroll) | done | analyze clean; full 232/232; 2026-11-09 |
| ECTS-064 | M8 | Glass dialogs/sheets | done | analyze clean; full 237/237; 2026-11-09 |
| ECTS-065 | M8 | Translate glass keys to 53 ARBs | done | analyze clean; full 237/237; 2026-11-09 |
| ECTS-066 | M8 | Glass legibility pass | done | reason: implemented per screenshot review, verification pending (runs halted); last green 237/237; 2026-11-09 |
| ECTS-067 | M8 | Settings glass coverage | done | reason: same as 066, verification pending user run; last green 237/237; 2026-11-09 |
| ECTS-068 | M8 | Glass crash + numeric-dialog truncation | done | analyze clean; full 244/244; 2026-11-11 |
| ECTS-069 | M8 | Accent mapping drops teal (0 persists, reads back slate) | done | reason: not reproducible — `accentFromInt(0)` is teal (`models.dart`); round-trip pinned by `repositories_test.dart` incl. `accentFromInt(0) == teal`; default slate is the intentional 2026-11-08 theme change |
| ECTS-070 | M9 | Reminders v1: spec + pure logic + tests | done | analyze clean; reminders 18/18; 2026-11-11 |
| ECTS-071 | M9 | Dev-mode reminder preview harness | done | analyze clean; preview 3/3; commits 95dba50+3ff186e; 2026-11-11 |
| ECTS-072 | M9 | Reminder platform wiring + persistence | done | analyze clean; full 290/290; 2026-11-11 |
| ECTS-073 | M9 | Custom/dynamic reminders | done | analyze clean; logic 31/31; 2026-11-11 |
| ECTS-074 | M8 | Apple polish: spacing + menus | done | analyze clean; affected 16/16; 2026-11-11 |
| ECTS-075 | M9 | Behind-nudge computed catch-up hours | done | analyze clean; full 298/298; 2026-11-12 |
| ECTS-076 | M9 | Preview restyle to GlassCard/system gaps | done | analyze clean; full 298/298; 2026-11-12 |
| ECTS-077 | M8 | Courses filter-row centering | done | analyze clean; affected 34/34; 2026-11-12 |
| ECTS-078 | M4 | Sub-hour pace minutes formatter | done | analyze clean; 158/158 incl. pace_format 4/4; 2026-11-12 |
| ECTS-079 | M10 | Docs hygiene: TRACK compaction + AGENTS.md locale policy + docs cleanup | done | subagent docs-compact; README.md diff empty (human doc untouched); AGENTS.md §6 locale policy added; reminders-spec header/footer + docs/README index; 2026-11-12 |
| ECTS-080 | M10 | Structural refactors: date_utils/result split, constants, import hygiene | done | analyze clean; logic 141/141; data/state/startup 109/109; full 309/309; commit 13bef19 (code only); 2026-11-12 |
| ECTS-081 | M10 | God-file splits via part files (home_shell, settings_page, repositories), verbatim moves only | done | byte-exact reconstruction vs HEAD; analyze clean; full 309/309; commit a395ec3 (code only); 2026-11-12 |
| ECTS-082 | M10 | Correctness/small refactors: session_form build fix, course_labels layering, bare-catch logging, constants, copyWith/a11y/main wiring | done | analyze clean; logic+data+ui green; commit bb2a6f4 (code only); 2026-11-12 |
| ECTS-083 | M10 | Coverage + config + closure: gap tests, lints probe, deps prune, ECTS-069 resolve, ARCHITECTURE.md | done | analyze clean; full 332/332; tests+config commit 728681f; docs commit (this run); 2026-11-12 |
| ECTS-084 | M9 | Reminder preview full-bleed layout + sub-hour minutes copy | done | analyze clean; full 335/335; 2026-11-12 |
| ECTS-085 | M8 | Liquid-glass bottom nav flow-through (content scrolls under tab bar, no white block) | done | analyze clean; glass chrome/cards/dialogs 25/25 green, full suite 306+ no failures at timeout (slow UI); commit 502c65c; 2026-11-12 |
| ECTS-086 | M7 | Bulk locale pass: translate missing 26 keys + units audit for all 53 non-EN ARBs | done | analyze clean; gen-l10n ok; full 335/335; 5-way subagent split (A-E) |
| ECTS-087 | M9 | Localize reminder notification copy (preview + OS share one path) | done | analyze clean; gen-l10n ok; full 341/341; code 75a83f2 + bulk 21e0cb6 + gen 5014202 |
| ECTS-088 | M9 | Dev-mode "Remove all data" tile: keep, make visually consistent | done | analyze clean; widgets+dialogs 9/9; divider restored (1-line) |
| ECTS-089 | M8 | Fix reset-all → liquid-glass flips accent slate→teal (keep slate) | done | analyze clean; full 343/343; reseed + v9 repair + 2 regression tests |
| ECTS-090 | M9 | Behind-title ⚠️ renders as text glyph, misaligned — swap to color-emoji mark | done | analyze clean; full 343/343; U+26A0→🔻 in logic + 54 ARBs + regen, spec + test updated |
| ECTS-091 | M11 | Study timer: manual stays, add course-picked start/pause/resume/finish, restart-proof | done | analyze clean; full 358/358 (15 new timer tests); commit 0c500dd; 2026-11-13 |
| ECTS-092 | M11 | Fold timer into Log-session dialog (Manual/Timer switch), remove outside pills | done | analyze clean; full 376/376 (3 dialog tab tests); notifier once-restore fixes rebuild loop; commit 492c11f; 2026-11-13 |
| ECTS-093 | M11 | Phone notification: ongoing timer w/ pause-resume-finish-discard actions (Android live, iOS categories; Dynamic Island doc) | done | analyze clean; full 376/376 (12 alerts + 3 notifier-alert tests); commit 492c11f; 2026-11-13 |

Note: ECTS-033/034 were announced in a 2026-11-05 log but never got rows; IDs skipped, do NOT renumber.

Audited but intentionally unchanged (value filter, 2026-11-12): mass renames
(loop/test-helper/comment style — churn, no behavior); speculative perf
(computeReminders map precompute, catch-up iteration cut, statistics
memoization, per-card glass `watch` — reschedule/rare paths, tests pin
current shape); reminder copy message-IDs (spec-locked English v1 + tests
pin strings); legacy English sort/status labels (tests pin fallback);
palettes/`toStringAsFixed` precision (intentional per-surface variance);
`copyWith(localeCode: null)` sentinel (no caller needs it — repo path
handles null); `hasSampleDataProvider` shape (works, tested);
`always_put_required_named_parameters_first` (34 pre-existing sites —
churn); double-close guard (composition root already guards); UI `take(3)`
trims (different semantics per surface); hold-to-confirm timer test
(private widget, covered indirectly by settings pumps).

## Progress log (newest on top)

- 2026-11-13: ECTS-092 done (timer folded into Log-session dialog Manual/Timer switch; outside pills/FABs removed; banner in-flow + 760px cap; dialog overflow fixed; rebuild-loop fix via once-restore; widget tests use ProviderScope+mem fake).
- 2026-11-13: ECTS-093 done (ongoing phone notification w/ pause/resume/finish/discard; Android chronometer + background handler prefs-only; iOS categories localized; finish opens app; Dynamic Island scoped in docs/live-activity.md for macOS).

- 2026-11-12: ECTS-084 done (preview columns stretch to full-bleed equal insets; formatDuration <1 h → min in daily/behind/deadline/overdue/streak/custom; full 335/335).

- 2026-11-12: ECTS-085 done (glass bottom-nav flow-through: outer bottom inset removed, clearance moved inside scrollables; analyze clean; commit 502c65c).

- 2026-11-12: ECTS-083 done (form validation 7/7, widgets 4/4, prefs 5/5, view-model/grouping/tryFromJson tests; prefer_single_quotes guard on; cupertino_icons pruned; ECTS-069 closed not-reproducible; docs/ARCHITECTURE.md; full 332/332).
- 2026-11-12: ECTS-082 done (layering: course_labels out of logic; shared EmptyStateCard/SectionHeader; pure StatisticsView; prefs/backend DI; getAll one-shots; scoped MaterialApp watches; OS-composed text scaler; logged catches; pace/limit constants).
- 2026-11-12: ECTS-081 done (home_shell 2366→382, settings_page 1923→1546, repositories 1156→72 via part files, byte-exact; full 309/309).
- 2026-11-12: ECTS-080 done (date_utils single home wired into ects/statistics/session_totals/reminders/custom_reminders; Result moved to data/result.dart with re-export; Ok-pattern fix in importJson; reminder_prefs imports result directly; connection/providers blank-line hygiene; new date_utils_test 7/7; full 309/309 @13bef19).
- 2026-11-12: ECTS-079 done (TRACK 393→~130 lines; AGENTS.md §6 locale policy — README stays human-only; reminders-spec touch-ups; docs/README index).
- 2026-11-12: ECTS-077/078 done (filter-row centering via isDense + Wrap alignment; sub-hour pace minutes formatter, 158/158); ECTS-069 claim stale-expired, reverted to open.
- 2026-11-12: ECTS-075/076 done (computed catch-up hours replace hardcoded 45-min nudge; preview restyled to GlassCard/system gaps; full 298/298).
- 2026-11-11: ECTS-073 done (custom/weekly/monthly reminders, 31/31) + ECTS-074 done (Apple polish: airier spacing, glass menus; affected 16/16).
- 2026-11-11: ECTS-068 done (glass narrow-window crash fix, full 244/244) + ECTS-072 done (platform wiring, schema v9 prefs, full 290/290).
- 2026-11-11: ECTS-070 done (reminders spec + pure logic, 18/18) + ECTS-071 done (dev preview harness, commits 95dba50+3ff186e).
- 2026-11-09: ECTS-066/067 implemented per screenshot review, verification pending (runs halted by user; last green 237/237).
- 2026-11-09: ECTS-063/064/065 done (glass cards + dialogs + 53-locale key translation; full 237/237).
- 2026-11-09: ECTS-060/061/062 done (glass persistence + infra/opt-in + floating chrome; full 216/216 then 228/228).

## Conventions

- Status vocabulary: `open` / `claimed by <owner> at <UTC iso>` / `done`; policy/superseded/stale/unverified resolutions use `done` with the reason in Evidence.
- Evidence template: `flutter analyze` result + tests run (`N/N`) + commit SHA or date, one line.
- Stale-claim sweeper: any `claimed` older than 2h reverts to `open` (max run is 60min).
- WIP limits: max 1 claimed row per owner; one run owns ONE task, no sidecars.
- New-locale policy: new user-visible keys ship English-only in `app_en.arb`; bulk translation to other ARBs happens later on command (full text lives in AGENTS.md §6).
