import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logic/study_timer.dart';
import 'result.dart';

/// Persists the single active study timer (M11, ECTS-091).
///
/// One JSON blob under [keyTimer], so start/pause/resume are atomic and the
/// timer survives app kill + system restart. Errors surface as [Result]
/// values, never throw (AGENTS.md §3). Corrupt blobs read as "no timer".
class StudyTimerPrefsRepository {
  StudyTimerPrefsRepository([this._store]);

  SharedPreferences? _store;

  static const String keyTimer = 'studyTimer.json';

  /// Persisted app-locale code for background notification re-shows
  /// (M12, ECTS-096): the background isolate has no Riverpod/DB access,
  /// so the foreground provider snapshots its locale here on every save.
  static const String keyLocale = 'studyTimer.localeCode';

  Future<SharedPreferences> _instance() async =>
      _store ??= await SharedPreferences.getInstance();

  Future<StudyTimerState?> load() async {
    try {
      final s = await _instance();
      final raw = s.getString(keyTimer);
      if (raw == null || raw.isEmpty) return null;
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return StudyTimerState.tryFromJson(
        Map<String, Object?>.from(decoded),
      );
    } catch (_) {
      if (kDebugMode) debugPrint('study timer blob corrupt, using null');
      return null;
    }
  }

  Future<Result<void>> save(StudyTimerState timer) async {
    if (timer.courseId <= 0) return const Err('Select a course.');
    if (timer.accumulatedSec < 0) {
      return const Err('Invalid timer state.');
    }
    try {
      final s = await _instance();
      await s.setString(keyTimer, jsonEncode(timer.toJson()));
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save timer: $e');
    }
  }

  Future<Result<void>> clear() async {
    try {
      final s = await _instance();
      await s.remove(keyTimer);
      await s.remove(keyLocale);
      return const Ok(null);
    } catch (e) {
      return Err('Failed to clear timer: $e');
    }
  }

  /// Best-effort locale snapshot for the background re-show path.
  Future<void> saveLocale(String? code) async {
    try {
      final s = await _instance();
      if (code == null || code.isEmpty) {
        await s.remove(keyLocale);
      } else {
        await s.setString(keyLocale, code);
      }
    } catch (_) {
      // Best-effort: foreground alerts already use the live locale.
    }
  }

  Future<String?> loadLocale() async {
    try {
      final s = await _instance();
      final raw = s.getString(keyLocale);
      if (raw == null || raw.isEmpty) return null;
      return raw;
    } catch (_) {
      return null;
    }
  }
}
