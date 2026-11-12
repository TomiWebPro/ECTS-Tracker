part of '../repositories.dart';

class CourseRepository {
  CourseRepository(this._db);
  final AppDatabase _db;

  Stream<List<Course>> watchAll() =>
      _db.select(_db.courses).watch().map((rows) => rows.map(courseFromRow).toList());

  /// One-shot read of all courses (single home for snapshot uses like
  /// reminder rescheduling — keeps `watchAll().first` stream setups out of
  /// one-shot call sites).
  Future<List<Course>> getAll() async =>
      (await _db.select(_db.courses).get()).map(courseFromRow).toList();

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
    } catch (e) {
      // DB fault reads as "no samples" so the clear-sample tile hides
      // instead of crashing; log in debug so a real fault is visible.
      if (kDebugMode) debugPrint('countSample DB fault: $e');
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
    } catch (e) {
      // DB fault reads as "no samples" (tile hides); log in debug.
      if (kDebugMode) debugPrint('hasSampleData DB fault: $e');
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
    bool startEarly = false,
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
              startEarly: Value(startEarly),
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
    bool? startEarly,
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
          startEarly:
              startEarly == null ? const Value.absent() : Value(startEarly),
        ),
      );
      if (affected == 0) return const Err('Course not found.');
      return const Ok(null);
    } catch (e) {
      return Err('Failed to update course: $e');
    }
  }

  /// Deletes a course and its sessions in an explicit transaction boundary
  /// (ECTS-043 guard): session rows are removed before the course row so cascade
  /// is controlled/atomic, preventing partial state. Preserves the not-found
  /// contract (ECTS-042).
  Future<Result<void>> deleteCourse(int id) async {
    if (id <= 0) return const Err('Course not found.');
    try {
      final affected = await _db.transaction(() async {
        await (_db.delete(_db.studySessions)
              ..where((t) => t.courseId.equals(id)))
            .go();
        return await (_db.delete(_db.courses)
              ..where((t) => t.id.equals(id)))
            .go();
      });
      if (affected == 0) return const Err('Course not found.');
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

  /// Deletes a single sample-marked course safely (ECTS-030): removes sample
  /// sessions on that course, and deletes the course only if no user sessions
  /// remain. Leaves user data intact.
  Future<Result<void>> deleteSampleCourse(int courseId) async {
    try {
      await _db.transaction(() async {
        await (_db.delete(_db.studySessions)
              ..where((t) => t.courseId.equals(courseId) & t.isSample.equals(true)))
            .go();
        final remainingRows = await (_db.select(_db.studySessions)
              ..where((t) => t.courseId.equals(courseId))
              ..limit(1))
            .get();
        if (remainingRows.isEmpty) {
          await (_db.delete(_db.courses)..where((t) => t.id.equals(courseId)))
              .go();
        }
      });
      return const Ok(null);
    } catch (e) {
      return Err('Failed to delete course: $e');
    }
  }
}
