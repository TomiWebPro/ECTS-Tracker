import 'dart:convert';

import 'package:drift/drift.dart';

import '../dev/stress_seed.dart';
import '../i18n/app_locales.dart';
import '../models/models.dart';
import 'app_database.dart';
import 'result.dart';

export 'result.dart';

part 'repositories/course_repository.dart';
part 'repositories/session_repository.dart';
part 'repositories/settings_repository.dart';
part 'repositories/backup_repository.dart';
part 'repositories/dev_pump_repository.dart';

/// Maps a DB row to the plain model.
Course courseFromRow(CourseRow row) => Course(
      id: row.id,
      name: row.name,
      ectsCredits: row.ectsCredits,
      startDate: row.startDate,
      deadline: row.deadline,
      notes: row.notes,
      colorValue: row.colorValue,
      isSample: row.isSample,
      startEarly: row.startEarly,
    );

/// Maps a session row to the plain model.
StudySession sessionFromRow(SessionRow row) => StudySession(
      id: row.id,
      courseId: row.courseId,
      minutes: row.minutes,
      date: row.date,
      notes: row.notes,
      isSample: row.isSample,
    );

/// Matches the `Courses.name` column constraint (`text().withLength(1, 200)`),
/// checked at the boundary so an over-long name is a domain error rather than
/// a raw DB fault.
const int courseNameMaxLength = 200;

/// Domain validation shared by every course write path (AGENTS.md §3: the
/// boundary returns typed errors as values; the DB's own constraints are a
/// backstop, never the user-facing message).
///
/// Returns null when [name]/[ectsCredits]/[startDate]/[deadline] are
/// acceptable.
String? validateCourseInput({
  required String name,
  required double ectsCredits,
  DateTime? startDate,
  DateTime? deadline,
}) {
  final trimmed = name.trim();
  if (trimmed.isEmpty || trimmed.length > courseNameMaxLength) {
    return 'Name must be 1 to $courseNameMaxLength characters.';
  }
  if (ectsCredits <= 0) {
    return 'ECTS credits must be greater than zero.';
  }
  if (startDate != null && deadline != null) {
    if (!deadline.isAfter(startDate)) {
      return 'Deadline must be after start date.';
    }
  }
  return null;
}
