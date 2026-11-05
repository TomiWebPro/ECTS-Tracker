import 'package:drift/drift.dart';

import '../models/models.dart';
import 'app_database.dart';

/// Result wrapper: repositories return errors as values, never throw across
/// layers (AGENTS.md §3).
sealed class Result<T> {
  const Result();
}

class Ok<T> extends Result<T> {
  const Ok(this.value);
  final T value;
}

class Err<T> extends Result<T> {
  const Err(this.message);
  final String message;
}

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

class CourseRepository {
  CourseRepository(this._db);
  final AppDatabase _db;

  Stream<List<Course>> watchAll() =>
      _db.select(_db.courses).watch().map((rows) => rows.map(courseFromRow).toList());

  /// Watches only seeded sample courses (AGENTS.md §4 / ECTS-027,029).
  Stream<List<Course>> watchSample() => (_db.select(_db.courses)
        ..where((t) => t.isSample.equals(true)))
      .watch()
      .map((rows) => rows.map(courseFromRow).toList());

  /// Sample course count, reactive (ECTS-029).
  Stream<int> watchSampleCount() =>
      watchSample().map((rows) => rows.length);

  /// One-shot sample course count (ECTS-029). Returns 0 on DB fault.
  Future<int> countSample() async {
    try {
      final rows = await (_db.select(_db.courses)
            ..where((t) => t.isSample.equals(true)))
          .get();
      return rows.length;
    } catch (_) {
      return 0;
    }
  }

  /// True when any sample-marked course or session exists (ECTS-029). Checks
  /// both tables so the "clear sample data" action can decide whether to offer
  /// itself; reflects [deleteSampleData]'s outcome (a kept sample course that
  /// still owns user sessions remains sample-marked). Returns false on DB fault.
  Future<bool> hasSampleData() async {
    try {
      final c = await (_db.select(_db.courses)
            ..where((t) => t.isSample.equals(true))
            ..limit(1))
          .getSingleOrNull();
      if (c != null) return true;
      final s = await (_db.select(_db.studySessions)
            ..where((t) => t.isSample.equals(true))
            ..limit(1))
          .getSingleOrNull();
      return s != null;
    } catch (_) {
      return false;
    }
  }

  Future<Result<int>> addCourse({
    required String name,
    required double ectsCredits,
    DateTime? startDate,
    DateTime? deadline,
    String? notes,
    int? colorValue,
    bool isSample = false,
  }) async {
    final invalid = validateCourseInput(
      name: name,
      ectsCredits: ectsCredits,
      startDate: startDate,
      deadline: deadline,
    );
    if (invalid != null) return Err(invalid);
    try {
      final id = await _db.into(_db.courses).insert(
            CoursesCompanion.insert(
              name: name.trim(),
              ectsCredits: ectsCredits,
              startDate: Value(startDate),
              deadline: Value(deadline),
              notes: Value(notes),
              colorValue: Value(colorValue),
              isSample: Value(isSample),
            ),
          );
      return Ok(id);
    } catch (e) {
      return Err('Failed to add course: $e');
    }
  }

  /// Updates an existing course's editable fields. Returns [Err] when the input
  /// is invalid (same boundary rules as [addCourse]) or when no course with [id]
  /// exists, so callers can distinguish "not found" from a DB fault.
  Future<Result<void>> updateCourse({
    required int id,
    required String name,
    required double ectsCredits,
    DateTime? startDate,
    DateTime? deadline,
    String? notes,
    int? colorValue,
  }) async {
    final invalid = validateCourseInput(
      name: name,
      ectsCredits: ectsCredits,
      startDate: startDate,
      deadline: deadline,
    );
    if (invalid != null) return Err(invalid);
    if (id <= 0) return const Err('Course not found.');
    try {
      final affected = await (_db.update(_db.courses)
            ..where((t) => t.id.equals(id)))
          .write(
        CoursesCompanion(
          name: Value(name.trim()),
          ectsCredits: Value(ectsCredits),
          startDate: Value(startDate),
          deadline: Value(deadline),
          notes: Value(notes),
          colorValue: Value(colorValue),
        ),
      );
      if (affected == 0) return const Err('Course not found.');
      return const Ok(null);
    } catch (e) {
      return Err('Failed to update course: $e');
    }
  }

  Future<Result<void>> deleteCourse(int id) async {
    try {
      await (_db.delete(_db.courses)..where((t) => t.id.equals(id))).go();
      return const Ok(null);
    } catch (e) {
      return Err('Failed to delete course: $e');
    }
  }

  /// Removes all seeded sample data in a single transaction (AGENTS.md §4,
  /// ECTS-016/027): deletes sample sessions, then deletes sample courses that no
  /// longer have any sessions. User-logged rows (isSample false) are never
  /// touched; a sample course that still owns user sessions is kept so no user
  /// row is orphaned or cascade-deleted.
  Future<Result<void>> deleteSampleData() async {
    try {
      await _db.transaction(() async {
        await (_db.delete(_db.studySessions)
              ..where((t) => t.isSample.equals(true)))
            .go();
        // Delete sample courses with no remaining sessions (user sessions, if
        // any, keep their course alive).
        final occupied = _db.selectOnly(_db.studySessions)
          ..addColumns([_db.studySessions.courseId]);
        await (_db.delete(_db.courses)
              ..where((t) =>
                  t.isSample.equals(true) & t.id.isNotInQuery(occupied)))
            .go();
      });
      return const Ok(null);
    } catch (e) {
      return Err('Failed to clear sample data: $e');
    }
  }
}

