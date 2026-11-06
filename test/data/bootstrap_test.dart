import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/bootstrap.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('bootstrapDatabase (ECTS-020)', () {
    late AppDatabase db;

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
    });

    tearDown(() async {
      await db.close();
    });

    test('first run seeds sample data and is marked initialized', () async {
      final result = await bootstrapDatabase(db);

      expect(result.firstRun, isTrue);
      expect(result.seeded, isTrue);

      final courses = CourseRepository(db);
      final sessions = SessionRepository(db);
      expect(await courses.countSample(), greaterThan(0));
      expect(await sessions.countSample(), greaterThan(0));
      expect(await courses.hasSampleData(), isTrue);

      // Settings singleton row exists, so future launches are not "first run".
      final settingsRow = await db.select(db.settings).getSingleOrNull();
      expect(settingsRow, isNotNull);
    });

    test('second bootstrap does not re-seed (runs exactly once)', () async {
      final first = await bootstrapDatabase(db);
      expect(first.seeded, isTrue);

      final courses = CourseRepository(db);
      final sessions = SessionRepository(db);
      final courseCount = (await (db.select(db.courses)).get()).length;
      final sessionCount = (await (db.select(db.studySessions)).get()).length;
      expect(courseCount, greaterThan(0));

      final second = await bootstrapDatabase(db);
      expect(second.firstRun, isFalse);
      expect(second.seeded, isFalse);

      // No duplicate sample rows.
      expect((await (db.select(db.courses)).get()).length, courseCount);
      expect((await (db.select(db.studySessions)).get()).length, sessionCount);
      expect(await courses.countSample(), courseCount);
      expect(await sessions.countSample(), sessionCount);
    });

    test('does not re-seed after sample data is cleared (one-time guard)',
        () async {
      await bootstrapDatabase(db);
      final courses = CourseRepository(db);
      await courses.deleteSampleData();
      expect(await courses.hasSampleData(), isFalse);

      final again = await bootstrapDatabase(db);
      expect(again.firstRun, isFalse);
      expect(again.seeded, isFalse);
      expect(await courses.hasSampleData(), isFalse);
      expect((await (db.select(db.courses)).get()), isEmpty);
    });
  });
}
