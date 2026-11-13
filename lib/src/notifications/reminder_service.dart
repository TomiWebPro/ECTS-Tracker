import 'dart:async';

import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../logic/custom_reminders.dart';
import '../logic/reminders.dart';
import '../models/models.dart';
import 'reminder_prefs.dart';
import 'reminder_text.dart';
import 'study_timer_alerts.dart';

/// Transport abstraction so the scheduler is unit-testable with a fake
/// (M9, ECTS-072). Times are local wall-clock on both sides.
abstract class NotificationBackend {
  Future<bool> requestPermissions();
  Future<void> showNow({
    required int id,
    required String title,
    required String body,
    String? payload,
  });
  Future<void> scheduleDaily({
    required int id,
    required String title,
    required String body,
    required int timeMinutes,
    String? payload,
  });
  Future<void> scheduleOnce({
    required int id,
    required String title,
    required String body,
    required DateTime fireAt,
    String? payload,
  });
  Future<void> cancel(int id);
  Future<void> cancelAll();
}

/// Real transport over `flutter_local_notifications` + `timezone`.
/// Create via [RealNotificationBackend.create] (tz init is async).
/// Also serves timer alerts ([TimerAlertBackend]): the single timer action
/// stream feeds the study-timer notifier through `timerActionEventsProvider`.
class RealNotificationBackend
    implements NotificationBackend, TimerAlertBackend {
  RealNotificationBackend._(this._plugin);

  final FlutterLocalNotificationsPlugin _plugin;

  /// Foreground timer-action taps (`timer_*`). The plugin delivers response
  /// callbacks here; the app routes them to the timer notifier.
  final _timerActions = StreamController<String>.broadcast();

  @override
  Stream<String> get actionEvents => _timerActions.stream;

  static const AndroidNotificationChannel _dailyChannel =
      AndroidNotificationChannel(
    'daily_nudge',
    'Daily study nudge',
    description: 'The evening study plan summary.',
    importance: Importance.defaultImportance,
  );
  static const AndroidNotificationChannel _courseChannel =
      AndroidNotificationChannel(
    'course_alert',
    'Course alerts',
    description: 'Deadline countdowns and overdue escalations.',
    importance: Importance.high,
  );

  /// Ongoing timer channel (silent, shade-only; the in-app banner covers
  /// the foreground case). First show peeks via default importance.
  static const AndroidNotificationChannel _timerChannel =
      AndroidNotificationChannel(
    'study_timer',
    'Study timer',
    description: 'The running study timer with pause/finish actions.',
    importance: Importance.defaultImportance,
  );

  /// iOS timer categories, rebuilt per show so action labels follow the app
  /// language (categories are fixed at registration time).
  static List<DarwinNotificationCategory> _timerCategories(
    TimerAlertVisuals v,
  ) => [
        DarwinNotificationCategory(
          'study_timer_running',
          actions: [
            DarwinNotificationAction.plain(
                studyTimerActionPause, v.pauseLabel),
            DarwinNotificationAction.plain(
              studyTimerActionFinish,
              v.finishLabel,
              options: {DarwinNotificationActionOption.foreground},
            ),
            DarwinNotificationAction.plain(
              studyTimerActionDiscard,
              v.discardLabel,
              options: {DarwinNotificationActionOption.destructive},
            ),
          ],
        ),
        DarwinNotificationCategory(
          'study_timer_paused',
          actions: [
            DarwinNotificationAction.plain(
                studyTimerActionResume, v.resumeLabel),
            DarwinNotificationAction.plain(
              studyTimerActionFinish,
              v.finishLabel,
              options: {DarwinNotificationActionOption.foreground},
            ),
            DarwinNotificationAction.plain(
              studyTimerActionDiscard,
              v.discardLabel,
              options: {DarwinNotificationActionOption.destructive},
            ),
          ],
        ),
      ];

  static NotificationDetails _details(AndroidNotificationChannel channel,
          {bool silent = false}) =>
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: channel.importance,
          playSound: !silent,
          enableVibration: !silent,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: !silent,
        ),
      );

  static Future<RealNotificationBackend> create() async {
    tzdata.initializeTimeZones();
    try {
      final zone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(zone.identifier));
    } catch (_) {
      // Timezone lookup is best-effort; UTC keeps scheduling working.
      tz.setLocalLocation(tz.UTC);
    }
    final plugin = FlutterLocalNotificationsPlugin();
    final backend = RealNotificationBackend._(plugin);
    await backend._initializeTimerCategories(null);
    final android =
        plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await android?.createNotificationChannel(_dailyChannel);
    await android?.createNotificationChannel(_courseChannel);
    await android?.createNotificationChannel(_timerChannel);
    return backend;
  }

  /// (Re-)initializes the plugin: response routing plus localized iOS timer
  /// categories (`visuals` null keeps the last/default English labels).
  Future<void> _initializeTimerCategories(TimerAlertVisuals? visuals) {
    final categories = visuals == null
        ? _timerCategories(const TimerAlertVisuals(
            title: '',
            body: '',
            running: true,
            pauseLabel: 'Pause',
            resumeLabel: 'Resume',
            finishLabel: 'Finish',
            discardLabel: 'Discard',
          ))
        : _timerCategories(visuals);
    return _plugin.initialize(
      settings: InitializationSettings(
        android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          notificationCategories: categories,
        ),
      ),
      onDidReceiveNotificationResponse: (response) {
        final action = response.actionId;
        if (action != null && action.startsWith('timer_')) {
          _timerActions.add(action);
        }
      },
      onDidReceiveBackgroundNotificationResponse:
          handleTimerActionBackground,
    );
  }

  @override
  Future<bool> requestPermissions() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final androidGranted =
        await android?.requestNotificationsPermission() ?? true;
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    final iosGranted = await ios?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        ) ??
        true;
    return androidGranted && iosGranted;
  }

  @override
  Future<void> showNow({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) =>
      _plugin.show(
        id: id,
        title: title,
        body: body,
        notificationDetails: _details(_courseChannel),
        payload: payload,
      );

  @override
  Future<void> scheduleDaily({
    required int id,
    required String title,
    required String body,
    required int timeMinutes,
    String? payload,
  }) {
    final today = tz.TZDateTime.now(tz.local);
    final fire = tz.TZDateTime(
      tz.local,
      today.year,
      today.month,
      today.day,
      timeMinutes ~/ 60,
      timeMinutes % 60,
    );
    final at = fire.isAfter(tz.TZDateTime.now(tz.local))
        ? fire
        : fire.add(const Duration(days: 1));
    return _plugin.zonedSchedule(
      id: id,
      scheduledDate: at,
      notificationDetails: _details(_dailyChannel, silent: true),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      title: title,
      body: body,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );
  }

  @override
  Future<void> scheduleOnce({
    required int id,
    required String title,
    required String body,
    required DateTime fireAt,
    String? payload,
  }) =>
      _plugin.zonedSchedule(
        id: id,
        scheduledDate: tz.TZDateTime.from(fireAt, tz.local),
        notificationDetails: _details(_courseChannel),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        title: title,
        body: body,
        payload: payload,
      );

  @override
  Future<void> cancel(int id) => _plugin.cancel(id: id);

  @override
  Future<void> cancelAll() => _plugin.cancelAll();

  @override
  Future<void> showTimer(TimerAlertVisuals visuals) async {
    // Refresh categories so iOS action labels match the app language.
    await _initializeTimerCategories(visuals);
    await _plugin.show(
      id: studyTimerNotificationId,
      title: visuals.title,
      body: visuals.body,
      notificationDetails: timerAlertDetails(
        running: visuals.running,
        chronometerBaseMs: visuals.chronometerBaseMs,
        pauseLabel: visuals.pauseLabel,
        resumeLabel: visuals.resumeLabel,
        finishLabel: visuals.finishLabel,
        discardLabel: visuals.discardLabel,
      ),
      payload: studyTimerPayload,
    );
  }

  @override
  Future<void> cancelTimer() =>
      _plugin.cancel(id: studyTimerNotificationId);
}

