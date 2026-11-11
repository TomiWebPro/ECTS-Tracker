/// Custom/dynamic reminders (M9, ECTS-073).
///
/// Lets the student pin a nudge at any time: a one-off future fire, or a
/// recurring weekly/monthly time — for one course or for the automatic
/// topic (most behind). Pure Dart (models + ects + reminders only), so this
/// runs under `flutter test` on any OS. Persistence + OS scheduling arrive
/// with ECTS-071/072; the content here is always composed from *current*
/// numbers at fire time, never frozen at creation.
library;

import '../models/models.dart';
import 'ects.dart';
import 'reminders.dart';

/// Stable notification ID base for custom reminders (ECTS-072).
/// Fire ID = `customReminderIdBase + (scheduleId % 100000)`.
const int customReminderIdBase = 5000;

enum Recurrence { once, weekly, monthly }

/// A user-pinned nudge. [courseId] null means automatic topic.
class CustomSchedule {
  const CustomSchedule.once({
    required this.id,
    required this.fireAt,
    this.courseId,
    this.label,
  })  : recurrence = Recurrence.once,
        weekdays = null,
        timeMinutes = null,
        dayOfMonth = null;

  CustomSchedule.weekly({
    required this.id,
    required Set<int> weekdays,
    required int timeMinutes,
    this.courseId,
    this.label,
  })  : recurrence = Recurrence.weekly,
        weekdays = weekdays,
        fireAt = null,
        dayOfMonth = null,
        timeMinutes = timeMinutes {
    if (weekdays.isEmpty || weekdays.any((d) => d < 1 || d > 7)) {
      throw ArgumentError.value(
          weekdays, 'weekdays', 'must be 1..7 (Mon..Sun) and non-empty');
    }
    if (timeMinutes < 0 || timeMinutes > 1439) {
      throw ArgumentError.value(
          timeMinutes, 'timeMinutes', 'must be 0..1439');
    }
  }

  CustomSchedule.monthly({
    required this.id,
    required int dayOfMonth,
    required int timeMinutes,
    this.courseId,
    this.label,
  })  : recurrence = Recurrence.monthly,
        dayOfMonth = dayOfMonth,
        weekdays = null,
        fireAt = null,
        timeMinutes = timeMinutes {
    if (dayOfMonth < 1 || dayOfMonth > 31) {
      throw ArgumentError.value(
          dayOfMonth, 'dayOfMonth', 'must be 1..31');
    }
    if (timeMinutes < 0 || timeMinutes > 1439) {
      throw ArgumentError.value(
          timeMinutes, 'timeMinutes', 'must be 0..1439');
    }
  }

  final int id;
  final Recurrence recurrence;
  final int? courseId;
  final String? label;

  /// Exact fire instant for [Recurrence.once].
  final DateTime? fireAt;

  /// ISO weekdays (Mon=1..Sun=7) for [Recurrence.weekly].
  final Set<int>? weekdays;

  /// Day of month for [Recurrence.monthly]. Short months clamp to their
  /// last day (Feb → 28/29 for a 31st).
  final int? dayOfMonth;

  /// Minutes since midnight (local) for weekly/monthly fires.
  final int? timeMinutes;
}

int _daysInMonth(int year, int month) => DateTime(year, month + 1, 0).day;

