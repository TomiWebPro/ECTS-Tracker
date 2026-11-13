import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/logic/custom_reminders.dart';
import 'package:ects_tracker/src/logic/date_utils.dart';
import 'package:ects_tracker/src/logic/reminders.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:ects_tracker/src/notifications/reminder_text.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_sizes.dart';
import 'glass.dart';

/// Fake "now" for the preview feed. Null means the real clock.
/// (M9, ECTS-071: this is how reminders are tested on Windows, where OS
/// notifications cannot be exercised.)
final previewNowProvider = StateProvider<DateTime?>((ref) => null);

String _fmtTime(DateTime t) =>
    '${formatYmd(t)} '
    '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

String _kindLabel(AppLocalizations l10n, ReminderKind kind) => switch (kind) {
      ReminderKind.daily => l10n.reminderKindDaily,
      ReminderKind.behind => l10n.reminderKindBehind,
      ReminderKind.deadline => l10n.reminderKindDeadline,
      ReminderKind.overdue => l10n.reminderKindOverdue,
      ReminderKind.streak => l10n.reminderKindStreak,
      ReminderKind.custom => l10n.reminderKindCustom,
    };

/// Dev-mode feed of what WOULD notify (ECTS-071). Display-only: same pure
/// functions the OS scheduler (ECTS-072) will call, driven by live data
/// plus an optional fake clock. Layout follows the [AppSizes]/[GlassCard]
/// system (ECTS-076), like the Settings page.
class ReminderPreviewPage extends ConsumerWidget {
  const ReminderPreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final coursesAsync = ref.watch(coursesProvider);
    final sessionsAsync = ref.watch(sessionsProvider);
    final settingsAsync = ref.watch(settingsProvider);
    final fakeNow = ref.watch(previewNowProvider);
    final now = fakeNow ?? DateTime.now();
    final glass = ref.watch(glassEnabledProvider);
    final cardGap = glass ? AppSizes.glassCardGap : AppSizes.cardGap;
    final sectionGap =
        glass ? AppSizes.glassSectionGap : AppSizes.sectionGap;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.reminderPreviewTitle)),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
          child: GlassBatch(
            child: ListView(
              padding: EdgeInsets.fromLTRB(
                AppSizes.pageHPad,
                glass ? AppSizes.glassPageTopPad : AppSizes.pageTopPad,
                AppSizes.pageHPad,
                AppSizes.pageBottomPadNoFab,
              ),
              children: [
                _NowBar(now: now, hasOverride: fakeNow != null),
                SizedBox(height: sectionGap),
                if (coursesAsync.isLoading ||
                    sessionsAsync.isLoading ||
                    settingsAsync.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (coursesAsync.hasError ||
                    sessionsAsync.hasError ||
                    settingsAsync.hasError)
                  Text(
                    '${l10n.commonError}: ${coursesAsync.error ?? sessionsAsync.error ?? settingsAsync.error}',
                  )
                else ...[
                  _Feed(
                    courses: coursesAsync.valueOrNull ?? const [],
                    sessions: sessionsAsync.valueOrNull ?? const [],
                    settings:
                        settingsAsync.valueOrNull ?? const AppSettings(),
                    now: now,
                    cardGap: cardGap,
                  ),
                  SizedBox(height: sectionGap),
                  _CustomDemo(
                    courses: coursesAsync.valueOrNull ?? const [],
                    sessions: sessionsAsync.valueOrNull ?? const [],
                    settings:
                        settingsAsync.valueOrNull ?? const AppSettings(),
                    now: now,
                    cardGap: cardGap,
                    headerGap: glass
                        ? AppSizes.glassSectionInnerGap
                        : AppSizes.sectionInnerGap,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NowBar extends ConsumerWidget {
  const _NowBar({required this.now, required this.hasOverride});

  final DateTime now;
  final bool hasOverride;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final notifier = ref.read(previewNowProvider.notifier);
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${l10n.reminderPreviewNow}: ${_fmtTime(now)}${hasOverride ? ' ${l10n.reminderPreviewFake}' : ''}',
              key: const Key('previewNowLabel'),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: AppSizes.sectionInnerGap),
            Wrap(
              spacing: AppSizes.sectionInnerGap,
              children: [
                OutlinedButton(
                  key: const Key('previewBackDay'),
                  onPressed: () => notifier.state =
                      now.subtract(const Duration(days: 1)),
                  child: Text(l10n.reminderPreviewBackDay),
                ),
                OutlinedButton(
                  key: const Key('previewFwdDay'),
                  onPressed: () =>
                      notifier.state = now.add(const Duration(days: 1)),
                  child: Text(l10n.reminderPreviewFwdDay),
                ),
                FilledButton(
                  key: const Key('previewResetNow'),
                  onPressed:
                      hasOverride ? () => notifier.state = null : null,
                  child: Text(l10n.reminderPreviewReset),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Feed extends StatelessWidget {
  const _Feed({
    required this.courses,
    required this.sessions,
    required this.settings,
    required this.now,
    required this.cardGap,
  });

  final List<Course> courses;
  final List<StudySession> sessions;
  final AppSettings settings;
  final DateTime now;
  final double cardGap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = computeReminders(
      courses: courses,
      sessions: sessions,
      hoursPerEcts: settings.hoursPerEcts,
      now: now,
      toleranceDays: settings.paceToleranceDays,
    ).map((item) => localizeReminder(l10n, item)).toList();
    if (items.isEmpty) {
      return GlassCard(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.cardPadding),
          child: Text(
            l10n.reminderPreviewEmpty,
            key: const Key('reminderEmpty'),
          ),
        ),
      );
    }
    final scheme = Theme.of(context).colorScheme;
    // Full-bleed cards: stretch fills the ListView width so left/right
    // edges line up (ECTS-084). Default Column centering shrink-wraps
    // GlassCard to its content and reads as staggered centered tiles.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) SizedBox(height: cardGap),
          GlassCard(
            key: Key('reminderCard_$i'),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.cardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(label: Text(_kindLabel(l10n, items[i].kind))),
                  const SizedBox(
                      height: AppSizes.dashboardSmallGap),
                  Text(
                    items[i].title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: AppSizes.courseTitleGap),
                  Text(
                    items[i].body,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _CustomDemo extends StatelessWidget {
  const _CustomDemo({
    required this.courses,
    required this.sessions,
    required this.settings,
    required this.now,
    required this.cardGap,
    required this.headerGap,
  });

  final List<Course> courses;
  final List<StudySession> sessions;
  final AppSettings settings;
  final DateTime now;
  final double cardGap;
  final double headerGap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final firstCourseId = courses.isEmpty ? null : courses.first.id;
    final demos = [
      CustomSchedule.weekly(
        id: 901,
        weekdays: {now.weekday},
        timeMinutes: (now.hour * 60 + now.minute + 60) % 1440,
      ),
      CustomSchedule.monthly(
        id: 902,
        dayOfMonth: 1,
        timeMinutes: 19 * 60,
        courseId: firstCourseId,
      ),
      CustomSchedule.once(
        id: 903,
        fireAt: now.add(const Duration(hours: 2)),
        label: l10n.reminderPreviewDemoLabel,
      ),
    ];
    return Column(
      // Stretch like [_Feed]: cards fill the width with equal left/right
      // insets; the header text stays left-aligned within its full-width
      // slot (ECTS-084).
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.reminderPreviewCustom,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        SizedBox(height: headerGap),
        for (var i = 0; i < demos.length; i++) ...[
          if (i > 0) SizedBox(height: cardGap),
          _DemoRow(
            key: Key('demoRow_$i'),
            schedule: demos[i],
            courses: courses,
            sessions: sessions,
            settings: settings,
            now: now,
          ),
        ],
      ],
    );
  }
}

class _DemoRow extends StatelessWidget {
  const _DemoRow({
    super.key,
    required this.schedule,
    required this.courses,
    required this.sessions,
    required this.settings,
    required this.now,
  });

  final CustomSchedule schedule;
  final List<Course> courses;
  final List<StudySession> sessions;
  final AppSettings settings;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final fire = nextFireAt(schedule, now);
    final raw = composeCustomContent(
      schedule: schedule,
      courses: courses,
      sessions: sessions,
      hoursPerEcts: settings.hoursPerEcts,
      now: now,
      toleranceDays: settings.paceToleranceDays,
    );
    final content = raw == null ? null : localizeReminder(l10n, raw);
    final scheme = Theme.of(context).colorScheme;
    return GlassCard(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fire == null
                  ? l10n.reminderPreviewNoFire
                  : l10n.reminderPreviewNext(_fmtTime(fire)),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: AppSizes.courseTitleGap),
            Text(
              content == null
                  ? l10n.reminderPreviewEmpty
                  : '${content.title}\n${content.body}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
