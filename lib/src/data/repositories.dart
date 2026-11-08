import 'dart:convert';

import 'package:drift/drift.dart';

import '../dev/stress_seed.dart';
import '../i18n/app_locales.dart';
import '../models/models.dart';
import 'app_database.dart';

/// Result wrapper: repositories return errors as values, never throw across
/// layers (AGENTS.md §3).
sealed class Result<T> {
  const Result();
}

class Ok<T> extends Result<T> {
  const Ok(this.value);
  final T value;
}

class Err<T> extends Result<T> {
  const Err(this.message);
  final String message;
}

/// Maps a DB row to the plain model.
Course courseFromRow(CourseRow row) => Course(
      id: row.id,
      name: row.name,
      ectsCredits: row.ectsCredits,
      startDate: row.startDate,
      deadline: row.deadline,
      notes: row.notes,
      colorValue: row.colorValue,
      isSample: row.isSample,
      startEarly: row.startEarly,
    );

/// Maps a session row to the plain model.
StudySession sessionFromRow(SessionRow row) => StudySession(
      id: row.id,
      courseId: row.courseId,
      minutes: row.minutes,
      date: row.date,
      notes: row.notes,
      isSample: row.isSample,
    );

/// Matches the `Courses.name` column constraint (`text().withLength(1, 200)`),
/// checked at the boundary so an over-long name is a domain error rather than
/// a raw DB fault.
const int courseNameMaxLength = 200;

/// Domain validation shared by every course write path (AGENTS.md §3: the
/// boundary returns typed errors as values; the DB's own constraints are a
/// backstop, never the user-facing message).
///
/// Returns null when [name]/[ectsCredits]/[startDate]/[deadline] are
/// acceptable.
String? validateCourseInput({
  required String name,
  required double ectsCredits,
  DateTime? startDate,
  DateTime? deadline,
}) {
  final trimmed = name.trim();
  if (trimmed.isEmpty || trimmed.length > courseNameMaxLength) {
    return 'Name must be 1 to $courseNameMaxLength characters.';
  }
  if (ectsCredits <= 0) {
    return 'ECTS credits must be greater than zero.';
  }
  if (startDate != null && deadline != null) {
    if (!deadline.isAfter(startDate)) {
      return 'Deadline must be after start date.';
    }
  }
  return null;
}

class CourseRepository {
  CourseRepository(this._db);
  final AppDatabase _db;

  Stream<List<Course>> watchAll() =>
      _db.select(_db.courses).watch().map((rows) => rows.map(courseFromRow).toList());

  /// Watches only seeded sample courses (AGENTS.md §4 / ECTS-027,029).
  Stream<List<Course>> watchSample() => (_db.select(_db.courses)
        ..where((t) => t.isSample.equals(true)))
      .watch()
      .map((rows) => rows.map(courseFromRow).toList());

  /// Sample course count, reactive (ECTS-029).
  Stream<int> watchSampleCount() =>
      watchSample().map((rows) => rows.length);

  /// One-shot sample course count (ECTS-029). Returns 0 on DB fault.
  Future<int> countSample() async {
    try {
      final rows = await (_db.select(_db.courses)
            ..where((t) => t.isSample.equals(true)))
          .get();
      return rows.length;
    } catch (_) {
      return 0;
    }
  }

  /// True when any sample-marked course or session exists (ECTS-029). Checks
  /// both tables so the "clear sample data" action can decide whether to offer
  /// itself; reflects [deleteSampleData]'s outcome (a kept sample course that
  /// still owns user sessions remains sample-marked). Returns false on DB fault.
  Future<bool> hasSampleData() async {
    try {
      final c = await (_db.select(_db.courses)
            ..where((t) => t.isSample.equals(true))
            ..limit(1))
          .getSingleOrNull();
      if (c != null) return true;
      final s = await (_db.select(_db.studySessions)
            ..where((t) => t.isSample.equals(true))
            ..limit(1))
          .getSingleOrNull();
      return s != null;
    } catch (_) {
      return false;
    }
  }

  Future<Result<int>> addCourse({
    required String name,
    required double ectsCredits,
    DateTime? startDate,
    DateTime? deadline,
    String? notes,
    int? colorValue,
    bool isSample = false,
    bool startEarly = false,
  }) async {
    final invalid = validateCourseInput(
      name: name,
      ectsCredits: ectsCredits,
      startDate: startDate,
      deadline: deadline,
    );
    if (invalid != null) return Err(invalid);
    try {
      final id = await _db.into(_db.courses).insert(
            CoursesCompanion.insert(
              name: name.trim(),
              ectsCredits: ectsCredits,
              startDate: Value(startDate),
              deadline: Value(deadline),
              notes: Value(notes),
              colorValue: Value(colorValue),
              isSample: Value(isSample),
              startEarly: Value(startEarly),
            ),
          );
      return Ok(id);
    } catch (e) {
      return Err('Failed to add course: $e');
    }
  }

