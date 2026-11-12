import 'package:ects_tracker/l10n/app_localizations.dart';

import '../logic/course_list.dart';
import '../logic/ects.dart';

/// Localized variant of [courseSortLabel].
///
/// Takes [AppLocalizations] (keys `sort*`) instead of returning hardcoded
/// English. Lives in UI (not `logic/`) so the pure course-list math never
/// depends on Flutter localizations. The original [courseSortLabel] is
/// intentionally kept unchanged as the English fallback for tests/compat
/// (see course_list_test.dart).
String courseSortLabelL10n(CourseSort sort, AppLocalizations l10n) =>
    switch (sort) {
      CourseSort.name => l10n.sortName,
      CourseSort.deadline => l10n.sortDeadline,
      CourseSort.progress => l10n.sortProgress,
      CourseSort.status => l10n.sortStatus,
    };

/// Localized variant of [courseStatusLabel].
///
/// Takes [AppLocalizations] (keys `status*`) instead of returning hardcoded
/// English. The original [courseStatusLabel] is intentionally kept unchanged
/// as the English fallback for tests/compat (see course_list_test.dart).
String courseStatusLabelL10n(CourseStatus status, AppLocalizations l10n) =>
    switch (status) {
      CourseStatus.completed => l10n.statusCompleted,
      CourseStatus.overdue => l10n.statusOverdue,
      CourseStatus.ahead => l10n.statusAhead,
      CourseStatus.onTrack => l10n.statusOnTrack,
      CourseStatus.behind => l10n.statusBehind,
    };
