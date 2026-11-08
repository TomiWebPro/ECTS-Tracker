import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/data/connection.dart';
import 'src/i18n/app_locales.dart';
import 'src/models/models.dart';
import 'src/startup.dart';
import 'src/state/providers.dart';
import 'src/ui/app_fonts.dart';
import 'src/ui/app_sizes.dart';
import 'src/ui/home_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final startup = await initializeApp(openConnection());
  runApp(EctsTrackerApp(startup: startup));
}

class EctsTrackerApp extends StatelessWidget {
  const EctsTrackerApp({super.key, required this.startup});

  final StartupState startup;

  static ThemeData buildLightTheme({
    Color seed = const Color(0xFF51606E),
    List<String>? fontFamilyFallback,
  }) {
    final base = ThemeData(
      colorSchemeSeed: seed,
      useMaterial3: true,
      fontFamilyFallback: fontFamilyFallback ?? AppFonts.general,
    );
    return _polish(base);
  }

  static ThemeData buildDarkTheme({
    Color seed = const Color(0xFF51606E),
    List<String>? fontFamilyFallback,
  }) {
    final base = ThemeData(
      colorSchemeSeed: seed,
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamilyFallback: fontFamilyFallback ?? AppFonts.general,
    );
    return _polish(base);
  }

  /// Shared polish on top of the seeded Material 3 theme: rounded cards,
  /// tonal chips/nav, bolder titles. Sizes from [AppSizes] — edit there.
  static ThemeData _polish(ThemeData base) {
    return base.copyWith(
      appBarTheme: base.appBarTheme.copyWith(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 1,
        toolbarHeight: AppSizes.appBarHeight,
        titleTextStyle: base.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: -0.2,
        ),
      ),
      cardTheme: base.cardTheme.copyWith(
        elevation: AppSizes.cardElevation,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.chipRadius),
        ),
        labelStyle: base.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      dialogTheme: base.dialogTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.dialogRadius),
        ),
      ),
      dividerTheme: base.dividerTheme.copyWith(
        thickness: 1,
        space: AppSizes.dividerSpace,
      ),
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.fabRadius),
        ),
        extendedTextStyle: base.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        extendedIconLabelSpacing: AppSizes.fabIconGap,
        extendedPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.fabHPad,
          vertical: AppSizes.fabVPad,
        ),
      ),
      listTileTheme: base.listTileTheme.copyWith(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.listTileHPad,
          vertical: AppSizes.listTileVPad,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.listTileRadius),
        ),
      ),
      navigationBarTheme: base.navigationBarTheme.copyWith(
        height: AppSizes.navHeight,
        labelTextStyle: WidgetStatePropertyAll(
          base.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      snackBarTheme: base.snackBarTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      textTheme: base.textTheme.copyWith(
        displaySmall: base.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
        headlineMedium: base.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: -0.4,
        ),
        headlineSmall: base.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: -0.3,
        ),
        titleLarge: base.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w800,
          letterSpacing: -0.2,
        ),
        titleMedium: base.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        titleSmall: base.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: base.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        bodySmall: base.textTheme.bodySmall?.copyWith(
          fontSize: 13,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (startup) {
      StartupFailed(:final message) => MaterialApp(
          onGenerateTitle: (context) =>
              AppLocalizations.of(context)!.appTitle,
          debugShowCheckedModeBanner: false,
          theme: buildLightTheme(),
          darkTheme: buildDarkTheme(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
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
    final s = settings.valueOrNull ?? const AppSettings();
    final seed = Color(s.accent.seedValue);
    final appLocale = appLocaleFromCode(s.localeCode);
    // System locale when the user picks "system default": ensures CJK
    // Han-unification picks the right sans (SC vs JP vs KR) even without
    // an explicit app language.
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final fallback = fontFallbackForLocale(appLocale ?? systemLocale);
    return MaterialApp(
      onGenerateTitle: (context) =>
          AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: switch (s.themeMode) {
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
        _ => ThemeMode.system,
      },
      theme: EctsTrackerApp.buildLightTheme(
          seed: seed, fontFamilyFallback: fallback),
      darkTheme: EctsTrackerApp.buildDarkTheme(
          seed: seed, fontFamilyFallback: fallback),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: appLocaleFromCode(s.localeCode),
      builder: (context, child) {
        final scaler = TextScaler.linear(s.displaySize.scale);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: scaler),
          child: child!,
        );
      },
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
                  AppLocalizations.of(context)!.startupTitle,
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
