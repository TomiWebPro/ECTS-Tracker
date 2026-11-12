import '../models/models.dart';
import 'date_utils.dart';

/// Pure helpers for study-log totals (ECTS-007). Derived, never stored.
class SessionTotals {
  const SessionTotals({required this.dailyMinutes, required this.weeklyMinutes});

  final int dailyMinutes;
  final int weeklyMinutes;

  double get dailyHours => dailyMinutes / 60.0;
  double get weeklyHours => weeklyMinutes / 60.0;
}

/// Groups sessions by `courseId` (single home — one copy instead of one per
/// caller). A course with no sessions simply has no entry; use `?? []`.
Map<int, List<StudySession>> groupSessionsByCourse(
    Iterable<StudySession> sessions) {
  final byCourse = <int, List<StudySession>>{};
  for (final s in sessions) {
    (byCourse[s.courseId] ??= <StudySession>[]).add(s);
  }
  return byCourse;
}

/// Start of the week containing [date], using [firstWeekday] (DateTime.monday
/// by default; ISO week). [firstWeekday] must be 1..7 (DateTime weekday values).
DateTime startOfWeek(DateTime date, {int firstWeekday = DateTime.monday}) {
  final d = dateOnly(date);
  final delta = (d.weekday - firstWeekday + 7) % 7;
  return d.subtract(Duration(days: delta));
}

/// Computes daily (same calendar day as [now]) and weekly totals from
/// [sessions]. Week starts at [firstWeekday] (default Monday).
SessionTotals sessionTotals(
  List<StudySession> sessions, {
  required DateTime now,
  int firstWeekday = DateTime.monday,
}) {
  final today = dateOnly(now);
  final weekStart = startOfWeek(now, firstWeekday: firstWeekday);
  final weekEndExclusive = weekStart.add(const Duration(days: 7));
  var daily = 0;
  var weekly = 0;
  for (final s in sessions) {
    final day = dateOnly(s.date);
    if (day == today) daily += s.minutes;
    if (!day.isBefore(weekStart) && day.isBefore(weekEndExclusive)) {
      weekly += s.minutes;
    }
  }
  return SessionTotals(dailyMinutes: daily, weeklyMinutes: weekly);
}

/// Sessions sorted by date descending, then id descending (stable history view).
List<StudySession> sessionsByDateDesc(List<StudySession> sessions) {
  final list = List<StudySession>.of(sessions);
  list.sort((a, b) {
    final d = b.date.compareTo(a.date);
    if (d != 0) return d;
    return b.id.compareTo(a.id);
  });
  return list;
}
