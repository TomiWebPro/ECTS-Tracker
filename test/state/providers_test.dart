import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('hasSampleDataProvider (ECTS-029)', () {
    late AppDatabase db;
    late ProviderContainer container;

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
      container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(db)],
      );
    });

    tearDown(() async {
      container.dispose();
      await db.close();
    });

    Future<bool> readHasSample() async {
      // StreamProvider: wait until it has data.
      final sub = container.listen(hasSampleDataProvider.future, (previous, next) {});
      try {
        return await container.read(hasSampleDataProvider.future);
      } finally {
        sub.close();
      }
    }

    test('false when no sample rows exist', () async {
      final courses = container.read(courseRepositoryProvider);
      await courses.addCourse(name: 'User', ectsCredits: 5);
      expect(await readHasSample(), isFalse);
    });

    test('true when sample rows exist, false after deleteSampleData', () async {
      final courses = container.read(courseRepositoryProvider);
      final sessions = container.read(sessionRepositoryProvider);
      final sampleCourse = (await courses.addCourse(
        name: 'Sample',
        ectsCredits: 5,
        isSample: true,
      ) as Ok<int>)
          .value;
      await sessions.addSession(
        courseId: sampleCourse,
        minutes: 30,
        date: DateTime(2026, 1, 1),
        isSample: true,
      );

      expect(await readHasSample(), isTrue);

      await courses.deleteSampleData();
      // Allow stream propagation.
      await Future<void>.delayed(const Duration(milliseconds: 50));
      container.invalidate(hasSampleDataProvider);
      expect(await readHasSample(), isFalse);
    });

    test('only sample rows count (user rows do not trigger true alone)',
        () async {
      final courses = container.read(courseRepositoryProvider);
      await courses.addCourse(name: 'User', ectsCredits: 5);
      expect(await readHasSample(), isFalse);
      await courses.addCourse(name: 'Sample', ectsCredits: 3, isSample: true);
      container.invalidate(hasSampleDataProvider);
      expect(await readHasSample(), isTrue);
    });
  });
}
