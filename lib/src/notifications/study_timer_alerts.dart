import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../data/study_timer_prefs.dart';
import '../i18n/app_locales.dart';
import '../logic/study_timer.dart';

/// Phone notification surface for the study timer (M11, ECTS-093).
///
/// Android: an ongoing notification with Pause/Resume, Finish & log and
/// Discard actions. While running it uses the platform chronometer, so the
/// elapsed time counts live with zero notification updates; pause/resume
/// transitions re-show it once. Finish opens the app and completes in the
/// foreground (full validation + session write); pause/resume/discard also
/// work from the background with the app killed (prefs-only).
///
/// iOS: the same actions via notification categories (best-effort; no
/// Dynamic Island — that needs a native Live Activity, see
/// `docs/live-activity.md` for the macOS follow-up).

/// Notification id for the single active timer (reminders use 1..3xx).
const int studyTimerNotificationId = 9001;

/// Windows toast identity (stable GUID for the activation callback).
const WindowsInitializationSettings windowsNotificationSettings =
    WindowsInitializationSettings(
  appName: 'ECTS Tracker',
  appUserModelId: 'EctsTracker.ECTSTracker',
  guid: '7d9e2f4a-1b3c-4d5e-8f6a-9c0b2d4e6f8a',
);

/// Notification tap payload identifying the timer surface.
const String studyTimerPayload = 'timer';

/// Action ids (foreground handler routes `timer_*` to the timer notifier;
/// Finish opens the app and completes there).
const String studyTimerActionPause = 'timer_pause';
const String studyTimerActionResume = 'timer_resume';
const String studyTimerActionFinish = 'timer_finish';
const String studyTimerActionDiscard = 'timer_discard';

/// Transport for timer alerts. The real backend lives in
/// `reminder_service.dart`; tests use a recording fake. Defaults to a no-op
/// so the timer works headless without notification setup.
abstract class TimerAlertBackend {
  /// Foreground action taps (`timer_*`). Never emits for the no-op backend.
  Stream<String> get actionEvents;

  Future<bool> requestPermissions();

  Future<void> showTimer(TimerAlertVisuals visuals);

  Future<void> cancelTimer();
}

class NoopTimerAlertBackend implements TimerAlertBackend {
  const NoopTimerAlertBackend();

  @override
  Stream<String> get actionEvents => const Stream.empty();

  @override
  Future<bool> requestPermissions() async => false;

  @override
  Future<void> showTimer(TimerAlertVisuals visuals) async {}

  @override
  Future<void> cancelTimer() async {}
}

/// Everything the backends need to render one timer notification frame.
class TimerAlertVisuals {
  const TimerAlertVisuals({
    required this.title,
    required this.body,
    required this.running,
    this.chronometerBaseMs,
    required this.pauseLabel,
    required this.resumeLabel,
    required this.finishLabel,
    required this.discardLabel,
  });

  final String title;
  final String body;
  final bool running;

  /// Wall-clock base for the platform chronometer (running only).
  final int? chronometerBaseMs;

  final String pauseLabel;
  final String resumeLabel;
  final String finishLabel;
  final String discardLabel;
}

/// Pure content builder (unit-tested): title/body/chronometer per state.
TimerAlertContent buildTimerAlertContent({
  required String courseName,
  required StudyTimerState timer,
  required AppLocalizations l10n,
  required DateTime now,
}) {
  final title = l10n.studyTimerActiveTitle(courseName);
  if (timer.isRunning) {
    return TimerAlertContent(
      title: title,
      body: l10n.studyTimerNotifRunning,
      useChronometer: true,
      chronometerBaseMs: timer.runningSinceMs,
    );
  }
  return TimerAlertContent(
    title: title,
    body: l10n.studyTimerNotifPaused(formatTimerHms(timer.elapsedSec(now))),
    useChronometer: false,
    chronometerBaseMs: null,
  );
}

class TimerAlertContent {
  const TimerAlertContent({
    required this.title,
    required this.body,
    required this.useChronometer,
    this.chronometerBaseMs,
  });

  final String title;
  final String body;
  final bool useChronometer;
  final int? chronometerBaseMs;
}