  /// Updates an existing course's editable fields. Returns [Err] when the input
  /// is invalid (same boundary rules as [addCourse]) or when no course with [id]
  /// exists, so callers can distinguish "not found" from a DB fault.
  Future<Result<void>> updateCourse({
    required int id,
    required String name,
    required double ectsCredits,
    DateTime? startDate,
    DateTime? deadline,
    String? notes,
    int? colorValue,
    bool? startEarly,
  }) async {
    final invalid = validateCourseInput(
      name: name,
      ectsCredits: ectsCredits,
      startDate: startDate,
      deadline: deadline,
    );
    if (invalid != null) return Err(invalid);
    if (id <= 0) return const Err('Course not found.');
    try {
      final affected = await (_db.update(_db.courses)
            ..where((t) => t.id.equals(id)))
          .write(
        CoursesCompanion(
          name: Value(name.trim()),
          ectsCredits: Value(ectsCredits),
          startDate: Value(startDate),
          deadline: Value(deadline),
          notes: Value(notes),
          colorValue: Value(colorValue),
          startEarly:
              startEarly == null ? const Value.absent() : Value(startEarly),
        ),
      );
      if (affected == 0) return const Err('Course not found.');
      return const Ok(null);
    } catch (e) {
      return Err('Failed to update course: $e');
    }
  }

  /// Deletes a course and its sessions in an explicit transaction boundary
  /// (ECTS-043 guard): session rows are removed before the course row so cascade
  /// is controlled/atomic, preventing partial state. Preserves the not-found
  /// contract (ECTS-042).
  Future<Result<void>> deleteCourse(int id) async {
    if (id <= 0) return const Err('Course not found.');
    try {
      final affected = await _db.transaction(() async {
        await (_db.delete(_db.studySessions)
              ..where((t) => t.courseId.equals(id)))
            .go();
        return await (_db.delete(_db.courses)
              ..where((t) => t.id.equals(id)))
            .go();
      });
      if (affected == 0) return const Err('Course not found.');
      return const Ok(null);
    } catch (e) {
      return Err('Failed to delete course: $e');
    }
  }

  /// Removes all seeded sample data in a single transaction (AGENTS.md §4,
  /// ECTS-016/027): deletes sample sessions, then deletes sample courses that no
  /// longer have any sessions. User-logged rows (isSample false) are never
  /// touched; a sample course that still owns user sessions is kept so no user
  /// row is orphaned or cascade-deleted.
  Future<Result<void>> deleteSampleData() async {
    try {
      await _db.transaction(() async {
        await (_db.delete(_db.studySessions)
              ..where((t) => t.isSample.equals(true)))
            .go();
        // Delete sample courses with no remaining sessions (user sessions, if
        // any, keep their course alive).
        final occupied = _db.selectOnly(_db.studySessions)
          ..addColumns([_db.studySessions.courseId]);
        await (_db.delete(_db.courses)
              ..where((t) =>
                  t.isSample.equals(true) & t.id.isNotInQuery(occupied)))
            .go();
      });
      return const Ok(null);
    } catch (e) {
      return Err('Failed to clear sample data: $e');
    }
  }

  /// Deletes a single sample-marked course safely (ECTS-030): removes sample
  /// sessions on that course, and deletes the course only if no user sessions
  /// remain. Leaves user data intact.
  Future<Result<void>> deleteSampleCourse(int courseId) async {
    try {
      await _db.transaction(() async {
        await (_db.delete(_db.studySessions)
              ..where((t) => t.courseId.equals(courseId) & t.isSample.equals(true)))
            .go();
        final remainingRows = await (_db.select(_db.studySessions)
              ..where((t) => t.courseId.equals(courseId))
              ..limit(1))
            .get();
        if (remainingRows.isEmpty) {
          await (_db.delete(_db.courses)..where((t) => t.id.equals(courseId)))
              .go();
        }
      });
      return const Ok(null);
    } catch (e) {
      return Err('Failed to delete course: $e');
    }
  }
}

class SessionRepository {
  SessionRepository(this._db);
  final AppDatabase _db;

  /// Verifies the target course of a session exists (and that [courseId] is a
  /// plausible id). Checked at the boundary so a bad id is a typed domain error
  /// the caller can distinguish from a DB fault, instead of the generic
  /// `Failed to add session: $e` raised by a foreign-key violation.
  ///
  /// Returns null when the course exists.
  Future<String?> validateCourseReference(int courseId) async {
    if (courseId <= 0) return 'Course not found.';
    try {
      final row = await (_db.select(_db.courses)
            ..where((t) => t.id.equals(courseId))
            ..limit(1))
          .getSingleOrNull();
      return row == null ? 'Course not found.' : null;
    } catch (e) {
      return 'Failed to look up course: $e';
    }
  }

