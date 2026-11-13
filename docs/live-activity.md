# Live Activity / Dynamic Island follow-up (macOS required)

The in-app timer banner and the Android ongoing notification (ECTS-093) are
done and cross-platform. A true Dynamic Island / Lock Screen Live Activity on
iOS needs native work that cannot be built or verified from Windows/macOS-less
CI: an ActivityKit Widget extension plus a Dart bridge. This doc scopes that
follow-up so it can be picked up on a Mac with Xcode.

## Why native

- Live Activities are rendered by iOS from SwiftUI in a separate Widget
  extension target — Flutter widgets cannot draw there.
- The Dart side only starts/updates/ends the activity; all pixels, the
  Dynamic Island compact/expanded layouts, and Lock Screen UI live in Swift.
- Needs a physical device or Xcode simulator (Live Activities do not run on
  every simulator runtime; iPhone 14 Pro+ screenshots need the Island).

## Dart-side prep (already in place)

- `StudyTimerState` already carries everything an activity needs:
  `courseId`, `courseName` snapshot, `initialStartedAtMs`, `accumulatedSec`,
  `runningSinceMs` (single home: `lib/src/logic/study_timer.dart`).
- Transitions already fan out in one place:
  `StudyTimerNotifier.start/pause/resume/discard/finishAndLog`
  (`lib/src/state/study_timer_provider.dart` → `_syncAlert`). A Live Activity
  updater hooks in next to `_syncAlert` with the same best-effort discipline
  (never break timer ops for alert failures).

## Suggested implementation (on macOS)

1. Add a Flutter plugin for Live Activities (e.g. `live_activities`) to
   `pubspec.yaml`, or a tiny platform channel of our own (`startActivity`,
   `updateActivity`, `endActivity` with the timer fields above).
2. Xcode: Runner → New Target → Widget Extension ( dynasty: Live Activity,
   SwiftUI). Bundle id `<runner>.TimerActivity`, deployment iOS 16.1+.
3. `AppIntent`/ActivityKit model: `TimerAttributes(courseName)` +
   `ContentState(elapsedBaseMs, running)`; compact leading/trailing show the
   course + live time, expanded shows Pause/Finish deep-link buttons
   (`timer://pause`, `timer://finish` handled in `AppDelegate` → routed to
   the same notifier methods as the notification actions).
4. Enable the App Group capability on Runner + extension if the island must
   read state while the app is suspended; otherwise push updates on every
   transition (start/pause/resume) plus a minute-tick while foregrounded.
5. End the activity in `finishAndLog`/`discard` (same place `_syncAlert`
   cancels the Android notification).
6. Localize the SwiftUI strings via the extension's own `Localizable.strings`
   (the Dart ARB pipeline does not reach Widget extensions).

## Test plan (on macOS)

- `flutter run` on a 16.1+ device, start a timer → island appears.
- Pause from the island → app state flips within a second (banner + widget).
- Kill the app mid-run → island keeps its last state; reopening resyncs
  from the persisted blob (same restore path as Android).
- Finish from the island → session logged (ceil minutes), island ends.
