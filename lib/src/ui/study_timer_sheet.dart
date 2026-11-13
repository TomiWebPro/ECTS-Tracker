import 'dart:async';

import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../logic/study_timer.dart';
import '../models/models.dart';
import '../state/providers.dart';
import '../state/study_timer_provider.dart';
import 'app_sizes.dart';
import 'glass.dart';

class StudyTimerActiveDialog extends ConsumerStatefulWidget {
  const StudyTimerActiveDialog({super.key});

  @override
  ConsumerState<StudyTimerActiveDialog> createState() =>
      _StudyTimerActiveDialogState();
}

/// Opens the active-timer sheet (pause/resume/finish/discard).
Future<void> showStudyTimerActiveSheet(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const StudyTimerActiveDialog(),
  );
}

/// Shared running-timer controls (M11, ECTS-092): live elapsed + pause /
/// resume + finish + discard. Embedded both in the active-timer sheet and in
/// the log-session dialog's timer tab. The host owns display ticking and pops
/// itself via [onFinished]/[onDiscarded].
class StudyTimerActiveControls extends ConsumerStatefulWidget {
  const StudyTimerActiveControls({
    super.key,
    this.notesController,
    this.showCourseName = false,
    this.onFinished,
    this.onDiscarded,
  });

  /// Optional notes field (the sheet edits notes live; the log dialog shares
  /// its own notes controller). Null hides the field.
  final TextEditingController? notesController;

  /// Show the course name above the readout (the sheet already has it in
  /// the title; the embedded tab does not).
  final bool showCourseName;

  /// Called after a successful finish-and-log (host pops itself).
  final VoidCallback? onFinished;

  /// Called after a confirmed discard (the log tab stays open on idle;
  /// the sheet pops itself).
  final VoidCallback? onDiscarded;

  @override
  ConsumerState<StudyTimerActiveControls> createState() =>
      _StudyTimerActiveControlsState();
}

class _StudyTimerActiveControlsState
    extends ConsumerState<StudyTimerActiveControls> {
  String? _error;
  bool _busy = false;

  Future<void> _toggle(StudyTimerState timer) async {
    final notifier = ref.read(studyTimerProvider.notifier);
    final result = timer.isRunning
        ? await notifier.pause()
        : await notifier.resume();
    if (!mounted) return;
    if (result case Err<void>(:final message)) {
      setState(() => _error = message);
    }
  }

  Future<void> _finish() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    final result = await ref.read(studyTimerProvider.notifier).finishAndLog();
    if (!mounted) return;
    setState(() => _busy = false);
    switch (result) {
      case Ok<int>():
        widget.onFinished?.call();
      case Err<int>(:final message):
        setState(() => _error = message);
    }
  }

  Future<void> _confirmDiscard() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.studyTimerDiscardTitle),
        content: Text(l10n.studyTimerDiscardBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            key: const Key('confirmDiscardTimer'),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.studyTimerDiscard),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    await ref.read(studyTimerProvider.notifier).discard();
    widget.onDiscarded?.call();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final timer = ref.watch(studyTimerProvider);
    if (timer == null) return const SizedBox.shrink();
    final courses = ref.watch(coursesProvider).valueOrNull ?? const [];
    final course = _findCourse(courses, timer.courseId);
    final courseName =
        course?.name ?? l10n.studyLogUnknownCourse('${timer.courseId}');
    final elapsed = timer.elapsedSec(DateTime.now());
    final minutes = studyTimerLogMinutes(elapsed);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showCourseName)
          Text(
            courseName,
            style: Theme.of(context).textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
        if (widget.showCourseName) const SizedBox(height: 4),
        Center(
          child: Text(
            formatTimerHms(elapsed),
            key: const Key('studyTimerElapsed'),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ),
        if (widget.notesController != null) ...[
          const SizedBox(height: 12),
          TextFormField(
            key: const Key('studyTimerActiveNotesField'),
            controller: widget.notesController,
            decoration: InputDecoration(labelText: l10n.sessionFormNotesLabel),
            maxLines: 2,
          ),
        ],
        if (_error != null) ...[
          const SizedBox(height: 8),
          Text(
            _error!,
            key: const Key('studyTimerActiveError'),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: FilledButton.tonal(
                key: const Key('pauseResumeTimerButton'),
                onPressed: _busy ? null : () => _toggle(timer),
                child: Text(
                  timer.isRunning
                      ? l10n.studyTimerPause
                      : l10n.studyTimerResume,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                key: const Key('discardTimerButton'),
                onPressed: _busy ? null : _confirmDiscard,
                child: Text(l10n.studyTimerDiscard),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            key: const Key('finishTimerButton'),
            onPressed: _busy || minutes <= 0 ? null : _finish,
            child: Text(l10n.studyTimerFinishLog('$minutes')),
          ),
        ),
      ],
    );
  }
}

