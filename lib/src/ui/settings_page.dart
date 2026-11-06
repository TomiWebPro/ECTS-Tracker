import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/providers.dart';

/// Minimal Settings surface (ECTS-016): exposes the one-tap "clear sample data"
/// path. Expanded by ECTS-011.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSample = ref.watch(hasSampleDataProvider);
    return hasSample.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (present) => ListView(
        children: [
          if (present)
            ListTile(
              key: const Key('clearSampleDataTile'),
              leading: const Icon(Icons.delete_sweep_outlined),
              title: const Text('Clear sample data'),
              subtitle: const Text(
                'Remove the seeded example courses and sessions. Your own data is kept.',
              ),
              onTap: () => _confirmClear(context, ref),
            )
          else
            const ListTile(
              key: Key('noSampleDataTile'),
              leading: Icon(Icons.check_circle_outline),
              title: Text('No sample data'),
              subtitle: Text('Seeded example data has already been cleared.'),
            ),
        ],
      ),
    );
  }

  Future<void> _confirmClear(BuildContext context, WidgetRef ref) async {
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
    if (confirmed == true) {
      await ref.read(courseRepositoryProvider).deleteSampleData();
    }
  }
}
