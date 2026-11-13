part of '../repositories.dart';

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
          : SettingsRepository.fromRow(settingsRow);
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
          'liquidGlass': settings.liquidGlass,
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
    final _ValidatedBackup backup;
    switch (parsed) {
      case Err<_ValidatedBackup>(:final message):
        return Err(message);
      case Ok<_ValidatedBackup>(:final value):
        backup = value;
    }
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
                  liquidGlass:
                      Value(settings['liquidGlass'] == true),
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
    // Missing key (pre-glass backups) defaults to false; any truthy non-bool
    // stays false so a malformed payload cannot enable chrome by accident.
    final liquidGlass = settingsRaw['liquidGlass'] == true;
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
        'liquidGlass': liquidGlass,
      },
      courseMaps: courseMaps,
      sessionMaps: sessionMaps,
      formatVersion: formatVersion,
      dbSchema: dbSchema,
      exportedAt: decoded['exportedAt'] as String?,
    ));
  }

  /// Deletes all courses, sessions, and settings (full reset), then
  /// re-seeds the explicit default settings row. The reseed matters:
  /// DBs created before the slate accent default keep a baked-in
  /// `accent DEFAULT 0` (teal), so a later partial write (e.g. the
  /// liquid-glass toggle) on a missing row would re-insert teal
  /// (ECTS-089). With the row present, partial writes only touch their
  /// own column. The app still shows a clean empty state (no courses).
  Future<Result<void>> resetAllData() async {
    try {
      await _db.transaction(() async {
        await _db.delete(_db.studySessions).go();
        await _db.delete(_db.courses).go();
        await _db.delete(_db.settings).go();
        await _db
            .into(_db.settings)
            .insert(defaultSettingsCompanion());
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

String _jsonEncode(Object? value) => const JsonEncoder.withIndent('  ').convert(value);

Object? _jsonDecode(String source) => jsonDecode(source);
