import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/course_list.dart';
import '../logic/ects.dart';
import '../logic/statistics.dart';
import '../state/providers.dart';
import 'app_sizes.dart';
import 'widgets.dart';

class StatisticsPage extends ConsumerWidget {
  const StatisticsPage({super.key, this.now});

  final DateTime? now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final coursesAsync = ref.watch(coursesProvider);
    final sessionsAsync = ref.watch(sessionsProvider);
    final settingsAsync = ref.watch(settingsProvider);

    final error = coursesAsync.error ?? sessionsAsync.error ?? settingsAsync.error;
    if (error != null) {
      return Center(child: Text('${l10n.commonError}: $error'));
    }
    if (coursesAsync.isLoading || sessionsAsync.isLoading || settingsAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final courses = coursesAsync.requireValue;
    final sessions = sessionsAsync.requireValue;
    final settings = settingsAsync.requireValue;
    final effectiveNow = now ?? DateTime.now();

    final stats = computeStatistics(sessions, now: effectiveNow);
    final courseMap = {for (final c in courses) c.id: c};
    final scheme = Theme.of(context).colorScheme;
    final withProgress = coursesWithProgress(
      courses,
      sessions,
      hoursPerEcts: settings.hoursPerEcts,
      now: effectiveNow,
      toleranceDays: settings.paceToleranceDays,
    );
    final pastAvg = averageDailyHours(sessions, now: effectiveNow, days: 14);
    var needSum = 0.0;
    for (final e in withProgress) {
      if (isScheduledCourse(e.course, effectiveNow)) continue;
      needSum += e.progress.requiredDailyHours ?? 0;
    }
    final gap = needSum - pastAvg;
    final forecast = forecastWeeklyLoad(
      withProgress,
      now: effectiveNow,
      weeks: 8,
      firstWeekday: settings.firstWeekday,
    );
    final overloadAt = settings.weeklyOverloadHours;
    final peak = forecast.isEmpty
        ? 0.0
        : forecast.map((w) => w.hours).reduce((a, b) => a > b ? a : b);
    final sortedByDeadline = withProgress
        .where((e) => e.course.deadline != null)
        .toList()
      ..sort((a, b) => a.course.deadline!.compareTo(b.course.deadline!));

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSizes.pageHPad,
        AppSizes.dashboardTopPad,
        AppSizes.pageHPad,
        AppSizes.pageBottomPadNoFab,
      ),
      children: [
        SectionHeader(title: l10n.statsOverview, icon: Icons.insights_outlined),
        Card(
          color: scheme.primaryContainer.withValues(alpha: 0.45),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _MiniStat(
                        icon: Icons.schedule_outlined,
                        label: l10n.statsTotal,
                        value: l10n.statsHoursValue(
                            stats.totalHours.toStringAsFixed(1)),
                      ),
                    ),
                    Expanded(
                      child: _MiniStat(
                        icon: Icons.bolt_outlined,
                        label: l10n.statsSessions,
                        value: '${stats.sessionsCount}',
                      ),
                    ),
                    Expanded(
                      child: _MiniStat(
                        icon: Icons.event_available_outlined,
                        label: l10n.statsActiveDays,
                        value: '${stats.activeDays}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: scheme.surface,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _InlineStat(
                          label: l10n.statsLast7Days,
                          value: l10n.statsHoursValue(
                              stats.last7DaysHours.toStringAsFixed(1)),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 28,
                        color: scheme.outlineVariant,
                      ),
                      Expanded(
                        child: _InlineStat(
                          label: l10n.statsLast30Days,
                          value: l10n.statsHoursValue(
                              stats.last30DaysHours.toStringAsFixed(1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SectionHeader(
            title: l10n.statsConsistency, icon: Icons.calendar_month_outlined),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.statsConsistencyScore(
                            (stats.consistencyScore * 100).toStringAsFixed(0)),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: scheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        l10n.statsActiveDaysBadge(stats.activeDays),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                              color: scheme.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RoundedProgressBar(value: stats.consistencyScore),
                const SizedBox(height: 6),
                Text(
                  l10n.statsConsistencyHint,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SectionHeader(
            title: l10n.statsPastVsNeeded, icon: Icons.history_outlined),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _InlineStat(
                        label: l10n.statsDidPerDay,
                        value:
                            l10n.statsHoursValue(pastAvg.toStringAsFixed(1)),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 28,
                      color: scheme.outlineVariant,
                    ),
                    Expanded(
                      child: _InlineStat(
                        label: l10n.statsNeedPerDay,
                        value:
                            l10n.statsHoursValue(needSum.toStringAsFixed(1)),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 28,
                      color: scheme.outlineVariant,
                    ),
                    Expanded(
                      child: _InlineStat(
                        label: l10n.statsGap,
                        value: l10n.statsGapValue(gap <= 0 ? '+' : '',
                            (-gap).toStringAsFixed(1)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RoundedProgressBar(
                  value: needSum <= 0
                      ? 0
                      : (pastAvg / needSum).clamp(0.0, 1.0),
                ),
                const SizedBox(height: 6),
                Text(
                  gap <= 0
                      ? l10n.statsPaceCovers
                      : l10n.statsPaceShort(gap.toStringAsFixed(1)),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: gap > 0
                            ? scheme.error
                            : scheme.onSurfaceVariant,
                        fontWeight:
                            gap > 0 ? FontWeight.w700 : FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SectionHeader(
            title: l10n.statsComingLoad, icon: Icons.event_note_outlined),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.statsNext8Weeks,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: peak > overloadAt
                            ? scheme.errorContainer
                            : scheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        l10n.statsPeakPerWeek(peak.toStringAsFixed(0)),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                              color: peak > overloadAt
                                  ? scheme.onErrorContainer
                                  : scheme.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  sortedByDeadline.isEmpty
                      ? l10n.statsAddDeadlines
                      : l10n.statsSuggestedOrder(sortedByDeadline
                          .take(3)
                          .map((e) => e.course.name)
                          .join(' → ')),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 12),
                ...forecast.map((w) {
                  final label =
                      '${w.weekStart.month.toString().padLeft(2, '0')}/${w.weekStart.day.toString().padLeft(2, '0')}';
                  final ratio = peak <= 0
                      ? 0.0
                      : (w.hours / peak).clamp(0.0, 1.0);
                  final overload = w.hours > overloadAt;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 44,
                          child: Text(
                            label,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: scheme.onSurfaceVariant,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: LinearProgressIndicator(
                              value: ratio,
                              minHeight: 10,
                              backgroundColor:
                                  scheme.surfaceContainerHighest,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                overload ? scheme.error : scheme.primary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 52,
                          child: Text(
                            l10n.statsHoursCompact(
                                w.hours.toStringAsFixed(0)),
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: overload
                                      ? scheme.error
                                      : scheme.onSurfaceVariant,
                                  fontWeight: overload
                                      ? FontWeight.w800
                                      : FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                if (peak > overloadAt)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      l10n.statsOverloadWarning(overloadAt.toStringAsFixed(
                          overloadAt % 1 == 0 ? 0 : 1)),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: scheme.error,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SectionHeader(title: l10n.statsLast7Days, icon: Icons.bar_chart_outlined),
        _BarChart(
          value: stats.last7DaysMinutes / 60.0,
          maxValue: (stats.last30DaysMinutes / 60.0).clamp(1.0, double.infinity),
          label: l10n.statsHoursValue(stats.last7DaysHours.toStringAsFixed(1)),
          caption: l10n.statsOfLast30DaysVolume,
        ),
        const SizedBox(height: 16),
        SectionHeader(
            title: l10n.statsLast30Days, icon: Icons.stacked_bar_chart_outlined),
        _BarChart(
          value: stats.last30DaysMinutes / 60.0,
          maxValue: (stats.last30DaysMinutes / 60.0).clamp(1.0, double.infinity),
          label: l10n.statsHoursValue(stats.last30DaysHours.toStringAsFixed(1)),
          caption: l10n.statsTotalVolume,
        ),
        const SizedBox(height: 20),
        SectionHeader(
          title: l10n.statsPerCourse,
          icon: Icons.menu_book_outlined,
          trailing: '${stats.perCourseMinutes.length}',
        ),
        if (stats.perCourseMinutes.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Icon(Icons.hourglass_empty_outlined,
                      color: scheme.onSurfaceVariant),
                  const SizedBox(width: 10),
                  Expanded(child: Text(l10n.statsEmpty)),
                ],
              ),
            ),
          )
        else
          ...stats.perCourseMinutes.entries.map((entry) {
            final course = courseMap[entry.key];
            final hours = entry.value / 60.0;
            final required = course == null
                ? 0.0
                : requiredHours(course.ectsCredits, settings.hoursPerEcts);
            final progress = required == 0 ? 0.0 : (hours / required).clamp(0.0, 1.0);
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CourseAvatar(
                      name: course?.name ??
                          l10n.statsCourseShortFallback(entry.key),
                      colorValue: course?.colorValue,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course?.name ??
                                l10n.statsCourseFallback(entry.key),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            l10n.statsPerCourseProgress(
                                hours.toStringAsFixed(1),
                                required.toStringAsFixed(0),
                                (progress * 100).toStringAsFixed(0)),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: scheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 8),
                          RoundedProgressBar(value: progress),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      ],
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat(
      {required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppSizes.statBox,
          height: AppSizes.statBox,
          decoration: BoxDecoration(
            color: scheme.primary,
            borderRadius: BorderRadius.circular(AppSizes.statRadius),
          ),
          child: Icon(icon, size: AppSizes.statIcon, color: scheme.onPrimary),
        ),
        const SizedBox(height: AppSizes.statGap),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: scheme.onPrimaryContainer,
              ),
        ),
        Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: scheme.onPrimaryContainer.withValues(alpha: 0.75),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.7,
              ),
        ),
      ],
    );
  }
}

class _InlineStat extends StatelessWidget {
  const _InlineStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart(
      {required this.value,
      required this.maxValue,
      required this.label,
      this.caption});

  final double value;
  final double maxValue;
  final String label;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final ratio = maxValue == 0 ? 0.0 : (value / maxValue).clamp(0.0, 1.0);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                Text(
                  l10n.statsPercentValue((ratio * 100).toStringAsFixed(0)),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: scheme.primary,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ],
            ),
            if (caption != null)
              Text(
                caption!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
              ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: ratio <= 0
                  ? Container(
                      height: 14,
                      color: scheme.surfaceContainerHighest,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 3.5),
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: scheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : LinearProgressIndicator(
                      value: ratio,
                      minHeight: 14,
                      backgroundColor: scheme.surfaceContainerHighest,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(scheme.primary),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
