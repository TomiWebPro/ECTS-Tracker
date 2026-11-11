import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../data/repositories.dart';
import '../logic/custom_reminders.dart';
import '../models/reminder_settings.dart';

/// Persists [ReminderSettings], custom schedules, and overdue fire counts
/// in SharedPreferences (M9, ECTS-072). Errors surface as [Result] values,
/// never throws, per AGENTS.md §3.
class ReminderPrefsRepository {
  ReminderPrefsRepository([this._store]);

  SharedPreferences? _store;

  static const String keyEnabled = 'reminder.enabled';
  static const String keyTimeMinutes = 'reminder.timeMinutes';
  static const String keyWarnDays = 'reminder.warnDays';
  static const String keyCustom = 'reminder.custom';

  Future<SharedPreferences> _instance() async =>
      _store ??= await SharedPreferences.getInstance();

  Future<ReminderSettings> load() async {
    final s = await _instance();
    return ReminderSettings(
      enabled: s.getBool(keyEnabled) ?? false,
      timeMinutes:
          (s.getInt(keyTimeMinutes) ?? ReminderSettings.defaultReminderTimeMinutes)
              .clamp(0, 1439),
      warnDays:
          (s.getInt(keyWarnDays) ?? ReminderSettings.defaultDeadlineWarnDays)
              .clamp(0, 14),
    );
  }

  Future<Result<void>> save(ReminderSettings settings) async {
    if (settings.timeMinutes < 0 || settings.timeMinutes > 1439) {
      return const Err('Reminder time must be 0–1439 minutes.');
    }
    if (settings.warnDays < 0 || settings.warnDays > 14) {
      return const Err('Deadline warning window must be 0–14 days.');
    }
    try {
      final s = await _instance();
      await s.setBool(keyEnabled, settings.enabled);
      await s.setInt(keyTimeMinutes, settings.timeMinutes);
      await s.setInt(keyWarnDays, settings.warnDays);
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save reminder settings: $e');
    }
  }

  /// Custom schedules as JSON. Malformed entries are skipped, never fatal.
  Future<List<CustomSchedule>> loadCustom() async {
    final s = await _instance();
    final raw = s.getString(keyCustom);
    if (raw == null || raw.isEmpty) return const [];
    try {
      final decoded = _jsonDecode(raw);
      if (decoded is! List) return const [];
      final out = <CustomSchedule>[];
      for (final entry in decoded) {
        if (entry is! Map) continue;
        try {
          out.add(CustomSchedule.fromJson(
              Map<String, Object?>.from(entry)));
        } catch (_) {
          continue;
        }
      }
      return out;
    } catch (_) {
      return const [];
    }
  }

  Future<Result<void>> saveCustom(List<CustomSchedule> schedules) async {
    try {
      final s = await _instance();
      await s.setString(
          keyCustom, _jsonEncode([for (final c in schedules) c.toJson()]));
      return const Ok(null);
    } catch (e) {
      return Err('Failed to save custom reminders: $e');
    }
  }

  /// How many times an overdue escalation already fired for one
  /// course-deadline (spec: max 2 ever, then silence).
  Future<int> overdueCount(String key) async {
    final s = await _instance();
    return s.getInt('reminder.overdue.$key') ?? 0;
  }

  Future<void> recordOverdueFire(String key) async {
    final s = await _instance();
    final count = s.getInt('reminder.overdue.$key') ?? 0;
    await s.setInt('reminder.overdue.$key', count + 1);
  }
}

String _jsonEncode(Object? value) => jsonEncode(value);
Object? _jsonDecode(String source) => jsonDecode(source);