  Stream<List<StudySession>> watchAll() => _db
      .select(_db.studySessions)
      .watch()
      .map((rows) => rows.map(sessionFromRow).toList());

  /// Watches only seeded sample sessions (AGENTS.md §4 / ECTS-027,029).
  Stream<List<StudySession>> watchSample() => (_db.select(_db.studySessions)
        ..where((t) => t.isSample.equals(true)))
      .watch()
      .map((rows) => rows.map(sessionFromRow).toList());

  /// Sample session count, reactive (ECTS-029).
  Stream<int> watchSampleCount() =>
      watchSample().map((rows) => rows.length);

  /// One-shot sample session count (ECTS-029). Returns 0 on DB fault.
  Future<int> countSample() async {
    try {
      final rows = await (_db.select(_db.studySessions)
            ..where((t) => t.isSample.equals(true)))
          .get();
      return rows.length;
    } catch (_) {
      return 0;
    }
  }

  Future<Result<int>> addSession({
    required int courseId,
    required int minutes,
    required DateTime date,
    String? notes,
    bool isSample = false,
  }) async {
    if (minutes <= 0) return const Err('Duration must be greater than zero.');
    final missingCourse = await validateCourseReference(courseId);
    if (missingCourse != null) return Err(missingCourse);
    try {
      final id = await _db.into(_db.studySessions).insert(
            StudySessionsCompanion.insert(
              courseId: courseId,
              minutes: minutes,
              date: date,
              notes: Value(notes),
              isSample: Value(isSample),
            ),
          );
      return Ok(id);
    } catch (e) {
      return Err('Failed to add session: $e');
    }
  }

  /// Updates an existing session. Validates duration and the target course
  /// reference (same boundary rules as [addSession]) and returns [Err] when no
  /// session with [id] exists.
  Future<Result<void>> updateSession({
    required int id,
    required int courseId,
    required int minutes,
    required DateTime date,
    String? notes,
  }) async {
    if (minutes <= 0) return const Err('Duration must be greater than zero.');
    final missingCourse = await validateCourseReference(courseId);
    if (missingCourse != null) return Err(missingCourse);
    if (id <= 0) return const Err('Session not found.');
    try {
      final affected = await (_db.update(_db.studySessions)
            ..where((t) => t.id.equals(id)))
          .write(
        StudySessionsCompanion(
          courseId: Value(courseId),
          minutes: Value(minutes),
          date: Value(date),
          notes: Value(notes),
        ),
      );
      if (affected == 0) return const Err('Session not found.');
      return const Ok(null);
    } catch (e) {
      return Err('Failed to update session: $e');
    }
  }

  Future<Result<void>> deleteSession(int id) async {
    if (id <= 0) return const Err('Session not found.');
    try {
      final affected = await (_db.delete(_db.studySessions)
            ..where((t) => t.id.equals(id)))
          .go();
      if (affected == 0) return const Err('Session not found.');
      return const Ok(null);
    } catch (e) {
      return Err('Failed to delete session: $e');
    }
  }
}

class SettingsRepository {
  SettingsRepository(this._db);
  final AppDatabase _db;

  Stream<AppSettings> watch() => _db
      .select(_db.settings)
      .watchSingleOrNull()
      .map((row) => row == null ? const AppSettings() : _fromRow(row));

  AppSettings _fromRow(SettingsRow row) => AppSettings(
        hoursPerEcts: row.hoursPerEcts,
        dailyTargetMinutes: row.dailyTargetMinutes,
        firstWeekday: row.firstWeekday.clamp(1, 7),
        themeMode: themeModeFromInt(row.themeMode),
        paceToleranceDays: row.paceToleranceDays.clamp(0.0, 30.0),
        weeklyOverloadHours: row.weeklyOverloadHours.clamp(5.0, 100.0),
        displaySize: displaySizeFromInt(row.displaySize),
        accent: accentFromInt(row.accent),
        localeCode: isAppLocaleCode(row.localeCode) ? row.localeCode : null,
      );

  /// One-shot read of the current settings, defaulting to [AppSettings] when
  /// no row exists (same mapping as [watch]). Lets bootstrap/first-frame code
  /// resolve settings without a stream subscription (ECTS-045). On a DB fault
  /// returns defaults rather than throwing (AGENTS.md §3).
  Future<AppSettings> get() async {
    try {
      final row = await _db.select(_db.settings).getSingleOrNull();
      if (row == null) return const AppSettings();
      return _fromRow(row);
    } catch (_) {
      return const AppSettings();
    }
  }

