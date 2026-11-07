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
import 'statistics_page.dart';
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

  static const _titles = [
    'Dashboard',
    'Courses',
    'Study Log',
    'Statistics',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_index],
          style: const TextStyle(fontSize: 26),
        ),
        actions: [
          if (_index == 0)
            IconButton(
              tooltip: 'Log study session',
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
      body: Align(
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
      ),
      floatingActionButton: switch (_index) {
        1 => FloatingActionButton.extended(
            key: const Key('addCourseFab'),
            onPressed: () => showCourseFormDialog(context),
            tooltip: 'Add course',
            icon: const Icon(Icons.add),
            label: const Text('New course'),
          ),
        2 => FloatingActionButton.extended(
            key: const Key('logSessionFab'),
            onPressed: () => showSessionFormDialog(context),
            tooltip: 'Log session',
            icon: const Icon(Icons.timer),
            label: const Text('Log session'),
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

class _OverviewPage extends ConsumerWidget {
  const _OverviewPage({this.now});

  /// Reference time for derived progress/status/deadlines (injectable for tests).
  final DateTime? now;

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

    return ListView(
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
          child: FilledButton.icon(
            key: const Key('dashboardLogSessionAction'),
            onPressed: () => showSessionFormDialog(context),
            icon: const Icon(
              Icons.timer_outlined,
              size: AppSizes.statIcon,
            ),
            label: const Text('Log study session'),
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
          title: 'Courses',
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
                    withProgress.isEmpty ? 'No courses yet' : 'All done',
                    key: const Key('dashboardNoCourses'),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: AppSizes.emptySmallGap),
                  Text(
                    withProgress.isEmpty
                        ? 'Add a course to start tracking your ECTS progress.'
                        : 'Every course is completed — see the Courses tab for the full list.',
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
            title: 'Upcoming',
            titleKey: const Key('upcomingTitle'),
            icon: Icons.schedule_outlined,
            trailing: '${scheduled.length}',
          ),
          Text(
            'Future starts — no pressure today, excluded from Today’s pace.',
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
    final scheme = Theme.of(context).colorScheme;
    final fraction = progressFraction(totalRequired, totalDone);
    final pct = (fraction * 100).clamp(0, 100).toStringAsFixed(0);
    final isFreshStart = totalDone <= 0;
    final isEmpty = courseCount <= 0;
    final hasProgram = totalRequired > 0;
    final hasToday = todayPace > 0;
    final todayPct = (todayFraction * 100).clamp(0, 100).toStringAsFixed(0);
    return Card(
      color: scheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.heroRadius),
      ),
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
                        isFreshStart ? 'FRESH START' : 'TODAY’S PACE',
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
                            ? '$runwayDays days of runway'
                            : 'No deadlines scheduled',
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
                    isEmpty ? 'NEW' : '$pct%',
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
                  ? 'Due today — ${todayLogged.toStringAsFixed(1)} h logged'
                  : todayPace <= 0
                      ? 'No pace due today'
                      : '${todayLogged.toStringAsFixed(1)} / ${todayPace.toStringAsFixed(1)} h today',
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
                                  : '${e.progress.requiredDailyHours!.toStringAsFixed(1)} h/d',
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
                          ? 'Add your first course — your daily pace and progress will appear here.'
                          : 'First 25 min counts most — pick the course due first.',
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
                    'TODAY $todayPct%',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: scheme.onPrimaryContainer,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    '${todayLogged.toStringAsFixed(1)} / ${todayPace.toStringAsFixed(1)} h',
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
                    'TODAY',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: scheme.onPrimaryContainer,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    isEmpty
                        ? 'Nothing to track yet'
                        : (todayLogged > 0
                            ? '${todayLogged.toStringAsFixed(1)} h logged (bonus)'
                            : 'Nothing due'),
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
                    'PROGRAM $pct%',
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
                    '${totalDone.toStringAsFixed(1)} / '
                    '${totalRequired.toStringAsFixed(0)} h',
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
                    'PROGRAM',
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
                    'Add a course to start tracking',
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
                '$courseCount course(s)'
                '${upcomingCount > 0 ? ' · $upcomingCount upcoming not in today’s pace' : ''}',
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

  String _deadlineLabel(CourseProgress progress, DateTime? deadline) {
    if (deadline == null) return 'No deadline';
    final d = '${deadline.year}-'
        '${deadline.month.toString().padLeft(2, '0')}-'
        '${deadline.day.toString().padLeft(2, '0')}';
    if (progress.status == CourseStatus.overdue) return 'Deadline $d (overdue)';
    if (progress.status == CourseStatus.completed) return 'Deadline $d';
    final days = progress.remainingDays;
    if (days == null) return 'Deadline $d';
    if (days == 0) return 'Deadline $d (today)';
    return 'Deadline $d ($days day${days == 1 ? '' : 's'} left)';
  }

  @override
  Widget build(BuildContext context) {
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
        ? 'Not set'
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
          ? 'Starts ${startLabel(course.startDate)} · ${p.remainingHours.toStringAsFixed(1)}h to do'
          : 'Need ${fromStart.toStringAsFixed(1)} h/day from ${startLabel(course.startDate)} · not in Today’s pace';
      paceColor = scheme.onSurfaceVariant;
      paceIcon = Icons.schedule_outlined;
    } else if (p.requiredDailyHours != null) {
      final daily = p.requiredDailyHours!;
      final weekly = p.requiredWeeklyHours;
      paceText =
          'Need ${daily.toStringAsFixed(1)} h/day${weekly == null ? '' : ' · ${weekly.toStringAsFixed(1)} h/week'} to finish';
      if (daily > 6) {
        paceColor = scheme.error;
        paceIcon = Icons.warning_amber_outlined;
        paceText += ' · unrealistic';
      } else if (daily > 4) {
        paceColor = scheme.error.withValues(alpha: 0.9);
        paceIcon = Icons.speed_outlined;
      } else {
        paceColor = scheme.primary;
        paceIcon = Icons.bolt_outlined;
      }
    } else if (p.remainingHours > 0 && p.remainingDays == 0) {
      paceText = 'Due today — ${p.remainingHours.toStringAsFixed(1)}h left';
      paceColor = scheme.error;
      paceIcon = Icons.error_outline;
    } else if (course.deadline == null) {
      paceText =
          'No deadline — ${p.remainingHours.toStringAsFixed(1)}h left · no daily pressure';
      paceIcon = Icons.all_inclusive;
    }

    // Behind / on-track explainer.
    String? explainerText;
    if (scheduled) {
      explainerText =
          'Starts in $daysToStart d · counted from ${startLabel(course.startDate)}${course.startEarly ? ' · early start on' : ''}';
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
      explainerText = need == null
          ? 'Behind: no finite pace hits a today deadline with hours left'
          : 'Behind = doing ${achieved.toStringAsFixed(1)}/d, need ${need.toStringAsFixed(1)}/d';
      if (course.startEarly && isFutureStart(course.startDate, now)) {
        explainerText += ' · early start';
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
        explainerText = 'On track: no pace yet — log first session to confirm';
      }
    }

    final pillLabel = scheduled
        ? (daysToStart <= 0
            ? 'Starts soon'
            : 'Starts in ${daysToStart}d')
        : courseStatusLabel(p.status);
    final pillStatus =
        scheduled ? CourseStatus.onTrack : p.status;
    return Card(
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
                  '${p.completedHours.toStringAsFixed(1)} / ${p.requiredHours.toStringAsFixed(1)} h',
                  key: Key('dashboardHours_${course.id}'),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(width: AppSizes.dashboardIconGap),
                Expanded(
                  child: Text(
                    '· ${(p.progressFraction * 100).toStringAsFixed(0)}% · ${p.remainingHours.toStringAsFixed(0)}h left',
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
                    _deadlineLabel(p, course.deadline),
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
                  Text('No courses yet',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          )),
                  const SizedBox(height: AppSizes.emptySmallGap),
                  Text(
                    'Tap “New course” to create your first course.',
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

    return Column(
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
              ),
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
              ),
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
                  '${visible.length} shown',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                ),
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
                      'No courses match this filter',
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
                return Card(
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
                                '${course.ectsCredits} ECTS',
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
                                '${p.completedHours.toStringAsFixed(1)} / ${p.requiredHours.toStringAsFixed(1)} h'
                                ' • ${courseStatusLabel(p.status)}',
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
                                    '${p.requiredDailyHours!.toStringAsFixed(1)} h/day'
                                    '${p.requiredWeeklyHours == null ? '' : ' • ${p.requiredWeeklyHours!.toStringAsFixed(1)} h/week'} needed',
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
                            tooltip: 'Remove sample course',
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
                            itemBuilder: (context) => const [
                              PopupMenuItem(
                                  value: 'edit', child: Text('Edit')),
                              PopupMenuItem(
                                  value: 'delete', child: Text('Delete')),
                            ],
                          ),
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
    final settings = ref.watch(settingsProvider).valueOrNull;
    final effectiveNow = now ?? DateTime.now();
    final firstWeekday = settings?.firstWeekday ?? DateTime.monday;

    return sessionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
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
                    'No study sessions yet',
                    key: const Key('studyLogEmpty'),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: AppSizes.emptySmallGap),
                  Text(
                    'Log a session to track your study time.',
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

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.pageHPad,
                AppSizes.pageTopPad,
                AppSizes.pageHPad,
                AppSizes.sectionInnerGap,
              ),
              child: Card(
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
                          label: 'Today',
                          value:
                              '${totals.dailyHours.toStringAsFixed(1)} h',
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
                          label: 'This week',
                          value:
                              '${totals.weeklyHours.toStringAsFixed(1)} h',
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
                  return Card(
                    margin: const EdgeInsets.only(bottom: AppSizes.cardGap),
                    child: ListTile(
                      key: Key('sessionTile_${session.id}'),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.studyRowHPad,
                        vertical: AppSizes.coursePadV,
                      ),
                      leading: CourseAvatar(
                        name: course?.name ?? 'C${session.courseId}',
                        colorValue: course?.colorValue,
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              course?.name ?? 'Course ${session.courseId}',
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
                              '${hours.toStringAsFixed(1)} h',
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
                            const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Chip(
                                key: Key('sampleSessionMarker'),
                                label: Text('Sample'),
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
                              itemBuilder: (context) => const [
                                PopupMenuItem(
                                    value: 'edit', child: Text('Edit')),
                                PopupMenuItem(
                                    value: 'delete', child: Text('Delete')),
                              ],
                            ),
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
