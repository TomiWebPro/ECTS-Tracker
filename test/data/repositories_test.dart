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
    final s = await settings.watch().first;
    expect(s.hoursPerEcts, 30);
    expect(s.dailyTargetMinutes, 0);
  });

  group('setDailyTargetMinutes (ECTS-019)', () {
    late SettingsRepository settings;

    setUp(() {
      settings = SettingsRepository(db);
    });

    test('persists a positive daily target', () async {
      final res = await settings.setDailyTargetMinutes(120);
      expect(res, isA<Ok<void>>());
      expect((await settings.watch().first).dailyTargetMinutes, 120);
    });

    test('accepts 0 as "no target" and persists it', () async {
      await settings.setDailyTargetMinutes(90);
      final res = await settings.setDailyTargetMinutes(0);
      expect(res, isA<Ok<void>>());
      expect((await settings.watch().first).dailyTargetMinutes, 0);
    });

    test('rejects a negative target with a domain Err and leaves the row unchanged',
        () async {
      final res = await settings.setDailyTargetMinutes(-1);
      expect(res, isA<Err<void>>());
      expect(
        (res as Err<void>).message,
        'Daily target must not be negative.',
      );
      expect((await settings.watch().first).dailyTargetMinutes, 0);
    });

    test('rejects a large negative target and does not persist it', () async {
      await settings.setDailyTargetMinutes(60);
      final res = await settings.setDailyTargetMinutes(-999);
      expect(res, isA<Err<void>>());
      expect((await settings.watch().first).dailyTargetMinutes, 60);
    });

    test('writes only settings, leaving courses and sessions intact', () async {
      final courseId =
          (await courses.addCourse(name: 'Untouched', ectsCredits: 5) as Ok<int>)
              .value;
      await sessions.addSession(
        courseId: courseId,
        minutes: 45,
        date: DateTime(2026, 11, 4),
      );

      final res = await settings.setDailyTargetMinutes(75);
      expect(res, isA<Ok<void>>());

      expect((await courses.watchAll().first).single.name, 'Untouched');
      expect((await sessions.watchAll().first).single.minutes, 45);
    });

    test('upserts the singleton row (no duplicate settings rows)', () async {
      await settings.setHoursPerEcts(25);
      await settings.setDailyTargetMinutes(90);
      await settings.setHoursPerEcts(30);
      await settings.setDailyTargetMinutes(0);

      final s = await settings.watch().first;
      expect(s.hoursPerEcts, 30);
      expect(s.dailyTargetMinutes, 0);
      // Only the singleton row must exist.
      expect((await db.select(db.settings).get()).length, 1);
    });
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

  group('addCourse date order validation (ECTS-038)', () {
    test('rejects deadline before start date with a domain Err and writes no row',
        () async {
      final res = await courses.addCourse(
        name: 'Bad',
        ectsCredits: 5,
        startDate: DateTime(2026, 12, 1),
        deadline: DateTime(2026, 11, 20),
      );
      expect(res, isA<Err<int>>());
      expect((res as Err<int>).message, 'Deadline must be after start date.');
      expect(await courses.watchAll().first, isEmpty);
    });

    test('rejects deadline equal to start date (same instant)', () async {
      final start = DateTime(2026, 12, 1);
      final res = await courses.addCourse(
        name: 'Same',
        ectsCredits: 5,
        startDate: start,
        deadline: start,
      );
      expect(res, isA<Err<int>>());
      expect((res as Err<int>).message, 'Deadline must be after start date.');
      expect(await courses.watchAll().first, isEmpty);
    });

    test('accepts deadline after start date', () async {
      final res = await courses.addCourse(
        name: 'Ok',
        ectsCredits: 5,
        startDate: DateTime(2026, 9, 1),
        deadline: DateTime(2026, 12, 1),
      );
      expect(res, isA<Ok<int>>());
      expect((await courses.watchAll().first).single.name, 'Ok');
    });

    test('accepts course with only start date or only deadline', () async {
      final res1 = await courses.addCourse(
        name: 'StartOnly',
        ectsCredits: 5,
        startDate: DateTime(2026, 9, 1),
      );
      expect(res1, isA<Ok<int>>());
      final res2 = await courses.addCourse(
        name: 'DeadlineOnly',
        ectsCredits: 5,
        deadline: DateTime(2026, 12, 1),
      );
      expect(res2, isA<Ok<int>>());
      expect((await courses.watchAll().first).length, 2);
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

  group('updateCourse (ECTS-014)', () {
    test('updates editable fields and trims the name', () async {
      final id = (await courses.addCourse(
        name: 'Old',
        ectsCredits: 5,
        notes: 'before',
      ) as Ok<int>)
          .value;
      final deadline = DateTime(2026, 12, 1);

      final res = await courses.updateCourse(
        id: id,
        name: '  New Name  ',
        ectsCredits: 6,
        startDate: DateTime(2026, 9, 1),
        deadline: deadline,
        notes: 'after',
        colorValue: 0xFF112233,
      );
      expect(res, isA<Ok<void>>());

      final row = (await courses.watchAll().first).single;
      expect(row.id, id);
      expect(row.name, 'New Name');
      expect(row.ectsCredits, 6);
      expect(row.startDate, DateTime(2026, 9, 1));
      expect(row.deadline, deadline);
      expect(row.notes, 'after');
      expect(row.colorValue, 0xFF112233);
    });

    test('clears optional fields when passed null', () async {
      final id = (await courses.addCourse(
        name: 'Course',
        ectsCredits: 5,
        startDate: DateTime(2026, 1, 1),
        deadline: DateTime(2026, 6, 1),
        notes: 'note',
      ) as Ok<int>)
          .value;

      final res = await courses.updateCourse(
        id: id,
        name: 'Course',
        ectsCredits: 5,
      );
      expect(res, isA<Ok<void>>());

      final row = (await courses.watchAll().first).single;
      expect(row.startDate, isNull);
      expect(row.deadline, isNull);
      expect(row.notes, isNull);
      expect(row.colorValue, isNull);
    });

    test('returns Err for a missing course and writes nothing', () async {
      await courses.addCourse(name: 'Kept', ectsCredits: 3);
      final res = await courses.updateCourse(
        id: 9999,
        name: 'Ghost',
        ectsCredits: 4,
      );
      expect(res, isA<Err<void>>());
      expect((res as Err<void>).message, 'Course not found.');
      expect((await courses.watchAll().first).single.name, 'Kept');
    });

    test('rejects invalid input with a domain Err and leaves the row unchanged',
        () async {
      final id =
          (await courses.addCourse(name: 'Kept', ectsCredits: 3) as Ok<int>)
              .value;
      final res = await courses.updateCourse(
        id: id,
        name: 'Bad',
        ectsCredits: 0,
      );
      expect(res, isA<Err<void>>());
      expect((res as Err<void>).message, 'ECTS credits must be greater than zero.');
      final row = (await courses.watchAll().first).single;
      expect(row.name, 'Kept');
      expect(row.ectsCredits, 3);
    });

    test('rejects deadline before start date on update and leaves row unchanged',
        () async {
      final id =
          (await courses.addCourse(name: 'Kept', ectsCredits: 3) as Ok<int>)
              .value;
      final res = await courses.updateCourse(
        id: id,
        name: 'Kept',
        ectsCredits: 3,
        startDate: DateTime(2026, 12, 1),
        deadline: DateTime(2026, 11, 20),
      );
      expect(res, isA<Err<void>>());
      expect((res as Err<void>).message, 'Deadline must be after start date.');
      final row = (await courses.watchAll().first).single;
      expect(row.startDate, isNull);
      expect(row.deadline, isNull);
    });
  });

  group('updateSession (ECTS-014)', () {
    test('updates editable fields and can move a session to another course',
        () async {
      final a = (await courses.addCourse(name: 'A', ectsCredits: 5) as Ok<int>).value;
      final b = (await courses.addCourse(name: 'B', ectsCredits: 5) as Ok<int>).value;
      final sid = (await sessions.addSession(
        courseId: a,
        minutes: 30,
        date: DateTime(2026, 11, 1),
        notes: 'old',
      ) as Ok<int>)
          .value;

      final res = await sessions.updateSession(
        id: sid,
        courseId: b,
        minutes: 90,
        date: DateTime(2026, 11, 2),
        notes: 'new',
      );
      expect(res, isA<Ok<void>>());

      final row = (await sessions.watchAll().first).single;
      expect(row.id, sid);
      expect(row.courseId, b);
      expect(row.minutes, 90);
      expect(row.date, DateTime(2026, 11, 2));
      expect(row.notes, 'new');
    });

    test('returns Err for a missing session', () async {
      final id =
          (await courses.addCourse(name: 'C', ectsCredits: 5) as Ok<int>).value;
      final res = await sessions.updateSession(
        id: 9999,
        courseId: id,
        minutes: 60,
        date: DateTime(2026, 11, 1),
      );
      expect(res, isA<Err<void>>());
      expect((res as Err<void>).message, 'Session not found.');
    });

    test('rejects a non-positive duration and leaves the row unchanged', () async {
      final courseId =
          (await courses.addCourse(name: 'D', ectsCredits: 5) as Ok<int>).value;
      final sid = (await sessions.addSession(
        courseId: courseId,
        minutes: 45,
        date: DateTime(2026, 11, 1),
      ) as Ok<int>)
          .value;

      final res = await sessions.updateSession(
        id: sid,
        courseId: courseId,
        minutes: 0,
        date: DateTime(2026, 11, 1),
      );
      expect(res, isA<Err<void>>());
      expect((res as Err<void>).message, 'Duration must be greater than zero.');
      expect((await sessions.watchAll().first).single.minutes, 45);
    });

    test('rejects a missing target course and leaves the row unchanged', () async {
      final courseId =
          (await courses.addCourse(name: 'E', ectsCredits: 5) as Ok<int>).value;
      final sid = (await sessions.addSession(
        courseId: courseId,
        minutes: 45,
        date: DateTime(2026, 11, 1),
      ) as Ok<int>)
          .value;

      final res = await sessions.updateSession(
        id: sid,
        courseId: 9999,
        minutes: 60,
        date: DateTime(2026, 11, 1),
      );
      expect(res, isA<Err<void>>());
      expect((res as Err<void>).message, 'Course not found.');
      expect((await sessions.watchAll().first).single.courseId, courseId);
    });
  });
}
