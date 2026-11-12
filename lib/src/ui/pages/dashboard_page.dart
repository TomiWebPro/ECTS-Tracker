part of '../home_shell.dart';

class _OverviewPage extends ConsumerWidget {
  const _OverviewPage({this.now});

  /// Reference time for derived progress/status/deadlines (injectable for tests).
  final DateTime? now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
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
          '${l10n.commonError}: $error',
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
      toleranceDays: settings.paceToleranceDays,
    );
    final scheduled =
        withProgress.where((e) => isScheduledCourse(e.course, effectiveNow)).toList()
          ..sort((a, b) {
            final sa = a.course.startDate;
            final sb = b.course.startDate;
            if (sa == null && sb == null) {
              return a.course.name
                  .toLowerCase()
                  .compareTo(b.course.name.toLowerCase());
            }
            if (sa == null) return 1;
            if (sb == null) return -1;
            return sa.compareTo(sb);
          });
    final activeItems = dashboardItems(withProgress, effectiveNow);

    // Today's pace: sum of finite required daily paces for started courses.
    // Scheduled future courses are excluded (no pressure today).
    var todayPace = 0.0;
    var hasDueToday = false;
    for (final e in activeItems) {
      final need = e.progress.requiredDailyHours;
      if (need != null) {
        todayPace += need;
      } else if (e.progress.remainingHours > 0 &&
          e.progress.remainingDays == 0) {
        hasDueToday = true;
      }
    }
    final totals = sessionTotals(
      sessions,
      now: effectiveNow,
      firstWeekday: settings.firstWeekday,
    );
    final todayLogged = totals.dailyHours;
    final todayFraction = todayPace <= 0
        ? (todayLogged > 0 ? 1.0 : 0.0)
        : (todayLogged / todayPace).clamp(0.0, 1.0);
    var runwayDays = 0;
    for (final e in activeItems) {
      final d = e.progress.remainingDays;
      if (d != null && d > runwayDays) runwayDays = d;
    }

    // Glass cards (ECTS-063): hero + course cards share one page batch
    // (lite lenses only; members never overlap in the scroll list).
    // ECTS-074 Apple polish (glass-only): airier rhythm — larger top pad,
    // section gaps and card gaps so frosted cards breathe.
    final glass = ref.watch(glassEnabledProvider);
    final topPad =
        glass ? AppSizes.glassDashboardTopPad : AppSizes.dashboardTopPad;
    final sectionGap =
        glass ? AppSizes.glassSectionGap : AppSizes.sectionGap;
    final innerGap = glass
        ? AppSizes.glassSectionInnerGap
        : AppSizes.sectionInnerGap;
    // Glass flow-through: outer bottom inset is gone (see home_shell), so
    // the scrollable carries the tab-bar clearance itself.
    final bottomPad = glass
        ? AppSizes.glassPageBottomInset + AppSizes.pageBottomPadNoFab
        : AppSizes.pageBottomPadNoFab;
    return GlassBatch(
      child: ListView(
      key: const Key('dashboardList'),
      padding: EdgeInsets.fromLTRB(
        AppSizes.pageHPad,
        topPad,
        AppSizes.pageHPad,
        bottomPad,
      ),
      children: [
        _OverallProgressCard(
          totalRequired: totalRequired,
          totalDone: totalDone,
          courseCount: courses.length,
          todayPace: todayPace,
          todayLogged: todayLogged,
          todayFraction: todayFraction,
          hasDueToday: hasDueToday,
          upcomingCount: scheduled.length,
          runwayDays: runwayDays,
          activeItems: activeItems,
        ),
        SizedBox(height: sectionGap),
        SizedBox(
          width: double.infinity,
          // Glass gate (ECTS-062): same Key/label/icon/tap, glass body
          // with a subtle press flex; off keeps the FilledButton.
          // Light frost + dark ink + soft shadow (ECTS-066): airy pill
          // that floats — the saturated primary wash read as a flat
          // solid block. Package white-on-frost default is invisible
          // on light themes, so ink is explicit.
          child: glass
              ? LiquidGlassButton(
                  key: const Key('dashboardLogSessionAction'),
                  onPressed: () => showSessionFormDialog(context),
                  icon: Icons.timer_outlined,
                  label: l10n.dashboardLogSessionAction,
                  foregroundColor: scheme.onPrimaryContainer,
                  style: LiquidGlassButton.defaultStyle.copyWith(
                    // Sheer wash like the cards (ECTS-066): glass over the
                    // solid page, dark ink keeps it legible.
                    color: scheme.primaryContainer.withValues(alpha: 0.35),
                    // Shared card shadow (ECTS-066): one depth language.
                    shadow: glassCardShadow,
                  ),
                  touch: const LiquidGlassTouch.flexing(
                    LiquidGlassFlex.subtle(),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.fabHPad,
                    vertical: AppSizes.fabVPad,
                  ),
                )
              : FilledButton.icon(
                  key: const Key('dashboardLogSessionAction'),
                  onPressed: () => showSessionFormDialog(context),
                  icon: const Icon(
                    Icons.timer_outlined,
                    size: AppSizes.statIcon,
                  ),
                  label: Text(l10n.dashboardLogSessionAction),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.fabHPad,
                      vertical: AppSizes.fabVPad,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSizes.cardRadius),
                    ),
                  ),
                ),
        ),
        SizedBox(height: sectionGap),
        SectionHeader(
          title: l10n.dashboardCoursesTitle,
          titleKey: const Key('coursesTitle'),
          icon: Icons.menu_book_outlined,
          trailing: '${activeItems.length}',
        ),
        SizedBox(height: innerGap),
        if (activeItems.isEmpty)
          EmptyStateCard(
            inset: false,
            icon: Icons.school_outlined,
            title: withProgress.isEmpty
                ? l10n.dashboardNoCourses
                : l10n.dashboardAllDone,
            titleKey: const Key('dashboardNoCourses'),
            titleLarge: true,
            hint: withProgress.isEmpty
                ? l10n.dashboardEmptyHintNoCourses
                : l10n.dashboardEmptyHintAllDone,
          )
        else
          for (final item in activeItems)
            _DashboardCourseCard(
              key: Key('dashboardCourseCard_${item.course.id}'),
              item: item,
              now: effectiveNow,
            ),
        if (scheduled.isNotEmpty) ...[
          SizedBox(height: sectionGap),
          SectionHeader(
            title: l10n.dashboardUpcomingTitle,
            titleKey: const Key('upcomingTitle'),
            icon: Icons.schedule_outlined,
            trailing: '${scheduled.length}',
          ),
          Text(
            l10n.dashboardUpcomingSubtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: innerGap),
          for (final item in scheduled)
            _DashboardCourseCard(
              key: Key('upcomingCard_${item.course.id}'),
              item: item,
              now: effectiveNow,
            ),
        ],
      ],
      ),
    );
  }
}
