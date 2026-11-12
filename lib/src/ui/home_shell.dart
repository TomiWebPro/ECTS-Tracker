import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

import '../data/repositories.dart';
import '../logic/course_list.dart';
import '../logic/ects.dart';
import '../logic/pace_format.dart';
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

part 'pages/dashboard_page.dart';
part 'pages/dashboard_cards.dart';
part 'pages/courses_page.dart';
part 'pages/study_log_page.dart';

/// Responsive floating tab-bar width (ECTS-068).
///
/// The package centers its fixed-width capsule with a computed
/// `(parentWidth - width) / 2` inset — a window narrower than
/// [AppSizes.glassTabWidth] made that inset negative and tripped
/// RenderPadding's `isNonNegative` assert on the Impeller morph-pill path
/// (Windows crash). Clamping the bar to the available width keeps the
/// inset non-negative on any window size.
double glassTabBarWidthFor(double maxWidth) =>
    (maxWidth - AppSizes.pageHPad * 2).clamp(0.0, AppSizes.glassTabWidth);

/// Root scaffold: bottom nav across the five app areas (AGENTS.md §3).
class HomeShell extends StatefulWidget {  const HomeShell({super.key, this.now});

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
        // is the last Stack child (docs' standalone pattern). No
        // scroll-edge bands (ECTS-066): their black fade gradient washed
        // over content and read as a dirty overlay.
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
                  // Glass action pills (ECTS-066): LiquidGlassButton, not Fab —
                  // only Button answers a finger with the same subtle
                  // press/drag flex as the dashboard action. Light
                  // primaryContainer frost + dark ink + soft shadow: airy
                  // pills that float (package white-on-frost default is
                  // invisible on light themes). Same Keys/tooltips/taps
                  // as the legacy FABs.
                  if (_index == 1)
                    Positioned(
                      right: AppSizes.pageHPad,
                      bottom: AppSizes.glassFabLift,
                      child: Tooltip(
                        message: l10n.coursesAddTooltip,
                        child: LiquidGlassButton(
                          key: const Key('addCourseFab'),
                          onPressed: () => showCourseFormDialog(context),
                          icon: Icons.add,
                          label: l10n.coursesNewCourse,
                          foregroundColor: scheme.onPrimaryContainer,
                          style: LiquidGlassButton.defaultStyle.copyWith(
                            color: scheme.primaryContainer
                                .withValues(alpha: 0.35),
                            // Shared card shadow (ECTS-066) — one depth
                            // language everywhere.
                            shadow: glassCardShadow,
                          ),
                          touch: const LiquidGlassTouch.flexing(
                            LiquidGlassFlex.subtle(),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.fabHPad,
                            vertical: AppSizes.fabVPad,
                          ),
                        ),
                      ),
                    ),
                  if (_index == 2)
                    Positioned(
                      right: AppSizes.pageHPad,
                      bottom: AppSizes.glassFabLift,
                      child: Tooltip(
                        message: l10n.studyLogFabTooltip,
                        child: LiquidGlassButton(
                          key: const Key('logSessionFab'),
                          onPressed: () => showSessionFormDialog(context),
                          icon: Icons.timer,
                          label: l10n.studyLogFabLabel,
                          foregroundColor: scheme.onPrimaryContainer,
                          style: LiquidGlassButton.defaultStyle.copyWith(
                            color: scheme.primaryContainer
                                .withValues(alpha: 0.35),
                            // Shared card shadow (ECTS-066) — one depth
                            // language everywhere.
                            shadow: glassCardShadow,
                          ),
                          touch: const LiquidGlassTouch.flexing(
                            LiquidGlassFlex.subtle(),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.fabHPad,
                            vertical: AppSizes.fabVPad,
                          ),
                        ),
                      ),
                    ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return LiquidGlassTabBar(
                        items: [
                          LiquidGlassTabBarItem(
                              icon: Icons.dashboard,
                              label: l10n.navDashboard),
                          LiquidGlassTabBarItem(
                              icon: Icons.book, label: l10n.navCourses),
                          LiquidGlassTabBarItem(
                              icon: Icons.timer, label: l10n.navStudyLog),
                          LiquidGlassTabBarItem(
                              icon: Icons.bar_chart,
                              label: l10n.navStatistics),
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
                        // ECTS-068: fit the bar to the window (see
                        // [glassTabBarWidthFor]); the package-computed
                        // centering inset goes negative on narrower windows
                        // and crashes.
                        width: glassTabBarWidthFor(constraints.maxWidth),
                        height: AppSizes.glassTabHeight,
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.only(
                          bottom: AppSizes.glassTabBottomMargin,
                        ),
                      );
                    },
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
      // Tinted frost + chrome shadow (ECTS-066): the default near-clear
      // frost is invisible against the white page — a primaryContainer
      // wash makes the glass read while the dark onSurface ink stays
      // legible. Shadow is the shared chrome depth (see glass.dart).
      style: LiquidGlassAppBar.defaultStyle.copyWith(
        color: scheme.primaryContainer.withValues(alpha: 0.55),
        shadow: glassChromeShadow,
      ),
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
                // Dark solid chip (ECTS-066): primary on the light bar so
                // it separates as its own layer — the pale container melted
                // in. Legacy branch keeps the light container.
                color: scheme.primary,
                borderRadius:
                    BorderRadius.circular(AppSizes.appBarActionRadius),
              ),
              child: Icon(Icons.add,
                  size: AppSizes.appBarActionIcon,
                  color: scheme.onPrimary),
            ),
          ),
        const SizedBox(width: AppSizes.dashboardSmallGap),
      ],
    );
  }
}
