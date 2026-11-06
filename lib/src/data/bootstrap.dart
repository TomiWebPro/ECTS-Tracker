import 'package:drift/drift.dart';

import 'app_database.dart';

/// Result of a bootstrap run (ECTS-020).
class BootstrapResult {
  const BootstrapResult({required this.firstRun, required this.seeded});

  /// True when this launch was detected as the first run.
  final bool firstRun;

  /// True when sample data was inserted during this run.
  final bool seeded;
}

/// Ensures the database is opened/migrated and performs the one-time first-run
/// bootstrap (ECTS-020).
///
/// First-run detection is a documented, persistent check: the settings singleton
/// row is absent only on a brand-new database. On first run we seed sample data
/// ([Courses]/[StudySessions] with `isSample = true`) and create the settings
/// row, so a later launch (even after the user clears sample data) never
/// re-seeds. A second call is therefore a no-op for seeding.
///
/// Calling this forces the lazy [AppDatabase] connection open and runs
/// migrations, so it can be awaited before the first frame (see ECTS-023 for
/// the app-start wiring and error boundary).
Future<BootstrapResult> bootstrapDatabase(AppDatabase db) async {
  // Force open + migrations (LazyDatabase) by touching the DB.
  await db.customSelect('SELECT 1').get();

  final settingsRow = await db.select(db.settings).getSingleOrNull();
  if (settingsRow != null) {
    return const BootstrapResult(firstRun: false, seeded: false);
  }

  // First run: seed sample data and mark the database as initialized by
  // creating the settings singleton. Both happen in one transaction so a
  // partial failure leaves no half-seeded state; a retry will still see no
  // settings row and can attempt again.
  await db.transaction(() async {
    await _seedSampleData(db);
    await db.into(db.settings).insertOnConflictUpdate(
          SettingsCompanion.insert(id: const Value(1)),
        );
  });

  return const BootstrapResult(firstRun: true, seeded: true);
}

Future<void> _seedSampleData(AppDatabase db) async {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  final algorithmsId = await db.into(db.courses).insert(
        CoursesCompanion.insert(
          name: 'Algorithms & Data Structures',
          ectsCredits: 6,
          startDate: Value(today.subtract(const Duration(days: 21))),
          deadline: Value(today.add(const Duration(days: 45))),
          notes: const Value('Sample course — clear sample data in Settings.'),
          isSample: const Value(true),
        ),
      );
  final calculusId = await db.into(db.courses).insert(
        CoursesCompanion.insert(
          name: 'Calculus II',
          ectsCredits: 5,
          startDate: Value(today.subtract(const Duration(days: 14))),
          deadline: Value(today.add(const Duration(days: 60))),
          notes: const Value('Sample course — clear sample data in Settings.'),
          isSample: const Value(true),
        ),
      );
  final projectId = await db.into(db.courses).insert(
        CoursesCompanion.insert(
          name: 'Software Engineering Project',
          ectsCredits: 10,
          startDate: Value(today.subtract(const Duration(days: 30))),
          deadline: Value(today.add(const Duration(days: 30))),
          notes: const Value('Sample course — clear sample data in Settings.'),
          isSample: const Value(true),
        ),
      );

  Future<void> addSession(int courseId, int daysAgo, int minutes, String note) {
    return db.into(db.studySessions).insert(
          StudySessionsCompanion.insert(
            courseId: courseId,
            minutes: minutes,
            date: today.subtract(Duration(days: daysAgo)),
            notes: Value(note),
            isSample: const Value(true),
          ),
        );
  }

  await addSession(algorithmsId, 2, 90, 'Sample: graph traversal exercises');
  await addSession(algorithmsId, 5, 60, 'Sample: lecture review');
  await addSession(calculusId, 1, 75, 'Sample: integration practice');
  await addSession(calculusId, 4, 45, 'Sample: problem set');
  await addSession(projectId, 1, 120, 'Sample: sprint planning');
  await addSession(projectId, 3, 90, 'Sample: implementation');
}
