import 'dart:convert';

import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late CourseRepository courses;
  late SessionRepository sessions;
  late SettingsRepository settings;
  late BackupRepository backup;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    courses = CourseRepository(db);
    sessions = SessionRepository(db);
    settings = SettingsRepository(db);
    backup = BackupRepository(db);
  });

  tearDown(() async => db.close());

  Future<String> seedExport() async {
    final c1 = (await courses.addCourse(name: 'Alpha', ectsCredits: 6)
        as Ok<int>)
        .value;
    await sessions.addSession(
        courseId: c1, minutes: 60, date: DateTime(2026, 5, 1));
    final exported = await backup.exportJson();
    expect(exported, isA<Ok<String>>());
    return (exported as Ok<String>).value;
  }

  test('export envelope carries app, formatVersion, dbSchema', () async {
    final json = await seedExport();
    final decoded = jsonDecode(json) as Map;
    expect(decoded['app'], backupAppId);
    expect(decoded['formatVersion'], backupFormatVersion);
    expect(decoded['dbSchema'], db.schemaVersion);
  });

  test('same-data re-import (replace) works twice without crashing',
      () async {
    final json = await seedExport();
    expect(await backup.importJson(json), isA<Ok<void>>());
    expect(await backup.importJson(json), isA<Ok<void>>());
    expect(await courses.watchAll().first, hasLength(1));
    expect(await sessions.watchAll().first, hasLength(1));
  });

  test('previewImport accepts own export', () async {
    final json = await seedExport();
    final preview = await backup.previewImport(json);
    expect(preview, isA<Ok<BackupPreview>>());
    final p = (preview as Ok<BackupPreview>).value;
    expect(p.courses, 1);
    expect(p.sessions, 1);
  });

  test('import rejects foreign app id without mutating', () async {
    await courses.addCourse(name: 'Keep', ectsCredits: 3);
    final payload = jsonEncode({
      'app': 'something-else',
      'courses': [],
      'sessions': [],
    });
    final res = await backup.importJson(payload);
    expect(res, isA<Err<void>>());
    expect(await courses.watchAll().first, hasLength(1));
  });

  test('import rejects newer formatVersion without mutating', () async {
    await courses.addCourse(name: 'Keep', ectsCredits: 3);
    final payload = jsonEncode({
      'app': backupAppId,
      'formatVersion': 999,
      'courses': [],
      'sessions': [],
    });
    final res = await backup.importJson(payload);
    expect(res, isA<Err<void>>());
    expect((res as Err<void>).message, contains('newer app'));
    expect(await courses.watchAll().first, hasLength(1));
  });

  test('import rejects session with unknown course link without mutating',
      () async {
    await courses.addCourse(name: 'Keep', ectsCredits: 3);
    final payload = jsonEncode({
      'courses': [
        {'name': 'A', 'ectsCredits': 5},
      ],
      'sessions': [
        {'courseId': 424242, 'minutes': 30, 'date': '2026-05-01T10:00:00.000'},
      ],
    });
    final res = await backup.importJson(payload);
    expect(res, isA<Err<void>>());
    expect((res as Err<void>).message, contains('unknown course'));
    expect(await courses.watchAll().first, hasLength(1));
    expect(await sessions.watchAll().first, isEmpty);
  });

  test('append mode keeps existing data and remaps sessions', () async {
    final keepId =
        (await courses.addCourse(name: 'Keep', ectsCredits: 3) as Ok<int>)
            .value;
    await sessions.addSession(
        courseId: keepId, minutes: 15, date: DateTime(2026, 5, 2));

    final payload = jsonEncode({
      'app': backupAppId,
      'formatVersion': backupFormatVersion,
      'courses': [
        {'id': 1, 'name': 'Added', 'ectsCredits': 5},
      ],
      'sessions': [
        {'courseId': 1, 'minutes': 45, 'date': '2026-05-03T10:00:00.000'},
      ],
    });
    final res = await backup.importJson(payload, mode: ImportMode.append);
    expect(res, isA<Ok<void>>());

    final allCourses = await courses.watchAll().first;
    expect(
        allCourses.map((c) => c.name), containsAll(['Keep', 'Added']));
    final allSessions = await sessions.watchAll().first;
    expect(allSessions, hasLength(2));
    // Appended session must point at the fresh "Added" row, not payload id 1.
    final added = allCourses.firstWhere((c) => c.name == 'Added');
    expect(allSessions.any((s) => s.courseId == added.id && s.minutes == 45),
        isTrue);
    // Settings untouched by append (still defaults here).
    expect((await settings.get()).hoursPerEcts, 30);
  });
}
