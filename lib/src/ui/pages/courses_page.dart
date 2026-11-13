part of '../home_shell.dart';

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
    final glass = ref.read(glassEnabledProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        final title = Text(l10n.coursesDeleteTitle);
        final content = Text(
          l10n.coursesDeleteBody(course.name),
        );
        final actions = [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmDeleteCourse'),
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
      return EmptyStateCard(
        icon: Icons.menu_book_outlined,
        title: l10n.coursesEmptyTitle,
        hint: l10n.coursesEmptyHint,
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
    // ECTS-074 Apple polish (glass-only): airier gaps + frosted Apple
    // menus (rounded, near-opaque, checkmark selection). Legacy stays
    // byte-identical.
    final glass = ref.watch(glassEnabledProvider);
    Widget chip(Widget child, double radius) =>
        glass ? GlassCard(cornerRadius: radius, child: child) : child;
    final filterGap =
        glass ? AppSizes.glassSectionInnerGap : AppSizes.sectionInnerGap;
    final listTopPad =
        glass ? AppSizes.glassSectionInnerGap : AppSizes.sectionInnerGap;
    final pageTopPad =
        glass ? AppSizes.glassPageTopPad : AppSizes.pageTopPad;
    final cardGap =
        glass ? AppSizes.glassCardGap : AppSizes.cardGap;
    // Glass flow-through: outer bottom inset is gone (see home_shell), so
    // the scrollable carries the tab-bar + FAB clearance itself.
    final bottomPad = glass
        ? AppSizes.glassPageBottomInset + AppSizes.pageBottomPad
        : AppSizes.pageBottomPad;
    // Apple-style menu surface (glass-only): null keeps legacy defaults.
    final menuColor = glass ? glassMenuColor(context) : null;
    final menuRadius = glass
        ? BorderRadius.circular(AppSizes.glassMenuRadius)
        : null;
    final menuElevationInt =
        glass ? AppSizes.glassMenuElevation.toInt() : null;
    final menuElevationDouble =
        glass ? AppSizes.glassMenuElevation : null;

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
          child: Wrap(
            spacing: filterGap,
            runSpacing: filterGap,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              chip(
                FilterDropdownShell(
                  icon: Icons.sort,
                  transparent: glass,
                  child: GlassInkClear(
                    enabled: glass,
                    child: DropdownButton<CourseSort>(
                    key: const Key('courseSortDropdown'),
                    value: _sort,
                    underline: const SizedBox.shrink(),
                    focusColor: Colors.transparent,
                    // Dense closed face (ECTS-077): the default 48px
                    // itemHeight makes the chip ~2x taller than the
                    // count pill, so the row reads off-center.
                    isDense: true,
                    icon: const Icon(
                      Icons.expand_more,
                      size: AppSizes.filterIcon,
                    ),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                    dropdownColor: menuColor,
                    borderRadius: menuRadius,
                    elevation: menuElevationInt ?? 8,
                    menuMaxHeight: glass
                        ? AppSizes.glassMenuMaxHeight
                        : null,
                    onChanged: (v) =>
                        setState(() => _sort = v ?? CourseSort.name),
                    // Closed-face stays plain text (ECTS-074d): without
                    // this the button renders the selected item's
                    // GlassMenuRow, leaking menu padding/weight into the
                    // chip as a second pill.
                    selectedItemBuilder: glass
                        ? (context) => [
                              for (final s in CourseSort.values)
                                Text(l10n.coursesSortOption(
                                    courseSortLabelL10n(s, l10n))),
                            ]
                        : null,
                    items: [
                      for (final s in CourseSort.values)
                        DropdownMenuItem(
                          value: s,
                          key: Key('courseSort_${s.name}'),
                          child: glass
                              ? GlassMenuRow(
                                  selected: _sort == s,
                                  child: Text(l10n.coursesSortOption(
                                      courseSortLabelL10n(s, l10n))),
                                )
                              : Text(l10n.coursesSortOption(
                                  courseSortLabelL10n(s, l10n))),
                        ),
                    ],
                    ),
                  ),
                ),
                AppSizes.filterRadius,
              ),
              chip(
                FilterDropdownShell(
                  icon: Icons.filter_list_outlined,
                  transparent: glass,
                  child: GlassInkClear(
                    enabled: glass,
                    child: DropdownButton<CourseStatus?>(
                    key: const Key('courseStatusFilterDropdown'),
                    value: _statusFilter,
                    underline: const SizedBox.shrink(),
                    focusColor: Colors.transparent,
                    // Dense closed face (ECTS-077): see sort dropdown.
                    isDense: true,
                    icon: const Icon(
                      Icons.expand_more,
                      size: AppSizes.filterIcon,
                    ),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                    dropdownColor: menuColor,
                    borderRadius: menuRadius,
                    elevation: menuElevationInt ?? 8,
                    menuMaxHeight: glass
                        ? AppSizes.glassMenuMaxHeight
                        : null,
                    onChanged: (v) => setState(() => _statusFilter = v),
                    // Closed-face stays plain text (ECTS-074d): see sort
                    // dropdown above — no menu row leaks into the chip.
                    selectedItemBuilder: glass
                        ? (context) => [
                              Text(l10n.coursesFilterAll),
                              for (final s in CourseStatus.values)
                                Text(courseStatusLabelL10n(s, l10n)),
                            ]
                        : null,
                    items: [
                      DropdownMenuItem<CourseStatus?>(
                        value: null,
                        key: const Key('courseFilter_all'),
                        child: glass
                            ? GlassMenuRow(
                                selected: _statusFilter == null,
                                child: Text(l10n.coursesFilterAll),
                              )
                            : Text(l10n.coursesFilterAll),
                      ),
                      for (final s in CourseStatus.values)
                        DropdownMenuItem<CourseStatus?>(
                          value: s,
                          key: Key('courseFilter_${s.name}'),
                          child: glass
                              ? GlassMenuRow(
                                  selected: _statusFilter == s,
                                  child: Text(
                                      courseStatusLabelL10n(s, l10n)),
                                )
                              : Text(courseStatusLabelL10n(s, l10n)),
                        ),
                    ],
                    ),
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
                    SizedBox(height: filterGap),
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
              padding: EdgeInsets.fromLTRB(
                AppSizes.pageHPad,
                listTopPad,
                AppSizes.pageHPad,
                bottomPad,
              ),
              itemCount: visible.length,
              itemBuilder: (context, i) {
                final item = visible[i];
                final course = item.course;
                final p = item.progress;
                final scheme = Theme.of(context).colorScheme;
                final (_, statusFg) = statusColors(context, p.status);
                final paceUrgent = (p.requiredDailyHours ?? 0) >
                    courseTileUrgentDailyHours;
                return GlassCard(
                  margin:
                      EdgeInsets.only(bottom: cardGap),
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
                                        ? (isSubHourPace(
                                                p.requiredDailyHours!)
                                            ? l10n.coursesPaceNeededMinutes(
                                                formatPaceValue(p
                                                    .requiredDailyHours!))
                                            : l10n.coursesPaceNeeded(
                                                formatPaceValue(p
                                                    .requiredDailyHours!)))
                                        : isSubHourPace(
                                                p.requiredDailyHours!)
                                            ? (isSubHourPace(
                                                    p.requiredWeeklyHours!)
                                                ? l10n.coursesPaceNeededWeeklyMinutes(
                                                    formatPaceValue(p
                                                        .requiredDailyHours!),
                                                    formatPaceValue(p
                                                        .requiredWeeklyHours!))
                                                : l10n.coursesPaceNeededWeeklyMinutesHours(
                                                    formatPaceValue(p
                                                        .requiredDailyHours!),
                                                    formatPaceValue(p
                                                        .requiredWeeklyHours!)))
                                            : l10n.coursesPaceNeededWeekly(
                                                formatPaceValue(p
                                                    .requiredDailyHours!),
                                                formatPaceValue(p
                                                    .requiredWeeklyHours!)),
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
                            shape: glass
                                ? glassMenuShape()
                                : RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppSizes.listTileRadius),
                                  ),
                            color: menuColor,
                            elevation: menuElevationDouble,
                            onSelected: (value) async {
                              if (value == 'edit') {
                                showCourseFormDialog(context, existing: course);
                              } else if (value == 'delete') {
                                _confirmDelete(course);
                              } else if (value == 'timer') {
                                final active =
                                    ref.read(studyTimerProvider);
                                if (active != null) {
                                  showStudyTimerActiveSheet(context);
                                } else {
                                  await ref
                                      .read(studyTimerProvider.notifier)
                                      .startReplacing(course.id);
                                  if (context.mounted) {
                                    showStudyTimerActiveSheet(context);
                                  }
                                }
                              }
                            },
                            itemBuilder: (context) {
                              final menuL10n =
                                  AppLocalizations.of(context)!;
                              if (!glass) {
                                return [
                                  PopupMenuItem(
                                      value: 'timer',
                                      child:
                                          Text(menuL10n.studyTimerStart)),
                                  PopupMenuItem(
                                      value: 'edit',
                                      child: Text(menuL10n.commonEdit)),
                                  PopupMenuItem(
                                      value: 'delete',
                                      child: Text(menuL10n.commonDelete)),
                                ];
                              }
                              // Apple-style glass menu (ECTS-074): rounded
                              // frosted surface, icon rows, red delete.
                              return [
                                PopupMenuItem(
                                  value: 'timer',
                                  child: GlassMenuRow(
                                    selected: false,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.play_arrow_outlined,
                                            size: 18),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Text(
                                              menuL10n.studyTimerStart),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
  }
}
