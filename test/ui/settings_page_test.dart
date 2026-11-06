import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/bootstrap.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SettingsPage clear sample data (ECTS-016)', () {
    late AppDatabase db;

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
    });

    tearDown(() async {
      await db.close();
    });

    Future<void> flush(WidgetTester tester) async {
      // Unmount so providers dispose; pump zero-duration drift timers.
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
    }

    Widget app() => ProviderScope(
          overrides: [databaseProvider.overrideWithValue(db)],
          child: const MaterialApp(home: Scaffold(body: SettingsPage())),
        );

    testWidgets('shows clear action when sample data exists and clears on confirm',
        (tester) async {
      await bootstrapDatabase(db); // seeds sample courses/sessions (first run)

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('clearSampleDataTile')), findsOneWidget);
      expect(find.text('Clear sample data'), findsOneWidget);
      expect(find.byKey(const Key('noSampleDataTile')), findsNothing);

      await tester.tap(find.byKey(const Key('clearSampleDataTile')));
      await tester.pumpAndSettle();
      expect(find.text('Clear sample data?'), findsOneWidget);

      await tester.tap(find.byKey(const Key('confirmClearSampleData')));
      await tester.pumpAndSettle();

      // Sample rows removed; UI reflects empty sample state.
      expect(find.byKey(const Key('noSampleDataTile')), findsOneWidget);
      expect(find.byKey(const Key('clearSampleDataTile')), findsNothing);

      final courses = CourseRepository(db);
      final sessions = SessionRepository(db);
      expect(await courses.countSample(), 0);
      expect(await sessions.countSample(), 0);
      // All seeded rows were sample-marked, so clear removes them entirely.
      final allCourses = await db.select(db.courses).get();
      expect(allCourses, isEmpty);
      await flush(tester);
    });

    testWidgets('shows no-sample state when no sample data is present',
        (tester) async {
      // Fresh DB, no bootstrap/seed: no sample rows.
      await tester.pumpWidget(app());
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('noSampleDataTile')), findsOneWidget);
      expect(find.byKey(const Key('clearSampleDataTile')), findsNothing);
      await flush(tester);
    });

    testWidgets('cancel leaves sample data intact', (tester) async {
      await bootstrapDatabase(db);

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('clearSampleDataTile')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('clearSampleDataTile')), findsOneWidget);
      expect(await CourseRepository(db).countSample(), greaterThan(0));
      await flush(tester);
    });

    testWidgets('surfaces Err from deleteSampleData and keeps UI consistent',
        (tester) async {
      await bootstrapDatabase(db);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            databaseProvider.overrideWithValue(db),
            courseRepositoryProvider
                .overrideWithValue(_FailingClearCourseRepository(db)),
          ],
          child: const MaterialApp(home: Scaffold(body: SettingsPage())),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('clearSampleDataTile')), findsOneWidget);

      await tester.tap(find.byKey(const Key('clearSampleDataTile')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('confirmClearSampleData')));
      await tester.pumpAndSettle();

      // Error surfaced via SnackBar; sample rows and UI remain unchanged.
      expect(find.byKey(const Key('clearSampleDataError')), findsOneWidget);
      expect(
        find.text('Failed to clear sample data: simulated failure'),
        findsOneWidget,
      );
      expect(find.byKey(const Key('clearSampleDataTile')), findsOneWidget);
      expect(find.byKey(const Key('noSampleDataTile')), findsNothing);
      expect(await CourseRepository(db).countSample(), greaterThan(0));
      final allCourses = await db.select(db.courses).get();
      expect(allCourses, isNotEmpty);
      await flush(tester);
    });
  });
}

class _FailingClearCourseRepository extends CourseRepository {
  _FailingClearCourseRepository(super.db);

  @override
  Future<Result<void>> deleteSampleData() async =>
      const Err('Failed to clear sample data: simulated failure');
}
