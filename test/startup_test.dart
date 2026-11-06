import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:ects_tracker/main.dart';
import 'package:ects_tracker/src/startup.dart';
import 'package:flutter/material.dart';
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

  group('EctsTrackerApp startup boundary (ECTS-023)', () {
    testWidgets('reaches a usable state before first frame shows dashboard',
        (tester) async {
      final state = await initializeApp(NativeDatabase.memory());
      final db = (state as StartupReady).db;

      await tester.pumpWidget(EctsTrackerApp(startup: state));
      await tester.pumpAndSettle();

      // App reached the real dashboard (seed data bootstrapped), not an empty
      // or error shell.
      expect(find.text('Overall progress'), findsOneWidget);
      expect(find.byType(StartupErrorScreen), findsNothing);
      // Seed data resolved: dashboard shows the bootstrapped courses.
      expect(find.text('3 course(s)'), findsOneWidget);

      // Unmount disposes the ProviderScope; ECTS-048 closes the pre-opened DB.
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pumpAndSettle();
      await expectLater(db.customSelect('SELECT 1').get(), throwsA(anything));
    });

    testWidgets('surfaces a failed open as an explicit error screen',
        (tester) async {
      const failed = StartupFailed('Failed to open or prepare the database.');
      await tester.pumpWidget(const EctsTrackerApp(startup: failed));
      await tester.pump();

      expect(find.byType(StartupErrorScreen), findsOneWidget);
      expect(find.text('Could not start ECTS Tracker'), findsOneWidget);
      expect(find.text('Failed to open or prepare the database.'),
          findsOneWidget);
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
