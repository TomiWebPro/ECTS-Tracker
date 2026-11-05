import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late CourseRepository courses;
  late SessionRepository sessions;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    courses = CourseRepository(db);
    sessions = SessionRepository(db);
  });

  tearDown(() async => db.close());

  test('adds and reads back a course with derived defaults', () async {
    final res = await courses.addCourse(name: 'Algorithms', ectsCredits: 6);
    expect(res, isA<Ok<int>>());

    final list = await courses.watchAll().first;
    expect(list.single.name, 'Algorithms');
    expect(list.single.ectsCredits, 6);
  });

  test('logs a session and rejects non-positive duration', () async {
    final id = (await courses.addCourse(name: 'Databases', ectsCredits: 5) as Ok<int>).value;

    final ok = await sessions.addSession(courseId: id, minutes: 90, date: DateTime(2026, 11, 4));
    expect(ok, isA<Ok<int>>());

    final bad = await sessions.addSession(courseId: id, minutes: 0, date: DateTime(2026, 11, 4));
    expect(bad, isA<Err<int>>());

    final list = await sessions.watchAll().first;
    expect(list.single.minutes, 90);
    expect(list.single.hours, 1.5);
  });

  test('deleting a course cascades to its sessions', () async {
    final id = (await courses.addCourse(name: 'Physics', ectsCredits: 8) as Ok<int>).value;
    await sessions.addSession(courseId: id, minutes: 60, date: DateTime(2026, 11, 4));

    await courses.deleteCourse(id);
    expect(await sessions.watchAll().first, isEmpty);
  });

  test('settings default hoursPerEcts to 30', () async {
    final settings = SettingsRepository(db);
    expect((await settings.watch().first).hoursPerEcts, 30);
  });

  group('addCourse boundary validation (ECTS-025)', () {
    test('rejects zero credits with a domain Err and writes no row', () async {
      final res = await courses.addCourse(name: 'Zero', ectsCredits: 0);
      expect(res, isA<Err<int>>());
      expect((res as Err<int>).message, 'ECTS credits must be greater than zero.');
      expect(await courses.watchAll().first, isEmpty);
    });

    test('rejects negative credits with a domain Err and writes no row', () async {
      final res = await courses.addCourse(name: 'Negative', ectsCredits: -3);
      expect(res, isA<Err<int>>());
      expect((res as Err<int>).message, 'ECTS credits must be greater than zero.');
      expect(await courses.watchAll().first, isEmpty);
    });

    test('rejects an empty name with a domain Err, not a DB error', () async {
      final res = await courses.addCourse(name: '', ectsCredits: 5);
      expect(res, isA<Err<int>>());
      expect(
        (res as Err<int>).message,
        'Name must be 1 to 200 characters.',
      );
      expect(await courses.watchAll().first, isEmpty);
    });

    test('rejects a whitespace-only name', () async {
      final res = await courses.addCourse(name: '   ', ectsCredits: 5);
      expect(res, isA<Err<int>>());
      expect(await courses.watchAll().first, isEmpty);
    });

    test('rejects a 201-char name with a domain Err, not "Failed to add course"', () async {
      final res = await courses.addCourse(name: 'x' * 201, ectsCredits: 5);
      expect(res, isA<Err<int>>());
      final message = (res as Err<int>).message;
      expect(message, 'Name must be 1 to 200 characters.');
      expect(message, isNot(contains('Failed to add course')));
      expect(await courses.watchAll().first, isEmpty);
    });

    test('accepts a 200-char name and stores it trimmed', () async {
      final res = await courses.addCourse(name: 'y' * 200, ectsCredits: 5);
      expect(res, isA<Ok<int>>());
      final list = await courses.watchAll().first;
      expect(list.single.name.length, 200);
    });

    test('trims surrounding whitespace from a stored name', () async {
      final res = await courses.addCourse(name: '  Linear Algebra  ', ectsCredits: 6);
      expect(res, isA<Ok<int>>());
      final list = await courses.watchAll().first;
      expect(list.single.name, 'Linear Algebra');
    });

    test('validateCourseInput mirrors the rejection rules', () {
      expect(validateCourseInput(name: 'OK', ectsCredits: 1), isNull);
      expect(validateCourseInput(name: '  OK  ', ectsCredits: 0.5), isNull);
      expect(validateCourseInput(name: 'OK', ectsCredits: 0), isNotNull);
      expect(validateCourseInput(name: '', ectsCredits: 5), isNotNull);
      expect(courseNameMaxLength, 200);
    });
  });

  group('addSession course-reference validation (ECTS-026)', () {
    test('rejects a missing course with a domain Err, not a DB error', () async {
      final res =
          await sessions.addSession(courseId: 999, minutes: 60, date: DateTime(2026, 11, 4));
      expect(res, isA<Err<int>>());
      final message = (res as Err<int>).message;
      expect(message, 'Course not found.');
      expect(message, isNot(contains('Failed to add session')));
      expect(await sessions.watchAll().first, isEmpty);
    });

    test('rejects a non-positive courseId', () async {
      for (final badId in [0, -1]) {
        final res = await sessions
            .addSession(courseId: badId, minutes: 60, date: DateTime(2026, 11, 4));
        expect(res, isA<Err<int>>());
        expect((res as Err<int>).message, 'Course not found.');
      }
      expect(await sessions.watchAll().first, isEmpty);
    });

    test('rejects a deleted course: no orphan session is written', () async {
      final id = (await courses.addCourse(name: 'Ephemeral', ectsCredits: 4) as Ok<int>).value;
      expect(await courses.deleteCourse(id), isA<Ok<void>>());

      final res =
          await sessions.addSession(courseId: id, minutes: 30, date: DateTime(2026, 11, 4));
      expect(res, isA<Err<int>>());
      expect((res as Err<int>).message, 'Course not found.');
      expect(await sessions.watchAll().first, isEmpty);
    });

    test('still rejects a non-positive duration before the course lookup', () async {
      final id = (await courses.addCourse(name: 'Valid', ectsCredits: 5) as Ok<int>).value;
      final res = await sessions.addSession(courseId: id, minutes: 0, date: DateTime(2026, 11, 4));
      expect(res, isA<Err<int>>());
      expect((res as Err<int>).message, 'Duration must be greater than zero.');
    });

    test('accepts a session for an existing course', () async {
      final id = (await courses.addCourse(name: 'Real', ectsCredits: 5) as Ok<int>).value;
      final res =
          await sessions.addSession(courseId: id, minutes: 45, date: DateTime(2026, 11, 4));
      expect(res, isA<Ok<int>>());
      final list = await sessions.watchAll().first;
      expect(list.single.courseId, id);
      expect(list.single.minutes, 45);
    });

    test('validateCourseReference distinguishes existing from missing courses', () async {
      final id = (await courses.addCourse(name: 'Probe', ectsCredits: 3) as Ok<int>).value;
      expect(await sessions.validateCourseReference(id), isNull);
      expect(await sessions.validateCourseReference(id + 1), 'Course not found.');
      expect(await sessions.validateCourseReference(0), 'Course not found.');
    });
  });
}
