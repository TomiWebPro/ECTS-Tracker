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

    Future<bool> readHasSample({bool? expect}) async {
      // Keep dependencies alive while polling so stream providers stay active.
      final sub = container.listen(hasSampleDataProvider, (prev, next) {});
      try {
        for (var i = 0; i < 100; i++) {
          final v = container.read(hasSampleDataProvider);
          if (v.hasValue && (expect == null || v.value == expect)) {
            return v.value!;
          }
          if (v.hasError) throw v.error!;
          await Future<void>.delayed(const Duration(milliseconds: 20));
        }
        final v = container.read(hasSampleDataProvider);
        if (v.hasValue) return v.value!;
        throw StateError('hasSampleDataProvider did not resolve: $v');
      } finally {
        sub.close();
      }
    }

    test('false when no sample rows exist', () async {
      final courses = container.read(courseRepositoryProvider);
      await courses.addCourse(name: 'User', ectsCredits: 5);
      expect(await readHasSample(expect: false), isFalse);
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

      expect(await readHasSample(expect: true), isTrue);

      await courses.deleteSampleData();
      // Allow stream propagation through the underlying sample streams.
      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(await readHasSample(expect: false), isFalse);
    });

    test('only sample rows count (user rows do not trigger true alone)',
        () async {
      final courses = container.read(courseRepositoryProvider);
      await courses.addCourse(name: 'User', ectsCredits: 5);
      expect(await readHasSample(expect: false), isFalse);
      await courses.addCourse(name: 'Sample', ectsCredits: 3, isSample: true);
      expect(await readHasSample(expect: true), isTrue);
    });
  });
}
