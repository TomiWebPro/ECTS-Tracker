import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/data/connection.dart';
import 'src/models/models.dart';
import 'src/startup.dart';
import 'src/state/providers.dart';
import 'src/ui/home_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final startup = await initializeApp(openConnection());
  runApp(EctsTrackerApp(startup: startup));
}

class EctsTrackerApp extends StatelessWidget {
  const EctsTrackerApp({super.key, required this.startup});

  final StartupState startup;

  @override
  Widget build(BuildContext context) {
    return switch (startup) {
      StartupFailed(:final message) => MaterialApp(
          title: 'ECTS Tracker',
          theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
          darkTheme: ThemeData(
            colorSchemeSeed: Colors.indigo,
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          home: StartupErrorScreen(message: message),
        ),
      StartupReady(:final db) => ProviderScope(
          overrides: [
            databaseProvider.overrideWith((ref) {
              ref.onDispose(() {
                db.close().catchError((_) {});
              });
              return db;
            }),
          ],
          child: const _ThemedApp(),
        ),
    };
  }
}

class _ThemedApp extends ConsumerWidget {
  const _ThemedApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final themeMode = settings.valueOrNull?.themeMode;
    return MaterialApp(
      title: 'ECTS Tracker',
      themeMode: switch (themeMode) {
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
        _ => ThemeMode.system,
      },
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const HomeShell(),
    );
  }
}

/// Explicit startup failure UI (ECTS-023): shown instead of an unhandled error
/// leaking into the widget tree when the database cannot be opened/prepared.
class StartupErrorScreen extends StatelessWidget {
  const StartupErrorScreen({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, size: 56, color: scheme.error),
                const SizedBox(height: 16),
                Text(
                  'Could not start ECTS Tracker',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: scheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