  Future<Result<void>> setHoursPerEcts(double value) async {
    if (value <= 0) return const Err('Hours per ECTS must be greater than zero.');
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              hoursPerEcts: Value(value),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Persists the daily study target (minutes/day). `0` is "no target", a
  /// positive value is the target; a negative one is rejected at the boundary so
  /// it never reaches the row (ECTS-019). Writes only the settings singleton, so
  /// no course or session data is touched.
  Future<Result<void>> setDailyTargetMinutes(int value) async {
    if (value < 0) {
      return const Err('Daily target must not be negative.');
    }
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              dailyTargetMinutes: Value(value),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Persists the first weekday for weekly totals (1=Monday .. 7=Sunday).
  Future<Result<void>> setFirstWeekday(int value) async {
    if (value < 1 || value > 7) {
      return const Err('First weekday must be between 1 (Monday) and 7 (Sunday).');
    }
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              firstWeekday: Value(value),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Persists display theme preference (0=system, 1=light, 2=dark).
  Future<Result<void>> setThemeMode(AppThemeMode mode) async {
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              themeMode: Value(themeModeToInt(mode)),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Persists ahead/behind tolerance in days of current need (0..30).
  /// 5 = stable band (default): surplus/deficit must reach 5 days of work
  /// before the label flips. 0 = sensitive (any surplus/deficit flips).
  Future<Result<void>> setPaceToleranceDays(double value) async {
    if (value < 0 || value > 30) {
      return const Err('Tolerance must be between 0 and 30 days.');
    }
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              paceToleranceDays: Value(value),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Persists the Coming-load overload cutoff in hours/week (5..100).
  /// Weeks above this load are flagged red in Statistics. 35 ≈ full-time.
  Future<Result<void>> setWeeklyOverloadHours(double value) async {
    if (value < 5 || value > 100) {
      return const Err('Overload threshold must be between 5 and 100 h/week.');
    }
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              weeklyOverloadHours: Value(value),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Persists display size (compact/comfortable/large).
  Future<Result<void>> setDisplaySize(AppDisplaySize size) async {
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              displaySize: Value(displaySizeToInt(size)),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Persists theme accent (teal/forest/clay/slate/berry).
  Future<Result<void>> setAccent(AppAccent accent) async {
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              accent: Value(accentToInt(accent)),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Persists the app language ([code] is an ARB `@@locale` tag such as
  /// `de` or `zh_Hans`). Null clears the override and follows the system
  /// language. Unknown codes are rejected at the boundary so they never
  /// reach the row.
  Future<Result<void>> setLocaleCode(String? code) async {
    if (code != null && !isAppLocaleCode(code)) {
      return Err('Unknown language code: $code.');
    }
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              localeCode: Value(code),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save settings: $e');
    }
  }

  /// Resets settings to defaults (keeps courses/sessions).
  Future<Result<void>> resetToDefaults() async {
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              hoursPerEcts: const Value(AppSettings.defaultHoursPerEcts),
              dailyTargetMinutes: const Value(0),
              firstWeekday: const Value(DateTime.monday),
              themeMode: Value(themeModeToInt(AppThemeMode.system)),
              paceToleranceDays:
                  const Value(AppSettings.defaultPaceToleranceDays),
              weeklyOverloadHours:
                  const Value(AppSettings.defaultWeeklyOverloadHours),
              displaySize:
                  Value(displaySizeToInt(AppDisplaySize.comfortable)),
              accent: Value(accentToInt(AppAccent.slate)),
              localeCode: const Value(null),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to reset settings: $e');
    }
  }
}

/// Import write mode for [BackupRepository.importJson].
enum ImportMode { replace, append }

/// Read-only preview of a backup payload (no writes). Returned by
/// [BackupRepository.previewImport] so the UI can show counts, settings and
/// compatibility before anything is touched.
class BackupPreview {
  const BackupPreview({
    required this.courses,
    required this.sessions,
    required this.formatVersion,
    required this.dbSchema,
    this.hoursPerEcts,
    this.exportedAt,
  });

  final int courses;
  final int sessions;
  final int formatVersion;
  final int? dbSchema;
  final double? hoursPerEcts;
  final String? exportedAt;
}

/// Backup envelope constants. `formatVersion` is ours (not the DB version):
/// bump when the JSON shape changes. `dbSchema` records the writer's drift
/// schema so a backup from a newer app is rejected instead of crashing.
const String backupAppId = 'ects-tracker';
const int backupFormatVersion = 2;

/// Hard limits: past these the payload is rejected before parsing rows.
const int backupMaxChars = 25 * 1024 * 1024;
const int backupMaxCourses = 20000;
const int backupMaxSessions = 200000;

class _ValidatedBackup {
  const _ValidatedBackup({
    required this.settings,
    required this.courseMaps,
    required this.sessionMaps,
    required this.formatVersion,
    required this.dbSchema,
    this.exportedAt,
  });

  final Map<String, Object?> settings;
  final List<Map<String, Object?>> courseMaps;
  final List<Map<String, Object?>> sessionMaps;
  final int formatVersion;
  final int? dbSchema;
  final String? exportedAt;
}

class BackupRepository {
  BackupRepository(this._db);
  final AppDatabase _db;

  /// Exports all data (settings, courses, sessions) as a JSON string.
  /// Derived values are not exported (AGENTS.md: computed, never stored).
  Future<Result<String>> exportJson() async {
    try {
      final settingsRow = await _db.select(_db.settings).getSingleOrNull();
      final courseRows = await _db.select(_db.courses).get();
      final sessionRows = await _db.select(_db.studySessions).get();
      final settings = settingsRow == null
          ? const AppSettings()
          : AppSettings(
              hoursPerEcts: settingsRow.hoursPerEcts,
              dailyTargetMinutes: settingsRow.dailyTargetMinutes,
              firstWeekday: settingsRow.firstWeekday.clamp(1, 7),
              themeMode: themeModeFromInt(settingsRow.themeMode),
              paceToleranceDays:
                  settingsRow.paceToleranceDays.clamp(0.0, 30.0),
              weeklyOverloadHours:
                  settingsRow.weeklyOverloadHours.clamp(5.0, 100.0),
              displaySize: displaySizeFromInt(settingsRow.displaySize),
              accent: accentFromInt(settingsRow.accent),
              localeCode: isAppLocaleCode(settingsRow.localeCode)
                  ? settingsRow.localeCode
                  : null,
            );
      final map = <String, Object?>{
        'app': backupAppId,
        'formatVersion': backupFormatVersion,
        // Legacy alias kept for older readers.
        'version': 1,
        'dbSchema': _db.schemaVersion,
        'exportedAt': DateTime.now().toUtc().toIso8601String(),
        'settings': {
          'hoursPerEcts': settings.hoursPerEcts,
          'dailyTargetMinutes': settings.dailyTargetMinutes,
          'firstWeekday': settings.firstWeekday,
          'themeMode': themeModeToInt(settings.themeMode),
          'paceToleranceDays': settings.paceToleranceDays,
          'weeklyOverloadHours': settings.weeklyOverloadHours,
          'displaySize': displaySizeToInt(settings.displaySize),
          'accent': accentToInt(settings.accent),
          'localeCode': settings.localeCode,
        },
        'courses': courseRows
            .map((c) => {
                  'id': c.id,
                  'name': c.name,
                  'ectsCredits': c.ectsCredits,
                  'startDate': c.startDate?.toIso8601String(),
                  'deadline': c.deadline?.toIso8601String(),
                  'notes': c.notes,
                  'colorValue': c.colorValue,
                  'isSample': c.isSample,
                  'startEarly': c.startEarly,
                })
            .toList(),
        'sessions': sessionRows
            .map((s) => {
                  'id': s.id,
                  'courseId': s.courseId,
                  'minutes': s.minutes,
                  'date': s.date.toIso8601String(),
                  'notes': s.notes,
                  'isSample': s.isSample,
                })
            .toList(),
      };
      return Ok(_jsonEncode(map));
    } catch (e) {
      return Err('Failed to export data: $e');
    }
  }

  /// Validates [text] without writing anything. Powers the import dialog's
  /// preview (counts, settings, compatibility) and shares its checks with
  /// [importJson] so preview and import can never disagree.
  Future<Result<BackupPreview>> previewImport(String text) async {
    final parsed = _parseAndValidate(text);
    switch (parsed) {
      case Err<_ValidatedBackup>(:final message):
        return Err(message);
      case Ok<_ValidatedBackup>(:final value):
        return Ok(BackupPreview(
          courses: value.courseMaps.length,
          sessions: value.sessionMaps.length,
          formatVersion: value.formatVersion,
          dbSchema: value.dbSchema,
          hoursPerEcts: (value.settings['hoursPerEcts'] as num?)?.toDouble(),
          exportedAt: value.exportedAt,
        ));
    }
  }

  /// Imports data from JSON exported by [exportJson].
  ///
  /// * [ImportMode.replace] (default): validates everything first, then wipes
  ///   and restores courses, sessions, and settings in one transaction.
  /// * [ImportMode.append]: validates, keeps existing rows and current
  ///   settings, and adds the payload's courses/sessions with fresh ids
  ///   (payload ids are never reused, so there are no key collisions).
  ///
  /// Payload ids are never written to the database in either mode — every
  /// course gets a fresh id and sessions are remapped onto it. Returns [Err]
  /// on invalid input or DB failure with no partial writes.
  Future<Result<void>> importJson(String json,
      {ImportMode mode = ImportMode.replace}) async {
    final parsed = _parseAndValidate(json);
    switch (parsed) {
      case Err<_ValidatedBackup>(:final message):
        return Err(message);
      case Ok<_ValidatedBackup>():
        break;
    }
    final backup = (parsed as Ok).value as _ValidatedBackup;
    final settings = backup.settings;
    try {
      await _db.transaction(() async {
        if (mode == ImportMode.replace) {
          await _db.delete(_db.studySessions).go();
          await _db.delete(_db.courses).go();
          await _db.delete(_db.settings).go();
          await _db.into(_db.settings).insert(
                SettingsCompanion.insert(
                  id: const Value(1),
                  hoursPerEcts:
                      Value((settings['hoursPerEcts'] as num).toDouble()),
                  dailyTargetMinutes:
                      Value((settings['dailyTargetMinutes'] as num).toInt()),
                  firstWeekday:
                      Value((settings['firstWeekday'] as num).toInt()),
                  themeMode: Value((settings['themeMode'] as num).toInt()),
                  paceToleranceDays:
                      Value((settings['paceToleranceDays'] as num).toDouble()),
                  weeklyOverloadHours: Value(
                      (settings['weeklyOverloadHours'] as num).toDouble()),
                  displaySize:
                      Value((settings['displaySize'] as num).toInt()),
                  accent: Value((settings['accent'] as num).toInt()),
                  localeCode: Value(settings['localeCode'] as String?),
                ),
              );
        }
        // Fresh ids in both modes: payload ids only link sessions to their
        // course within the payload, they are never written to the DB.
        final idMap = <int, int>{};
        for (var i = 0; i < backup.courseMaps.length; i++) {
          final c = backup.courseMaps[i];
          final newId = await _db.into(_db.courses).insert(
                CoursesCompanion.insert(
                  name: (c['name'] as String).trim(),
                  ectsCredits: (c['ectsCredits'] as num).toDouble(),
                  startDate: Value(_parseDate(c['startDate'])),
                  deadline: Value(_parseDate(c['deadline'])),
                  notes: Value(c['notes'] as String?),
                  colorValue: Value((c['colorValue'] as num?)?.toInt()),
                  isSample: Value(c['isSample'] == true),
                  startEarly: Value(c['startEarly'] == true),
                ),
              );
          final payloadId = (c['id'] as num?)?.toInt() ?? -(i + 1);
          idMap[payloadId] = newId;
        }
        await _db.batch((b) {
          for (final s in backup.sessionMaps) {
            final payloadCourseId = (s['courseId'] as num).toInt();
            b.insert(
              _db.studySessions,
              StudySessionsCompanion.insert(
                courseId: idMap[payloadCourseId]!,
                minutes: (s['minutes'] as num).toInt(),
                date: _parseDate(s['date'])!,
                notes: Value(s['notes'] as String?),
                isSample: Value(s['isSample'] == true),
              ),
            );
          }
        });
      });
      return const Ok(null);
    } catch (e) {
      return Err('Failed to import data: $e');
    }
  }

  /// Shared schema + compatibility + row validation. Never touches the DB.
  Result<_ValidatedBackup> _parseAndValidate(String text) {
    if (text.trim().isEmpty) {
      return const Err('Invalid import file: backup is empty.');
    }
    if (text.length > backupMaxChars) {
      return const Err(
          'Invalid import file: backup is too large (over 25 MB).');
    }
    final Object? decoded;
    try {
      decoded = _jsonDecode(text);
    } catch (_) {
      return const Err('Invalid import file: not valid JSON.');
    }
    if (decoded is! Map) {
      return const Err('Invalid import file: expected a JSON object.');
    }
    final app = decoded['app'];
    if (app != null && app != backupAppId) {
      return const Err('Invalid import file: not an ECTS Tracker backup.');
    }
    final formatVersion =
        (decoded['formatVersion'] as num?)?.toInt() ??
            (decoded['version'] as num?)?.toInt() ??
            1;
    if (formatVersion > backupFormatVersion) {
      return const Err(
          'Incompatible backup: it was exported by a newer app. Update ECTS Tracker and try again.');
    }
    final dbSchema = (decoded['dbSchema'] as num?)?.toInt();
    if (dbSchema != null && dbSchema > _db.schemaVersion) {
      return Err(
          'Incompatible backup: database schema v$dbSchema is newer than this app (v${_db.schemaVersion}). Update the app first.');
    }
    final coursesRaw = decoded['courses'];
    final sessionsRaw = decoded['sessions'];
    if (coursesRaw is! List || sessionsRaw is! List) {
      return const Err('Invalid import file: missing courses or sessions.');
    }
    if (coursesRaw.length > backupMaxCourses) {
      return Err(
          'Invalid import file: too many courses (${coursesRaw.length}).');
    }
    if (sessionsRaw.length > backupMaxSessions) {
      return Err(
          'Invalid import file: too many sessions (${sessionsRaw.length}).');
    }
    final settingsRaw =
        decoded['settings'] is Map ? decoded['settings'] as Map : const {};
    double numD(Object? v, double fallback) =>
        (v as num?)?.toDouble() ?? fallback;
    int numI(Object? v, int fallback) => (v as num?)?.toInt() ?? fallback;
    final hoursPerEcts = numD(settingsRaw['hoursPerEcts'], 30.0);
    final dailyTarget = numI(settingsRaw['dailyTargetMinutes'], 0);
    final firstWeekday = numI(settingsRaw['firstWeekday'], 1).clamp(1, 7);
    final themeMode = numI(settingsRaw['themeMode'], 0).clamp(0, 2);
    final paceToleranceDays =
        numD(settingsRaw['paceToleranceDays'], AppSettings.defaultPaceToleranceDays);
    final weeklyOverloadHours =
        numD(settingsRaw['weeklyOverloadHours'], AppSettings.defaultWeeklyOverloadHours);
    final displaySize = numI(settingsRaw['displaySize'], 1).clamp(0, 2);
    final accent = numI(settingsRaw['accent'], 3).clamp(0, 4);
    // Unknown locale codes fall back to system default instead of failing
    // the whole import: language is cosmetic, never structural.
    final localeRaw = settingsRaw['localeCode'];
    final localeCode = localeRaw is String && isAppLocaleCode(localeRaw)
        ? localeRaw
        : null;
    if (hoursPerEcts <= 0 || hoursPerEcts > 1000) {
      return const Err('Invalid import: hoursPerEcts must be 0–1000.');
    }
    if (dailyTarget < 0 || dailyTarget > 24 * 60) {
      return const Err('Invalid import: dailyTargetMinutes must be 0–1440.');
    }
    if (paceToleranceDays < 0 || paceToleranceDays > 30) {
      return const Err('Invalid import: paceToleranceDays must be 0..30.');
    }
    if (weeklyOverloadHours < 5 || weeklyOverloadHours > 100) {
      return const Err('Invalid import: weeklyOverloadHours must be 5..100.');
    }

    final courseMaps = <Map<String, Object?>>[];
    final payloadIds = <int>{};
    for (var i = 0; i < coursesRaw.length; i++) {
      final c = coursesRaw[i];
      if (c is! Map) {
        return Err('Invalid import: course #${i + 1} is malformed.');
      }
      final name = (c['name'] as String?)?.trim() ?? '';
      final ects = (c['ectsCredits'] as num?)?.toDouble();
      if (name.isEmpty || name.length > courseNameMaxLength) {
        return Err(
            'Invalid import: course #${i + 1} has an invalid name (1–$courseNameMaxLength chars).');
      }
      if (ects == null || ects <= 0 || ects > 1000) {
        return Err(
            'Invalid import: course #${i + 1} (“$name”) has invalid ECTS credits.');
      }
      final start = _parseDate(c['startDate']);
      if (c['startDate'] is String &&
          (c['startDate'] as String).isNotEmpty &&
          start == null) {
        return Err(
            'Invalid import: course #${i + 1} (“$name”) has an unreadable start date.');
      }
      final deadline = _parseDate(c['deadline']);
      if (c['deadline'] is String &&
          (c['deadline'] as String).isNotEmpty &&
          deadline == null) {
        return Err(
            'Invalid import: course #${i + 1} (“$name”) has an unreadable deadline.');
      }
      if (start != null && deadline != null && !deadline.isAfter(start)) {
        return Err(
            'Invalid import: course #${i + 1} (“$name”) deadline must be after its start date.');
      }
      final colorRaw = c['colorValue'];
      if (colorRaw != null &&
          (colorRaw is! num ||
              colorRaw.toInt() < 0 ||
              colorRaw.toInt() > 0xFFFFFFFF)) {
        return Err(
            'Invalid import: course #${i + 1} (“$name”) has an invalid color.');
      }
      final map = Map<String, Object?>.from(c);
      final payloadId = (map['id'] as num?)?.toInt() ?? -(i + 1);
      payloadIds.add(payloadId);
      courseMaps.add(map);
    }
    final sessionMaps = <Map<String, Object?>>[];
    for (var i = 0; i < sessionsRaw.length; i++) {
      final s = sessionsRaw[i];
      if (s is! Map) {
        return Err('Invalid import: session #${i + 1} is malformed.');
      }
      final courseId = (s['courseId'] as num?)?.toInt();
      final minutes = (s['minutes'] as num?)?.toInt();
      if (courseId == null) {
        return Err('Invalid import: session #${i + 1} has no course link.');
      }
      if (!payloadIds.contains(courseId)) {
        return Err(
            'Invalid import: session #${i + 1} links to unknown course id $courseId.');
      }
      if (minutes == null || minutes <= 0 || minutes > 10080) {
        return Err(
            'Invalid import: session #${i + 1} has an invalid duration (1–10080 min).');
      }
      final date = _parseDate(s['date']);
      if (date == null) {
        return Err('Invalid import: session #${i + 1} has an unreadable date.');
      }
      if (date.year < 1970 || date.year > 2200) {
        return Err(
            'Invalid import: session #${i + 1} date is out of range (1970–2200).');
      }
      sessionMaps.add(Map<String, Object?>.from(s));
    }
    return Ok(_ValidatedBackup(
      settings: {
        'hoursPerEcts': hoursPerEcts,
        'dailyTargetMinutes': dailyTarget,
        'firstWeekday': firstWeekday,
        'themeMode': themeMode,
        'paceToleranceDays': paceToleranceDays,
        'weeklyOverloadHours': weeklyOverloadHours,
        'displaySize': displaySize,
        'accent': accent,
        'localeCode': localeCode,
      },
      courseMaps: courseMaps,
      sessionMaps: sessionMaps,
      formatVersion: formatVersion,
      dbSchema: dbSchema,
      exportedAt: decoded['exportedAt'] as String?,
    ));
  }

  /// Deletes all courses, sessions, and settings (full reset). Re-seeding is not
  /// performed automatically; the app will show a clean empty state.
  Future<Result<void>> resetAllData() async {
    try {
      await _db.transaction(() async {
        await _db.delete(_db.studySessions).go();
        await _db.delete(_db.courses).go();
        await _db.delete(_db.settings).go();
      });
      return const Ok(null);
    } catch (e) {
      return Err('Failed to reset data: $e');
    }
  }

  DateTime? _parseDate(Object? value) {
    if (value is! String || value.isEmpty) return null;
    return DateTime.tryParse(value);
  }
}

/// Hidden dev-mode stress pump (no UI except Settings): inserts a realistic
/// generated semester ([StressPayload]) and can clear it again by name
/// prefix. Pumped rows are normal user-style rows (`isSample: false`) so
/// they exercise the real pace/statistics paths.
class DevPumpRepository {
  DevPumpRepository(this._db);
  final AppDatabase _db;

  /// Inserts [payload] courses, then their sessions in one batch.
  /// Returns (courses, sessions) inserted. Existing data is kept.
  Future<Result<(int, int)>> pump(StressPayload payload) async {
    if (payload.courses.isEmpty) return const Err('Nothing to pump.');
    try {
      final ids = <int>[];
      await _db.transaction(() async {
        for (final c in payload.courses) {
          final id = await _db.into(_db.courses).insert(
                CoursesCompanion.insert(
                  name: c.name,
                  ectsCredits: c.ectsCredits,
                  startDate: Value(c.startDate),
                  deadline: Value(c.deadline),
                  notes: const Value('DEV PUMP — stress test data.'),
                  colorValue: Value(c.colorValue),
                  isSample: const Value(false),
                  startEarly: Value(c.startEarly),
                ),
              );
          ids.add(id);
        }
        await _db.batch((b) {
          for (final s in payload.sessions) {
            b.insert(
              _db.studySessions,
              StudySessionsCompanion.insert(
                courseId: ids[s.courseIndex],
                minutes: s.minutes,
                date: s.date,
                notes: Value(s.notes ?? 'DEV PUMP'),
                isSample: const Value(false),
              ),
            );
          }
        });
      });
      return Ok((ids.length, payload.sessions.length));
    } catch (e) {
      return Err('Failed to pump test data: $e');
    }
  }

  /// Deletes pumped courses (name prefix [stressCoursePrefix]) and their
  /// sessions. Returns the number of courses removed.
  Future<Result<int>> clearPumped() async {
    try {
      final rows = await _db.select(_db.courses).get();
      final ids = [
        for (final r in rows)
          if (r.name.startsWith(stressCoursePrefix)) r.id
      ];
      if (ids.isEmpty) return const Ok(0);
      final removed = await _db.transaction(() async {
        await (_db.delete(_db.studySessions)
              ..where((t) => t.courseId.isIn(ids)))
            .go();
        return await (_db.delete(_db.courses)
              ..where((t) => t.id.isIn(ids)))
            .go();
      });
      return Ok(removed);
    } catch (e) {
      return Err('Failed to clear pumped data: $e');
    }
  }
}

String _jsonEncode(Object? value) => const JsonEncoder.withIndent('  ').convert(value);

Object? _jsonDecode(String source) => jsonDecode(source);
