import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ects_tracker/l10n/app_localizations.dart';

import '../data/repositories.dart';
import '../dev/stress_seed.dart';
import '../i18n/app_locales.dart';import '../models/models.dart';
import '../models/reminder_settings.dart';
import '../notifications/reminder_service.dart';
import '../state/providers.dart';
import 'app_sizes.dart';
import 'err_text.dart';
import 'glass.dart';
import 'reminder_preview.dart';
import 'widgets.dart';

part 'settings/reminder_tiles.dart';
part 'settings/tiles.dart';
part 'settings/hold_to_confirm.dart';

/// Settings (ECTS-011): hours-per-ECTS, targets, first weekday, display prefs,
/// import/export/reset, plus "clear sample data" (ECTS-016).
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  /// Hidden dev-mode unlock: taps on the Data section icon in quick
  /// succession (≤2 s apart). Resets on slow taps. No animation by design.
  int _devTaps = 0;
  DateTime? _devLastTap;
  bool _pumping = false;

  void _registerDevTap() {
    final now = DateTime.now();
    if (_devLastTap != null &&
        now.difference(_devLastTap!) > const Duration(seconds: 2)) {
      _devTaps = 0;
    }
    _devLastTap = now;
    _devTaps++;
    if (_devTaps >= 10) {
      _devTaps = 0;
      _askActivateDevMode();
    }
  }

  Future<void> _askActivateDevMode() async {
    if (ref.read(devModeProvider)) return;
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final title = Text(l10n.devToolsActivateTitle);
        final content = Text(l10n.devToolsActivateMessage);
        final actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmActivateDevMode'),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.devToolsActivate),
          ),
        ];
        // Glass dialogs (ECTS-064): same title/content/actions/Keys.
        if (!glass) {
          return AlertDialog(
              title: title, content: content, actions: actions);
        }
        return glassAlert(context,
            title: title, content: content, actions: actions);
      },
    );
    if (confirmed == true && mounted) {
      ref.read(devModeProvider.notifier).state = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.devToolsActivated)),
      );
    }
  }

  Future<void> _pumpTestData() async {
    if (_pumping) return;
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    // Confirm twice: intent, then consequence.
    final step1 = await showDialog<bool>(
      context: context,
      builder: (context) {
        final title = Text(l10n.devToolsPumpTitle);
        final content = Text(l10n.devToolsPumpMessage);
        final actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmPumpStep1'),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.devToolsContinue),
          ),
        ];
        // Glass dialogs (ECTS-064): same title/content/actions/Keys.
        if (!glass) {
          return AlertDialog(
              title: title, content: content, actions: actions);
        }
        return glassAlert(context,
            title: title, content: content, actions: actions);
      },
    );
    if (step1 != true || !mounted) return;
    final step2 = await showDialog<bool>(
      context: context,
      builder: (context) {
        final title = Text(l10n.devToolsConfirmPumpTitle);
        final content = Text(l10n.devToolsConfirmPumpMessage);
        final actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmPumpStep2'),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.devToolsPumpData),
          ),
        ];
        // Glass dialogs (ECTS-064): same title/content/actions/Keys.
        if (!glass) {
          return AlertDialog(
              title: title, content: content, actions: actions);
        }
        return glassAlert(context,
            title: title, content: content, actions: actions);
      },
    );
    if (step2 != true || !mounted) return;
    setState(() => _pumping = true);
    try {
      final payload = buildStressPayload(random: Random());
      final result =
          await ref.read(devPumpRepositoryProvider).pump(payload);
      if (!mounted) return;
      switch (result) {
        case Ok<(int, int)>(:final value):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(l10n.devToolsPumped(
                    '${value.$1}', '${value.$2}'))),
          );
        case Err<(int, int)>(:final message):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(localizeRepoMessage(message, l10n))),
          );
      }
    } finally {
      if (mounted) setState(() => _pumping = false);
    }
  }

  Future<void> _clearPumpedData() async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final title = Text(l10n.devToolsClearPumpedTitle);
        final content = Text(l10n.devToolsClearPumpedMessage);
        final actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmClearPumpedData'),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.settingsClear),
          ),
        ];
        // Glass dialogs (ECTS-064): same title/content/actions/Keys.
        if (!glass) {
          return AlertDialog(
              title: title, content: content, actions: actions);
        }
        return glassAlert(context,
            title: title, content: content, actions: actions);
      },
    );
    if (confirmed != true || !mounted) return;
    final result = await ref.read(devPumpRepositoryProvider).clearPumped();
    if (!mounted) return;
    switch (result) {
      case Ok<int>(:final value):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.devToolsCleared('$value'))),
        );
      case Err<int>(:final message):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
    }
  }

  Future<void> _confirmRemoveAllDev() async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final title = Text(l10n.devToolsRemoveAllTitle);
        final content = Text(l10n.devToolsRemoveAllMessage);
        final actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmRemoveAllDataDev'),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.settingsDeleteEverything),
          ),
        ];
        // Glass dialogs (ECTS-064): same title/content/actions/Keys.
        if (!glass) {
          return AlertDialog(
              title: title, content: content, actions: actions);
        }
        return glassAlert(context,
            title: title, content: content, actions: actions);
      },
    );
    if (confirmed != true || !mounted) return;
    final result = await ref.read(backupRepositoryProvider).resetAllData();
    if (!mounted) return;
    _showResult(context, result, success: l10n.settingsAllDataDeleted);
  }

  @override
  Widget build(BuildContext context) {
    final hasSample = ref.watch(hasSampleDataProvider);
    final settingsAsync = ref.watch(settingsProvider);
    final settings = settingsAsync.valueOrNull ?? const AppSettings();
    final devMode = ref.watch(devModeProvider);
    final l10n = AppLocalizations.of(context)!;
    // Glass flow-through: outer bottom inset is gone (see home_shell), so
    // the scrollable carries the tab-bar clearance itself.
    final glass = ref.watch(glassEnabledProvider);
    final bottomPad = glass
        ? AppSizes.glassPageBottomInset + AppSizes.pageBottomPadNoFab
        : AppSizes.pageBottomPadNoFab;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: AppSizes.maxContentWidth),
        child: GlassBatch(
          child: ListView(
          padding: EdgeInsets.fromLTRB(
            AppSizes.pageHPad,
            AppSizes.pageTopPad,
            AppSizes.pageHPad,
            bottomPad,
          ),
          children: [
            SectionHeader(
              title: l10n.settingsStudySettings,
              icon: Icons.school_outlined,
              padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
            ),
            _SettingsCard(
              children: [
                _SettingsTile(
                  tileKey: const Key('hoursPerEctsTile'),
                  icon: Icons.timelapse_outlined,
                  title: l10n.settingsHoursPerEcts,
                  subtitle: Text(
                    l10n.settingsHoursPerEctsValue(settings.hoursPerEcts
                        .toStringAsFixed(
                            settings.hoursPerEcts % 1 == 0 ? 0 : 1)),
                  ),
                  onTap: () => _editHoursPerEcts(context, ref, settings),
                ),
                _SettingsTile(
                  tileKey: const Key('dailyTargetTile'),
                  icon: Icons.flag_outlined,
                  title: l10n.settingsDailyTarget,
                  subtitle: Text(settings.dailyTargetMinutes > 0
                      ? l10n.settingsDailyTargetValue(
                          '${settings.dailyTargetMinutes}')
                      : l10n.settingsNoTarget),
                  onTap: () => _editDailyTarget(context, ref, settings),
                  showDivider: false,
                ),
                _SettingsTile(
                  tileKey: const Key('firstWeekdayTile'),
                  icon: Icons.view_week_outlined,
                  title: l10n.settingsFirstWeekday,
                  subtitle:
                      Text(_weekdayName(l10n, settings.firstWeekday)),
                  onTap: () => _editFirstWeekday(context, ref, settings),
                  showDivider: false,
                  topDivider: true,
                ),
                _SettingsTile(
                  tileKey: const Key('paceToleranceTile'),
                  icon: Icons.speed_outlined,
                  title: l10n.settingsPaceTolerance,
                  subtitle: Text(
                    l10n.settingsToleranceOfWork(
                        _formatTolerance(l10n, settings.paceToleranceDays)),
                  ),
                  onTap: () => _editPaceTolerance(context, ref, settings),
                  topDivider: true,
                ),
                _SettingsTile(
                  tileKey: const Key('overloadThresholdTile'),
                  icon: Icons.local_fire_department_outlined,
                  title: l10n.settingsOverloadThreshold,
                  subtitle: Text(
                    l10n.settingsOverloadSubtitle(_formatOverload(
                        l10n, settings.weeklyOverloadHours)),
                  ),
                  onTap: () => _editOverloadThreshold(context, ref, settings),
                  showDivider: false,
                  topDivider: true,
                ),
                const _ReminderTiles(),
              ],
            ),
            SectionHeader(
              title: l10n.settingsDisplay,
              icon: Icons.palette_outlined,
              padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
            ),
            _SettingsCard(
              children: [
                _SettingsTile(
                  tileKey: const Key('languageTile'),
                  icon: Icons.translate_outlined,
                  title: l10n.settingsLanguage,
                  subtitle: Text(_languageName(l10n, settings.localeCode)),
                  onTap: () => _editLanguage(context, ref, settings),
                  topDivider: false,
                ),
                _SettingsTile(
                  tileKey: const Key('themeModeTile'),
                  icon: Icons.brightness_6_outlined,
                  title: l10n.settingsAppearance,
                  subtitle:
                      Text(_themeModeName(l10n, settings.themeMode)),
                  onTap: () => _editThemeMode(context, ref, settings),
                  topDivider: true,
                ),
                _SettingsTile(
                  tileKey: const Key('displaySizeTile'),
                  icon: Icons.format_size_outlined,
                  title: l10n.settingsDisplaySize,
                  subtitle:
                      Text(_displaySizeName(l10n, settings.displaySize)),
                  onTap: () => _editDisplaySize(context, ref, settings),
                  topDivider: true,
                ),
                _SettingsTile(
                  tileKey: const Key('accentTile'),
                  icon: Icons.color_lens_outlined,
                  title: l10n.settingsAccent,
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Color(settings.accent.seedValue),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Flexible(
                          child: Text(_accentName(l10n, settings.accent))),
                    ],
                  ),
                  onTap: () => _editAccent(context, ref, settings),
                  topDivider: true,
                ),
                _SettingsTile(
                  tileKey: const Key('liquidGlassTile'),
                  icon: Icons.blur_on_outlined,
                  title: l10n.settingsLiquidGlass,
                  // No On/Off state line (ECTS-066): the Switch itself
                  // already shows the state.
                  subtitle: Text(l10n.settingsLiquidGlassSubtitle),
                  trailing: Switch(
                    value: settings.liquidGlass,
                    onChanged: (value) =>
                        _setLiquidGlass(context, ref, value),
                  ),
                  showDivider: false,
                  topDivider: true,
                ),
              ],
            ),
            _UnlockableSectionHeader(
              title: l10n.settingsData,
              icon: Icons.storage_outlined,
              onIconTap: _registerDevTap,
            ),
            _SettingsCard(
              children: [
                hasSample.when(
                  loading: () => ListTile(
                    leading: const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    title: Text(l10n.settingsCheckingSample),
                  ),
                  error: (e, _) => ListTile(
                    leading: const Icon(Icons.error_outline),
                    title: Text(l10n.settingsSampleData),
                    subtitle: Text(l10n.settingsSampleDataError('$e')),
                  ),
                  data: (present) => present
                      ? _SettingsTile(
                          tileKey: const Key('clearSampleDataTile'),
                          icon: Icons.delete_sweep_outlined,
                          title: l10n.settingsClearSample,
                          subtitle: Text(
                            l10n.settingsClearSampleSubtitle,
                          ),
                          onTap: () => _confirmClearSample(context, ref),
                        )
                      : _SettingsTile(
                          tileKey: const Key('noSampleDataTile'),
                          icon: Icons.check_circle_outline,
                          title: l10n.settingsNoSample,
                          subtitle: Text(l10n.settingsNoSampleSubtitle),
                          onIconTap: _registerDevTap,
                        ),
                ),
                _SettingsTile(
                  tileKey: const Key('exportDataTile'),
                  icon: Icons.file_upload_outlined,
                  title: l10n.settingsExport,
                  subtitle: Text(l10n.settingsExportSubtitle),
                  onTap: () => _exportData(context, ref),
                ),
                _SettingsTile(
                  tileKey: const Key('importDataTile'),
                  icon: Icons.file_download_outlined,
                  title: l10n.settingsImport,
                  subtitle: Text(l10n.settingsImportSubtitle),
                  onTap: () => _importData(context, ref),
                ),
                _SettingsTile(
                  tileKey: const Key('resetSettingsTile'),
                  icon: Icons.settings_backup_restore_outlined,
                  title: l10n.settingsResetSettings,
                  subtitle: Text(l10n.settingsResetSettingsSubtitle),
                  onTap: () => _confirmResetSettings(context, ref),
                  showDivider: false,
                ),
              ],
            ),
            if (devMode) ...[
              const SizedBox(height: 12),
              SectionHeader(
                title: l10n.settingsDevMode,
                icon: Icons.bug_report_outlined,
                padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
              ),
              _SettingsCard(
                children: [
                  _SettingsTile(
                    tileKey: const Key('pumpTestDataTile'),
                    icon: Icons.science_outlined,
                    title: l10n.devToolsPumpTile,
                    subtitle: Text(_pumping
                        ? l10n.devToolsPumping
                        : l10n.devToolsPumpSubtitle),
                    onTap: _pumping ? null : _pumpTestData,
                  ),
                  _SettingsTile(
                    tileKey: const Key('clearPumpedDataTile'),
                    icon: Icons.cleaning_services_outlined,
                    title: l10n.devToolsClearPumped,
                    subtitle: Text(l10n.devToolsClearPumpedSubtitle),
                    onTap: _clearPumpedData,
                  ),
                  _SettingsTile(
                    tileKey: const Key('reminderPreviewTile'),
                    icon: Icons.notifications_outlined,
                    title: l10n.devToolsReminderPreview,
                    subtitle:
                        Text(l10n.devToolsReminderPreviewSubtitle),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ReminderPreviewPage(),
                      ),
                    ),
                  ),
                  _SettingsTile(
                    tileKey: const Key('removeAllDataDevTile'),
                    icon: Icons.delete_forever_outlined,
                    title: l10n.devToolsRemoveAll,
                    subtitle: Text(l10n.devToolsRemoveAllSubtitle),
                    onTap: _confirmRemoveAllDev,
                  ),
                  _SettingsTile(
                    tileKey: const Key('exitDevModeTile'),
                    icon: Icons.logout_outlined,
                    title: l10n.devToolsExit,
                    subtitle: Text(l10n.devToolsExitSubtitle),
                    onTap: () =>
                        ref.read(devModeProvider.notifier).state = false,
                    showDivider: false,
                  ),
                ],
              ),
            ],
            const SizedBox(height: 8),
          ],
          ),
        ),
      ),
    );
  }

  String _weekdayName(AppLocalizations l10n, int weekday) => switch (weekday) {
        1 => l10n.settingsWeekdayMonday,
        2 => l10n.settingsWeekdayTuesday,
        3 => l10n.settingsWeekdayWednesday,
        4 => l10n.settingsWeekdayThursday,
        5 => l10n.settingsWeekdayFriday,
        6 => l10n.settingsWeekdaySaturday,
        7 => l10n.settingsWeekdaySunday,
        _ => l10n.settingsWeekdayMonday,
      };

  String _themeModeName(AppLocalizations l10n, AppThemeMode mode) =>
      switch (mode) {
        AppThemeMode.system => l10n.settingsThemeSystem,
        AppThemeMode.light => l10n.settingsThemeLight,
        AppThemeMode.dark => l10n.settingsThemeDark,
      };

  String _languageName(AppLocalizations l10n, String? code) =>
      appLocaleNativeName(code) ?? l10n.settingsThemeSystem;

  String _displaySizeName(AppLocalizations l10n, AppDisplaySize size) =>
      switch (size) {
        AppDisplaySize.compact => l10n.settingsDisplayCompact,
        AppDisplaySize.comfortable => l10n.settingsDisplayComfortable,
        AppDisplaySize.large => l10n.settingsDisplayLarge,
      };

  String _accentName(AppLocalizations l10n, AppAccent accent) =>
      switch (accent) {
        AppAccent.teal => l10n.settingsAccentTeal,
        AppAccent.forest => l10n.settingsAccentForest,
        AppAccent.clay => l10n.settingsAccentClay,
        AppAccent.slate => l10n.settingsAccentSlate,
        AppAccent.berry => l10n.settingsAccentBerry,
      };

  String _formatTolerance(AppLocalizations l10n, double v) =>
      l10n.settingsToleranceDays(v % 1 == 0
          ? v.toStringAsFixed(0)
          : v.toStringAsFixed(1));

  String _formatOverload(AppLocalizations l10n, double v) =>
      l10n.settingsOverloadHours(v % 1 == 0
          ? v.toStringAsFixed(0)
          : v.toStringAsFixed(1));

  Future<void> _editOverloadThreshold(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final controller =
        TextEditingController(text: settings.weeklyOverloadHours.toString());
    String? errorText;
    final value = await showDialog<double>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          // Glass dialogs (ECTS-064): same title/content/actions/Keys;
          // the TextField stays a solid Material surface inside glass.
          final title = Text(l10n.settingsOverloadThreshold);
          final content = TextField(
            key: const Key('overloadThresholdField'),
            controller: controller,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: l10n.settingsOverloadLabel,
              helperText: l10n.settingsOverloadHelper,
              helperMaxLines: 3,
              errorText: errorText,
            ),
            autofocus: true,
          );
          final actions = [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.commonCancel),
            ),
            FilledButton(
              key: const Key('saveOverloadThreshold'),
              onPressed: () {
                final parsed = double.tryParse(
                    controller.text.trim().replaceAll(',', '.'));
                if (parsed == null || parsed < 5 || parsed > 100) {
                  setState(
                      () => errorText = l10n.settingsOverloadError);
                  return;
                }
                Navigator.of(context).pop(parsed);
              },
              child: Text(l10n.commonSave),
            ),
          ];
          if (!glass) {
            return AlertDialog(
                title: title, content: content, actions: actions);
          }
          return glassAlert(context,
              title: title, content: content, actions: actions);
        },
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.dispose());
    if (value == null || !context.mounted) return;
    final result = await ref
        .read(settingsRepositoryProvider)
        .setWeeklyOverloadHours(value);
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsOverloadUpdated);
  }

  Future<void> _editPaceTolerance(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final controller =
        TextEditingController(text: settings.paceToleranceDays.toString());
    String? errorText;
    final value = await showDialog<double>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          // Glass dialogs (ECTS-064): same title/content/actions/Keys;
          // the TextField stays a solid Material surface inside glass.
          final title = Text(l10n.settingsPaceTolerance);
          final content = TextField(
            key: const Key('paceToleranceField'),
            controller: controller,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: l10n.settingsToleranceLabel,
              helperText: l10n.settingsToleranceHelper,
              helperMaxLines: 3,
              errorText: errorText,
            ),
            autofocus: true,
          );
          final actions = [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.commonCancel),
            ),
            FilledButton(
              key: const Key('savePaceTolerance'),
              onPressed: () {
                final parsed = double.tryParse(
                    controller.text.trim().replaceAll(',', '.'));
                if (parsed == null || parsed < 0 || parsed > 30) {
                  setState(
                      () => errorText = l10n.settingsToleranceError);
                  return;
                }
                Navigator.of(context).pop(parsed);
              },
              child: Text(l10n.commonSave),
            ),
          ];
          if (!glass) {
            return AlertDialog(
                title: title, content: content, actions: actions);
          }
          return glassAlert(context,
              title: title, content: content, actions: actions);
        },
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.dispose());
    if (value == null || !context.mounted) return;
    final result = await ref
        .read(settingsRepositoryProvider)
        .setPaceToleranceDays(value);
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsToleranceUpdated);
  }

  Future<void> _editHoursPerEcts(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final controller = TextEditingController(
        text: settings.hoursPerEcts.toStringAsFixed(
            settings.hoursPerEcts % 1 == 0 ? 0 : 1));
    String? errorText;
    final value = await showDialog<double>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          // Glass dialogs (ECTS-064): same title/content/actions/Keys;
          // the TextField stays a solid Material surface inside glass.
          final title = Text(l10n.settingsHoursPerEcts);
          final content = TextField(
            key: const Key('hoursPerEctsField'),
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: l10n.settingsHoursLabel,
              helperText: l10n.settingsHoursHelper,
              helperMaxLines: 3,
              errorText: errorText,
            ),
            autofocus: true,
          );
          final actions = [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.commonCancel),
            ),
            FilledButton(
              key: const Key('saveHoursPerEcts'),
              onPressed: () {
                final parsed = double.tryParse(controller.text.trim().replaceAll(',', '.'));
                if (parsed == null || parsed <= 0) {
                  setState(() => errorText = l10n.settingsHoursError);
                  return;
                }
                Navigator.of(context).pop(parsed);
              },
              child: Text(l10n.commonSave),
            ),
          ];
          if (!glass) {
            return AlertDialog(
                title: title, content: content, actions: actions);
          }
          return glassAlert(context,
              title: title, content: content, actions: actions);
        },
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.dispose());
    if (value == null || !context.mounted) return;
    final result =
        await ref.read(settingsRepositoryProvider).setHoursPerEcts(value);
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsHoursUpdated);
  }

  Future<void> _editDailyTarget(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final controller =
        TextEditingController(text: settings.dailyTargetMinutes.toString());
    String? errorText;
    final value = await showDialog<int>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          // Glass dialogs (ECTS-064): same title/content/actions/Keys;
          // the TextField stays a solid Material surface inside glass.
          final title = Text(l10n.settingsDailyTarget);
          final content = TextField(
            key: const Key('dailyTargetField'),
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: l10n.settingsDailyLabel,
              errorText: errorText,
            ),
            autofocus: true,
          );
          final actions = [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.commonCancel),
            ),
            FilledButton(
              key: const Key('saveDailyTarget'),
              onPressed: () {
                final parsed = int.tryParse(controller.text.trim());
                if (parsed == null || parsed < 0) {
                  setState(() => errorText = l10n.settingsDailyError);
                  return;
                }
                Navigator.of(context).pop(parsed);
              },
              child: Text(l10n.commonSave),
            ),
          ];
          if (!glass) {
            return AlertDialog(
                title: title, content: content, actions: actions);
          }
          return glassAlert(context,
              title: title, content: content, actions: actions);
        },
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.dispose());
    if (value == null || !context.mounted) return;
    final result = await ref
        .read(settingsRepositoryProvider)
        .setDailyTargetMinutes(value);
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsDailyUpdated);
  }

  Future<void> _editFirstWeekday(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final selected = await showDialog<int>(
      context: context,
      builder: (context) {
        Widget optionRow(int day) => Row(
              children: [
                Expanded(child: Text(_weekdayName(l10n, day))),
                if (day == settings.firstWeekday)
                  const Icon(Icons.check, size: 18),
              ],
            );
        // Glass pickers (ECTS-064): off keeps the identical SimpleDialog;
        // on shows the same options (same Keys/taps) in a glass alert.
        if (!glass) {
          return SimpleDialog(
            title: Text(l10n.settingsFirstWeekday),
            children: [
              for (var day = 1; day <= 7; day++)
                SimpleDialogOption(
                  key: Key('weekday_$day'),
                  onPressed: () => Navigator.of(context).pop(day),
                  child: optionRow(day),
                ),
            ],
          );
        }
        return glassAlert(
          context,
          title: Text(l10n.settingsFirstWeekday),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var day = 1; day <= 7; day++)
                GlassOption(
                  key: Key('weekday_$day'),
                  onTap: () => Navigator.of(context).pop(day),
                  child: optionRow(day),
                ),
            ],
          ),
        );
      },
    );
    if (selected == null || !context.mounted) return;
    final result =
        await ref.read(settingsRepositoryProvider).setFirstWeekday(selected);
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsFirstWeekdayUpdated);
  }

  Future<void> _editLanguage(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    // The system entry pops '' (dismissal pops null), so picking "system"
    // is distinguishable from dismissing the dialog.
    final selected = await showDialog<String>(
      context: context,
      builder: (context) {
        Widget systemRow() => Row(
              children: [
                Expanded(child: Text(l10n.settingsThemeSystem)),
                if (settings.localeCode == null)
                  const Icon(Icons.check, size: 18),
              ],
            );
        // Glass pickers (ECTS-064): off keeps the identical SimpleDialog;
        // on shows the same options (same Keys/taps) in a glass alert.
        if (!glass) {
          return SimpleDialog(
            title: Text(l10n.settingsLanguage),
            children: [
              SimpleDialogOption(
                key: const Key('language_system'),
                onPressed: () => Navigator.of(context).pop(''),
                child: systemRow(),
              ),
              for (final option in kAppLocales)
                SimpleDialogOption(
                  key: Key('language_${option.code}'),
                  onPressed: () => Navigator.of(context).pop(option.code),
                  child: Row(
                    children: [
                      Expanded(child: Text(option.nativeName)),
                      if (option.code == settings.localeCode)
                        const Icon(Icons.check, size: 18),
                    ],
                  ),
                ),
            ],
          );
        }
        return glassAlert(
          context,
          title: Text(l10n.settingsLanguage),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GlassOption(
                  key: const Key('language_system'),
                  onTap: () => Navigator.of(context).pop(''),
                  child: systemRow(),
                ),
                for (final option in kAppLocales)
                  GlassOption(
                    key: Key('language_${option.code}'),
                    onTap: () => Navigator.of(context).pop(option.code),
                    child: Row(
                      children: [
                        Expanded(child: Text(option.nativeName)),
                        if (option.code == settings.localeCode)
                          const Icon(Icons.check, size: 18),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
    if (selected == null || !context.mounted) return;
    final result = await ref
        .read(settingsRepositoryProvider)
        .setLocaleCode(selected.isEmpty ? null : selected);
    if (!context.mounted) return;
    switch (result) {
      case Ok<void>():
        break;
      case Err<void>(:final message):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizeRepoMessage(
                  message, AppLocalizations.of(context)!))),
        );
    }
  }

  Future<void> _editThemeMode(
      BuildContext context, WidgetRef ref, AppSettings settings) async {    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final selected = await showDialog<AppThemeMode>(
      context: context,
      builder: (context) {
        Widget modeRow(AppThemeMode mode) => Row(
              children: [
                Expanded(child: Text(_themeModeName(l10n, mode))),
                if (mode == settings.themeMode)
                  const Icon(Icons.check, size: 18),
              ],
            );
        // Glass pickers (ECTS-064): off keeps the identical SimpleDialog;
        // on shows the same options (same Keys/taps) in a glass alert.
        if (!glass) {
          return SimpleDialog(
            title: Text(l10n.settingsThemeTitle),
            children: [
              for (final mode in AppThemeMode.values)
                SimpleDialogOption(
                  key: Key('theme_${mode.name}'),
                  onPressed: () => Navigator.of(context).pop(mode),
                  child: modeRow(mode),
                ),
            ],
          );
        }
        return glassAlert(
          context,
          title: Text(l10n.settingsThemeTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final mode in AppThemeMode.values)
                GlassOption(
                  key: Key('theme_${mode.name}'),
                  onTap: () => Navigator.of(context).pop(mode),
                  child: modeRow(mode),
                ),
            ],
          ),
        );
      },
    );
    if (selected == null || !context.mounted) return;
    final result =
        await ref.read(settingsRepositoryProvider).setThemeMode(selected);
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsThemeUpdated);
  }

  Future<void> _editDisplaySize(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final selected = await showDialog<AppDisplaySize>(
      context: context,
      builder: (context) {
        Widget sizeRow(AppDisplaySize size) => Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.settingsDisplaySizeOption(
                      _displaySizeName(l10n, size),
                      (size.scale * 100).toStringAsFixed(0),
                    ),
                    style: TextStyle(fontSize: 16 * size.scale),
                  ),
                ),
                if (size == settings.displaySize)
                  const Icon(Icons.check, size: 18),
              ],
            );
        // Glass pickers (ECTS-064): off keeps the identical SimpleDialog;
        // on shows the same options (same Keys/taps) in a glass alert.
        if (!glass) {
          return SimpleDialog(
            title: Text(l10n.settingsDisplaySize),
            children: [
              for (final size in AppDisplaySize.values)
                SimpleDialogOption(
                  key: Key('displaySize_${size.name}'),
                  onPressed: () => Navigator.of(context).pop(size),
                  child: sizeRow(size),
                ),
            ],
          );
        }
        return glassAlert(
          context,
          title: Text(l10n.settingsDisplaySize),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final size in AppDisplaySize.values)
                GlassOption(
                  key: Key('displaySize_${size.name}'),
                  onTap: () => Navigator.of(context).pop(size),
                  child: sizeRow(size),
                ),
            ],
          ),
        );
      },
    );
    if (selected == null || !context.mounted) return;
    final result =
        await ref.read(settingsRepositoryProvider).setDisplaySize(selected);
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsDisplaySizeUpdated);
  }

  Future<void> _editAccent(
      BuildContext context, WidgetRef ref, AppSettings settings) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final selected = await showDialog<AppAccent>(
      context: context,
      builder: (context) {
        Widget accentRow(AppAccent accent) => Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Color(accent.seedValue),
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(child: Text(_accentName(l10n, accent))),
                if (accent == settings.accent)
                  const Icon(Icons.check, size: 18),
              ],
            );
        // Glass pickers (ECTS-064): off keeps the identical SimpleDialog;
        // on shows the same options (same Keys/taps) in a glass alert.
        if (!glass) {
          return SimpleDialog(
            title: Text(l10n.settingsAccent),
            children: [
              for (final accent in AppAccent.values)
                SimpleDialogOption(
                  key: Key('accent_${accent.name}'),
                  onPressed: () => Navigator.of(context).pop(accent),
                  child: accentRow(accent),
                ),
            ],
          );
        }
        return glassAlert(
          context,
          title: Text(l10n.settingsAccent),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final accent in AppAccent.values)
                GlassOption(
                  key: Key('accent_${accent.name}'),
                  onTap: () => Navigator.of(context).pop(accent),
                  child: accentRow(accent),
                ),
            ],
          ),
        );
      },
    );
    if (selected == null || !context.mounted) return;
    final result =
        await ref.read(settingsRepositoryProvider).setAccent(selected);
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsAccentUpdated);
  }

  Future<void> _setLiquidGlass(
      BuildContext context, WidgetRef ref, bool value) async {
    final l10n = AppLocalizations.of(context)!;
    final result =
        await ref.read(settingsRepositoryProvider).setLiquidGlass(value);
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsLiquidGlassUpdated);
  }

  Future<void> _confirmClearSample(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final title = Text(l10n.settingsClearSampleTitle);
        final content = Text(l10n.settingsClearSampleMessage);
        final actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmClearSampleData'),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.settingsClear),
          ),
        ];
        // Glass dialogs (ECTS-064): same title/content/actions/Keys.
        if (!glass) {
          return AlertDialog(
              title: title, content: content, actions: actions);
        }
        return glassAlert(context,
            title: title, content: content, actions: actions);
      },
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
            content: Text(localizeRepoMessage(
                message, AppLocalizations.of(context)!)),
          ),
        );
    }
  }

  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final result = await ref.read(backupRepositoryProvider).exportJson();
    if (!context.mounted) return;
    switch (result) {
      case Err<String>():
        _showResult(context, Err<void>((result).message), success: '');
      case Ok<String>(:final value):
        int courses = 0;
        int sessions = 0;
        try {
          final decoded = jsonDecode(value);
          if (decoded is Map) {
            final c = decoded['courses'];
            final s = decoded['sessions'];
            if (c is List) courses = c.length;
            if (s is List) sessions = s.length;
          }
        } catch (_) {
          // Counts are display-only; a decode miss keeps 0/0, the raw
          // JSON below is still shown (value came from our own export).
        }
        final kb = (value.length / 1024).toStringAsFixed(1);
        const previewLimit = 4000;
        final preview = value.length > previewLimit
            ? '${value.substring(0, previewLimit)}\n${l10n.settingsExportTruncated(kb)}'
            : value;
        await showDialog<void>(
          context: context,
          builder: (context) {
            // Glass dialogs (ECTS-064): same title/content/actions/Keys.
            final title = Text(l10n.settingsExport);
            final content = SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(l10n.settingsExportSummary(
                        '$courses', '$sessions', kb)),
                    const SizedBox(height: 8),
                    SelectableText(
                      preview,
                      key: const Key('exportJsonText'),
                      style:
                          const TextStyle(fontFamily: 'monospace', fontSize: 12),
                    ),
                  ],
                ),
              ),
            );
            final actions = [
              TextButton(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: value));
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.settingsExportCopied)),
                    );
                  }
                },
                child: Text(l10n.settingsCopy),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l10n.commonClose),
              ),
            ];
            if (!glass) {
              return AlertDialog(
                  title: title, content: content, actions: actions);
            }
            return glassAlert(context,
                title: title, content: content, actions: actions);
          },
        );
    }
  }

  Future<void> _importData(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final controller = TextEditingController();
    ImportMode mode = ImportMode.replace;
    String? previewText;
    bool previewOk = false;
    String previewError = '';
    int previewCourses = 0;
    int previewSessions = 0;
    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          Future<void> validate() async {
            final text = controller.text;
            if (text.trim().isEmpty) {
              setState(() {
                previewOk = false;
                previewError = '';
                previewText = null;
              });
              return;
            }
            final res =
                await ref.read(backupRepositoryProvider).previewImport(text);
            if (!context.mounted) return;
            switch (res) {
              case Ok<BackupPreview>(:final value):
                setState(() {
                  previewOk = true;
                  previewError = '';
                  previewCourses = value.courses;
                  previewSessions = value.sessions;
                  previewText =
                      l10n.settingsImportPreview(
                          '${value.courses}', '${value.sessions}') +
                      (value.exportedAt != null
                          ? l10n.settingsImportPreviewExported(
                              '${value.exportedAt}')
                          : '') +
                      (value.dbSchema != null
                          ? l10n.settingsImportPreviewSchema(
                              '${value.dbSchema}')
                          : '');
                });
              case Err<BackupPreview>(:final message):
                setState(() {
                  previewOk = false;
                  previewError = message;
                  previewText = null;
                });
            }
          }

          // Glass dialogs (ECTS-064): same title/content/actions/Keys;
          // inputs stay solid Material surfaces inside glass.
          final importTitle = Text(l10n.settingsImport);
          final importContent = SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.settingsImportInfo),
                  const SizedBox(height: 12),
                  TextField(
                    key: const Key('importJsonField'),
                    controller: controller,
                    maxLines: 6,
                    decoration: InputDecoration(
                      labelText: l10n.settingsImportLabel,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (_) => validate(),
                  ),
                  const SizedBox(height: 8),
                  if (previewError.isNotEmpty)
                    Text(
                      previewError,
                      key: const Key('importPreviewError'),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error),
                    ),
                  if (previewText != null)
                    Text(
                      previewText!,
                      key: const Key('importPreviewOk'),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  const SizedBox(height: 8),
                  SegmentedButton<ImportMode>(
                    segments: [
                      ButtonSegment(
                        value: ImportMode.append,
                        label: Text(l10n.settingsImportAppend),
                        icon: const Icon(Icons.add),
                      ),
                      ButtonSegment(
                        value: ImportMode.replace,
                        label: Text(l10n.settingsImportReplace),
                        icon: const Icon(Icons.warning_amber_outlined),
                      ),
                    ],
                    selected: {mode},
                    onSelectionChanged: (s) =>
                        setState(() => mode = s.first),
                  ),
                  if (mode == ImportMode.replace) ...[
                    const SizedBox(height: 12),
                    Text(
                      l10n.settingsImportReplaceWarning('10'),
                    ),
                    const SizedBox(height: 8),
                    _HoldToConfirmButton(
                      enabled: previewOk,
                      seconds: 10,
                      label: l10n.settingsHoldToReplace,
                      onConfirmed: () async {
                        final text = controller.text;
                        Navigator.of(context).pop();
                        final result = await ref
                            .read(backupRepositoryProvider)
                            .importJson(text, mode: ImportMode.replace);
                        if (!context.mounted) return;
                        _showResult(context, result,
                            success: l10n.settingsImportReplaced(
                                '$previewCourses', '$previewSessions'),
                            errorKey: const Key('importDataError'));
                      },
                    ),
                  ],
                ],
              ),
            ),
          );
          final importActions = [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.commonCancel),
            ),
            if (mode == ImportMode.append)
              FilledButton(
                key: const Key('confirmImportData'),
                onPressed: !previewOk
                    ? null
                    : () async {
                        final text = controller.text;
                        Navigator.of(context).pop();
                        final result = await ref
                            .read(backupRepositoryProvider)
                            .importJson(text, mode: ImportMode.append);
                        if (!context.mounted) return;
                        _showResult(context, result,
                            success: l10n.settingsImportAppended(
                                '$previewCourses', '$previewSessions'),
                            errorKey: const Key('importDataError'));
                      },
                child: Text(l10n.settingsImportAppendAction),
              ),
          ];
          if (!glass) {
            return AlertDialog(
              title: importTitle,
              content: importContent,
              actions: importActions,
            );
          }
          return glassAlert(
            context,
            title: importTitle,
            content: importContent,
            actions: importActions,
          );
        },
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.dispose());
  }

  Future<void> _confirmResetSettings(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final glass = ref.read(glassEnabledProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final title = Text(l10n.settingsResetSettingsTitle);
        final content = Text(l10n.settingsResetSettingsMessage);
        final actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmResetSettings'),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.settingsReset),
          ),
        ];
        // Glass dialogs (ECTS-064): same title/content/actions/Keys.
        if (!glass) {
          return AlertDialog(
              title: title, content: content, actions: actions);
        }
        return glassAlert(context,
            title: title, content: content, actions: actions);
      },
    );
    if (confirmed != true || !context.mounted) return;
    final result = await ref.read(settingsRepositoryProvider).resetToDefaults();
    if (!context.mounted) return;
    _showResult(context, result, success: l10n.settingsResetSettingsDone);
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
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            key: errorKey,
            content: Text(localizeRepoMessage(message, l10n))));
    }
  }
}