/// Platform details for one timer frame, shared by the real backend and the
/// background handler (single home so both render identically).
NotificationDetails timerAlertDetails({
  required bool running,
  required int? chronometerBaseMs,
  required String pauseLabel,
  required String resumeLabel,
  required String finishLabel,
  required String discardLabel,
  String channelName = 'Study timer',
  String channelDesc = 'The running study timer with pause/finish actions.',
}) {
  AndroidNotificationAction pauseOrResume(String id, String label) =>
      AndroidNotificationAction(
        id,
        label,
        showsUserInterface: false,
        cancelNotification: false,
      );
  return NotificationDetails(
    android: AndroidNotificationDetails(
      'study_timer',
      channelName,
      channelDescription: channelDesc,
      importance: Importance.defaultImportance,
      priority: Priority.low,
      playSound: false,
      enableVibration: false,
      ongoing: true,
      autoCancel: false,
      onlyAlertOnce: true,
      showWhen: true,
      usesChronometer: running,
      when: running ? chronometerBaseMs : null,
      actions: [
        if (running)
          pauseOrResume(studyTimerActionPause, pauseLabel)
        else
          pauseOrResume(studyTimerActionResume, resumeLabel),
        AndroidNotificationAction(
          studyTimerActionFinish,
          finishLabel,
          // Opens the app: finish completes in the foreground with full
          // validation instead of a background DB write.
          showsUserInterface: true,
          cancelNotification: false,
        ),
        AndroidNotificationAction(
          studyTimerActionDiscard,
          discardLabel,
          showsUserInterface: false,
          cancelNotification: false,
        ),
      ],
    ),
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentSound: false,
      presentBadge: false,
      categoryIdentifier:
          running ? 'study_timer_running' : 'study_timer_paused',
    ),
  );
}

/// Headless locale for notification text: explicit choice, else system, else
/// English. The WidgetsBinding lookup throws in a background isolate, so it
/// is guarded (background falls back to explicit-or-English).
AppLocalizations timerAlertL10n(String? code) {
  final candidates = <Locale?>[appLocaleFromCode(code)];
  try {
    candidates.add(WidgetsBinding.instance.platformDispatcher.locale);
  } catch (_) {
    // Background isolate: no binding.
  }
  candidates.add(const Locale('en'));
  for (final locale in candidates) {
    if (locale == null) continue;
    try {
      return lookupAppLocalizations(locale);
    } catch (_) {
      // Try the next candidate; 'en' always resolves.
    }
  }
  return lookupAppLocalizations(const Locale('en'));
}

/// Background action handler (app killed or in background): prefs-only
/// pause/resume/discard. Finish is excluded on purpose — its action opens
/// the app and the foreground handler completes it there.
@pragma('vm:entry-point')
void handleTimerActionBackground(NotificationResponse response) {
  final action = response.actionId;
  if (action == null || !action.startsWith('timer_')) return;
  if (action == studyTimerActionFinish) return;
  _applyBackgroundTimerAction(action);
}

Future<void> _applyBackgroundTimerAction(String action) async {
  try {
    final prefs = StudyTimerPrefsRepository();
    final timer = await prefs.load();
    if (timer == null) return;
    final nowMs = DateTime.now().millisecondsSinceEpoch;
    switch (action) {
      case studyTimerActionPause:
        if (!timer.isRunning) return;
        final paused = timer.pausedAt(nowMs);
        await prefs.save(paused);
        await _reshowBackground(paused);
      case studyTimerActionResume:
        if (timer.isRunning) return;
        final resumed = timer.resumedAt(nowMs);
        await prefs.save(resumed);
        await _reshowBackground(resumed);
      case studyTimerActionDiscard:
        await prefs.clear();
        final plugin = FlutterLocalNotificationsPlugin();
        await plugin.initialize(
          settings: const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: DarwinInitializationSettings(),
            macOS: DarwinInitializationSettings(),
            linux: LinuxInitializationSettings(defaultActionName: 'Open'),
            windows: windowsNotificationSettings,
          ),
        );
        await plugin.cancel(id: studyTimerNotificationId);
      default:
        return;
    }
  } catch (_) {
    // Best-effort: never crash the background isolate.
  }
}

Future<void> _reshowBackground(StudyTimerState timer) async {
  // Foreground snapshots its locale next to the timer (ECTS-096) so the
  // background re-show keeps the user's language instead of English.
  String? code;
  try {
    code = await StudyTimerPrefsRepository().loadLocale();
  } catch (_) {
    code = null;
  }
  final l10n = timerAlertL10n(code);
  final name = timer.courseName ?? l10n.studyLogUnknownCourse(
    '${timer.courseId}',
  );
  final content = buildTimerAlertContent(
    courseName: name,
    timer: timer,
    l10n: l10n,
    now: DateTime.now(),
  );
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(
    settings: InitializationSettings(
      android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: const DarwinInitializationSettings(),
      macOS: const DarwinInitializationSettings(),
      linux:
          LinuxInitializationSettings(defaultActionName: l10n.notifActionOpen),
      windows: windowsNotificationSettings,
    ),
  );
  await plugin.show(
    id: studyTimerNotificationId,
    title: content.title,
    body: content.body,
    notificationDetails: timerAlertDetails(
      running: content.useChronometer,
      chronometerBaseMs: content.chronometerBaseMs,
      pauseLabel: l10n.studyTimerPause,
      resumeLabel: l10n.studyTimerResume,
      finishLabel: l10n.studyTimerFinishLog(
        '${studyTimerLogMinutes(timer.elapsedSec(DateTime.now()))}',
      ),
      discardLabel: l10n.studyTimerDiscard,
      channelName: l10n.notifChannelTimerName,
      channelDesc: l10n.notifChannelTimerDesc,
    ),
    payload: studyTimerPayload,
  );
}
