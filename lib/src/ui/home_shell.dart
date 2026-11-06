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
      body: switch (_index) {
        0 => const _OverviewPage(),
        1 => _CoursesPage(now: widget.now),
        2 => _StudyLogPage(now: widget.now),
        3 => const _PlaceholderPage('Statistics'),
        4 => const SettingsPage(),
        _ => const SizedBox.shrink(),
      },
      floatingActionButton: switch (_index) {
        1 => FloatingActionButton(
            key: const Key('addCourseFab'),
            onPressed: () => showCourseFormDialog(context),
            tooltip: 'Add course',
            child: const Icon(Icons.add),
          ),
        2 => FloatingActionButton(
            key: const Key('logSessionFab'),
            onPressed: () => showSessionFormDialog(context),
            tooltip: 'Log session',
            child: const Icon(Icons.add),
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

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$label — coming in a later milestone'));
  }
}

class _OverviewPage extends ConsumerWidget {
  const _OverviewPage();

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

    var totalRequired = 0.0;
    for (final c in courses) {
      totalRequired += requiredHours(c.ectsCredits, settings.hoursPerEcts);
    }
    final totalDone = completedHours(sessions);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Overall progress', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progressFraction(totalRequired, totalDone),
        ),
        const SizedBox(height: 8),
        Text('${totalDone.toStringAsFixed(1)} h of '
            '${totalRequired.toStringAsFixed(0)} h'),
        const Divider(height: 32),
        Text('${courses.length} course(s)', style: Theme.of(context).textTheme.bodyLarge),
      ],
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
    if (courses.isEmpty) return const Center(child: Text('No courses yet'));

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
          const Expanded(
            child: Center(
              child: Text(
                'No courses match this filter',
                key: Key('coursesFilterEmpty'),
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
    final effectiveNow = now ?? DateTime.now();

    return sessionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (sessionList) {
        if (sessionList.isEmpty) {
          return const Center(
            child: Text('No study sessions yet', key: Key('studyLogEmpty')),
          );
        }
        final courseMap = {
          for (final c in coursesAsync.valueOrNull ?? const []) c.id: c,
        };
        final totals = sessionTotals(sessionList, now: effectiveNow);
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