/// Next fire instant after [now] (local time on both sides). Null when a
/// one-off already passed.
DateTime? nextFireAt(CustomSchedule schedule, DateTime now) {
  switch (schedule.recurrence) {
    case Recurrence.once:
      final fireAt = schedule.fireAt!;
      return fireAt.isAfter(now) ? fireAt : null;
    case Recurrence.weekly:
      final days = schedule.weekdays!;
      final minutes = schedule.timeMinutes!;
      for (var offset = 0; offset <= 7; offset++) {
        final day = DateTime(now.year, now.month, now.day)
            .add(Duration(days: offset));
        if (!days.contains(day.weekday)) continue;
        final candidate = DateTime(
            day.year, day.month, day.day, minutes ~/ 60, minutes % 60);
        if (candidate.isAfter(now)) return candidate;
      }
      return null; // Unreachable: offset 7 always hits the same weekday.
    case Recurrence.monthly:
      final wanted = schedule.dayOfMonth!;
      final minutes = schedule.timeMinutes!;
      DateTime candidateFor(int year, int month) {
        final day = wanted.clamp(1, _daysInMonth(year, month));
        return DateTime(year, month, day, minutes ~/ 60, minutes % 60);
      }
      final thisMonth = candidateFor(now.year, now.month);
      if (thisMonth.isAfter(now)) return thisMonth;
      final next = DateTime(now.year, now.month + 1, 1);
      return candidateFor(next.year, next.month);
  }
}

/// Automatic topic: most urgent incomplete, non-scheduled course —
/// behind first (soonest deadline), then soonest deadline, else null when
/// everything is completed/ahead without deadlines.
Course? automaticTopic({
  required List<Course> courses,
  required List<StudySession> sessions,
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
}) {
  final byCourse = <int, List<StudySession>>{};
  for (final s in sessions) {
    (byCourse[s.courseId] ??= <StudySession>[]).add(s);
  }
  Course? fallback;
  DateTime? fallbackDeadline;
  final behind = <Course>[];
  for (final course in courses) {
    if (isScheduledCourse(course, now)) continue;
    final progress = courseProgressFor(
      course,
      byCourse[course.id] ?? const <StudySession>[],
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    if (progress.status == CourseStatus.completed) continue;
    if (progress.status == CourseStatus.behind) {
      behind.add(course);
      continue;
    }
    final deadline = course.deadline;
    if (deadline != null &&
        (fallbackDeadline == null || deadline.isBefore(fallbackDeadline))) {
      fallback = course;
      fallbackDeadline = deadline;
    }
  }
  if (behind.isNotEmpty) {
    behind.sort((a, b) {
      int daysOf(Course c) => remainingDays(c.deadline, now) ?? 1 << 30;
      final cmp = daysOf(a).compareTo(daysOf(b));
      if (cmp != 0) return cmp;
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return behind.first;
  }
  return fallback;
}

/// Content for one custom fire, composed from *current* numbers. Null when
/// there is nothing to nudge about (target deleted/completed, or no topic
/// at all for automatic).
ReminderContent? composeCustomContent({
  required CustomSchedule schedule,
  required List<Course> courses,
  required List<StudySession> sessions,
  required double hoursPerEcts,
  required DateTime now,
  double toleranceDays = defaultPaceToleranceDays,
}) {
  final byCourse = <int, List<StudySession>>{};
  for (final s in sessions) {
    (byCourse[s.courseId] ??= <StudySession>[]).add(s);
  }
  final Course? target;
  if (schedule.courseId != null) {
    final matches =
        courses.where((c) => c.id == schedule.courseId).toList();
    if (matches.isEmpty) return null;
    target = matches.first;
  } else {
    target = automaticTopic(
      courses: courses,
      sessions: sessions,
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: toleranceDays,
    );
    if (target == null) return null;
  }
  final progress = courseProgressFor(
    target,
    byCourse[target.id] ?? const <StudySession>[],
    hoursPerEcts: hoursPerEcts,
    now: now,
    toleranceDays: toleranceDays,
  );
  if (progress.status == CourseStatus.completed) return null;
  final left = progress.remainingHours;
  final pace = progress.requiredDailyHours;
  final body = pace == null
      ? '${formatHours(left)} h still open — anything you log now counts.'
      : '${formatHours(left)} h open · ${formatHours(pace)} h/day to finish on time. Log a session to update progress.';
  final title = schedule.label ??
      (schedule.courseId == null
          ? '📚 Study check-in: ${target.name}'
          : '📚 Time to update: ${target.name}');
  return ReminderContent(
    kind: ReminderKind.custom,
    title: title,
    body: body,
    courseId: target.id,
  );
}
