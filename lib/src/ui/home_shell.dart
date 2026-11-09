import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

import '../data/repositories.dart';
import '../logic/course_list.dart';
import '../logic/ects.dart';
import '../logic/session_totals.dart';
import '../models/models.dart';
import '../state/providers.dart';
import 'course_form.dart';
import 'glass.dart';
import 'session_form.dart';
import 'settings_page.dart';
import 'statistics_page.dart';
import 'app_logo.dart';
import 'app_sizes.dart';
import 'widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    // Glass gate (ECTS-062): off renders the identical legacy chrome;
    // on floats LiquidGlass chrome over the same page body.
    return Consumer(
      builder: (context, ref, _) {
        final glass = ref.watch(glassEnabledProvider);
        final l10n = AppLocalizations.of(context)!;
        final titles = [
          l10n.navDashboard,
          l10n.navCourses,
          l10n.navStudyLog,
          l10n.navStatistics,
          l10n.navSettings,
        ];
        final scheme = Theme.of(context).colorScheme;
        // Tab content shared by both branches: constrained, animated,
        // keyed per tab. The glass branch wraps it in insets so the
        // first/last content clears the floating chrome.
        final page = Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth),
            child: AnimatedSwitcher(
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
          ),
        );
        if (!glass) {
          return Scaffold(
            appBar: AppBar(
              leading: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Center(
                  child: AppLogo(
                    size: AppSizes.logoAppBar,
                    radius: AppSizes.logoAppBarRadius,
                  ),
                ),
              ),
              title: Text(
                titles[_index],
                style: const TextStyle(fontSize: 26),
              ),
              actions: [
                if (_index == 0)
                  IconButton(
                    tooltip: l10n.dashboardLogSessionTooltip,
                    onPressed: () => showSessionFormDialog(context),
                    icon: Container(
                      padding:
                          const EdgeInsets.all(AppSizes.appBarActionPad),
                      decoration: BoxDecoration(
                        color: scheme.primaryContainer,
                        borderRadius:
                            BorderRadius.circular(AppSizes.appBarActionRadius),
                      ),
                      child: Icon(Icons.add,
                          size: AppSizes.appBarActionIcon,
                          color: scheme.onPrimaryContainer),
                    ),
                  ),
                const SizedBox(width: AppSizes.dashboardSmallGap),
              ],
            ),
            body: page,
            floatingActionButton: switch (_index) {
              1 => FloatingActionButton.extended(
                  key: const Key('addCourseFab'),
                  onPressed: () => showCourseFormDialog(context),
                  tooltip: l10n.coursesAddTooltip,
                  icon: const Icon(Icons.add),
                  label: Text(l10n.coursesNewCourse),
                ),
              2 => FloatingActionButton.extended(
                  key: const Key('logSessionFab'),
                  onPressed: () => showSessionFormDialog(context),
                  tooltip: l10n.studyLogFabTooltip,
                  icon: const Icon(Icons.timer),
                  label: Text(l10n.studyLogFabLabel),
                ),
              _ => null,
            },
            bottomNavigationBar: NavigationBar(
              selectedIndex: _index,
              onDestinationSelected: (i) => setState(() => _index = i),
              destinations: [
                NavigationDestination(
                    icon: const Icon(Icons.dashboard),
                    label: l10n.navDashboard),
                NavigationDestination(
                    icon: const Icon(Icons.book), label: l10n.navCourses),
                NavigationDestination(
                    icon: const Icon(Icons.timer), label: l10n.navStudyLog),
                NavigationDestination(
                    icon: const Icon(Icons.bar_chart),
                    label: l10n.navStatistics),
                NavigationDestination(
                    icon: const Icon(Icons.settings),
                    label: l10n.navSettings),
              ],
            ),
          );
        }
        // Glass chrome: one batch over the floating bars so they share a
        // single backdrop read (ECTS-062). Members must not overlap: the
        // app bar sits top, the FAB rides above the tab bar, the tab bar
        // is the last Stack child (docs' standalone pattern), and the
        // scroll-edge bands are excluded (each overlaps the chrome).
        return Scaffold(
          extendBody: true,
          body: SafeArea(
            child: LiquidGlassBatch(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: AppSizes.glassPageTopInset,
                        bottom: AppSizes.glassPageBottomInset,
                      ),
                      child: page,
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: AppSizes.glassEdgeBand,
                    child: LiquidGlassBatch.exclude(
                      child: LiquidGlassScrollEdge(
                        edge: LiquidGlassEdge.top,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: AppSizes.glassEdgeBand,
                    child: LiquidGlassBatch.exclude(
                      child: LiquidGlassScrollEdge(
                        edge: LiquidGlassEdge.bottom,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppSizes.pageHPad,
                        right: AppSizes.pageHPad,
                        top: AppSizes.glassChromeGap,
                      ),
                      child: Center(
                        child: _glassAppBar(context, titles, scheme, l10n),
                      ),
                    ),
                  ),
                  if (_index == 1)
                    Positioned(
                      right: AppSizes.pageHPad,
                      bottom: AppSizes.glassFabLift,
                      child: LiquidGlassFab.extended(
                        key: const Key('addCourseFab'),
                        onPressed: () => showCourseFormDialog(context),
                        tooltip: l10n.coursesAddTooltip,
                        icon: Icons.add,
                        label: Text(l10n.coursesNewCourse),
                      ),
                    ),
                  if (_index == 2)
                    Positioned(
                      right: AppSizes.pageHPad,
                      bottom: AppSizes.glassFabLift,
                      child: LiquidGlassFab.extended(
                        key: const Key('logSessionFab'),
                        onPressed: () => showSessionFormDialog(context),
                        tooltip: l10n.studyLogFabTooltip,
                        icon: Icons.timer,
                        label: Text(l10n.studyLogFabLabel),
                      ),
                    ),
                  LiquidGlassTabBar(
                    items: [
                      LiquidGlassTabBarItem(
                          icon: Icons.dashboard, label: l10n.navDashboard),
                      LiquidGlassTabBarItem(
                          icon: Icons.book, label: l10n.navCourses),
                      LiquidGlassTabBarItem(
                          icon: Icons.timer, label: l10n.navStudyLog),
                      LiquidGlassTabBarItem(
                          icon: Icons.bar_chart, label: l10n.navStatistics),
                      LiquidGlassTabBarItem(
                          icon: Icons.settings, label: l10n.navSettings),
                    ],
                    selectedIndex: _index,
                    onChanged: (i) => setState(() => _index = i),
                    // Glass morph pill on Impeller; plain frosted capsule
                    // on Skia/Web (no capture view needed there).
                    pillStyle: const LiquidGlassTabPillStyle(
                      mode: LiquidGlassPillMode.impellerOnly,
                    ),
                    itemStyle: const LiquidGlassTabItemStyle(
                      iconSize: AppSizes.glassTabIconSize,
                    ),
                    width: AppSizes.glassTabWidth,
                    height: AppSizes.glassTabHeight,
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(
                      bottom: AppSizes.glassTabBottomMargin,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Floating glass app bar mirroring the legacy AppBar slots (ECTS-062):
  /// same logo leading, same tab title, same dashboard log action.
  Widget _glassAppBar(
    BuildContext context,
    List<String> titles,
    ColorScheme scheme,
    AppLocalizations l10n,
  ) {
    final barWidth = (MediaQuery.sizeOf(context).width -
            AppSizes.pageHPad * 2)
        .clamp(AppSizes.glassBarMinWidth, AppSizes.glassBarMaxWidth)
        .toDouble();
    return LiquidGlassAppBar(
      width: barWidth,
      height: AppSizes.glassBarHeight,
      centerTitle: false,
      foregroundColor: scheme.onSurface,
      leading: const Padding(
        padding: EdgeInsets.only(left: AppSizes.glassBarLeadingPad),
        child: Center(
          child: AppLogo(
            size: AppSizes.logoAppBar,
            radius: AppSizes.logoAppBarRadius,
          ),
        ),
      ),
      title: Text(
        titles[_index],
        style: const TextStyle(
          fontSize: AppSizes.glassBarTitleSize,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        if (_index == 0)
          IconButton(
            tooltip: l10n.dashboardLogSessionTooltip,
            onPressed: () => showSessionFormDialog(context),
            icon: Container(
              padding: const EdgeInsets.all(AppSizes.appBarActionPad),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius:
                    BorderRadius.circular(AppSizes.appBarActionRadius),
              ),
              child: Icon(Icons.add,
                  size: AppSizes.appBarActionIcon,
                  color: scheme.onPrimaryContainer),
            ),
          ),
        const SizedBox(width: AppSizes.dashboardSmallGap),
      ],
    );
  }
}

class _OverviewPage extends ConsumerWidget {
  const _OverviewPage({this.now});

  /// Reference time for derived progress/status/deadlines (injectable for tests).
  final DateTime? now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
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
    return GlassBatch(
      child: ListView(
      key: const Key('dashboardList'),
      padding: const EdgeInsets.fromLTRB(
        AppSizes.pageHPad,
        AppSizes.dashboardTopPad,
        AppSizes.pageHPad,
        AppSizes.pageBottomPadNoFab,
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
        const SizedBox(height: AppSizes.sectionGap),
        SizedBox(
          width: double.infinity,
          // Glass gate (ECTS-062): same Key/label/icon/tap, glass body
          // with a subtle press flex; off keeps the FilledButton.
          child: ref.watch(glassEnabledProvider)
              ? LiquidGlassButton(
                  key: const Key('dashboardLogSessionAction'),
                  onPressed: () => showSessionFormDialog(context),
                  icon: Icons.timer_outlined,
                  label: l10n.dashboardLogSessionAction,
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
        const SizedBox(height: AppSizes.sectionGap),
        SectionHeader(
          title: l10n.dashboardCoursesTitle,
          titleKey: const Key('coursesTitle'),
          icon: Icons.menu_book_outlined,
          trailing: '${activeItems.length}',
        ),
        const SizedBox(height: AppSizes.sectionInnerGap),
        if (activeItems.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.emptyVPadding,
                horizontal: AppSizes.emptyHPadding,
              ),
              child: Column(
                children: [
                  Container(
                    width: AppSizes.emptyIconBox,
                    height: AppSizes.emptyIconBox,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withValues(alpha: 0.6),
                      borderRadius:
                          BorderRadius.circular(AppSizes.emptyIconRadius),
                    ),
                    child: Icon(Icons.school_outlined,
                        size: AppSizes.emptyIcon,
                        color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  const SizedBox(height: AppSizes.emptyGap),
                  Text(
                    withProgress.isEmpty
                        ? l10n.dashboardNoCourses
                        : l10n.dashboardAllDone,
                    key: const Key('dashboardNoCourses'),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: AppSizes.emptySmallGap),
                  Text(
                    withProgress.isEmpty
                        ? l10n.dashboardEmptyHintNoCourses
                        : l10n.dashboardEmptyHintAllDone,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
          for (final item in activeItems)
            _DashboardCourseCard(
              key: Key('dashboardCourseCard_${item.course.id}'),
              item: item,
              now: effectiveNow,
            ),
        if (scheduled.isNotEmpty) ...[
          const SizedBox(height: AppSizes.sectionGap),
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
          const SizedBox(height: AppSizes.sectionInnerGap),
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

class _OverallProgressCard extends StatelessWidget {
  const _OverallProgressCard({
    required this.totalRequired,
    required this.totalDone,
    required this.courseCount,
    required this.todayPace,
    required this.todayLogged,
    required this.todayFraction,
    required this.hasDueToday,
    required this.upcomingCount,
    required this.runwayDays,
    required this.activeItems,
  });

  final double totalRequired;
  final double totalDone;
  final int courseCount;
  final double todayPace;
  final double todayLogged;
  final double todayFraction;
  final bool hasDueToday;
  final int upcomingCount;
  final int runwayDays;
  final List<CourseWithProgress> activeItems;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final fraction = progressFraction(totalRequired, totalDone);
    final pct = (fraction * 100).clamp(0, 100).toStringAsFixed(0);
    final isFreshStart = totalDone <= 0;
    final isEmpty = courseCount <= 0;
    final hasProgram = totalRequired > 0;
    final hasToday = todayPace > 0;
    final todayPct = (todayFraction * 100).clamp(0, 100).toStringAsFixed(0);
    // Glass cards (ECTS-063): tinted primaryContainer lens + shadow when on;
    // identical Card when off (theme card shape already uses heroRadius).
    return GlassCard(
      color: scheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.heroPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: AppSizes.heroIconBox,
                  height: AppSizes.heroIconBox,
                  decoration: BoxDecoration(
                    color: scheme.primary,
                    borderRadius:
                        BorderRadius.circular(AppSizes.heroIconRadius),
                  ),
                  child: Icon(Icons.today_outlined,
                      color: scheme.onPrimary, size: AppSizes.heroIcon),
                ),
                const SizedBox(width: AppSizes.heroGap),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isFreshStart
                            ? l10n.dashboardFreshStart
                            : l10n.dashboardTodayPaceLabel,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: scheme.onPrimaryContainer,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.8,
                                ),
                      ),
                      const SizedBox(height: AppSizes.heroTitleGap),
                      Text(
                        runwayDays > 0
                            ? l10n.dashboardRunwayDays(runwayDays)
                            : l10n.dashboardNoDeadlines,
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: scheme.onPrimaryContainer,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.pillHPad,
                    vertical: AppSizes.pillVPad,
                  ),
                  decoration: BoxDecoration(
                    color: isFreshStart ? scheme.surface : scheme.primary,
                    borderRadius:
                        BorderRadius.circular(AppSizes.pillRadius),
                  ),
                  child: Text(
                    // Empty (no courses) is not 0% progress — there is
                    // nothing to measure yet, so invite action, not a number.
                    isEmpty ? l10n.dashboardNewBadge : '$pct%',
                    key: const Key('dashboardOverallPct'),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: isFreshStart
                              ? scheme.onSurface
                              : scheme.onPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.heroAfterHeadGap),
            Text(
              hasDueToday
                  ? l10n.dashboardDueToday(todayLogged.toStringAsFixed(1))
                  : todayPace <= 0
                      ? l10n.dashboardNoPaceDue
                      : l10n.dashboardTodayProgress(
                          todayLogged.toStringAsFixed(1),
                          todayPace.toStringAsFixed(1),
                        ),
              key: const Key('dashboardTodayPace'),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                    color: scheme.onPrimaryContainer,
                  ),
            ),
            const SizedBox(height: AppSizes.heroAfterPaceGap),
            if (activeItems.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.heroBoxHPad,
                  vertical: AppSizes.heroBoxVPad,
                ),
                decoration: BoxDecoration(
                  color: scheme.surface.withValues(alpha: 0.75),
                  borderRadius:
                      BorderRadius.circular(AppSizes.heroBoxRadius),
                ),
                child: Column(
                  children: [
                    for (final e in activeItems.take(3))
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.heroRowVPad),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: AppSizes.heroDot,
                              height: AppSizes.heroDot,
                              decoration: BoxDecoration(
                                color: e.course.colorValue != null
                                    ? Color(e.course.colorValue!)
                                    : scheme.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: AppSizes.heroDotGap),
                            Expanded(
                              child: Text(
                                e.course.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(width: AppSizes.heroValueGap),
                            Text(
                              e.progress.requiredDailyHours == null
                                  ? '—'
                                  : l10n.dashboardHoursPerDay(e.progress
                                      .requiredDailyHours!
                                      .toStringAsFixed(1)),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            if (isFreshStart) ...[
              const SizedBox(height: AppSizes.heroTipGap),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.lightbulb_outline,
                      size: AppSizes.heroTipIcon,
                      color: scheme.onPrimaryContainer),
                  const SizedBox(width: AppSizes.heroTipIconGap),
                  Expanded(
                    child: Text(
                      isEmpty
                          ? l10n.dashboardTipEmpty
                          : l10n.dashboardTipFirst,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: scheme.onPrimaryContainer,
                          ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: AppSizes.heroBarSectionGap),
            if (hasToday) ...[
              Row(
                children: [
                  Text(
                    l10n.dashboardTodayLabel(todayPct),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: scheme.onPrimaryContainer,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    l10n.dashboardTodayHours(todayLogged.toStringAsFixed(1),
                        todayPace.toStringAsFixed(1)),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: scheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.heroBarLabelGap),
              RoundedProgressBar(
                value: todayFraction,
                color: scheme.primary,
                minHeight: AppSizes.heroTodayBar,
              ),
              const SizedBox(height: AppSizes.dashboardBarGap),
            ] else ...[
              Row(
                children: [
                  Text(
                    l10n.dashboardTodayBare,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: scheme.onPrimaryContainer,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    isEmpty
                        ? l10n.dashboardNothingToTrack
                        : (todayLogged > 0
                            ? l10n.dashboardBonusLogged(
                                todayLogged.toStringAsFixed(1))
                            : l10n.dashboardNothingDue),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: scheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.dashboardBarGap),
            ],
            if (hasProgram) ...[
              Row(
                children: [
                  Text(
                    l10n.dashboardProgramLabel(pct),
                    style:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: scheme.onPrimaryContainer
                                  .withValues(alpha: 0.8),
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                  ),
                  const Spacer(),
                  Text(
                    l10n.dashboardProgramHours(
                        totalDone.toStringAsFixed(1),
                        totalRequired.toStringAsFixed(0)),
                    key: const Key('dashboardTotals'),
                    style:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: scheme.onPrimaryContainer
                                  .withValues(alpha: 0.8),
                              fontWeight: FontWeight.w600,
                            ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.heroBarLabelGap),
              RoundedProgressBar(
                value: fraction,
                progressKey: const Key('dashboardOverallProgress'),
                color: scheme.onPrimaryContainer,
                minHeight: AppSizes.heroProgramBar,
              ),
              const SizedBox(height: AppSizes.heroAfterBarsGap),
            ] else ...[
              Row(
                children: [
                  Text(
                    l10n.dashboardProgramBare,
                    style:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: scheme.onPrimaryContainer
                                  .withValues(alpha: 0.8),
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                  ),
                  const Spacer(),
                  Text(
                    l10n.dashboardProgramEmptyHint,
                    style:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: scheme.onPrimaryContainer
                                  .withValues(alpha: 0.8),
                              fontWeight: FontWeight.w600,
                            ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.heroAfterBarsGap),
            ],
            if (!isEmpty)
              Text(
                upcomingCount > 0
                    ? l10n.dashboardCourseCountWithUpcoming(
                        '$courseCount', '$upcomingCount')
                    : l10n.dashboardCourseCount('$courseCount'),
                key: const Key('dashboardCourseCount'),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: scheme.onPrimaryContainer.withValues(alpha: 0.7),
                    ),
              ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCourseCard extends StatelessWidget {
  const _DashboardCourseCard(
      {super.key, required this.item, required this.now});

  final CourseWithProgress item;
  final DateTime now;

  String _deadlineLabel(
      AppLocalizations l10n, CourseProgress progress, DateTime? deadline) {
    if (deadline == null) return l10n.dashboardNoDeadline;
    final d = '${deadline.year}-'
        '${deadline.month.toString().padLeft(2, '0')}-'
        '${deadline.day.toString().padLeft(2, '0')}';
    if (progress.status == CourseStatus.overdue) {
      return l10n.dashboardDeadlineOverdue(d);
    }
    if (progress.status == CourseStatus.completed) return l10n.dashboardDeadline(d);
    final days = progress.remainingDays;
    if (days == null) return l10n.dashboardDeadline(d);
    if (days == 0) return l10n.dashboardDeadlineToday(d);
    if (days == 1) return l10n.dashboardDeadlineOneDayLeft(d);
    return l10n.dashboardDeadlineDaysLeft(d, '$days');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final course = item.course;
    final p = item.progress;
    final scheme = Theme.of(context).colorScheme;
    final (_, statusFg) = statusColors(context, p.status);
    final deadlineUrgent = p.status == CourseStatus.overdue ||
        p.status == CourseStatus.behind;
    final scheduled = isScheduledCourse(course, now);
    final daysToStart = scheduled && course.startDate != null
        ? course.startDate!
            .difference(DateTime(now.year, now.month, now.day))
            .inDays
        : 0;
    String startLabel(DateTime? d) => d == null
        ? l10n.dashboardStartNotSet
        : '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

    // Pace action line.
    String? paceText;
    Color paceColor = scheme.onSurfaceVariant;
    FontWeight paceWeight = FontWeight.w700;
    IconData paceIcon = Icons.bolt_outlined;
    if (scheduled) {
      final fromStart = requiredDailyHoursFromStart(
          p.remainingHours, course.startDate, course.deadline);
      paceText = fromStart == null
          ? l10n.dashboardPaceStarts(startLabel(course.startDate),
              p.remainingHours.toStringAsFixed(1))
          : l10n.dashboardPaceNeedFrom(fromStart.toStringAsFixed(1),
              startLabel(course.startDate));
      paceColor = scheme.onSurfaceVariant;
      paceIcon = Icons.schedule_outlined;
    } else if (p.requiredDailyHours != null) {
      final daily = p.requiredDailyHours!;
      final weekly = p.requiredWeeklyHours;
      if (weekly == null) {
        paceText = l10n.dashboardPaceNeedDaily(daily.toStringAsFixed(1));
      } else {
        paceText = l10n.dashboardPaceNeedDailyWeekly(
            daily.toStringAsFixed(1), weekly.toStringAsFixed(1));
      }
      if (daily > 6) {
        paceColor = scheme.error;
        paceIcon = Icons.warning_amber_outlined;
        paceText = l10n.dashboardPaceUnrealistic(paceText);
      } else if (daily > 4) {
        paceColor = scheme.error.withValues(alpha: 0.9);
        paceIcon = Icons.speed_outlined;
      } else {
        paceColor = scheme.primary;
        paceIcon = Icons.bolt_outlined;
      }
    } else if (p.remainingHours > 0 && p.remainingDays == 0) {
      paceText = l10n.dashboardPaceDueToday(p.remainingHours.toStringAsFixed(1));
      paceColor = scheme.error;
      paceIcon = Icons.error_outline;
    } else if (course.deadline == null) {
      paceText = l10n.dashboardPaceNoDeadline(
          p.remainingHours.toStringAsFixed(1));
      paceIcon = Icons.all_inclusive;
    }

    // Behind / on-track explainer.
    String? explainerText;
    if (scheduled) {
      explainerText = course.startEarly
          ? l10n.dashboardExplainerStartsInEarly(
              '$daysToStart', startLabel(course.startDate))
          : l10n.dashboardExplainerStartsIn(
              '$daysToStart', startLabel(course.startDate));
    } else if (p.status == CourseStatus.behind) {
      final effStart = effectivePaceStart(
        startDate: course.startDate,
        startEarly: course.startEarly,
        now: now,
        sessions: const [],
      );
      final elapsed = elapsedDays(effStart, now);
      final achieved = elapsed > 0
          ? p.completedHours / elapsed
          : (p.completedHours > 0 ? p.completedHours : 0.0);
      final need = p.requiredDailyHours;
      final earlyStart =
          course.startEarly && isFutureStart(course.startDate, now);
      if (need == null) {
        explainerText = l10n.dashboardExplainerBehindNoPace;
      } else if (earlyStart) {
        explainerText = l10n.dashboardExplainerBehindEarly(
            achieved.toStringAsFixed(1), need.toStringAsFixed(1));
      } else {
        explainerText = l10n.dashboardExplainerBehind(
            achieved.toStringAsFixed(1), need.toStringAsFixed(1));
      }
    } else if (p.status == CourseStatus.onTrack &&
        p.requiredDailyHours != null) {
      final effStart = effectivePaceStart(
        startDate: course.startDate,
        startEarly: course.startEarly,
        now: now,
        sessions: const [],
      );
      final elapsed = elapsedDays(effStart, now);
      if (elapsed <= 0 && p.completedHours <= 0) {
        explainerText = l10n.dashboardExplainerOnTrackNoPace;
      }
    }

    final pillLabel = scheduled
        ? (daysToStart <= 0
            ? l10n.dashboardStartsSoon
            : l10n.dashboardStartsIn('$daysToStart'))
        : courseStatusLabelL10n(p.status, l10n);
    final pillStatus =
        scheduled ? CourseStatus.onTrack : p.status;
    return GlassCard(
      margin: const EdgeInsets.only(bottom: AppSizes.cardGap),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.dashboardCardPad),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CourseAvatar(
                    name: course.name, colorValue: course.colorValue),
                const SizedBox(width: AppSizes.heroGap),
                Expanded(
                  child: Text(
                    course.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.2,
                        ),
                  ),
                ),
                StatusPill(
                  status: pillStatus,
                  label: pillLabel,
                  textKey: Key('dashboardStatus_${course.id}'),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.dashboardTitleGap),
            RoundedProgressBar(
              value: p.progressFraction,
              progressKey: Key('dashboardProgress_${course.id}'),
              color: statusFg == scheme.onPrimaryContainer
                  ? scheme.primary
                  : statusFg,
              minHeight: AppSizes.barDashboard,
            ),
            const SizedBox(height: AppSizes.dashboardBarGap),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.schedule_outlined,
                    size: AppSizes.dashboardIcon,
                    color: scheme.onSurfaceVariant),
                const SizedBox(width: AppSizes.dashboardIconGap),
                Text(
                  l10n.dashboardHoursFraction(
                      p.completedHours.toStringAsFixed(1),
                      p.requiredHours.toStringAsFixed(1)),
                  key: Key('dashboardHours_${course.id}'),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(width: AppSizes.dashboardIconGap),
                Expanded(
                  child: Text(
                    l10n.dashboardHoursDetail(
                        (p.progressFraction * 100).toStringAsFixed(0),
                        p.remainingHours.toStringAsFixed(0)),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
            if (paceText != null) ...[
              const SizedBox(height: AppSizes.dashboardRowGap),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.dashboardPaceHPad,
                  vertical: AppSizes.dashboardPaceVPad,
                ),
                decoration: BoxDecoration(
                  color: paceColor.withValues(alpha: 0.12),
                  borderRadius:
                      BorderRadius.circular(AppSizes.dashboardPaceRadius),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(paceIcon,
                        size: AppSizes.dashboardPaceIcon, color: paceColor),
                    const SizedBox(width: AppSizes.dashboardIconGap),
                    Expanded(
                      child: Text(
                        paceText,
                        key: Key('dashboardPace_${course.id}'),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: paceColor,
                              fontWeight: paceWeight,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (explainerText != null) ...[
              const SizedBox(height: AppSizes.dashboardSmallGap),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.info_outline,
                      size: AppSizes.dashboardIcon,
                      color: scheme.onSurfaceVariant),
                  const SizedBox(width: AppSizes.dashboardIconGap),
                  Expanded(
                    child: Text(
                      explainerText,
                      key: Key('dashboardBehind_${course.id}'),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: AppSizes.dashboardSmallGap),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  p.status == CourseStatus.overdue
                      ? Icons.error_outline
                      : Icons.event_outlined,
                  size: AppSizes.dashboardIcon,
                  color: deadlineUrgent
                      ? scheme.error
                      : scheme.onSurfaceVariant,
                ),
                const SizedBox(width: AppSizes.dashboardIconGap),
                Expanded(
                  child: Text(
                    _deadlineLabel(l10n, p, course.deadline),
                    key: Key('dashboardDeadline_${course.id}'),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: deadlineUrgent
                              ? scheme.error
                              : scheme.onSurfaceVariant,
                          fontWeight: deadlineUrgent
                              ? FontWeight.w800
                              : FontWeight.w500,
                        ),
                  ),
                ),
              ],
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
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.coursesDeleteTitle),
          content: Text(
            l10n.coursesDeleteBody(course.name),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.commonCancel),
            ),
            FilledButton(
              key: const Key('confirmDeleteCourse'),
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.commonDelete),
            ),
          ],
        );
      },
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
    final l10n = AppLocalizations.of(context)!;
    final coursesAsync = ref.watch(coursesProvider);
    final sessionsAsync = ref.watch(sessionsProvider);
    final settingsAsync = ref.watch(settingsProvider);

    final error =
        coursesAsync.error ?? sessionsAsync.error ?? settingsAsync.error;
    if (error != null) {
      return Center(child: Text('${l10n.commonError}: $error'));
    }
    if (coursesAsync.isLoading ||
        sessionsAsync.isLoading ||
        settingsAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final courses = coursesAsync.requireValue;
    if (courses.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.pageHPad),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.emptyVPadding,
                horizontal: AppSizes.emptyHPadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: AppSizes.emptyIconBox,
                    height: AppSizes.emptyIconBox,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(
                          AppSizes.emptyIconRadius),
                    ),
                    child: Icon(Icons.menu_book_outlined,
                        size: AppSizes.emptyIcon,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  const SizedBox(height: AppSizes.emptyGap),
                  Text(l10n.coursesEmptyTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          )),
                  const SizedBox(height: AppSizes.emptySmallGap),
                  Text(
                    l10n.coursesEmptyHint,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    final now = widget.now ?? DateTime.now();
    final appSettings = settingsAsync.requireValue;
    final hoursPerEcts = appSettings.hoursPerEcts;
    final withProgress = coursesWithProgress(
      courses,
      sessionsAsync.requireValue,
      hoursPerEcts: hoursPerEcts,
      now: now,
      toleranceDays: appSettings.paceToleranceDays,
    );
    final visible = sortAndFilterCourses(
      withProgress,
      sort: _sort,
      statusFilter: _statusFilter,
    );

    // Glass cards (ECTS-063): filter chips + count pill render as lite
    // lenses when on (DropdownButton/Chip untouched inside); the identical
    // legacy containers when off. Rows below are GlassCards in one batch.
    final glass = ref.watch(glassEnabledProvider);
    Widget chip(Widget child, double radius) =>
        glass ? GlassCard(cornerRadius: radius, child: child) : child;

    return GlassBatch(
      child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.pageHPad,
            AppSizes.pageTopPad,
            AppSizes.pageHPad,
            AppSizes.sectionInnerGap,
          ),
          child: Wrap(
            spacing: AppSizes.sectionInnerGap,
            runSpacing: AppSizes.sectionInnerGap,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              chip(
                FilterDropdownShell(
                  icon: Icons.sort,
                  child: DropdownButton<CourseSort>(
                    key: const Key('courseSortDropdown'),
                    value: _sort,
                    underline: const SizedBox.shrink(),
                    icon: const Icon(
                      Icons.expand_more,
                      size: AppSizes.filterIcon,
                    ),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                    onChanged: (v) =>
                        setState(() => _sort = v ?? CourseSort.name),
                    items: [
                      for (final s in CourseSort.values)
                        DropdownMenuItem(
                          value: s,
                          key: Key('courseSort_${s.name}'),
                          child: Text(l10n.coursesSortOption(
                              courseSortLabelL10n(s, l10n))),
                        ),
                    ],
                  ),
                ),
                AppSizes.filterRadius,
              ),
              chip(
                FilterDropdownShell(
                  icon: Icons.filter_list_outlined,
                  child: DropdownButton<CourseStatus?>(
                    key: const Key('courseStatusFilterDropdown'),
                    value: _statusFilter,
                    underline: const SizedBox.shrink(),
                    icon: const Icon(
                      Icons.expand_more,
                      size: AppSizes.filterIcon,
                    ),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                    onChanged: (v) => setState(() => _statusFilter = v),
                    items: [
                      DropdownMenuItem<CourseStatus?>(
                        value: null,
                        key: const Key('courseFilter_all'),
                        child: Text(l10n.coursesFilterAll),
                      ),
                      for (final s in CourseStatus.values)
                        DropdownMenuItem<CourseStatus?>(
                          value: s,
                          key: Key('courseFilter_${s.name}'),
                          child: Text(courseStatusLabelL10n(s, l10n)),
                        ),
                    ],
                  ),
                ),
                AppSizes.filterRadius,
              ),
              chip(
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.pillHPad,
                    vertical: AppSizes.pillVPad,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius:
                        BorderRadius.circular(AppSizes.pillRadius),
                  ),
                  child: Text(
                    l10n.coursesShownCount('${visible.length}'),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                AppSizes.pillRadius,
              ),
            ],
          ),
        ),
        if (visible.isEmpty)
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.pageHPad),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.filter_alt_off_outlined,
                        size: AppSizes.emptyIcon,
                        color: Theme.of(context).colorScheme.outline),
                    const SizedBox(height: AppSizes.sectionInnerGap),
                    Text(
                      l10n.coursesFilterEmpty,
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
              padding: const EdgeInsets.fromLTRB(
                AppSizes.pageHPad,
                AppSizes.sectionInnerGap,
                AppSizes.pageHPad,
                AppSizes.pageBottomPad,
              ),
              itemCount: visible.length,
              itemBuilder: (context, i) {
                final item = visible[i];
                final course = item.course;
                final p = item.progress;
                final scheme = Theme.of(context).colorScheme;
                final (_, statusFg) = statusColors(context, p.status);
                final paceUrgent = (p.requiredDailyHours ?? 0) > 8;
                return GlassCard(
                  margin:
                      const EdgeInsets.only(bottom: AppSizes.cardGap),
                  child: ListTile(
                    key: Key('courseTile_${course.id}'),
                    isThreeLine: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.coursePadH,
                      vertical: AppSizes.coursePadV,
                    ),
                    leading: CourseAvatar(
                      name: course.name,
                      colorValue: course.colorValue,
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            course.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ),
                        if (course.isSample)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Chip(
                              key: const Key('sampleCourseMarker'),
                              label: Text(l10n.sampleBadge),
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSizes.courseTitleGap),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.innerHPad,
                                vertical: AppSizes.pillVPad,
                              ),
                              decoration: BoxDecoration(
                                color: scheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(
                                    AppSizes.innerRadius),
                              ),
                              child: Text(
                                l10n.coursesEctsValue(course.ectsCredits),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color:
                                          scheme.onSecondaryContainer,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                            const SizedBox(width: AppSizes.sectionInnerGap),
                            Expanded(
                              child: Text(
                                l10n.coursesProgressWithStatus(
                                    p.completedHours.toStringAsFixed(1),
                                    p.requiredHours.toStringAsFixed(1),
                                    courseStatusLabelL10n(p.status, l10n)),
                                key: Key('courseProgressText_${course.id}'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.courseMetaGap),
                        RoundedProgressBar(
                          value: p.progressFraction,
                          progressKey:
                              Key('courseProgressBar_${course.id}'),
                          color: statusFg == scheme.onPrimaryContainer
                              ? scheme.primary
                              : statusFg,
                          minHeight: AppSizes.barCourse,
                        ),
                        if (p.requiredDailyHours != null)
                          Padding(
                            padding: const EdgeInsets.only(
                                top: AppSizes.coursePaceGap),
                            child: Row(
                              children: [
                                Icon(
                                  paceUrgent
                                      ? Icons.warning_amber_outlined
                                      : Icons.speed_outlined,
                                  size: AppSizes.courseIcon,
                                  color: paceUrgent
                                      ? scheme.error
                                      : scheme.onSurfaceVariant,
                                ),
                                const SizedBox(
                                    width: AppSizes.dashboardSmallGap),
                                Expanded(
                                  child: Text(
                                    p.requiredWeeklyHours == null
                                        ? l10n.coursesPaceNeeded(p
                                            .requiredDailyHours!
                                            .toStringAsFixed(1))
                                        : l10n.coursesPaceNeededWeekly(
                                            p.requiredDailyHours!
                                                .toStringAsFixed(1),
                                            p.requiredWeeklyHours!
                                                .toStringAsFixed(1)),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: paceUrgent
                                              ? scheme.error
                                              : scheme.onSurfaceVariant,
                                          fontWeight: paceUrgent
                                              ? FontWeight.w800
                                              : FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
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
                            tooltip: l10n.coursesRemoveSampleTooltip,
                            style: IconButton.styleFrom(
                              foregroundColor: scheme.onSurfaceVariant,
                            ),
                            onPressed: () => _removeSampleCourse(course),
                          )
                        : PopupMenuButton<String>(
                            key: Key('courseMenu_${course.id}'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppSizes.listTileRadius),
                            ),
                            onSelected: (value) {
                              if (value == 'edit') {
                                showCourseFormDialog(context, existing: course);
                              } else if (value == 'delete') {
                                _confirmDelete(course);
                              }
                            },
                            itemBuilder: (context) {
                              final menuL10n =
                                  AppLocalizations.of(context)!;
                              return [
                                PopupMenuItem(
                                    value: 'edit',
                                    child: Text(menuL10n.commonEdit)),
                                PopupMenuItem(
                                    value: 'delete',
                                    child: Text(menuL10n.commonDelete)),
                              ];
                            },
                          ),
                  ),
                );
              },
            ),
          ),
      ],
      ),
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
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return AlertDialog(
          title: Text(l10n.studyLogDeleteTitle),
          content: Text(
            l10n.studyLogDeleteBody,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.commonCancel),
            ),
            FilledButton(
              key: const Key('confirmDeleteSession'),
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.commonDelete),
            ),
          ],
        );
      },
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
    final l10n = AppLocalizations.of(context)!;
    final sessionsAsync = ref.watch(sessionsProvider);
    final coursesAsync = ref.watch(coursesProvider);
    final settings = ref.watch(settingsProvider).valueOrNull;
    final effectiveNow = now ?? DateTime.now();
    final firstWeekday = settings?.firstWeekday ?? DateTime.monday;

    return sessionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) =>
          Center(child: Text('${l10n.commonError}: $e')),
      data: (sessionList) {
        if (sessionList.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.pageHPad),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: AppSizes.emptyIconBox,
                    height: AppSizes.emptyIconBox,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(
                          AppSizes.emptyIconRadius),
                    ),
                    child: Icon(Icons.timer_outlined,
                        size: AppSizes.emptyIcon,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  const SizedBox(height: AppSizes.emptyGap),
                  Text(
                    l10n.studyLogEmptyTitle,
                    key: const Key('studyLogEmpty'),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: AppSizes.emptySmallGap),
                  Text(
                    l10n.studyLogEmptyHint,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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

        // Glass cards (ECTS-063): totals + session rows share one page batch.
        return GlassBatch(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.pageHPad,
                AppSizes.pageTopPad,
                AppSizes.pageHPad,
                AppSizes.sectionInnerGap,
              ),
              child: GlassCard(
                key: const Key('studyTotalsCard'),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.studyTotalsHPad,
                    vertical: AppSizes.studyTotalsVPad,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: StatTile(
                          icon: Icons.today_outlined,
                          label: l10n.studyLogToday,
                          value: l10n.studyLogHoursValue(
                              totals.dailyHours.toStringAsFixed(1)),
                          valueKey: const Key('dailyTotal'),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: AppSizes.studyDividerH,
                        margin: const EdgeInsets.symmetric(
                            horizontal: AppSizes.studyDividerGap),
                        color: Theme.of(context)
                            .colorScheme
                            .outlineVariant
                            .withValues(alpha: 0.7),
                      ),
                      Expanded(
                        child: StatTile(
                          icon: Icons.date_range_outlined,
                          label: l10n.studyLogThisWeek,
                          value: l10n.studyLogHoursValue(
                              totals.weeklyHours.toStringAsFixed(1)),
                          valueKey: const Key('weeklyTotal'),
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
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.pageHPad,
                  AppSizes.sectionInnerGap,
                  AppSizes.pageHPad,
                  AppSizes.pageBottomPad,
                ),
                itemCount: sorted.length,
                itemBuilder: (context, i) {
                  final session = sorted[i];
                  final course = courseMap[session.courseId];
                  final hours = session.minutes / 60.0;
                  final dateLabel = '${session.date.year}-'
                      '${session.date.month.toString().padLeft(2, '0')}-'
                      '${session.date.day.toString().padLeft(2, '0')}';
                  final subtitleParts = <String>[
                    dateLabel,
                  ];
                  if (session.notes != null && session.notes!.trim().isNotEmpty) {
                    subtitleParts.add(session.notes!.trim());
                  }
                  final scheme = Theme.of(context).colorScheme;
                  return GlassCard(
                    margin: const EdgeInsets.only(bottom: AppSizes.cardGap),
                    child: ListTile(
                      key: Key('sessionTile_${session.id}'),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.studyRowHPad,
                        vertical: AppSizes.coursePadV,
                      ),
                      leading: CourseAvatar(
                        name: course?.name ??
                            l10n.studyLogUnknownCourseShort(
                                '${session.courseId}'),
                        colorValue: course?.colorValue,
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              course?.name ??
                                  l10n.studyLogUnknownCourse(
                                      '${session.courseId}'),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: AppSizes.sectionInnerGap),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.studyHourHPad,
                              vertical: AppSizes.studyHourVPad,
                            ),
                            decoration: BoxDecoration(
                              color: scheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(
                                  AppSizes.pillRadius),
                            ),
                            child: Text(
                              l10n.studyLogHoursValue(
                                  hours.toStringAsFixed(1)),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: scheme.onSecondaryContainer,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                          if (session.isSample)
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Chip(
                                key: const Key('sampleSessionMarker'),
                                label: Text(l10n.sampleBadge),
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(
                            top: AppSizes.sectionInnerGap),
                        child: Text(
                          subtitleParts.join('\n'),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                        ),
                      ),
                      isThreeLine: subtitleParts.length > 1,
                      onTap: session.isSample
                          ? null
                          : () =>
                              showSessionFormDialog(context, existing: session),
                      trailing: session.isSample
                          ? IconButton(
                              key: const Key('removeSampleSession'),
                              icon: const Icon(Icons.delete_outline),
                              tooltip: l10n.studyLogRemoveSampleTooltip,
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppSizes.listTileRadius),
                              ),
                              onSelected: (value) {
                                if (value == 'edit') {
                                  showSessionFormDialog(context,
                                      existing: session);
                                } else if (value == 'delete') {
                                  _confirmDeleteSession(context, ref, session);
                                }
                              },
                              itemBuilder: (context) {
                                final menuL10n =
                                    AppLocalizations.of(context)!;
                                return [
                                  PopupMenuItem(
                                      value: 'edit',
                                      child: Text(menuL10n.commonEdit)),
                                  PopupMenuItem(
                                      value: 'delete',
                                      child: Text(menuL10n.commonDelete)),
                                ];
                              },
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
          ),
        );
      },
    );
  }
}
