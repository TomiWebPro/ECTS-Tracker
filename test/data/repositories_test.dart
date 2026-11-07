import 'package:drift/drift.dart' show LazyDatabase;
import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/logic/ects.dart' as ects;
import 'package:ects_tracker/src/models/models.dart';
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

  group('deleteCourse/deleteSession not-found contract (ECTS-042)', () {
    test('deleteCourse returns Ok for an existing id', () async {
      final id = (await courses.addCourse(name: 'Temp', ectsCredits: 3) as Ok<int>).value;
      final res = await courses.deleteCourse(id);
      expect(res, isA<Ok<void>>());
      expect(await courses.watchAll().first, isEmpty);
    });

    test('deleteCourse returns typed Err when no row matches', () async {
      final res = await courses.deleteCourse(9999);
      expect(res, isA<Err<void>>());
      expect((res as Err<void>).message, 'Course not found.');
    });

    test('deleteCourse returns Err for non-positive id', () async {
      expect((await courses.deleteCourse(0) as Err<void>).message, 'Course not found.');
      expect((await courses.deleteCourse(-1) as Err<void>).message, 'Course not found.');
    });

    test('deleteCourse returns Err when deleting an already-deleted course', () async {
      final id = (await courses.addCourse(name: 'Gone', ectsCredits: 3) as Ok<int>).value;
      expect(await courses.deleteCourse(id), isA<Ok<void>>());
      final res = await courses.deleteCourse(id);
      expect(res, isA<Err<void>>());
      expect((res as Err<void>).message, 'Course not found.');
    });

    test('deleteSession returns Ok for an existing id', () async {
      final courseId =
          (await courses.addCourse(name: 'C', ectsCredits: 5) as Ok<int>).value;
      final sid = (await sessions.addSession(
        courseId: courseId,
        minutes: 30,
        date: DateTime(2026, 11, 1),
      ) as Ok<int>)
          .value;
      final res = await sessions.deleteSession(sid);
      expect(res, isA<Ok<void>>());
      expect(await sessions.watchAll().first, isEmpty);
    });

    test('deleteSession returns typed Err when no row matches', () async {
      final res = await sessions.deleteSession(9999);
      expect(res, isA<Err<void>>());
      expect((res as Err<void>).message, 'Session not found.');
    });

    test('deleteSession returns Err for non-positive id', () async {
      expect((await sessions.deleteSession(0) as Err<void>).message, 'Session not found.');
      expect((await sessions.deleteSession(-1) as Err<void>).message, 'Session not found.');
    });
  });

  group('deleteCourse transaction boundary/guard (ECTS-043)', () {
    test('removes course and all its sessions atomically', () async {
      final id =
          (await courses.addCourse(name: 'Guarded', ectsCredits: 6) as Ok<int>)
              .value;
      await sessions.addSession(
          courseId: id, minutes: 30, date: DateTime(2026, 11, 1));
      await sessions.addSession(
          courseId: id, minutes: 45, date: DateTime(2026, 11, 2));
      await sessions.addSession(
          courseId: id, minutes: 60, date: DateTime(2026, 11, 3));

      final res = await courses.deleteCourse(id);
      expect(res, isA<Ok<void>>());
      expect(await courses.watchAll().first, isEmpty);
      expect(await sessions.watchAll().first, isEmpty);
    });

    test('deletes only target course sessions; other courses untouched', () async {
      final a =
          (await courses.addCourse(name: 'A', ectsCredits: 3) as Ok<int>).value;
      final b =
          (await courses.addCourse(name: 'B', ectsCredits: 3) as Ok<int>).value;
      await sessions.addSession(
          courseId: a, minutes: 20, date: DateTime(2026, 11, 1));
      await sessions.addSession(
          courseId: b, minutes: 40, date: DateTime(2026, 11, 1));
      await sessions.addSession(
          courseId: b, minutes: 50, date: DateTime(2026, 11, 2));

      final res = await courses.deleteCourse(a);
      expect(res, isA<Ok<void>>());
      final remainingCourses = await courses.watchAll().first;
      expect(remainingCourses.map((c) => c.id), [b]);
      final remainingSessions = await sessions.watchAll().first;
      expect(remainingSessions.length, 2);
      expect(remainingSessions.every((s) => s.courseId == b), isTrue);
    });

    test('succeeds for a course with no sessions (boundary is safe)', () async {
      final id =
          (await courses.addCourse(name: 'Empty', ectsCredits: 3) as Ok<int>)
              .value;
      final res = await courses.deleteCourse(id);
      expect(res, isA<Ok<void>>());
      expect(await courses.watchAll().first, isEmpty);
    });
  });

  group('SettingsRepository.get() (ECTS-045)', () {
    late SettingsRepository settings;

    setUp(() {
      settings = SettingsRepository(db);
    });

    test('returns default settings when no row exists', () async {
      final s = await settings.get();
      expect(s.hoursPerEcts, 30);
      expect(s.dailyTargetMinutes, 0);
    });

    test('returns persisted settings after writes', () async {
      await settings.setHoursPerEcts(25);
      await settings.setDailyTargetMinutes(90);

      final s = await settings.get();
      expect(s.hoursPerEcts, 25);
      expect(s.dailyTargetMinutes, 90);
    });

    test('matches watch() for the same state', () async {
      await settings.setDailyTargetMinutes(45);
      final fromGet = await settings.get();
      final fromWatch = await settings.watch().first;
      expect(fromGet.hoursPerEcts, fromWatch.hoursPerEcts);
      expect(fromGet.dailyTargetMinutes, fromWatch.dailyTargetMinutes);
    });
  });

  group('sample-data scoped queries and delete (ECTS-027)', () {
    test('deleteSampleData removes sample courses and sessions, keeps user rows',
        () async {
      final sampleCourse =
          (await courses.addCourse(name: 'Sample C', ectsCredits: 5, isSample: true)
                  as Ok<int>)
              .value;
      final userCourse =
          (await courses.addCourse(name: 'User C', ectsCredits: 6) as Ok<int>)
              .value;
      await sessions.addSession(
        courseId: sampleCourse,
        minutes: 30,
        date: DateTime(2026, 1, 1),
        isSample: true,
      );
      await sessions.addSession(
        courseId: userCourse,
        minutes: 45,
        date: DateTime(2026, 1, 2),
      );

      final res = await courses.deleteSampleData();
      expect(res, isA<Ok<void>>());

      final allCourses = await courses.watchAll().first;
      expect(allCourses.map((c) => c.name), ['User C']);
      expect(allCourses.single.isSample, isFalse);
      final allSessions = await sessions.watchAll().first;
      expect(allSessions.single.minutes, 45);
      expect(allSessions.single.courseId, userCourse);
      expect(allSessions.single.isSample, isFalse);
    });

    test('keeps a sample course that still owns user sessions (no FK orphan)',
        () async {
      final sampleCourse =
          (await courses.addCourse(name: 'Sample', ectsCredits: 5, isSample: true)
                  as Ok<int>)
              .value;
      await sessions.addSession(
        courseId: sampleCourse,
        minutes: 20,
        date: DateTime(2026, 1, 1),
        isSample: true,
      );
      await sessions.addSession(
        courseId: sampleCourse,
        minutes: 40,
        date: DateTime(2026, 1, 2),
      ); // user session on sample course

      final res = await courses.deleteSampleData();
      expect(res, isA<Ok<void>>());

      final allCourses = await courses.watchAll().first;
      expect(allCourses, hasLength(1));
      expect(allCourses.single.id, sampleCourse);
      expect(allCourses.single.isSample, isTrue);
      final allSessions = await sessions.watchAll().first;
      expect(allSessions, hasLength(1));
      expect(allSessions.single.minutes, 40);
      expect(allSessions.single.isSample, isFalse);
      expect(allSessions.single.courseId, sampleCourse);
    });

    test('removes sample sessions on a user course, keeps the user course',
        () async {
      final userCourse =
          (await courses.addCourse(name: 'Mine', ectsCredits: 3) as Ok<int>).value;
      await sessions.addSession(
        courseId: userCourse,
        minutes: 15,
        date: DateTime(2026, 1, 1),
        isSample: true,
      );
      await sessions.addSession(
        courseId: userCourse,
        minutes: 25,
        date: DateTime(2026, 1, 2),
      );

      final res = await courses.deleteSampleData();
      expect(res, isA<Ok<void>>());

      expect((await courses.watchAll().first).single.name, 'Mine');
      final remaining = await sessions.watchAll().first;
      expect(remaining.single.minutes, 25);
      expect(remaining.single.isSample, isFalse);
    });

    test('watchSample exposes only sample rows', () async {
      await courses.addCourse(name: 'Sample A', ectsCredits: 5, isSample: true);
      await courses.addCourse(name: 'User A', ectsCredits: 5);
      final sampleCourse =
          (await courses.addCourse(name: 'Sample B', ectsCredits: 4, isSample: true)
                  as Ok<int>)
              .value;
      final userCourse =
          (await courses.addCourse(name: 'User B', ectsCredits: 4) as Ok<int>)
              .value;
      await sessions.addSession(
        courseId: sampleCourse,
        minutes: 10,
        date: DateTime(2026, 1, 1),
        isSample: true,
      );
      await sessions.addSession(
        courseId: userCourse,
        minutes: 10,
        date: DateTime(2026, 1, 1),
      );

      expect((await courses.watchSample().first).map((c) => c.name),
          ['Sample A', 'Sample B']);
      expect((await sessions.watchSample().first).length, 1);
      expect((await sessions.watchSample().first).single.isSample, isTrue);
    });

    test('deleteSampleData on an empty database is Ok', () async {
      final res = await courses.deleteSampleData();
      expect(res, isA<Ok<void>>());
    });
  });


  group('DB-fault Result<T> contract (ECTS-039)', () {
    late AppDatabase faultDb;
    late CourseRepository faultCourses;
    late SessionRepository faultSessions;
    late SettingsRepository faultSettings;

    setUp(() {
      // The executor fails on first open, simulating an unavailable/corrupt DB.
      // Repositories must catch and return Err (AGENTS.md §3), never throw.
      faultDb = AppDatabase(LazyDatabase(() async {
        throw StateError('database unavailable');
      }));
      faultCourses = CourseRepository(faultDb);
      faultSessions = SessionRepository(faultDb);
      faultSettings = SettingsRepository(faultDb);
    });

    tearDown(() async {
      // Ignore close errors from a DB that never opened.
      try {
        await faultDb.close();
      } catch (_) {}
    });

    void expectErr<T>(Result<T> res, String prefixFragment) {
      expect(res, isA<Err<T>>());
      final message = (res as Err<T>).message;
      expect(message, isNotEmpty);
      expect(message, contains(prefixFragment));
      // Human-readable, not a raw throw site marker.
      expect(message, isNot(contains('Instance of')));
    }

    test('addCourse returns Err, never throws', () async {
      final res = await faultCourses.addCourse(name: 'X', ectsCredits: 5);
      expectErr<int>(res, 'Failed to add course');
    });

    test('deleteCourse returns Err, never throws', () async {
      final res = await faultCourses.deleteCourse(1);
      expectErr<void>(res, 'Failed to delete course');
    });

    test('deleteSampleData returns Err, never throws', () async {
      final res = await faultCourses.deleteSampleData();
      expectErr<void>(res, 'Failed to clear sample data');
    });

    test('addSession returns Err on DB fault (course lookup), never throws',
        () async {
      // addSession validates the course reference first; on an unavailable DB
      // that lookup fails and is surfaced as a typed Err, not an exception.
      final res = await faultSessions.addSession(
        courseId: 1,
        minutes: 30,
        date: DateTime(2026, 1, 1),
      );
      expect(res, isA<Err<int>>());
      final message = (res as Err<int>).message;
      expect(message, isNotEmpty);
      expect(message, contains('Failed to look up course'));
    });

    test('deleteSession returns Err, never throws', () async {
      final res = await faultSessions.deleteSession(1);
      expectErr<void>(res, 'Failed to delete session');
    });

    test('setHoursPerEcts returns Err, never throws', () async {
      final res = await faultSettings.setHoursPerEcts(25);
      expectErr<void>(res, 'Failed to save settings');
    });

    test('watchAll/watchSample/watch do not throw synchronously', () {
      // Streams cannot return Result<T>; the contract here is that creating
      // the stream does not throw across the layer at the call site. Any
      // underlying DB error is delivered through the stream.
      expect(() => faultCourses.watchAll(), returnsNormally);
      expect(() => faultCourses.watchSample(), returnsNormally);
      expect(() => faultSessions.watchAll(), returnsNormally);
      expect(() => faultSessions.watchSample(), returnsNormally);
      expect(() => faultSettings.watch(), returnsNormally);
    });
  });

  group('sample-aware read/count and hasSampleData (ECTS-029)', () {
    test('zero sample rows: counts 0 and hasSampleData false', () async {
      await courses.addCourse(name: 'User', ectsCredits: 5);
      final cid =
          (await courses.addCourse(name: 'User2', ectsCredits: 3) as Ok<int>).value;
      await sessions.addSession(
          courseId: cid, minutes: 30, date: DateTime(2026, 1, 1));

      expect(await courses.countSample(), 0);
      expect(await sessions.countSample(), 0);
      expect(await courses.watchSampleCount().first, 0);
      expect(await sessions.watchSampleCount().first, 0);
      expect(await courses.hasSampleData(), isFalse);
    });

    test('sample rows coexisting with user rows: only sample counted/watched',
        () async {
      final userCourse =
          (await courses.addCourse(name: 'User', ectsCredits: 5) as Ok<int>).value;
      await courses.addCourse(name: 'Sample A', ectsCredits: 4, isSample: true);
      final sampleCourse =
          (await courses.addCourse(name: 'Sample B', ectsCredits: 6, isSample: true)
                  as Ok<int>)
              .value;
      await sessions.addSession(
          courseId: userCourse, minutes: 10, date: DateTime(2026, 1, 1));
      await sessions.addSession(
          courseId: sampleCourse,
          minutes: 20,
          date: DateTime(2026, 1, 1),
          isSample: true);

      expect(await courses.countSample(), 2);
      expect(await sessions.countSample(), 1);
      expect(await courses.watchSampleCount().first, 2);
      expect(await sessions.watchSampleCount().first, 1);
      expect((await courses.watchSample().first).map((c) => c.name),
          ['Sample A', 'Sample B']);
      expect(await courses.hasSampleData(), isTrue);
    });

    test('empty signal after deleteSampleData clears all sample rows', () async {
      final sampleCourse =
          (await courses.addCourse(name: 'Sample', ectsCredits: 5, isSample: true)
                  as Ok<int>)
              .value;
      await sessions.addSession(
          courseId: sampleCourse,
          minutes: 30,
          date: DateTime(2026, 1, 1),
          isSample: true);

      expect(await courses.hasSampleData(), isTrue);

      final res = await courses.deleteSampleData();
      expect(res, isA<Ok<void>>());

      expect(await courses.countSample(), 0);
      expect(await sessions.countSample(), 0);
      expect(await courses.hasSampleData(), isFalse);
    });

    test('hasSampleData true when a sample course is kept (owns user sessions)',
        () async {
      final sampleCourse =
          (await courses.addCourse(name: 'Sample', ectsCredits: 5, isSample: true)
                  as Ok<int>)
              .value;
      await sessions.addSession(
          courseId: sampleCourse,
          minutes: 40,
          date: DateTime(2026, 1, 2)); // user session keeps course alive

      await courses.deleteSampleData();
      // Sample marker remains on the kept course.
      expect(await courses.hasSampleData(), isTrue);
      expect(await courses.countSample(), 1);
    });
  });

  group('DB-fault Result<T> contract (ECTS-046)', () {
    late AppDatabase faultDb;
    late CourseRepository faultCourses;
    late SessionRepository faultSessions;
    late SettingsRepository faultSettings;

    setUp(() {
      // Same fault simulation as ECTS-039: executor fails on first open.
      // Methods added after ECTS-039 must also never throw across layers.
      faultDb = AppDatabase(LazyDatabase(() async {
        throw StateError('database unavailable');
      }));
      faultCourses = CourseRepository(faultDb);
      faultSessions = SessionRepository(faultDb);
      faultSettings = SettingsRepository(faultDb);
    });

    tearDown(() async {
      try {
        await faultDb.close();
      } catch (_) {}
    });

    void expectErr<T>(Result<T> res, String prefixFragment) {
      expect(res, isA<Err<T>>());
      final message = (res as Err<T>).message;
      expect(message, isNotEmpty);
      expect(message, contains(prefixFragment));
      expect(message, isNot(contains('Instance of')));
    }

    test('updateCourse returns Err, never throws', () async {
      final res = await faultCourses.updateCourse(
        id: 1,
        name: 'X',
        ectsCredits: 5,
      );
      expectErr<void>(res, 'Failed to update course');
    });

    test('updateSession returns Err on DB fault (course lookup), never throws',
        () async {
      // updateSession validates the target course reference first; on an
      // unavailable DB that lookup fails and is surfaced as a typed Err.
      final res = await faultSessions.updateSession(
        id: 1,
        courseId: 1,
        minutes: 30,
        date: DateTime(2026, 1, 1),
      );
      expect(res, isA<Err<void>>());
      final message = (res as Err<void>).message;
      expect(message, isNotEmpty);
      expect(message, contains('Failed to look up course'));
    });

    test('setDailyTargetMinutes returns Err, never throws', () async {
      final res = await faultSettings.setDailyTargetMinutes(60);
      expectErr<void>(res, 'Failed to save settings');
    });

    test(
        'get() returns defaults and never throws on DB fault (non-Result API)',
        () async {
      // SettingsRepository.get() is a Future<AppSettings> (ECTS-045), so it
      // cannot return Err<T>; the AGENTS.md §3 contract is satisfied by
      // catching DB faults and returning safe defaults without throwing.
      final s = await faultSettings.get();
      expect(s.hoursPerEcts, 30);
      expect(s.dailyTargetMinutes, 0);
    });
  });

  group('Settings recalc preserves sessions (ECTS-018)', () {
    late SettingsRepository settings;

    setUp(() {
      settings = SettingsRepository(db);
    });

    test(
        'hoursPerEcts change rescales every course required hours and keeps all '
        'logged sessions (end-to-end over in-memory DB)', () async {
      // Seed two courses with different ECTS loads and log sessions on both.
      final algorithmsId =
          (await courses.addCourse(name: 'Algorithms', ectsCredits: 6) as Ok<int>)
              .value;
      final databasesId =
          (await courses.addCourse(name: 'Databases', ectsCredits: 5) as Ok<int>)
              .value;
      await courses.addCourse(name: 'Seminar', ectsCredits: 3);

      final s1 = await sessions.addSession(
        courseId: algorithmsId,
        minutes: 90,
        date: DateTime(2026, 10, 1),
        notes: 'lecture 1',
      );
      final s2 = await sessions.addSession(
        courseId: algorithmsId,
        minutes: 60,
        date: DateTime(2026, 10, 2),
      );
      final s3 = await sessions.addSession(
        courseId: databasesId,
        minutes: 45,
        date: DateTime(2026, 10, 3),
        notes: 'lab',
      );
      expect(s1, isA<Ok<int>>());
      expect(s2, isA<Ok<int>>());
      expect(s3, isA<Ok<int>>());

      final coursesBefore = await courses.watchAll().first;
      final sessionsBefore = await sessions.watchAll().first;
      expect(coursesBefore, hasLength(3));
      expect(sessionsBefore, hasLength(3));

      const defaultFactor = 30.0;
      expect((await settings.get()).hoursPerEcts, defaultFactor);

      double totalRequired(double factor) => coursesBefore.fold<double>(
            0,
            (sum, c) => sum + ects.requiredHours(c.ectsCredits, factor),
          );

      // At the default factor: 6*30 + 5*30 + 3*30 = 420.
      expect(totalRequired(defaultFactor), 420);
      expect(ects.requiredHours(6, defaultFactor), 180);
      expect(ects.requiredHours(5, defaultFactor), 150);
      expect(ects.requiredHours(3, defaultFactor), 90);

      // Change the ECTS conversion factor via the settings repository. This must
      // never delete or mutate logged sessions (AGENTS.md §4).
      final change = await settings.setHoursPerEcts(25);
      expect(change, isA<Ok<void>>());
      expect((await settings.get()).hoursPerEcts, 25);

      // Every course's requirement is recomputed (derived, never stored) with
      // the new factor: 6*25 + 5*25 + 3*25 = 350.
      final coursesAfter = await courses.watchAll().first;
      expect(coursesAfter, hasLength(3));
      double totalRequiredAfter(double factor) => coursesAfter.fold<double>(
            0,
            (sum, c) => sum + ects.requiredHours(c.ectsCredits, factor),
          );
      expect(totalRequiredAfter(25), 350);
      final byName = {for (final c in coursesAfter) c.name: c};
      expect(ects.requiredHours(byName['Algorithms']!.ectsCredits, 25), 150);
      expect(ects.requiredHours(byName['Databases']!.ectsCredits, 25), 125);
      expect(ects.requiredHours(byName['Seminar']!.ectsCredits, 25), 75);
      // Old-factor totals no longer describe the current requirement.
      expect(totalRequiredAfter(defaultFactor), 420);

      // All logged sessions are preserved, byte-for-byte in meaning: same count,
      // same ids/course links/durations/dates/notes.
      final sessionsAfter = await sessions.watchAll().first;
      expect(sessionsAfter, hasLength(3));
      final byId = {for (final s in sessionsAfter) s.id: s};
      expect(byId[(s1 as Ok<int>).value]!.minutes, 90);
      expect(byId[(s1).value]!.courseId, algorithmsId);
      expect(byId[(s1).value]!.notes, 'lecture 1');
      expect(byId[(s1).value]!.date, DateTime(2026, 10, 1));
      expect(byId[(s2 as Ok<int>).value]!.minutes, 60);
      expect(byId[(s2).value]!.courseId, algorithmsId);
      expect(byId[(s3 as Ok<int>).value]!.minutes, 45);
      expect(byId[(s3).value]!.courseId, databasesId);
      expect(byId[(s3).value]!.notes, 'lab');

      // Completed hours remain the sum of preserved sessions (195 min = 3.25 h),
      // independent of the factor change.
      expect(ects.completedHours(sessionsAfter), closeTo(3.25, 1e-9));
    });
  });

  group('ECTS-011 settings + backup', () {
    late SettingsRepository settings;
    late BackupRepository backup;

    setUp(() {
      settings = SettingsRepository(db);
      backup = BackupRepository(db);
    });

    test('persists and reads firstWeekday and themeMode', () async {
      expect((await settings.get()).firstWeekday, DateTime.monday);
      expect((await settings.get()).themeMode, AppThemeMode.system);

      final w = await settings.setFirstWeekday(DateTime.sunday);
      expect(w, isA<Ok<void>>());
      final t = await settings.setThemeMode(AppThemeMode.dark);
      expect(t, isA<Ok<void>>());

      final current = await settings.get();
      expect(current.firstWeekday, DateTime.sunday);
      expect(current.themeMode, AppThemeMode.dark);

      final watched = await settings.watch().first;
      expect(watched.firstWeekday, DateTime.sunday);
      expect(watched.themeMode, AppThemeMode.dark);
    });

    test('rejects invalid firstWeekday', () async {
      expect(await settings.setFirstWeekday(0), isA<Err<void>>());
      expect(await settings.setFirstWeekday(8), isA<Err<void>>());
      expect((await settings.get()).firstWeekday, DateTime.monday);
    });

    test('resetToDefaults restores defaults and keeps data rows untouched', () async {
      await settings.setHoursPerEcts(25);
      await settings.setDailyTargetMinutes(120);
      await settings.setFirstWeekday(DateTime.sunday);
      await settings.setThemeMode(AppThemeMode.light);
      await courses.addCourse(name: 'Keep me', ectsCredits: 5);

      final res = await settings.resetToDefaults();
      expect(res, isA<Ok<void>>());
      final current = await settings.get();
      expect(current.hoursPerEcts, AppSettings.defaultHoursPerEcts);
      expect(current.dailyTargetMinutes, 0);
      expect(current.firstWeekday, DateTime.monday);
      expect(current.themeMode, AppThemeMode.system);
      expect(await courses.watchAll().first, hasLength(1));
    });

    test('exportJson/importJson round-trip restores data', () async {
      await settings.setHoursPerEcts(28);
      await settings.setDailyTargetMinutes(45);
      await settings.setFirstWeekday(DateTime.sunday);
      await settings.setThemeMode(AppThemeMode.dark);
      final c1 = await courses.addCourse(
        name: 'Algorithms',
        ectsCredits: 6,
        notes: 'n1',
      );
      final c2 = await courses.addCourse(name: 'Math', ectsCredits: 5);
      final c1Id = (c1 as Ok<int>).value;
      await sessions.addSession(
        courseId: c1Id,
        minutes: 90,
        date: DateTime(2026, 5, 1),
        notes: 's1',
      );
      await sessions.addSession(
        courseId: (c2 as Ok<int>).value,
        minutes: 30,
        date: DateTime(2026, 5, 2),
      );

      final exported = await backup.exportJson();
      expect(exported, isA<Ok<String>>());
      final json = (exported as Ok<String>).value;
      expect(json, contains('Algorithms'));
      expect(json, contains('"hoursPerEcts"'));

      final wiped = await backup.resetAllData();
      expect(wiped, isA<Ok<void>>());
      expect(await courses.watchAll().first, isEmpty);

      final imported = await backup.importJson(json);
      expect(imported, isA<Ok<void>>());
      final restoredSettings = await settings.get();
      expect(restoredSettings.hoursPerEcts, 28);
      expect(restoredSettings.dailyTargetMinutes, 45);
      expect(restoredSettings.firstWeekday, DateTime.sunday);
      expect(restoredSettings.themeMode, AppThemeMode.dark);
      final restoredCourses = await courses.watchAll().first;
      expect(restoredCourses.map((c) => c.name), containsAll(['Algorithms', 'Math']));
      final restoredSessions = await sessions.watchAll().first;
      expect(restoredSessions, hasLength(2));
      expect(restoredSessions.any((s) => s.minutes == 90 && s.notes == 's1'), isTrue);
    });

    test('importJson rejects invalid payloads without mutating data', () async {
      await courses.addCourse(name: 'Keep', ectsCredits: 3);
      expect(await backup.importJson('not json'), isA<Err<void>>());
      expect(await backup.importJson('{}'), isA<Err<void>>());
      expect(await courses.watchAll().first, hasLength(1));
    });

    test('resetAllData clears courses, sessions, and settings', () async {
      await settings.setHoursPerEcts(25);
      final c = await courses.addCourse(name: 'X', ectsCredits: 1);
      await sessions.addSession(
          courseId: (c as Ok<int>).value, minutes: 10, date: DateTime(2026, 1, 1));
      final res = await backup.resetAllData();
      expect(res, isA<Ok<void>>());
      expect(await courses.watchAll().first, isEmpty);
      expect(await sessions.watchAll().first, isEmpty);
      expect((await settings.get()).hoursPerEcts, AppSettings.defaultHoursPerEcts);
    });
  });
}
