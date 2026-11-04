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
}
