part of '../repositories.dart';

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
        liquidGlass: row.liquidGlass,
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

  /// Persists the liquid-glass chrome opt-in (no validation needed: bool).
  Future<Result<void>> setLiquidGlass(bool value) async {
    try {
      await _db.into(_db.settings).insertOnConflictUpdate(
            SettingsCompanion.insert(
              id: const Value(1),
              liquidGlass: Value(value),
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
              liquidGlass: const Value(false),
            ),
          );
      return const Ok(null);
    } catch (e) {
      return Err('Failed to reset settings: $e');
    }
  }
}
