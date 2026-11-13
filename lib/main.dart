import 'dart:async';

import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

import 'src/data/app_database.dart';
import 'src/data/connection.dart';
import 'src/data/repositories.dart';
import 'src/i18n/app_locales.dart';
import 'src/models/models.dart';
import 'src/notifications/reminder_prefs.dart';
import 'src/notifications/reminder_service.dart';
import 'src/notifications/study_timer_alerts.dart';
import 'src/startup.dart';
import 'src/state/providers.dart';
import 'src/state/study_timer_provider.dart';
import 'src/ui/app_fonts.dart';
import 'src/ui/app_sizes.dart';
import 'src/ui/home_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Pre-compile the liquid-glass shaders so the first lens (ECTS-061+)
  // is glass on its first frame. Lite glass on Skia: frost + tint + rim,
  // no shader pass and no capture view needed.
  await LiquidGlassShaders.ensureLoaded();
  LiquidGlassEngine.liteGlassOnSkia = true;
  final startup = await initializeApp(openConnection());
  if (startup case StartupReady(:final db)) {
    // Single notification backend for reminders + the study-timer alert.
    // Best-effort: a failed init (missing permissions/platform support)
    // degrades to no OS notifications instead of blocking launch
    // (the Windows-crash regression ECTS-094).
    RealNotificationBackend? backend;
    try {
      final dbForLocale = db;
      final localeSettings = await SettingsRepository(dbForLocale).get();
      backend = await RealNotificationBackend.create(
        l10n: _reminderLocale(localeSettings.localeCode),
      );
    } catch (_) {
      if (kDebugMode) debugPrint('notification backend init failed');
      backend = null;
    }
    if (backend != null) {
      // Best-effort: never blocks or breaks launch (M9, ECTS-072).
      unawaited(_rescheduleReminders(db, backend));
    }
    runApp(EctsTrackerApp(startup: startup, notificationBackend: backend));
  } else {
    runApp(EctsTrackerApp(startup: startup));
  }
}

/// Recomputes scheduled nudges from live data on every launch. Disabled
/// reminders cancel everything; any failure is swallowed (alarms are
/// best-effort, the in-app feed in dev mode always works).
Future<void> _rescheduleReminders(
  AppDatabase db,
  RealNotificationBackend backend,
) async {
  try {
    final courses = await CourseRepository(db).getAll();
    final sessions = await SessionRepository(db).getAll();
    final settings = await SettingsRepository(db).get();
    await ReminderService(backend, ReminderPrefsRepository()).reschedule(
      courses: courses,
      sessions: sessions,
      hoursPerEcts: settings.hoursPerEcts,
      toleranceDays: settings.paceToleranceDays,
      now: DateTime.now(),
      l10n: _reminderLocale(settings.localeCode),
    );
  } catch (e) {
    // Launch-time reschedule is best-effort (alarms only); log in debug.
    if (kDebugMode) debugPrint('launch reschedule failed: $e');
  }
}

/// Locale for headless (no-BuildContext) scheduling: the user's chosen app
/// language, else the OS locale, else English. Unsupported locales fall back
/// to English rather than throwing (gen-l10n lookup is strict).
AppLocalizations _reminderLocale(String? localeCode) {
  final candidates = [
    appLocaleFromCode(localeCode),
    WidgetsBinding.instance.platformDispatcher.locale,
    const Locale('en'),
  ];
  for (final locale in candidates) {
    if (locale == null) continue;
    try {
      return lookupAppLocalizations(locale);
    } catch (_) {
      // Try the next candidate; 'en' always resolves.
    }
  }
  // Unreachable: the 'en' candidate above always resolves.
  return lookupAppLocalizations(const Locale('en'));
}

class EctsTrackerApp extends StatelessWidget {
  const EctsTrackerApp({super.key, required this.startup, this.notificationBackend});

  final StartupState startup;

  /// Shared notification backend (reminders + timer alert). Null in tests.
  final RealNotificationBackend? notificationBackend;

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
            if (notificationBackend != null)
              timerAlertBackendProvider
                  .overrideWithValue(notificationBackend!),
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
    // Phone notification actions (M11, ECTS-093): Pause/Resume/Discard
    // apply headlessly; Finish opens the app and completes here with full
    // validation. The notifier refreshes the alert after every transition.
    ref.listen<AsyncValue<String>>(timerActionEventsProvider, (_, next) {
      next.whenData((action) {
        final notifier = ref.read(studyTimerProvider.notifier);
        switch (action) {
          case studyTimerActionPause:
            notifier.pause();
          case studyTimerActionResume:
            notifier.resume();
          case studyTimerActionDiscard:
            notifier.discard();
          case studyTimerActionFinish:
            notifier.finishAndLog();
        }
      });
    });
    // Scoped watches: a settings write (e.g. daily target) rebuilds only
    // what its own field feeds, not the whole MaterialApp.
    final accent = ref.watch(settingsProvider
        .select((s) => s.valueOrNull?.accent ?? AppAccent.slate));
    final themeMode = ref.watch(settingsProvider.select(
        (s) => s.valueOrNull?.themeMode ?? AppThemeMode.system));
    final localeCode = ref.watch(
        settingsProvider.select((s) => s.valueOrNull?.localeCode));
    final displayScale = ref.watch(settingsProvider.select((s) =>
        s.valueOrNull?.displaySize.scale ?? AppDisplaySize.comfortable.scale));
    final seed = Color(accent.seedValue);
    final appLocale = appLocaleFromCode(localeCode);
    // System locale when the user picks "system default": ensures CJK
    // Han-unification picks the right sans (SC vs JP vs KR) even without
    // an explicit app language.
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final fallback = fontFallbackForLocale(appLocale ?? systemLocale);
    return MaterialApp(
      onGenerateTitle: (context) =>
          AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: switch (themeMode) {
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
      locale: appLocale,
      builder: (context, child) {
        // App density multiplies the OS scaler (sampled at 16sp) instead
        // of replacing it, so system large-text settings keep working.
        final system = MediaQuery.textScalerOf(context);
        final composed =
            (system.scale(16) / 16 * displayScale).clamp(0.5, 3.0);
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(composed)),
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
