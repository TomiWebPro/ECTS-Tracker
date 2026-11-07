import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../logic/course_list.dart';
import '../logic/ects.dart';
import '../logic/session_totals.dart';
import '../models/models.dart';
import '../state/providers.dart';
import 'course_form.dart';
import 'session_form.dart';
import 'settings_page.dart';
import 'statistics_page.dart';

/// Root scaffold: bottom nav across the five app areas (AGENTS.md §3).
class HomeShell extends StatefulWidget {
  const HomeShell({super.key, this.now});

  /// Reference time for derived progress/status (injectable for tests).
  final DateTime? now;

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const _titles = [
    'Dashboard',
    'Courses',
    'Study Log',
    'Statistics',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_index])),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        child: KeyedSubtree(
          key: ValueKey(_index),
          child: switch (_index) {
            0 => _OverviewPage(now: widget.now),
            1 => _CoursesPage(now: widget.now),
            2 => _StudyLogPage(now: widget.now),
            3 => StatisticsPage(now: widget.now),
            4 => const SettingsPage(),
            _ => const SizedBox.shrink(),
          },
        ),
      ),
      floatingActionButton: switch (_index) {
        1 => FloatingActionButton.extended(
            key: const Key('addCourseFab'),
            onPressed: () => showCourseFormDialog(context),
            tooltip: 'Add course',
            icon: const Icon(Icons.add),
            label: const Text('New course'),
          ),
        2 => FloatingActionButton.extended(
            key: const Key('logSessionFab'),
            onPressed: () => showSessionFormDialog(context),
            tooltip: 'Log session',
            icon: const Icon(Icons.timer),
            label: const Text('Log session'),
          ),
        _ => null,
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.book), label: 'Courses'),
          NavigationDestination(icon: Icon(Icons.timer), label: 'Study Log'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Statistics'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class _OverviewPage extends ConsumerWidget {
  const _OverviewPage({this.now});

  /// Reference time for derived progress/status/deadlines (injectable for tests).
  final DateTime? now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(coursesProvider);
    final sessionsAsync = ref.watch(sessionsProvider);
    final settingsAsync = ref.watch(settingsProvider);

    // ECTS-028: never render a fake-empty dashboard on load/error. A DB/open or
    // stream failure must surface as an explicit error (never "0 course(s)/0 h"),
    // and loading must show progress until real data resolves.
    final error = coursesAsync.error ?? sessionsAsync.error ?? settingsAsync.error;
    if (error != null) {
      return Center(
        child: Text(
          'Error: $error',
          key: const Key('overviewError'),
        ),
      );
    }
    if (coursesAsync.isLoading || sessionsAsync.isLoading || settingsAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final courses = coursesAsync.requireValue;
    final sessions = sessionsAsync.requireValue;
    final settings = settingsAsync.requireValue;
    final effectiveNow = now ?? DateTime.now();

    var totalRequired = 0.0;
    for (final c in courses) {
      totalRequired += requiredHours(c.ectsCredits, settings.hoursPerEcts);
    }
    final totalDone = completedHours(sessions);

    final withProgress = coursesWithProgress(
      courses,
      sessions,
      hoursPerEcts: settings.hoursPerEcts,
      now: effectiveNow,
    );
    final needsAttention = withProgress
        .where((e) =>
            e.progress.status == CourseStatus.behind ||
            e.progress.status == CourseStatus.overdue)
        .toList()
      ..sort((a, b) {
        final sa = a.progress.status == CourseStatus.overdue ? 0 : 1;
        final sb = b.progress.status == CourseStatus.overdue ? 0 : 1;
        if (sa != sb) return sa.compareTo(sb);
        final da = a.course.deadline;
        final db = b.course.deadline;
        if (da == null && db == null) {
          return a.course.name.toLowerCase().compareTo(b.course.name.toLowerCase());
        }
        if (da == null) return 1;
        if (db == null) return -1;
        return da.compareTo(db);
      });

    return ListView(
      key: const Key('dashboardList'),
      padding: const EdgeInsets.all(16),
      children: [
        Text('Overall progress', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          key: const Key('dashboardOverallProgress'),
          value: progressFraction(totalRequired, totalDone),
        ),
        const SizedBox(height: 8),
        Text(
          '${totalDone.toStringAsFixed(1)} h of '
          '${totalRequired.toStringAsFixed(0)} h',
          key: const Key('dashboardTotals'),
        ),
        const SizedBox(height: 4),
        Text(
          '${courses.length} course(s)',
          key: const Key('dashboardCourseCount'),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton.icon(
            key: const Key('dashboardLogSessionAction'),
            onPressed: () => showSessionFormDialog(context),
            icon: const Icon(Icons.timer),
            label: const Text('Log study session'),
          ),
        ),
        if (needsAttention.isNotEmpty) ...[
          const Divider(height: 32),
          Text(
            'Needs attention',
            key: const Key('needsAttentionTitle'),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          for (final item in needsAttention)
            _DashboardCourseCard(
              key: Key('needsAttentionCard_${item.course.id}'),
              item: item,
            ),
        ],
        const Divider(height: 32),
        Text('Courses', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        if (withProgress.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Icon(Icons.school_outlined,
                    size: 48, color: Theme.of(context).colorScheme.outline),
                const SizedBox(height: 8),
                Text(
                  'No courses yet',
                  key: const Key('dashboardNoCourses'),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Add a course to start tracking your ECTS progress.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        else
          for (final item in withProgress)
            _DashboardCourseCard(
              key: Key('dashboardCourseCard_${item.course.id}'),
              item: item,
            ),
      ],
    );
  }
}

class _DashboardCourseCard extends StatelessWidget {
  const _DashboardCourseCard({super.key, required this.item});

  final CourseWithProgress item;

  String _deadlineLabel(CourseProgress progress, DateTime? deadline) {
    if (deadline == null) return 'No deadline';
    final d = '${deadline.year}-'
        '${deadline.month.toString().padLeft(2, '0')}-'
        '${deadline.day.toString().padLeft(2, '0')}';
    if (progress.status == CourseStatus.overdue) return 'Deadline $d (overdue)';
    if (progress.status == CourseStatus.completed) return 'Deadline $d';
    final days = progress.remainingDays;
    if (days == null) return 'Deadline $d';
    if (days == 0) return 'Deadline $d (today)';
    return 'Deadline $d ($days day${days == 1 ? '' : 's'} left)';
  }

  @override
  Widget build(BuildContext context) {
    final course = item.course;
    final p = item.progress;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (course.colorValue != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CircleAvatar(
                      backgroundColor: Color(course.colorValue!),
                      radius: 6,
                    ),
                  ),
                Expanded(
                  child: Text(
                    course.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Text(
                  courseStatusLabel(p.status),
                  key: Key('dashboardStatus_${course.id}'),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              key: Key('dashboardProgress_${course.id}'),
              value: p.progressFraction,
            ),
            const SizedBox(height: 6),
            Text(
              '${p.completedHours.toStringAsFixed(1)} / ${p.requiredHours.toStringAsFixed(1)} h',
              key: Key('dashboardHours_${course.id}'),
            ),
            const SizedBox(height: 2),
            Text(
              _deadlineLabel(p, course.deadline),
              key: Key('dashboardDeadline_${course.id}'),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _CoursesPage extends ConsumerStatefulWidget {
  const _CoursesPage({this.now});

  final DateTime? now;

  @override
  ConsumerState<_CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends ConsumerState<_CoursesPage> {
  CourseSort _sort = CourseSort.name;
  CourseStatus? _statusFilter;

  Future<void> _confirmDelete(Course course) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete course?'),
        content: Text(
          'Delete "${course.name}" and all its study sessions? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            key: const Key('confirmDeleteCourse'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    final result = await ref.read(courseRepositoryProvider).deleteCourse(course.id);
    if (!mounted) return;
    if (result is Err<void>) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message)),
      );
    }
  }

  Future<void> _removeSampleCourse(Course course) async {
    final result =
        await ref.read(courseRepositoryProvider).deleteSampleCourse(course.id);
    if (!mounted) return;
    if (result is Err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final coursesAsync = ref.watch(coursesProvider);
    final sessionsAsync = ref.watch(sessionsProvider);
    final settingsAsync = ref.watch(settingsProvider);

    final error =
        coursesAsync.error ?? sessionsAsync.error ?? settingsAsync.error;
    if (error != null) return Center(child: Text('Error: $error'));
    if (coursesAsync.isLoading ||
        sessionsAsync.isLoading ||
        settingsAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final courses = coursesAsync.requireValue;
    if (courses.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.menu_book_outlined,
                  size: 48, color: Theme.of(context).colorScheme.outline),
              const SizedBox(height: 8),
              Text('No courses yet',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 4),
              Text(
                'Tap “Add course” to create your first course.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    final now = widget.now ?? DateTime.now();
    final hoursPerEcts = settingsAsync.requireValue.hoursPerEcts;
    final withProgress = coursesWithProgress(
      courses,
      sessionsAsync.requireValue,
      hoursPerEcts: hoursPerEcts,
      now: now,
    );
    final visible = sortAndFilterCourses(
      withProgress,
      sort: _sort,
      statusFilter: _statusFilter,
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              DropdownButton<CourseSort>(
                key: const Key('courseSortDropdown'),
                value: _sort,
                onChanged: (v) => setState(() => _sort = v ?? CourseSort.name),
                items: [
                  for (final s in CourseSort.values)
                    DropdownMenuItem(
                      value: s,
                      key: Key('courseSort_${s.name}'),
                      child: Text('Sort: ${courseSortLabel(s)}'),
                    ),
                ],
              ),
              DropdownButton<CourseStatus?>(
                key: const Key('courseStatusFilterDropdown'),
                value: _statusFilter,
                onChanged: (v) => setState(() => _statusFilter = v),
                items: [
                  const DropdownMenuItem<CourseStatus?>(
                    value: null,
                    key: Key('courseFilter_all'),
                    child: Text('All statuses'),
                  ),
                  for (final s in CourseStatus.values)
                    DropdownMenuItem<CourseStatus?>(
                      value: s,
                      key: Key('courseFilter_${s.name}'),
                      child: Text(courseStatusLabel(s)),
                    ),
                ],
              ),
            ],
          ),
        ),
        if (visible.isEmpty)
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.filter_alt_off_outlined,
                        size: 40, color: Theme.of(context).colorScheme.outline),
                    const SizedBox(height: 8),
                    Text(
                      'No courses match this filter',
                      key: const Key('coursesFilterEmpty'),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          Expanded(
            child: ListView.builder(
              key: const Key('coursesList'),
              itemCount: visible.length,
              itemBuilder: (context, i) {
                final item = visible[i];
                final course = item.course;
                final p = item.progress;
                return ListTile(
                  key: Key('courseTile_${course.id}'),
                  isThreeLine: true,
                  leading: course.colorValue == null
                      ? null
                      : CircleAvatar(
                          backgroundColor: Color(course.colorValue!),
                          radius: 10,
                        ),
                  title: Row(
                    children: [
                      Expanded(child: Text(course.name)),
                      if (course.isSample)
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Chip(
                            key: Key('sampleCourseMarker'),
                            label: Text('Sample'),
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${course.ectsCredits} ECTS • ${p.completedHours.toStringAsFixed(1)} / ${p.requiredHours.toStringAsFixed(1)} h'
                        ' • ${courseStatusLabel(p.status)}',
                        key: Key('courseProgressText_${course.id}'),
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        key: Key('courseProgressBar_${course.id}'),
                        value: p.progressFraction,
                      ),
                      if (p.requiredDailyHours != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            '${p.requiredDailyHours!.toStringAsFixed(1)} h/day needed',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                    ],
                  ),
                  onTap: course.isSample
                      ? null
                      : () => showCourseFormDialog(context, existing: course),
                  trailing: course.isSample
                      ? IconButton(
                          key: const Key('removeSampleCourse'),
                          icon: const Icon(Icons.delete_outline),
                          tooltip: 'Remove sample course',
                          onPressed: () => _removeSampleCourse(course),
                        )
                      : PopupMenuButton<String>(
                          key: Key('courseMenu_${course.id}'),
                          onSelected: (value) {
                            if (value == 'edit') {
                              showCourseFormDialog(context, existing: course);
                            } else if (value == 'delete') {
                              _confirmDelete(course);
                            }
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(value: 'edit', child: Text('Edit')),
                            PopupMenuItem(value: 'delete', child: Text('Delete')),
                          ],
                        ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _StudyLogPage extends ConsumerWidget {
  const _StudyLogPage({this.now});

  final DateTime? now;

  Future<void> _confirmDeleteSession(
    BuildContext context,
    WidgetRef ref,
    StudySession session,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete session?'),
        content: const Text(
          'Delete this study session? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            key: const Key('confirmDeleteSession'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    final result =
        await ref.read(sessionRepositoryProvider).deleteSession(session.id);
    if (!context.mounted) return;
    if (result is Err<void>) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(sessionsProvider);
    final coursesAsync = ref.watch(coursesProvider);
    final settings = ref.watch(settingsProvider).valueOrNull;
    final effectiveNow = now ?? DateTime.now();
    final firstWeekday = settings?.firstWeekday ?? DateTime.monday;

    return sessionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (sessionList) {
        if (sessionList.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.timer_outlined,
                      size: 48, color: Theme.of(context).colorScheme.outline),
                  const SizedBox(height: 8),
                  Text(
                    'No study sessions yet',
                    key: const Key('studyLogEmpty'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Log a session to track your study time.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
        final courseMap = {
          for (final c in coursesAsync.valueOrNull ?? const []) c.id: c,
        };
        final totals = sessionTotals(
          sessionList,
          now: effectiveNow,
          firstWeekday: firstWeekday,
        );
        final sorted = sessionsByDateDesc(sessionList);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Card(
                key: const Key('studyTotalsCard'),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              '${totals.dailyHours.toStringAsFixed(1)} h',
                              key: const Key('dailyTotal'),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'This week',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              '${totals.weeklyHours.toStringAsFixed(1)} h',
                              key: const Key('weeklyTotal'),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                key: const Key('studyLogList'),
                itemCount: sorted.length,
                itemBuilder: (context, i) {
                  final session = sorted[i];
                  final course = courseMap[session.courseId];
                  final hours = session.minutes / 60.0;
                  final dateLabel = '${session.date.year}-'
                      '${session.date.month.toString().padLeft(2, '0')}-'
                      '${session.date.day.toString().padLeft(2, '0')}';
                  final subtitleParts = <String>[
                    '${hours.toStringAsFixed(1)} h • $dateLabel',
                  ];
                  if (session.notes != null && session.notes!.trim().isNotEmpty) {
                    subtitleParts.add(session.notes!.trim());
                  }
                  return ListTile(
                    key: Key('sessionTile_${session.id}'),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            course?.name ?? 'Course ${session.courseId}',
                          ),
                        ),
                        if (session.isSample)
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Chip(
                              key: Key('sampleSessionMarker'),
                              label: Text('Sample'),
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                      ],
                    ),
                    subtitle: Text(subtitleParts.join('\n')),
                    isThreeLine: subtitleParts.length > 1,
                    onTap: session.isSample
                        ? null
                        : () => showSessionFormDialog(context, existing: session),
                    trailing: session.isSample
                        ? IconButton(
                            key: const Key('removeSampleSession'),
                            icon: const Icon(Icons.delete_outline),
                            tooltip: 'Remove sample session',
                            onPressed: () async {
                              final result = await ref
                                  .read(sessionRepositoryProvider)
                                  .deleteSession(session.id);
                              if (!context.mounted) return;
                              if (result is Err) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result.message)),
                                );
                              }
                            },
                          )
                        : PopupMenuButton<String>(
                            key: Key('sessionMenu_${session.id}'),
                            onSelected: (value) {
                              if (value == 'edit') {
                                showSessionFormDialog(context, existing: session);
                              } else if (value == 'delete') {
                                _confirmDeleteSession(context, ref, session);
                              }
                            },
                            itemBuilder: (context) => const [
                              PopupMenuItem(value: 'edit', child: Text('Edit')),
                              PopupMenuItem(value: 'delete', child: Text('Delete')),
                            ],
                          ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
