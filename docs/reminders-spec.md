# Study reminders — v1 spec (locked 2026-11-11, ECTS-070)

> Project overview in [README.md](../README.md); this file is the normative spec.

Goal: nudge the student back to studying. Max 1 ping a day plus a
deadline countdown when close. Never nag. Phone and tablet identical
(local notifications, no server, no FCM).

## Message types (English v1; other locales later per M7 precedent)

1. **Daily plan** (19:00 default, user-settable later): per course, today's
   target is the start-of-day pace (remaining as if nothing logged today);
   still needed = max(0, target − hours already logged *today*).
   Covered courses drop out; all covered → silence
   (or the "Today is covered" variant via `todayLoggedHours`).
   - Needs work: `📚 Tonight: {X} h to stay on track` /
     `{Course} needs {p} h/day · {Course2} {p2} h/day. Log a session to clear today.`
   - Covered: `✅ Today is covered — {X} h logged. {Course} is back On track.`
     (or silence — caller decides; pure logic returns `null` when nothing due)
2. **Behind** (folded into the daily ping, no extra push): only when
   `status == behind` (real shortfall past the tolerance band, not one
   missed evening). `⚠️ {Course} slipped to Behind` /
   `{left} h left, {d} days to go — {p} h/day from here. Log {catchUp} h
   to get back On track.` — where {catchUp} is computed by bisection over
   the engine (ECTS-075, never a hardcoded session size); when only
   finishing clears it, the copy says so honestly.
3. **Deadline countdown** (`deadlineWarnDays = 3`, fires at reminder time on
   `deadline - warnDays`, plus tomorrow/today variants):
   - `⏳ {Course} exam in {d} days — {left} h left` / `That's {p} h/day. Split it: 2 sessions a day beats one marathon.`
   - Tomorrow: `🚨 {Course} is due tomorrow and still has {left} h open` /
     `Anything you log today counts double.`
   - Today: deadline-day rule (`requiredDailyHours == null`, status `behind`
     while hours remain) — action copy, never a fake pace number.
4. **Overdue escalation** (max 2 pushes ever per course-deadline, then
   silence; course stays atop dashboard needs-attention):
   `❌ {Course} passed its deadline with {left} h open` /
   `Move the deadline or finish the {left} h.`
5. **Streak** (weekly at most, only when true):
   `🔥 {n}-day streak — {w} h this week` / `All courses On track or Ahead. Nice run.`

## Rules (non-negotiable)

- Returns `[]`/`null` (no notification) when everything is `Completed`/`Ahead`/no deadlines.
- Returns `[]` (excluded) for scheduled-future courses (`isScheduledCourse`) in "tonight's number".
- One daily summary names max 2 courses, rest folds into "+N more".
- Daily ping is silent (no sound); sound only on deadline-tomorrow/overdue.
- Returns `[]` (and cancels all scheduled) when `remindersEnabled == false`; `resetAllData` cancels all.
- Returns `[]` for overdue beyond max 2 pushes per course-deadline, then silent.
- Returns `null` for streak when already fired within the past week (at most 1 per week).
- Tap payload carries `courseId` (or `open:dashboard`); app deep-links to
  the course with the log-session sheet one tap away.

## Notification IDs (platform layer, ECTS-072)

- `1000` daily, `2000 + (courseId % 100000)` deadline,
  `3000 + (courseId % 100000)` overdue, `4000` streak.

## Engine mapping (`lib/src/logic/ects.dart`)

- `courseProgressFor` per course; `requiredDailyHours`/`remainingDays`/
  `isScheduledCourse` as defined there. Deadline-day null pace ⇒
  behind-text (no divide by zero). Tolerance band from Settings
  (`paceToleranceDays`, default 5).

## Testability on Windows (no OS notifications needed)

- ECTS-070: `lib/src/logic/reminders.dart` is pure Dart (models + ects
  only — no plugins, no `BuildContext`, no DB). Fully covered by
  `flutter test test/logic/reminders_test.dart` on Windows.
- ECTS-071: dev-mode in-app preview feed ("what WOULD notify now",
  with fake-now trigger) reuses the same pure functions.
- ECTS-072: real `flutter_local_notifications` scheduling; tested on
  device, logic underneath already proven on Windows.

## v1 platform notes (ECTS-072, locked)

- Transport: `flutter_local_notifications` (inexact alarms — no exact-alarm
  permission needed) + `timezone`/`flutter_timezone`. Abstraction:
  `NotificationBackend` (fake in tests) + `ReminderService.reschedule`.
- Prefs in SharedPreferences (`ReminderPrefsRepository`): enabled (default
  off), reminder time (default 19:00), deadline window (default 3 d),
  custom schedules (JSON), overdue fire counts. NOT in Drift — ships
  without a schema migration; Drift consolidation is an optional follow-up.
- Reschedule triggers (v1): app launch (`main.dart`, best-effort guarded)
  + every reminder-pref change in Settings. No background workers: content
  is composed fresh at each reschedule; scheduled copies stay until the
  next reschedule replaces them.
- Countdowns schedule same-day fires only; future days ride the daily
  repeating ping until recomputed. Weekly/monthly customs schedule their
  next fire only (repeats continue while the app is opened regularly).
- Android: `POST_NOTIFICATIONS` (runtime, asked when enabling). iOS: no
  plist change (runtime alert/badge/sound auth only).

## Status

Locked 2026-11-11 ECTS-070; extended ECTS-073/075.
Implementation: lib/src/logic/reminders.dart + custom_reminders.dart, tests test/logic/reminders_test.dart + custom_reminders_test.dart.
