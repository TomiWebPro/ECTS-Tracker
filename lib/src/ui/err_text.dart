import 'package:ects_tracker/l10n/app_localizations.dart';

import '../data/repositories.dart';

/// Maps deterministic repository/prefs validation errors to localized
/// strings (M12, ECTS-096). Repository contracts keep their exact English
/// messages (tests pin them); the UI renders the localized variant and
/// falls back to the raw message for `Failed ...: $e` paths whose suffix
/// is a raw exception (untranslatable by nature).
String localizeRepoMessage(String message, AppLocalizations l10n) {
  if (message.startsWith('Name must be 1 to')) {
    return l10n.errorCourseNameLength('$courseNameMaxLength');
  }
  switch (message) {
    case 'ECTS credits must be greater than zero.':
      return l10n.errorEctsPositive;
    case 'Deadline must be after start date.':
      return l10n.errorDeadlineOrder;
    case 'Course not found.':
      return l10n.errorCourseNotFound;
    case 'Duration must be greater than zero.':
      return l10n.errorDurationPositive;
    case 'Hours per ECTS must be greater than zero.':
      return l10n.errorHoursPositive;
    case 'Daily target must not be negative.':
      return l10n.errorDailyNegative;
    case 'Tolerance must be between 0 and 30 days.':
      return l10n.errorToleranceRange;
    case 'Select a course.':
      return l10n.sessionFormNoCourseError;
    case 'Invalid timer state.':
      return l10n.errorTimerInvalid;
    case 'No active timer.':
      return l10n.errorTimerNoActive;
    case 'Timer has not run yet.':
      return l10n.studyTimerTooShort;
  }
  if (message.startsWith('First weekday must be between')) {
    return l10n.errorFirstWeekday;
  }
  if (message.startsWith('Overload threshold must be between')) {
    return l10n.errorOverloadRange;
  }
  if (message.startsWith('Unknown language code')) {
    return l10n.errorUnknownLanguage;
  }
  if (message.startsWith('Reminder time must be')) {
    return l10n.errorReminderTime;
  }
  if (message.startsWith('Deadline warning window must be')) {
    return l10n.errorReminderWarn;
  }
  if (message.startsWith('A timer is already running')) {
    return l10n.errorTimerAlreadyRunning;
  }
  return message;
}
