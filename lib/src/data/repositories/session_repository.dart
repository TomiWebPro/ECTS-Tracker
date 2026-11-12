part of '../repositories.dart';

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

  /// One-shot read of all sessions (see [CourseRepository.getAll]).
  Future<List<StudySession>> getAll() async => (await _db
          .select(_db.studySessions)
          .get())
      .map(sessionFromRow)
      .toList();

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
    } catch (e) {
      // DB fault reads as "no samples"; log in debug.
      if (kDebugMode) debugPrint('countSample sessions DB fault: $e');
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
    if (id <= 0) return const Err('Session not found.');
    try {
      final affected = await (_db.delete(_db.studySessions)
            ..where((t) => t.id.equals(id)))
          .go();
      if (affected == 0) return const Err('Session not found.');
      return const Ok(null);
    } catch (e) {
      return Err('Failed to delete session: $e');
    }
  }
}
