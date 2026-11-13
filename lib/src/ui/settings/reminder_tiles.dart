part of '../settings_page.dart';

/// Study-reminder opt-in + time (M9, ECTS-072). Prefs live in
/// SharedPreferences; every change recomputes the OS schedule.
class _ReminderTiles extends ConsumerWidget {
  const _ReminderTiles();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final prefs = ref.watch(reminderSettingsProvider);
    final current = prefs.valueOrNull ?? const ReminderSettings();
    final time = TimeOfDay(
        hour: current.timeMinutes ~/ 60, minute: current.timeMinutes % 60);
    return Column(
      children: [
        _SettingsTile(
          tileKey: const Key('reminderTile'),
          icon: Icons.notifications_outlined,
          title: l10n.settingsReminders,
          subtitle: Text(current.enabled
              ? time.format(context)
              : l10n.settingsRemindersOff),
          trailing: Switch(
            value: current.enabled,
            onChanged: (value) => _setEnabled(context, ref, value),
          ),
          topDivider: true,
        ),
        _SettingsTile(
          tileKey: const Key('reminderTimeTile'),
          icon: Icons.schedule_outlined,
          title: l10n.settingsReminderTime,
          subtitle: Text(time.format(context)),
          onTap: () => _editTime(context, ref),
          showDivider: false,
          topDivider: true,
        ),
      ],
    );
  }

  Future<void> _setEnabled(
      BuildContext context, WidgetRef ref, bool value) async {
    final l10n = AppLocalizations.of(context)!;
    if (value) {
      var granted = false;
      try {
        granted = await (await ref.read(notificationBackendProvider.future))
            .requestPermissions();
      } catch (e) {
        // Permission request failed: treat as denied (snackbar below).
        if (kDebugMode) debugPrint('notification permission failed: $e');
      }
      if (!context.mounted) return;
      if (!granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.settingsReminderDenied)),
        );
        return;
      }
    }
    final repo = ref.read(reminderPrefsProvider);
    final current = await repo.load();
    final result = await repo.save(current.copyWith(enabled: value));
    ref.invalidate(reminderSettingsProvider);
    if (!context.mounted) return;
    _showResultStatic(context, result);
    await _rescheduleNow(context, ref);
  }

  Future<void> _editTime(BuildContext context, WidgetRef ref) async {
    final repo = ref.read(reminderPrefsProvider);
    final current = await repo.load();
    if (!context.mounted) return;
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: current.timeMinutes ~/ 60, minute: current.timeMinutes % 60),
    );
    if (picked == null || !context.mounted) return;
    final result = await repo.save(current.copyWith(
        timeMinutes: picked.hour * 60 + picked.minute));
    ref.invalidate(reminderSettingsProvider);
    if (!context.mounted) return;
    _showResultStatic(context, result);
    await _rescheduleNow(context, ref);
  }

  /// Recomputes the OS schedule from live data. Best-effort: failures are
  /// swallowed so Settings never breaks (the dev preview always works).
  Future<void> _rescheduleNow(BuildContext context, WidgetRef ref) async {
    try {
      final backend = await ref.read(notificationBackendProvider.future);
      final courses = await ref.read(coursesProvider.future);
      final sessions = await ref.read(sessionsProvider.future);
      final s =
          ref.read(settingsProvider).valueOrNull ?? const AppSettings();
      if (!context.mounted) return;
      await ReminderService(backend, ref.read(reminderPrefsProvider))
          .reschedule(
        courses: courses,
        sessions: sessions,
        hoursPerEcts: s.hoursPerEcts,
        toleranceDays: s.paceToleranceDays,
        now: DateTime.now(),
        l10n: AppLocalizations.of(context)!,
      );
    } catch (e) {
      // Best-effort reschedule (doc above); log in debug.
      if (kDebugMode) debugPrint('settings reschedule failed: $e');
    }
  }

  void _showResultStatic(BuildContext context, Result<void> result) {
    switch (result) {
      case Ok<void>():
        break;
      case Err<void>(:final message):
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(localizeRepoMessage(message, l10n))));
    }
  }
}
