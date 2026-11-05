import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/app_database.dart';
import '../data/connection.dart';
import '../data/repositories.dart';
import '../models/models.dart';

/// The single app-wide database instance.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase(openConnection());
  ref.onDispose(db.close);
  return db;
});

final courseRepositoryProvider = Provider<CourseRepository>(
  (ref) => CourseRepository(ref.watch(databaseProvider)),
);

final sessionRepositoryProvider = Provider<SessionRepository>(
  (ref) => SessionRepository(ref.watch(databaseProvider)),
);

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SettingsRepository(ref.watch(databaseProvider)),
);

final coursesProvider = StreamProvider<List<Course>>(
  (ref) => ref.watch(courseRepositoryProvider).watchAll(),
);

final sessionsProvider = StreamProvider<List<StudySession>>(
  (ref) => ref.watch(sessionRepositoryProvider).watchAll(),
);

final settingsProvider = StreamProvider<AppSettings>(
  (ref) => ref.watch(settingsRepositoryProvider).watch(),
);

/// Sample-scoped streams (ECTS-029) for the "clear sample data" affordance.
final sampleCoursesProvider = StreamProvider<List<Course>>(
  (ref) => ref.watch(courseRepositoryProvider).watchSample(),
);

final sampleSessionsProvider = StreamProvider<List<StudySession>>(
  (ref) => ref.watch(sessionRepositoryProvider).watchSample(),
);

/// True when any sample-marked course or session exists (ECTS-029). Reacts to
/// both sample streams so it becomes false after [CourseRepository.deleteSampleData]
/// clears all sample rows.
final hasSampleDataProvider = StreamProvider<bool>((ref) {
  final controller = StreamController<bool>();
  List<Course>? sampleCourses;
  List<StudySession>? sampleSessions;
  void emit() {
    if (sampleCourses != null && sampleSessions != null) {
      controller.add(sampleCourses!.isNotEmpty || sampleSessions!.isNotEmpty);
    }
  }

  final cSub = ref
      .watch(courseRepositoryProvider)
      .watchSample()
      .listen((v) {
    sampleCourses = v;
    emit();
  }, onError: controller.addError);
  final sSub = ref
      .watch(sessionRepositoryProvider)
      .watchSample()
      .listen((v) {
    sampleSessions = v;
    emit();
  }, onError: controller.addError);
  ref.onDispose(() {
    cSub.cancel();
    sSub.cancel();
    controller.close();
  });
  return controller.stream;
});
