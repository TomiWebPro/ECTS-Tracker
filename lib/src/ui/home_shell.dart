import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../logic/ects.dart';
import '../models/models.dart';
import '../state/providers.dart';
import 'course_form.dart';
import 'settings_page.dart';

/// Root scaffold: bottom nav across the five app areas (AGENTS.md §3).
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

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
        1 => const _CoursesPage(),
        2 => const _StudyLogPage(),
        3 => const _PlaceholderPage('Statistics'),
        4 => const SettingsPage(),
        _ => const SizedBox.shrink(),
      },
      floatingActionButton: _index == 1
          ? FloatingActionButton(
              key: const Key('addCourseFab'),
              onPressed: () => showCourseFormDialog(context),
              tooltip: 'Add course',
              child: const Icon(Icons.add),
            )
          : null,
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

class _CoursesPage extends ConsumerWidget {
  const _CoursesPage();

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Course course) async {
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
    if (confirmed != true || !context.mounted) return;
    final result = await ref.read(courseRepositoryProvider).deleteCourse(course.id);
    if (!context.mounted) return;
    if (result is Err<void>) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(coursesProvider);
    final settingsAsync = ref.watch(settingsProvider);
    final hoursPerEcts = settingsAsync.valueOrNull?.hoursPerEcts ?? AppSettings.defaultHoursPerEcts;
    return courses.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (list) => list.isEmpty
          ? const Center(child: Text('No courses yet'))
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                final course = list[i];
                final req = requiredHours(course.ectsCredits, hoursPerEcts);
                return ListTile(
                  key: Key('courseTile_${course.id}'),
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
                  subtitle: Text(
                    '${course.ectsCredits} ECTS • ${req.toStringAsFixed(1)} h required',
                  ),
                  onTap: course.isSample
                      ? null
                      : () => showCourseFormDialog(context, existing: course),
                  trailing: course.isSample
                      ? IconButton(
                          key: const Key('removeSampleCourse'),
                          icon: const Icon(Icons.delete_outline),
                          tooltip: 'Remove sample course',
                          onPressed: () async {
                            final result = await ref
                                .read(courseRepositoryProvider)
                                .deleteSampleCourse(course.id);
                            if (!context.mounted) return;
                            if (result is Err) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(result.message)),
                              );
                            }
                          },
                        )
                      : PopupMenuButton<String>(
                          key: Key('courseMenu_${course.id}'),
                          onSelected: (value) {
                            if (value == 'edit') {
                              showCourseFormDialog(context, existing: course);
                            } else if (value == 'delete') {
                              _confirmDelete(context, ref, course);
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
    );
  }
}

class _StudyLogPage extends ConsumerWidget {
  const _StudyLogPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = ref.watch(sessionsProvider);
    final courses = ref.watch(coursesProvider);
    return sessions.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (sessionList) {
        if (sessionList.isEmpty) {
          return const Center(child: Text('No study sessions yet'));
        }
        final courseMap = {
          for (final c in courses.valueOrNull ?? []) c.id: c,
        };
        return ListView.builder(
          itemCount: sessionList.length,
          itemBuilder: (context, i) {
            final session = sessionList[i];
            final course = courseMap[session.courseId];
            final hours = session.minutes / 60.0;
            return ListTile(
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
              subtitle: Text(
                '${hours.toStringAsFixed(1)} h • ${session.date.toString().split(' ')[0]}',
              ),
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
                  : null,
            );
          },
        );
      },
    );
  }
}
