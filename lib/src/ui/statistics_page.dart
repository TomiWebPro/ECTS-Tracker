import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/ects.dart';
import '../logic/statistics.dart';
import '../state/providers.dart';

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

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Overview', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total: ${stats.totalHours.toStringAsFixed(1)} h'),
                const SizedBox(height: 4),
                Text('Last 7 days: ${stats.last7DaysHours.toStringAsFixed(1)} h'),
                const SizedBox(height: 4),
                Text('Last 30 days: ${stats.last30DaysHours.toStringAsFixed(1)} h'),
                const SizedBox(height: 4),
                Text('Sessions: ${stats.sessionsCount}'),
                const SizedBox(height: 4),
                Text('Active days: ${stats.activeDays}'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Consistency', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${(stats.consistencyScore * 100).toStringAsFixed(0)}% of last 30 days',
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: stats.consistencyScore),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Last 7 days', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        _BarChart(
          value: stats.last7DaysMinutes / 60.0,
          maxValue: (stats.last30DaysMinutes / 60.0).clamp(1.0, double.infinity),
          label: '${stats.last7DaysHours.toStringAsFixed(1)} h',
        ),
        const SizedBox(height: 16),
        Text('Last 30 days', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        _BarChart(
          value: stats.last30DaysMinutes / 60.0,
          maxValue: (stats.last30DaysMinutes / 60.0).clamp(1.0, double.infinity),
          label: '${stats.last30DaysHours.toStringAsFixed(1)} h',
        ),
        const SizedBox(height: 16),
        Text('Per course', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        if (stats.perCourseMinutes.isEmpty)
          const Text('No sessions yet')
        else
          ...stats.perCourseMinutes.entries.map((entry) {
            final course = courseMap[entry.key];
            final hours = entry.value / 60.0;
            final required = course == null
                ? 0.0
                : requiredHours(course.ectsCredits, settings.hoursPerEcts);
            final progress = required == 0 ? 0.0 : (hours / required).clamp(0.0, 1.0);
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course?.name ?? 'Course ${entry.key}'),
                    const SizedBox(height: 4),
                    Text('${hours.toStringAsFixed(1)} h / ${required.toStringAsFixed(0)} h'),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(value: progress),
                  ],
                ),
              ),
            );
          }),
      ],
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({required this.value, required this.maxValue, required this.label});

  final double value;
  final double maxValue;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ratio = maxValue == 0 ? 0.0 : (value / maxValue).clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: ratio,
            minHeight: 12,
          ),
        ),
      ],
    );
  }
}
