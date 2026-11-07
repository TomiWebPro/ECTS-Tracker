import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../models/models.dart';
import '../state/providers.dart';

/// Settings (ECTS-011): hours-per-ECTS, targets, first weekday, display prefs,
/// import/export/reset, plus "clear sample data" (ECTS-016).
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSample = ref.watch(hasSampleDataProvider);
    final settingsAsync = ref.watch(settingsProvider);
    final settings = settingsAsync.valueOrNull ?? const AppSettings();

    return ListView(
      children: [
        _sectionHeader(context, 'Study settings'),
        ListTile(
          key: const Key('hoursPerEctsTile'),
          leading: const Icon(Icons.timelapse_outlined),
          title: const Text('Hours per ECTS'),
          subtitle: Text(
            '${settings.hoursPerEcts.toStringAsFixed(settings.hoursPerEcts % 1 == 0 ? 0 : 1)} h  ·  '
            'Required hours = ECTS × this factor (existing logs kept).',
          ),
          onTap: () => _editHoursPerEcts(context, ref, settings),
        ),
        ListTile(
          key: const Key('dailyTargetTile'),
          leading: const Icon(Icons.flag_outlined),
          title: const Text('Daily study target'),
          subtitle: Text(settings.dailyTargetMinutes > 0
              ? '${settings.dailyTargetMinutes} min/day'
              : 'No target set'),
          onTap: () => _editDailyTarget(context, ref, settings),
        ),
        ListTile(
          key: const Key('firstWeekdayTile'),
          leading: const Icon(Icons.view_week_outlined),
          title: const Text('First day of week'),
          subtitle: Text(_weekdayName(settings.firstWeekday)),
          onTap: () => _editFirstWeekday(context, ref, settings),
        ),
        _sectionHeader(context, 'Display'),
        ListTile(
          key: const Key('themeModeTile'),
          leading: const Icon(Icons.brightness_6_outlined),
          title: const Text('Theme'),
          subtitle: Text(_themeModeName(settings.themeMode)),
          onTap: () => _editThemeMode(context, ref, settings),
        ),
        _sectionHeader(context, 'Data'),
        hasSample.when(
          loading: () => const ListTile(
            leading: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            title: Text('Checking sample data…'),
          ),
          error: (e, _) => ListTile(
            leading: const Icon(Icons.error_outline),
            title: const Text('Sample data'),
            subtitle: Text('Error: $e'),
          ),
          data: (present) => present
              ? ListTile(
                  key: const Key('clearSampleDataTile'),
                  leading: const Icon(Icons.delete_sweep_outlined),
                  title: const Text('Clear sample data'),
                  subtitle: const Text(
                    'Remove the seeded example courses and sessions. Your own data is kept.',
                  ),
                  onTap: () => _confirmClearSample(context, ref),
                )
              : const ListTile(
                  key: Key('noSampleDataTile'),
                  leading: Icon(Icons.check_circle_outline),
                  title: Text('No sample data'),
                  subtitle:
                      Text('Seeded example data has already been cleared.'),
                ),
        ),
        ListTile(
          key: const Key('exportDataTile'),
          leading: const Icon(Icons.file_upload_outlined),
          title: const Text('Export data'),
          subtitle: const Text('Copy all courses, sessions, and settings as JSON.'),
          onTap: () => _exportData(context, ref),
        ),
        ListTile(
          key: const Key('importDataTile'),
          leading: const Icon(Icons.file_download_outlined),
          title: const Text('Import data'),
          subtitle:
              const Text('Replace all data from a previously exported JSON backup.'),
          onTap: () => _importData(context, ref),
        ),
        ListTile(
          key: const Key('resetSettingsTile'),
          leading: const Icon(Icons.settings_backup_restore_outlined),
          title: const Text('Reset settings'),
          subtitle: const Text('Restore default hours-per-ECTS, targets, and display.'),
          onTap: () => _confirmResetSettings(context, ref),
        ),
        ListTile(
          key: const Key('resetAllDataTile'),
          leading: Icon(Icons.delete_forever_outlined,
              color: Theme.of(context).colorScheme.error),
          title: Text('Reset all data',
              style: TextStyle(color: Theme.of(context).colorScheme.error)),
          subtitle: const Text('Delete all courses, sessions, and settings.'),
          onTap: () => _confirmResetAll(context, ref),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _sectionHeader(BuildContext context, String title) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      );

  String _weekdayName(int weekday) => const {
        1: 'Monday',
        2: 'Tuesday',
        3: 'Wednesday',
        4: 'Thursday',
        5: 'Friday',
        6: 'Saturday',
        7: 'Sunday',
      }[weekday] ?? 'Monday';

  String _themeModeName(AppThemeMode mode) => switch (mode) {
        AppThemeMode.system => 'System default',
        AppThemeMode.light => 'Light',
        AppThemeMode.dark => 'Dark',
      };

  Future<void> _editHoursPerEcts(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final controller = TextEditingController(
        text: settings.hoursPerEcts.toStringAsFixed(
            settings.hoursPerEcts % 1 == 0 ? 0 : 1));
    String? errorText;
    final value = await showDialog<double>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Hours per ECTS'),
          content: TextField(
            key: const Key('hoursPerEctsField'),
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Hours per ECTS credit',
              helperText: 'Default 30. Changing recalculates requirements; logs kept.',
              errorText: errorText,
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              key: const Key('saveHoursPerEcts'),
              onPressed: () {
                final parsed = double.tryParse(controller.text.trim().replaceAll(',', '.'));
                if (parsed == null || parsed <= 0) {
                  setState(() => errorText = 'Enter a number greater than zero.');
                  return;
                }
                Navigator.of(context).pop(parsed);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.dispose());
    if (value == null || !context.mounted) return;
    final result =
        await ref.read(settingsRepositoryProvider).setHoursPerEcts(value);
    if (!context.mounted) return;
    _showResult(context, result, success: 'Hours per ECTS updated.');
  }

  Future<void> _editDailyTarget(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final controller =
        TextEditingController(text: settings.dailyTargetMinutes.toString());
    String? errorText;
    final value = await showDialog<int>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Daily study target'),
          content: TextField(
            key: const Key('dailyTargetField'),
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Minutes per day (0 = no target)',
              errorText: errorText,
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              key: const Key('saveDailyTarget'),
              onPressed: () {
                final parsed = int.tryParse(controller.text.trim());
                if (parsed == null || parsed < 0) {
                  setState(() => errorText = 'Enter 0 or a positive number of minutes.');
                  return;
                }
                Navigator.of(context).pop(parsed);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.dispose());
    if (value == null || !context.mounted) return;
    final result = await ref
        .read(settingsRepositoryProvider)
        .setDailyTargetMinutes(value);
    if (!context.mounted) return;
    _showResult(context, result, success: 'Daily target updated.');
  }

  Future<void> _editFirstWeekday(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final selected = await showDialog<int>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('First day of week'),
        children: [
          for (var day = 1; day <= 7; day++)
            SimpleDialogOption(
              key: Key('weekday_$day'),
              onPressed: () => Navigator.of(context).pop(day),
              child: Row(
                children: [
                  Expanded(child: Text(_weekdayName(day))),
                  if (day == settings.firstWeekday)
                    const Icon(Icons.check, size: 18),
                ],
              ),
            ),
        ],
      ),
    );
    if (selected == null || !context.mounted) return;
    final result =
        await ref.read(settingsRepositoryProvider).setFirstWeekday(selected);
    if (!context.mounted) return;
    _showResult(context, result, success: 'First day of week updated.');
  }

  Future<void> _editThemeMode(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final selected = await showDialog<AppThemeMode>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Theme'),
        children: [
          for (final mode in AppThemeMode.values)
            SimpleDialogOption(
              key: Key('theme_${mode.name}'),
              onPressed: () => Navigator.of(context).pop(mode),
              child: Row(
                children: [
                  Expanded(child: Text(_themeModeName(mode))),
                  if (mode == settings.themeMode)
                    const Icon(Icons.check, size: 18),
                ],
              ),
            ),
        ],
      ),
    );
    if (selected == null || !context.mounted) return;
    final result =
        await ref.read(settingsRepositoryProvider).setThemeMode(selected);
    if (!context.mounted) return;
    _showResult(context, result, success: 'Theme updated.');
  }

  Future<void> _confirmClearSample(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear sample data?'),
        content: const Text(
          'This removes the example courses and sessions. Courses or sessions you added yourself are not removed.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            key: const Key('confirmClearSampleData'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    final result = await ref.read(courseRepositoryProvider).deleteSampleData();
    if (!context.mounted) return;
    switch (result) {
      case Ok<void>():
        break;
      case Err<void>(:final message):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            key: const Key('clearSampleDataError'),
            content: Text(message),
          ),
        );
    }
  }

  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    final result = await ref.read(backupRepositoryProvider).exportJson();
    if (!context.mounted) return;
    switch (result) {
      case Err<String>():
        _showResult(context, Err<void>((result).message), success: '');
      case Ok<String>(:final value):
        await showDialog<void>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Export data'),
            content: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: SelectableText(
                  value,
                  key: const Key('exportJsonText'),
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: value));
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Export copied to clipboard.')),
                    );
                  }
                },
                child: const Text('Copy'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        );
    }
  }

  Future<void> _importData(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Import data'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'This replaces ALL courses, sessions, and settings with the imported backup.',
              ),
              const SizedBox(height: 12),
              TextField(
                key: const Key('importJsonField'),
                controller: controller,
                maxLines: 6,
                decoration: const InputDecoration(
                  labelText: 'Paste exported JSON',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            key: const Key('confirmImportData'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Import'),
          ),
        ],
      ),
    );
    final text = controller.text;
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.dispose());
    if (confirmed != true || !context.mounted) return;
    final result = await ref.read(backupRepositoryProvider).importJson(text);
    if (!context.mounted) return;
    _showResult(context, result,
        success: 'Data imported. Your backup has been restored.',
        errorKey: const Key('importDataError'));
  }

  Future<void> _confirmResetSettings(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset settings?'),
        content: const Text(
          'Restores hours-per-ECTS (30), daily target (none), first weekday (Monday), and theme (system). Courses and sessions are kept.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            key: const Key('confirmResetSettings'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    final result = await ref.read(settingsRepositoryProvider).resetToDefaults();
    if (!context.mounted) return;
    _showResult(context, result, success: 'Settings reset to defaults.');
  }

  Future<void> _confirmResetAll(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset all data?'),
        content: const Text(
          'This permanently deletes ALL courses, sessions, and settings. This cannot be undone. Export a backup first if needed.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            key: const Key('confirmResetAllData'),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete everything'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    final result = await ref.read(backupRepositoryProvider).resetAllData();
    if (!context.mounted) return;
    _showResult(context, result, success: 'All data deleted.');
  }

  void _showResult(BuildContext context, Result<void> result,
      {required String success, Key? errorKey}) {
    switch (result) {
      case Ok<void>():
        if (success.isNotEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(success)));
        }
      case Err<void>(:final message):
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(key: errorKey, content: Text(message)));
    }
  }
}
