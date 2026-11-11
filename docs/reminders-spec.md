# Study reminders — v1 spec (locked 2026-11-11, ECTS-070)

Goal: nudge the student back to studying. Max 1 ping a day plus a
deadline countdown when close. Never nag. Phone and tablet identical
(local notifications, no server, no FCM).

## Message types (English v1; other locales later per M7 precedent)

1. **Daily plan** (19:00 default, user-settable later): total still needed
   today = Σ finite `requiredDailyHours` over started, incomplete courses.
   - Needs work: `📚 Tonight: {X} h to stay on track` /
     `{Course} needs {p} h/day · {Course2} {p2} h/day. Log a session to clear today.`
   - Covered: `✅ Today is covered — {X} h logged. {Course} is back On track.`
     (or silence — caller decides; pure logic returns `null` when nothing due)
2. **Behind** (folded into the daily ping, no extra push): only when
   `status == behind` (real shortfall past the tolerance band, not one
   missed evening). `⚠️ {Course} slipped to Behind` /
   `{left} h left, {d} days to go — {p} h/day from here. A 45-min session tonight stops the slide.`
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

- Never notify when everything is `Completed`/`Ahead`/no deadlines.
- Scheduled-future courses (`isScheduledCourse`) are excluded from
  "tonight's number".
- One daily summary names max 2 courses, rest folds into "+N more".
- Daily ping is silent (no sound); sound only on deadline-tomorrow/overdue.
- `remindersEnabled == false` → cancel all. `resetAllData` → cancel all.
- Overdue: max 2 pushes per course-deadline, then silent.
- Streak: at most 1 per week.
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
