import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/ects.dart';
import '../models/models.dart';
import '../state/providers.dart';
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
        2 => const _PlaceholderPage('Study Log'),
        3 => const _PlaceholderPage('Statistics'),
        4 => const SettingsPage(),
        _ => const SizedBox.shrink(),
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
    final courses = ref.watch(coursesProvider).valueOrNull ?? const <Course>[];
    final sessions =
        ref.watch(sessionsProvider).valueOrNull ?? const <StudySession>[];
    final settings = ref.watch(settingsProvider).valueOrNull ?? const AppSettings();

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(coursesProvider);
    return courses.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (list) => list.isEmpty
          ? const Center(child: Text('No courses yet'))
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) => ListTile(
                title: Text(list[i].name),
                subtitle: Text('${list[i].ectsCredits} ECTS'),
              ),
            ),
    );
  }
}
