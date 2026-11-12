part of '../home_shell.dart';

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
                                  : isSubHourPace(
                                          e.progress.requiredDailyHours!)
                                      ? l10n.dashboardMinutesPerDay(
                                          formatPaceValue(e.progress
                                              .requiredDailyHours!))
                                      : l10n.dashboardHoursPerDay(
                                          formatPaceValue(e.progress
                                              .requiredDailyHours!)),
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

class _DashboardCourseCard extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
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
          : isSubHourPace(fromStart)
              ? l10n.dashboardPaceNeedFromMinutes(
                  formatPaceValue(fromStart), startLabel(course.startDate))
              : l10n.dashboardPaceNeedFrom(formatPaceValue(fromStart),
                  startLabel(course.startDate));
      paceColor = scheme.onSurfaceVariant;
      paceIcon = Icons.schedule_outlined;
    } else if (p.requiredDailyHours != null) {
      final daily = p.requiredDailyHours!;
      final weekly = p.requiredWeeklyHours;
      if (weekly == null) {
        paceText = isSubHourPace(daily)
            ? l10n.dashboardPaceNeedDailyMinutes(formatPaceValue(daily))
            : l10n.dashboardPaceNeedDaily(formatPaceValue(daily));
      } else if (isSubHourPace(daily)) {
        paceText = isSubHourPace(weekly)
            ? l10n.dashboardPaceNeedDailyWeeklyMinutes(
                formatPaceValue(daily), formatPaceValue(weekly))
            : l10n.dashboardPaceNeedDailyWeeklyMinutesHours(
                formatPaceValue(daily), formatPaceValue(weekly));
      } else {
        paceText = l10n.dashboardPaceNeedDailyWeekly(
            formatPaceValue(daily), formatPaceValue(weekly));
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
    // ECTS-074 Apple polish (glass-only): airier card rhythm.
    final glass = ref.watch(glassEnabledProvider);
    final cardGap =
        glass ? AppSizes.glassCardGap : AppSizes.cardGap;
    return GlassCard(
      margin: EdgeInsets.only(bottom: cardGap),
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
