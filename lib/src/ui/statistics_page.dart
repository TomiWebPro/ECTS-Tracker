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
    final coursesAsync = ref.watch(coursesProvider);
    final sessionsAsync = ref.watch(sessionsProvider);
    final settingsAsync = ref.watch(settingsProvider);

    final error = coursesAsync.error ?? sessionsAsync.error ?? settingsAsync.error;
    if (error != null) {
      return Center(child: Text('Error: $error'));
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
        const SectionHeader(title: 'Overview', icon: Icons.insights_outlined),
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
                        label: 'Total',
                        value: '${stats.totalHours.toStringAsFixed(1)} h',
                      ),
                    ),
                    Expanded(
                      child: _MiniStat(
                        icon: Icons.bolt_outlined,
                        label: 'Sessions',
                        value: '${stats.sessionsCount}',
                      ),
                    ),
                    Expanded(
                      child: _MiniStat(
                        icon: Icons.event_available_outlined,
                        label: 'Active days',
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
                          label: 'Last 7 days',
                          value:
                              '${stats.last7DaysHours.toStringAsFixed(1)} h',
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 28,
                        color: scheme.outlineVariant,
                      ),
                      Expanded(
                        child: _InlineStat(
                          label: 'Last 30 days',
                          value:
                              '${stats.last30DaysHours.toStringAsFixed(1)} h',
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
        const SectionHeader(
            title: 'Consistency', icon: Icons.calendar_month_outlined),
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
                        '${(stats.consistencyScore * 100).toStringAsFixed(0)}% of last 30 days',
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
                        '${stats.activeDays}d active',
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
                  'Study days in the last 30 days. Small steps every day beat cramming.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const SectionHeader(
            title: 'Past vs needed', icon: Icons.history_outlined),
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
                        label: 'Did / day (14d)',
                        value: '${pastAvg.toStringAsFixed(1)} h',
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 28,
                      color: scheme.outlineVariant,
                    ),
                    Expanded(
                      child: _InlineStat(
                        label: 'Need / day',
                        value: '${needSum.toStringAsFixed(1)} h',
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 28,
                      color: scheme.outlineVariant,
                    ),
                    Expanded(
                      child: _InlineStat(
                        label: 'Gap',
                        value:
                            '${gap <= 0 ? '+' : ''}${(-gap).toStringAsFixed(1)} h',
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
                      ? 'Past pace covers what’s needed. Keep the streak.'
                      : 'Past pace is ${gap.toStringAsFixed(1)} h/day short — add a block or trim scope.',
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
        const SectionHeader(
            title: 'Coming load', icon: Icons.event_note_outlined),
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
                        'Next 8 weeks',
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
                        'peak ${peak.toStringAsFixed(0)}h/wk',
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
                      ? 'Add deadlines to forecast the load.'
                      : 'Suggested order: ${sortedByDeadline.take(3).map((e) => e.course.name).join(' → ')} (earliest deadline first)',
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
                            '${w.hours.toStringAsFixed(0)}h',
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
                      'Overload weeks >${overloadAt.toStringAsFixed(overloadAt % 1 == 0 ? 0 : 1)}h flagged red — move a deadline or cut scope.',
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
        const SectionHeader(title: 'Last 7 days', icon: Icons.bar_chart_outlined),
        _BarChart(
          value: stats.last7DaysMinutes / 60.0,
          maxValue: (stats.last30DaysMinutes / 60.0).clamp(1.0, double.infinity),
          label: '${stats.last7DaysHours.toStringAsFixed(1)} h',
          caption: 'of last 30 days volume',
        ),
        const SizedBox(height: 16),
        const SectionHeader(
            title: 'Last 30 days', icon: Icons.stacked_bar_chart_outlined),
        _BarChart(
          value: stats.last30DaysMinutes / 60.0,
          maxValue: (stats.last30DaysMinutes / 60.0).clamp(1.0, double.infinity),
          label: '${stats.last30DaysHours.toStringAsFixed(1)} h',
          caption: 'total volume',
        ),
        const SizedBox(height: 20),
        SectionHeader(
          title: 'Per course',
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
                  const Expanded(child: Text('No sessions yet')),
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
                      name: course?.name ?? 'C${entry.key}',
                      colorValue: course?.colorValue,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course?.name ?? 'Course ${entry.key}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${hours.toStringAsFixed(1)} h / ${required.toStringAsFixed(0)} h · ${(progress * 100).toStringAsFixed(0)}%',
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
                  '${(ratio * 100).toStringAsFixed(0)}%',
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
