import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:ects_tracker/src/startup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('initializeApp (ECTS-023)', () {
    test('opens, migrates, and bootstraps to a usable StartupReady state',
        () async {
      final state = await initializeApp(NativeDatabase.memory());
      addTearDown(() async {
        if (state is StartupReady) await state.db.close();
      });

      expect(state, isA<StartupReady>());
      final ready = state as StartupReady;
      expect(ready.bootstrap.firstRun, isTrue);
      expect(ready.bootstrap.seeded, isTrue);
      // DB is open and migrated: settings resolved, seed data present.
      final settings = await ready.db.select(ready.db.settings).getSingleOrNull();
      expect(settings, isNotNull);
      final courses = await ready.db.select(ready.db.courses).get();
      expect(courses, isNotEmpty);
    });

    test('returns StartupFailed for a broken executor (no throw)', () async {
      final state = await initializeApp(_FailingExecutor());
      expect(state, isA<StartupFailed>());
      expect((state as StartupFailed).message, isNotEmpty);
    });
  });
}

/// A [QueryExecutor] that fails to open, simulating a broken DB path/migration.
class _FailingExecutor extends QueryExecutor {
  @override
  SqlDialect get dialect => SqlDialect.sqlite;

  @override
  Future<bool> ensureOpen(QueryExecutorUser user) async {
    throw StateError('simulated open failure');
  }

  @override
  TransactionExecutor beginTransaction() => throw UnimplementedError();

  @override
  QueryExecutor beginExclusive() => throw UnimplementedError();

  @override
  Future<void> runBatched(BatchedStatements statements) {
    throw UnimplementedError();
  }

  @override
  Future<void> runCustom(String statement, [List<Object?>? args]) {
    throw UnimplementedError();
  }

  @override
  Future<int> runDelete(String statement, List<Object?> args) {
    throw UnimplementedError();
  }

  @override
  Future<int> runInsert(String statement, List<Object?> args) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, Object?>>> runSelect(
      String statement, List<Object?> args) {
    throw UnimplementedError();
  }

  @override
  Future<int> runUpdate(String statement, List<Object?> args) {
    throw UnimplementedError();
  }
}
