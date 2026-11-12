part of '../home_shell.dart';

class _StudyLogPage extends ConsumerWidget {
  const _StudyLogPage({this.now});

  final DateTime? now;

  Future<void> _confirmDeleteSession(
    BuildContext context,
    WidgetRef ref,
    StudySession session,
  ) async {
    final glass = ref.read(glassEnabledProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        final title = Text(l10n.studyLogDeleteTitle);
        final content = Text(
          l10n.studyLogDeleteBody,
        );
        final actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmDeleteSession'),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.commonDelete),
          ),
        ];
        // Glass dialogs (ECTS-064): same title/content/actions/Keys.
        if (!glass) {
          return AlertDialog(title: title, content: content, actions: actions);
        }
        return glassAlert(context,
            title: title, content: content, actions: actions);
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
          // Same empty-state card as Courses (ECTS-066): solid Card +
          // icon box + title/hint; only icon/strings/keys differ.
          return EmptyStateCard(
            icon: Icons.timer_outlined,
            title: l10n.studyLogEmptyTitle,
            titleKey: const Key('studyLogEmpty'),
            hint: l10n.studyLogEmptyHint,
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
        // ECTS-074 Apple polish (glass-only): airier gaps + Apple menus.
        final glass = ref.watch(glassEnabledProvider);
        final filterGap =
            glass ? AppSizes.glassSectionInnerGap : AppSizes.sectionInnerGap;
        final pageTopPad =
            glass ? AppSizes.glassPageTopPad : AppSizes.pageTopPad;
        final cardGap =
            glass ? AppSizes.glassCardGap : AppSizes.cardGap;
        final menuColor = glass ? glassMenuColor(context) : null;
        final menuShape = glass
            ? glassMenuShape()
            : RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(AppSizes.listTileRadius),
              );
        final menuElevation =
            glass ? AppSizes.glassMenuElevation : null;
        // Glass flow-through: outer bottom inset is gone (see home_shell),
        // so the scrollable carries the tab-bar + FAB clearance itself.
        final bottomPad = glass
            ? AppSizes.glassPageBottomInset + AppSizes.pageBottomPad
            : AppSizes.pageBottomPad;
        return GlassBatch(
          child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSizes.pageHPad,
                pageTopPad,
                AppSizes.pageHPad,
                filterGap,
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
                padding: EdgeInsets.fromLTRB(
                  AppSizes.pageHPad,
                  filterGap,
                  AppSizes.pageHPad,
                  bottomPad,
                ),
                itemCount: sorted.length,
                itemBuilder: (context, i) {
                  final session = sorted[i];
                  final course = courseMap[session.courseId];
                  final hours = session.minutes / 60.0;
                  final dateLabel = formatYmd(session.date);
                  final subtitleParts = <String>[
                    dateLabel,
                  ];
                  if (session.notes != null && session.notes!.trim().isNotEmpty) {
                    subtitleParts.add(session.notes!.trim());
                  }
                  final scheme = Theme.of(context).colorScheme;
                  return GlassCard(
                    margin: EdgeInsets.only(bottom: cardGap),
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
                              shape: menuShape,
                              color: menuColor,
                              elevation: menuElevation,
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
                                if (!glass) {
                                  return [
                                    PopupMenuItem(
                                        value: 'edit',
                                        child: Text(menuL10n.commonEdit)),
                                    PopupMenuItem(
                                        value: 'delete',
                                        child: Text(menuL10n.commonDelete)),
                                  ];
                                }
                                return [
                                  PopupMenuItem(
                                    value: 'edit',
                                    child: GlassMenuRow(
                                      selected: false,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.edit_outlined,
                                              size: 18),
                                          const SizedBox(width: 10),
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                                menuL10n.commonEdit),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'delete',
                                    child: GlassMenuRow(
                                      selected: false,
                                      destructive: true,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.delete_outline,
                                              size: 18),
                                          const SizedBox(width: 10),
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                                menuL10n.commonDelete),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
