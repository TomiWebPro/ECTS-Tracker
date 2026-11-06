import 'package:drift/drift.dart';

import 'data/app_database.dart';
import 'data/bootstrap.dart';

/// Outcome of the app-start bootstrap boundary (ECTS-023).
sealed class StartupState {
  const StartupState();
}

/// The database was opened, migrated, and bootstrapped before the first frame.
class StartupReady extends StartupState {
  const StartupReady(this.db, this.bootstrap);

  final AppDatabase db;
  final BootstrapResult bootstrap;
}

/// Opening/migrating/bootstrap failed; the UI must show an explicit error
/// screen instead of leaking an unhandled error into the widget tree.
class StartupFailed extends StartupState {
  const StartupFailed(this.message, [this.error]);

  final String message;
  final Object? error;
}

/// Opens the database with [executor], runs migrations, and resolves the
/// first-run/settings state. Never throws: failures are returned as
/// [StartupFailed] so [main] can surface an explicit error screen.
Future<StartupState> initializeApp(QueryExecutor executor) async {
  AppDatabase? db;
  try {
    db = AppDatabase(executor);
    final bootstrap = await bootstrapDatabase(db);
    return StartupReady(db, bootstrap);
  } catch (e) {
    // A partially opened database must not leak.
    try {
      await db?.close();
    } catch (_) {}
    return StartupFailed('Failed to open or prepare the database.', e);
  }
}
