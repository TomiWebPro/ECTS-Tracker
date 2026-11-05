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
}
