/// Sort and filter helpers for the course list (ECTS-005).
///
/// Pure functions: take courses + derived progress and return an ordered/filtered
/// view. Derived values (progress, status) are computed by the ECTS math layer,
/// never stored (AGENTS.md §3/§4).
library;

import '../models/models.dart';
import 'ects.dart';
import 'session_totals.dart';

/// How the course list is ordered.
enum CourseSort {
  name,
  deadline,
  progress,
  status,
}

String courseSortLabel(CourseSort sort) => switch (sort) {
      CourseSort.name => 'Name',
      CourseSort.deadline => 'Deadline',
      CourseSort.progress => 'Progress',
      CourseSort.status => 'Status',
    };

/// Status priority for "needs attention" ordering (most urgent first).
/// Total over [CourseStatus]: every status maps explicitly, so lookups
/// never need `!`.
int statusPriority(CourseStatus status) => switch (status) {
      CourseStatus.overdue => 0,
      CourseStatus.behind => 1,
      CourseStatus.onTrack => 2,
      CourseStatus.ahead => 3,
      CourseStatus.completed => 4,
    };

String courseStatusLabel(CourseStatus status) => switch (status) {
      CourseStatus.completed => 'Completed',
      CourseStatus.overdue => 'Overdue',
      CourseStatus.ahead => 'Ahead',
      CourseStatus.onTrack => 'On track',
      CourseStatus.behind => 'Behind',
    };

/// A course paired with its derived progress summary.
class CourseWithProgress {
  const CourseWithProgress(this.course, this.progress);

  final Course course;
  final CourseProgress progress;
}

/// Computes derived progress for every course from the full session list.
///
/// Sessions are grouped by `courseId`; a course with no sessions gets an empty
/// iterable. [now] is the reference instant (injectable for tests).
/// [toleranceDays] is the ahead/behind band from Settings (default 5).
List<CourseWithProgress> coursesWithProgress(
  List<Course> courses,
  List<StudySession> sessions, {
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
}) {
  final byCourse = groupSessionsByCourse(sessions);
  return [
    for (final c in courses)
      CourseWithProgress(
        c,
        courseProgressFor(
          c,
          byCourse[c.id] ?? const <StudySession>[],
          hoursPerEcts: hoursPerEcts,
          now: now,
          toleranceDays: toleranceDays,
        ),
      ),
  ];
}

/// View priority for the dashboard Courses section: most urgent first
/// (overdue, behind, onTrack, ahead, completed), then soonest deadline,
/// then name as a stable tie-breaker.
List<CourseWithProgress> sortByViewPriority(List<CourseWithProgress> items) {
  final sorted = List<CourseWithProgress>.of(items);
  sorted.sort((a, b) {
    final cmp = statusPriority(a.progress.status)
        .compareTo(statusPriority(b.progress.status));
    if (cmp != 0) return cmp;
    final dc = _compareDeadline(a, b);
    if (dc != 0) return dc;
    return a.course.name
        .toLowerCase()
        .compareTo(b.course.name.toLowerCase());
  });
  return sorted;
}

/// Items for the dashboard Courses section: started and not completed,
/// sorted by view priority. Completed courses live in the Courses tab (not
/// essential to the dashboard's "what needs work today" job); future-start
/// courses live in Upcoming.
List<CourseWithProgress> dashboardItems(
    List<CourseWithProgress> items, DateTime now) {
  return sortByViewPriority(items
      .where((e) =>
          !isScheduledCourse(e.course, now) &&
          e.progress.status != CourseStatus.completed)
      .toList());
}

/// Filters by [statusFilter] (null = all) and sorts by [sort].
///
/// - name: A→Z, case-insensitive.
/// - deadline: soonest first; courses with no deadline last.
/// - progress: highest fraction complete first.
/// - status: needs-attention first (overdue, behind, onTrack, ahead, completed),
///   then name as a stable tie-breaker.
List<CourseWithProgress> sortAndFilterCourses(
  List<CourseWithProgress> items, {
  CourseSort sort = CourseSort.name,
  CourseStatus? statusFilter,
}) {
  final filtered = statusFilter == null
      ? List<CourseWithProgress>.of(items)
      : items.where((e) => e.progress.status == statusFilter).toList();

  int byName(CourseWithProgress a, CourseWithProgress b) =>
      a.course.name.toLowerCase().compareTo(b.course.name.toLowerCase());

  filtered.sort((a, b) {
    final cmp = switch (sort) {
      CourseSort.name => byName(a, b),
      CourseSort.deadline => _compareDeadline(a, b),
      CourseSort.progress =>
        b.progress.progressFraction.compareTo(a.progress.progressFraction),
      CourseSort.status => statusPriority(a.progress.status)
          .compareTo(statusPriority(b.progress.status)),
    };
    if (cmp != 0) return cmp;
    return byName(a, b);
  });
  return filtered;
}

int _compareDeadline(CourseWithProgress a, CourseWithProgress b) {
  final da = a.course.deadline;
  final db = b.course.deadline;
  if (da == null && db == null) return 0;
  if (da == null) return 1; // no deadline last
  if (db == null) return -1;
  return da.compareTo(db);
}
