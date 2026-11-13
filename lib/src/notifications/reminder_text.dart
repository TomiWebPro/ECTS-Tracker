/// Localized rendering of reminder copy (M9, ECTS-087).
///
/// The pure builders in `reminders.dart`/`custom_reminders.dart` stay
/// English v1 (pinned by logic tests) and carry a [ReminderContent.messageId]
/// plus raw [ReminderContent.args]; this layer renders the same content
/// through `AppLocalizations` for the preview feed and the OS scheduler.
/// Non-EN locales without translations yet fall back to English (M7 policy).
library;

import 'package:ects_tracker/l10n/app_localizations.dart';

import '../logic/locale_format.dart';
import '../logic/pace_format.dart';
import '../logic/reminders.dart';

/// Localized duration for notification copy, mirroring [formatDuration]'s
/// sub-hour rule (ECTS-078 threshold): whole minutes below 1 h, else the
/// trimmed one-decimal hour figure — with the locale's own units *and*
/// decimal separator.
String notifDuration(AppLocalizations l10n, double hours) {
  if (isSubHourPace(hours)) return l10n.notifDurationMinutes('${paceMinutes(hours)}');
  return l10n.notifDurationHours(
      formatHoursLocalized(hours, locale: l10n.localeName));
}

double _hours(Object? value) => (value as num).toDouble();
int _count(Object? value) => (value as num).toInt();
String _text(Object? value) => value as String;

/// Returns [content] with title/body rendered in the locale of [l10n].
/// Unknown message IDs (and user-typed custom labels as titles) pass the
/// English title through and only localize what has a template.
ReminderContent localizeReminder(AppLocalizations l10n, ReminderContent content) {
  final args = content.args;
  switch (content.messageId) {
    case 'daily':
      final names = (args['names'] as List).map(_text).toList();
      final durations = (args['durations'] as List).map(_hours).toList();
      final parts = [
        for (var i = 0; i < names.length; i++)
          l10n.notifDailyCourseNeed(names[i], notifDuration(l10n, durations[i])),
      ];
      final rest = _count(args['rest']);
      final detail = rest > 0
          ? '${parts.join(' · ')} ${l10n.notifDailyMore('$rest')}'
          : parts.join(' · ');
      return ReminderContent(
        kind: content.kind,
        title: l10n.notifDailyTitle(notifDuration(l10n, _hours(args['total']))),
        body: l10n.notifDailyBody(detail),
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'behindPace':
      return ReminderContent(
        kind: content.kind,
        title: l10n.notifBehindTitle(_text(args['course'])),
        body: l10n.notifBehindBodyPace(
          notifDuration(l10n, _hours(args['left'])),
          '${_count(args['days'])}',
          notifDuration(l10n, _hours(args['pace'])),
          notifDuration(l10n, _hours(args['catchUp'])),
        ),
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'behindFull':
      return ReminderContent(
        kind: content.kind,
        title: l10n.notifBehindTitle(_text(args['course'])),
        body: l10n.notifBehindBodyFull(
          notifDuration(l10n, _hours(args['left'])),
          '${_count(args['days'])}',
          notifDuration(l10n, _hours(args['pace'])),
        ),
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'behindDeadlineDay':
      return ReminderContent(
        kind: content.kind,
        title: l10n.notifBehindTitle(_text(args['course'])),
        body: l10n.notifBehindBodyDeadlineDay(
            notifDuration(l10n, _hours(args['left']))),
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'deadlineTomorrow':
      return ReminderContent(
        kind: content.kind,
        title: l10n.notifDeadlineTomorrowTitle(
          _text(args['course']),
          notifDuration(l10n, _hours(args['left'])),
        ),
        body: l10n.notifDeadlineTomorrowBody,
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'deadlineSoon':
      return ReminderContent(
        kind: content.kind,
        title: l10n.notifDeadlineSoonTitle(
          _text(args['course']),
          '${_count(args['days'])}',
          notifDuration(l10n, _hours(args['left'])),
        ),
        body: l10n.notifDeadlineSoonBody(
            notifDuration(l10n, _hours(args['pace']))),
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'deadlineSoonNoPace':
      return ReminderContent(
        kind: content.kind,
        title: l10n.notifDeadlineSoonTitle(
          _text(args['course']),
          '${_count(args['days'])}',
          notifDuration(l10n, _hours(args['left'])),
        ),
        body: l10n.notifDeadlineSoonBodyNoPace,
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'overdue':
      return ReminderContent(
        kind: content.kind,
        title: l10n.notifOverdueTitle(
          _text(args['course']),
          notifDuration(l10n, _hours(args['left'])),
        ),
        body: l10n.notifOverdueBody,
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'streak':
      return ReminderContent(
        kind: content.kind,
        title: l10n.notifStreakTitle(
          '${_count(args['days'])}',
          notifDuration(l10n, _hours(args['week'])),
        ),
        body: l10n.notifStreakBody,
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'customPace':
    case 'customLabelPace':
      return ReminderContent(
        kind: content.kind,
        // User-typed labels are user content: kept verbatim, never translated.
        title: content.messageId == 'customLabelPace'
            ? content.title
            : ((args['automatic'] as bool)
                ? l10n.notifCustomTitleAuto(_text(args['course']))
                : l10n.notifCustomTitleCourse(_text(args['course']))),
        body: l10n.notifCustomBodyPace(
          notifDuration(l10n, _hours(args['left'])),
          notifDuration(l10n, _hours(args['pace'])),
        ),
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    case 'customNoPace':
    case 'customLabelNoPace':
      return ReminderContent(
        kind: content.kind,
        title: content.messageId == 'customLabelNoPace'
            ? content.title
            : ((args['automatic'] as bool)
                ? l10n.notifCustomTitleAuto(_text(args['course']))
                : l10n.notifCustomTitleCourse(_text(args['course']))),
        body: l10n.notifCustomBodyNoPace(
            notifDuration(l10n, _hours(args['left']))),
        courseId: content.courseId,
        messageId: content.messageId,
        args: args,
      );
    default:
      return content;
  }
}