class SessionRepository {
  SessionRepository(this._db);
  final AppDatabase _db;

  /// Verifies the target course of a session exists (and that [courseId] is a
  /// plausible id). Checked at the boundary so a bad id is a typed domain error
  /// the caller can distinguish from a DB fault, instead of the generic
  /// `Failed to add session: $e` raised by a foreign-key violation.
  ///
  /// Returns null when the course exists.
  Future<String?> validateCourseReference(int courseId) async {
    if (courseId <= 0) return 'Course not found.';
    try {
      final row = await (_db.select(_db.courses)
            ..where((t) => t.id.equals(courseId))
            ..limit(1))
          .getSingleOrNull();
      return row == null ? 'Course not found.' : null;
    } catch (e) {
      return 'Failed to look up course: $e';
    }
  }

  Stream<List<StudySession>> watchAll() => _db
      .select(_db.studySessions)
      .watch()
      .map((rows) => rows.map(sessionFromRow).toList());

  /// Watches only seeded sample sessions (AGENTS.md §4 / ECTS-027,029).
  Stream<List<StudySession>> watchSample() => (_db.select(_db.studySessions)
        ..where((t) => t.isSample.equals(true)))
      .watch()
      .map((rows) => rows.map(sessionFromRow).toList());

  /// Sample session count, reactive (ECTS-029).
  Stream<int> watchSampleCount() =>
      watchSample().map((rows) => rows.length);

  /// One-shot sample session count (ECTS-029). Returns 0 on DB fault.
  Future<int> countSample() async {
    try {
      final rows = await (_db.select(_db.studySessions)
            ..where((t) => t.isSample.equals(true)))
          .get();
      return rows.length;
    } catch (_) {
      return 0;
    }
  }

  Future<Result<int>> addSession({
    required int courseId,
    required int minutes,
    required DateTime date,
    String? notes,
    bool isSample = false,
  }) async {
    if (minutes <= 0) return const Err('Duration must be greater than zero.');
    final missingCourse = await validateCourseReference(courseId);
    if (missingCourse != null) return Err(missingCourse);
    try {
      final id = await _db.into(_db.studySessions).insert(
            StudySessionsCompanion.insert(
              courseId: courseId,
              minutes: minutes,
              date: date,
              notes: Value(notes),
              isSample: Value(isSample),
            ),
          );
      return Ok(id);
    } catch (e) {
      return Err('Failed to add session: $e');
    }
  }

  /// Updates an existing session. Validates duration and the target course
  /// reference (same boundary rules as [addSession]) and returns [Err] when no
  /// session with [id] exists.
  Future<Result<void>> updateSession({
    required int id,
    required int courseId,
    required int minutes,
    required DateTime date,
    String? notes,
  }) async {
    if (minutes <= 0) return const Err('Duration must be greater than zero.');
    final missingCourse = await validateCourseReference(courseId);
    if (missingCourse != null) return Err(missingCourse);
    if (id <= 0) return const Err('Session not found.');
    try {
      final affected = await (_db.update(_db.studySessions)
            ..where((t) => t.id.equals(id)))
          .write(
        StudySessionsCompanion(
          courseId: Value(courseId),
          minutes: Value(minutes),
          date: Value(date),
          notes: Value(notes),
        ),
      );
      if (affected == 0) return const Err('Session not found.');
      return const Ok(null);
    } catch (e) {
      return Err('Failed to update session: $e');
    }
  }

  Future<Result<void>> deleteSession(int id) async {
    try {
      await (_db.delete(_db.studySessions)..where((t) => t.id.equals(id))).go();
      return const Ok(null);
    } catch (e) {
      return Err('Failed to delete session: $e');
    }
  }
}

class SettingsRepository {
  SettingsRepository(this._db);
  final AppDatabase _db;

  Stream<AppSettings> watch() => _db
      .select(_db.settings)
      .watchSingleOrNull()
      .map((row) => row == null
          ? const AppSettings()
          : AppSettings(
              hoursPerEcts: row.hoursPerEcts,
              dailyTargetMinutes: row.dailyTargetMinutes,
            ));

  /// One-shot read of the current settings, defaulting to [AppSettings] when
  /// no row exists (same mapping as [watch]). Lets bootstrap/first-frame code
  /// resolve settings without a stream subscription (ECTS-045). On a DB fault
  /// returns defaults rather than throwing (AGENTS.md §3).
  Future<AppSettings> get() async {
    try {
      final row = await _db.select(_db.settings).getSingleOrNull();
      if (row == null) return const AppSettings();
      return AppSettings(
        hoursPerEcts: row.hoursPerEcts,
        dailyTargetMinutes: row.dailyTargetMinutes,
      );
    } catch (_) {
      return const AppSettings();
    }
  }

  Future<Result<void>> setHoursPerEcts(double value) async {
    if (value <= 0) return const Err('Hours per ECTS must be greater than zero.');
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              hoursPerEcts: Value(value),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Persists the daily study target (minutes/day). `0` is "no target", a
  /// positive value is the target; a negative one is rejected at the boundary so
  /// it never reaches the row (ECTS-019). Writes only the settings singleton, so
  /// no course or session data is touched.
  Future<Result<void>> setDailyTargetMinutes(int value) async {
    if (value < 0) {
      return const Err('Daily target must not be negative.');
    }
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              dailyTargetMinutes: Value(value),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }
}
