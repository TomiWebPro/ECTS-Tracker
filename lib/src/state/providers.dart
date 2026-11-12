import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/app_database.dart';
import '../data/connection.dart';
import '../data/repositories.dart';
import '../models/models.dart';
import '../models/reminder_settings.dart';
import '../notifications/reminder_prefs.dart';
import '../notifications/reminder_service.dart';

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

final backupRepositoryProvider = Provider<BackupRepository>(
  (ref) => BackupRepository(ref.watch(databaseProvider)),
);

final devPumpRepositoryProvider = Provider<DevPumpRepository>(
  (ref) => DevPumpRepository(ref.watch(databaseProvider)),
);

/// Hidden dev mode (unlocked by tapping the Data section icon 10× rapidly).
/// In-memory only: never persisted, never exported.
final devModeProvider = StateProvider<bool>((ref) => false);

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
final hasSampleDataProvider = Provider<AsyncValue<bool>>((ref) {
  final courses = ref.watch(sampleCoursesProvider);
  final sessions = ref.watch(sampleSessionsProvider);
  if (courses.hasError) {
    return AsyncValue.error(courses.error!, courses.stackTrace ?? StackTrace.empty);
  }
  if (sessions.hasError) {
    return AsyncValue.error(sessions.error!, sessions.stackTrace ?? StackTrace.empty);
  }
  if (!courses.hasValue || !sessions.hasValue) {
    return const AsyncValue<bool>.loading();
  }
  return AsyncValue.data(
    courses.value!.isNotEmpty || sessions.value!.isNotEmpty,
  );
});

/// Reminder preferences (M9, ECTS-072). SharedPreferences-backed, so this
/// works without a Drift migration. Invalidate after every save.
final reminderSettingsProvider = FutureProvider<ReminderSettings>(
  (ref) => ReminderPrefsRepository().load(),
);

/// Shared [ReminderPrefsRepository] instance (single home — no per-call
/// `ReminderPrefsRepository()` in UI, one SharedPreferences handle).
final reminderPrefsProvider = Provider<ReminderPrefsRepository>(
  (ref) => ReminderPrefsRepository(),
);

/// Real OS notification backend, created once (tz init + plugin init).
/// Tests override with a fake.
final notificationBackendProvider = FutureProvider<NotificationBackend>(
  (ref) => RealNotificationBackend.create(),
);