class _StudyTimerActiveDialogState
    extends ConsumerState<StudyTimerActiveDialog> {
  Timer? _ticker;
  late final TextEditingController _notesController;
  bool _notesInit = false;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController();
    _ticker = Timer.periodic(
      const Duration(seconds: 1),
      (_) => mounted ? setState(() {}) : null,
    );
    // Persist notes edits live; fire-and-forget (best-effort).
    _notesController.addListener(() {
      final timer = ref.read(studyTimerProvider);
      if (timer == null) return;
      final text = _notesController.text.trim();
      final current = timer.notes ?? '';
      if (text != current) {
        unawaited(
          ref
              .read(studyTimerProvider.notifier)
              .updateNotes(text.isEmpty ? null : text),
        );
      }
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final timer = ref.watch(studyTimerProvider);
    final glass = ref.watch(glassEnabledProvider);
    if (timer == null) {
      return AlertDialog(
        title: Text(l10n.studyTimerStartTitle),
        content: Text(l10n.studyTimerTooShort),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.commonClose),
          ),
        ],
      );
    }
    if (!_notesInit) {
      _notesController.text = timer.notes ?? '';
      _notesInit = true;
    }
    final courses = ref.watch(coursesProvider).valueOrNull ?? const [];
    final course = _findCourse(courses, timer.courseId);
    final courseName =
        course?.name ?? l10n.studyLogUnknownCourse('${timer.courseId}');

    final title = Text(l10n.studyTimerActiveTitle(courseName));
    final content = SingleChildScrollView(
      child: StudyTimerActiveControls(
        notesController: _notesController,
        onFinished: () => Navigator.of(context).pop(),
        onDiscarded: () => Navigator.of(context).pop(),
      ),
    );
    final actions = [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(l10n.commonClose),
      ),
    ];
    if (!glass) {
      return AlertDialog(title: title, content: content, actions: actions);
    }
    return glassAlert(
      context,
      title: title,
      content: content,
      actions: actions,
    );
  }
}

Course? _findCourse(List<Course> courses, int id) {
  for (final c in courses) {
    if (c.id == id) return c;
  }
  return null;
}

/// Persistent banner shown on every tab while a timer is active.
///
/// Ticks once per second for display only; the source of truth stays the
/// persisted wall-clock state, so kills/restarts resume seamlessly.
class StudyTimerBanner extends ConsumerStatefulWidget {
  const StudyTimerBanner({super.key});

  @override
  ConsumerState<StudyTimerBanner> createState() => _StudyTimerBannerState();
}

class _StudyTimerBannerState extends ConsumerState<StudyTimerBanner> {
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(
      const Duration(seconds: 1),
      (_) => mounted ? setState(() {}) : null,
    );
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(studyTimerProvider);
    if (timer == null) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context)!;
    final courses = ref.watch(coursesProvider).valueOrNull ?? const [];
    final course = _findCourse(courses, timer.courseId);
    final courseName =
        course?.name ?? l10n.studyLogUnknownCourse('${timer.courseId}');
    final elapsed = timer.elapsedSec(DateTime.now());
    final scheme = Theme.of(context).colorScheme;

    // Same width cap + centering as the page body (home_shell): on wide
    // windows a full-bleed banner would stick out past every card.
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
        child: Padding(
          key: const Key('studyTimerBanner'),
          padding: const EdgeInsets.fromLTRB(
            AppSizes.pageHPad,
            0,
            AppSizes.pageHPad,
            AppSizes.sectionInnerGap,
          ),
          child: Material(
            color: scheme.secondaryContainer,
            borderRadius: BorderRadius.circular(AppSizes.cardRadius),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSizes.cardRadius),
              onTap: () => showStudyTimerActiveSheet(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.coursePadH,
                  vertical: AppSizes.coursePadV,
                ),
                child: Row(
                  children: [
                    Icon(
                      timer.isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                      color: scheme.onSecondaryContainer,
                    ),
                    const SizedBox(width: AppSizes.headerGap),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.studyTimerActiveTitle(courseName),
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  color: scheme.onSecondaryContainer,
                                  fontWeight: FontWeight.w800,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            formatTimerHms(elapsed),
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: scheme.onSecondaryContainer,
                                  fontFeatures: const [
                                    FontFeature.tabularFigures(),
                                  ],
                                ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      key: const Key('studyTimerBannerToggle'),
                      tooltip: timer.isRunning
                          ? l10n.studyTimerPause
                          : l10n.studyTimerResume,
                      color: scheme.onSecondaryContainer,
                      onPressed: () => timer.isRunning
                          ? ref.read(studyTimerProvider.notifier).pause()
                          : ref.read(studyTimerProvider.notifier).resume(),
                      icon: Icon(
                        timer.isRunning ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
