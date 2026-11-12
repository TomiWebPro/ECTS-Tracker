part of '../repositories.dart';

/// Hidden dev-mode stress pump (no UI except Settings): inserts a realistic
/// generated semester ([StressPayload]) and can clear it again by name
/// prefix. Pumped rows are normal user-style rows (`isSample: false`) so
/// they exercise the real pace/statistics paths.
class DevPumpRepository {
  DevPumpRepository(this._db);
  final AppDatabase _db;

  /// Inserts [payload] courses, then their sessions in one batch.
  /// Returns (courses, sessions) inserted. Existing data is kept.
  Future<Result<(int, int)>> pump(StressPayload payload) async {
    if (payload.courses.isEmpty) return const Err('Nothing to pump.');
    try {
      final ids = <int>[];
      await _db.transaction(() async {
        for (final c in payload.courses) {
          final id = await _db.into(_db.courses).insert(
                CoursesCompanion.insert(
                  name: c.name,
                  ectsCredits: c.ectsCredits,
                  startDate: Value(c.startDate),
                  deadline: Value(c.deadline),
                  notes: const Value('DEV PUMP — stress test data.'),
                  colorValue: Value(c.colorValue),
                  isSample: const Value(false),
                  startEarly: Value(c.startEarly),
                ),
              );
          ids.add(id);
        }
        await _db.batch((b) {
          for (final s in payload.sessions) {
            b.insert(
              _db.studySessions,
              StudySessionsCompanion.insert(
                courseId: ids[s.courseIndex],
                minutes: s.minutes,
                date: s.date,
                notes: Value(s.notes ?? 'DEV PUMP'),
                isSample: const Value(false),
              ),
            );
          }
        });
      });
      return Ok((ids.length, payload.sessions.length));
    } catch (e) {
      return Err('Failed to pump test data: $e');
    }
  }

  /// Deletes pumped courses (name prefix [stressCoursePrefix]) and their
  /// sessions. Returns the number of courses removed.
  Future<Result<int>> clearPumped() async {
    try {
      final rows = await _db.select(_db.courses).get();
      final ids = [
        for (final r in rows)
          if (r.name.startsWith(stressCoursePrefix)) r.id
      ];
      if (ids.isEmpty) return const Ok(0);
      final removed = await _db.transaction(() async {
        await (_db.delete(_db.studySessions)
              ..where((t) => t.courseId.isIn(ids)))
            .go();
        return await (_db.delete(_db.courses)
              ..where((t) => t.id.isIn(ids)))
            .go();
      });
      return Ok(removed);
    } catch (e) {
      return Err('Failed to clear pumped data: $e');
    }
  }
}