/// Recomputes the full notification set from live data and pushes it to
/// the [NotificationBackend] (ECTS-072).
///
/// Call on app start, on every course/session/reminder-preference change,
/// and when the preview page's custom demos change. Content is composed
/// fresh at each call; anything scheduled stays valid until the next call
/// replaces it (documented v1 limit in `docs/reminders-spec.md`).
class ReminderService {
  ReminderService(this._backend, this._prefs);

  final NotificationBackend _backend;
  final ReminderPrefsRepository _prefs;

  Future<void> reschedule({
    required List<Course> courses,
    required List<StudySession> sessions,
    required double hoursPerEcts,
    required double toleranceDays,
    required DateTime now,
    required AppLocalizations l10n,
  }) async {
    final settings = await _prefs.load();
    if (!settings.enabled) {
      await _backend.cancelAll();
      return;
    }

    final daily = computeDailyPlan(
      courses: courses,
      sessions: sessions,
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    if (daily != null) {
      final text = localizeReminder(l10n, daily);
      await _backend.scheduleDaily(
        id: dailyReminderId,
        title: text.title,
        body: text.body,
        timeMinutes: settings.timeMinutes,
      );
    } else {
      await _backend.cancel(dailyReminderId);
    }

    // Countdowns: only same-day fires (today's reminder time still ahead).
    // Future days are covered by the daily repeating ping until the next
    // reschedule recomputes them with fresh numbers.
    final todayFire = _todayAt(now, settings.timeMinutes);
    if (todayFire != null && settings.warnDays > 0) {
      for (final countdown in computeDeadlineCountdowns(
        courses: courses,
        sessions: sessions,
        hoursPerEcts: hoursPerEcts,
        now: now,
        toleranceDays: toleranceDays,
        warnDays: settings.warnDays,
      )) {
        final text = localizeReminder(l10n, countdown);
        await _backend.scheduleOnce(
          id: deadlineReminderIdBase + (countdown.courseId! % 100000),
          title: text.title,
          body: text.body,
          fireAt: todayFire,
        );
      }
    }

    // Overdue: immediate escalation, max 2 ever per course-deadline.
    for (final overdue in computeOverdue(
      courses: courses,
      sessions: sessions,
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    )) {
      final course =
          courses.firstWhere((c) => c.id == overdue.courseId);
      final key = '${course.id}_${course.deadline!.millisecondsSinceEpoch}';
      if (await _prefs.overdueCount(key) >= 2) continue;
      final text = localizeReminder(l10n, overdue);
      await _backend.showNow(
        id: overdueReminderIdBase + (overdue.courseId! % 100000),
        title: text.title,
        body: text.body,
      );
      await _prefs.recordOverdueFire(key);
    }

    for (final schedule in await _prefs.loadCustom()) {
      final fire = nextFireAt(schedule, now);
      if (fire == null) continue;
      final content = composeCustomContent(
        schedule: schedule,
        courses: courses,
        sessions: sessions,
        hoursPerEcts: hoursPerEcts,
        now: now,
        toleranceDays: toleranceDays,
      );
      if (content == null) continue;
      final text = localizeReminder(l10n, content);
      await _backend.scheduleOnce(
        id: customReminderIdBase + (schedule.id % 100000),
        title: text.title,
        body: text.body,
        fireAt: fire,
      );
    }
  }
}

/// Today at [timeMinutes] when still ahead, else null.
DateTime? _todayAt(DateTime now, int timeMinutes) {
  final candidate = DateTime(
      now.year, now.month, now.day, timeMinutes ~/ 60, timeMinutes % 60);
  return candidate.isAfter(now) ? candidate : null;
}
