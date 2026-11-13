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

/// Opens the start-timer sheet. Returns true when a timer was started.
Future<bool> showStudyTimerStartSheet(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => const StudyTimerStartDialog(),
  );
  return result ?? false;
}

/// Opens the active-timer sheet (pause/resume/finish/discard).
Future<void> showStudyTimerActiveSheet(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const StudyTimerActiveDialog(),
  );
}

class StudyTimerStartDialog extends ConsumerStatefulWidget {
  const StudyTimerStartDialog({super.key});

  @override
  ConsumerState<StudyTimerStartDialog> createState() =>
      _StudyTimerStartDialogState();
}

class _StudyTimerStartDialogState
    extends ConsumerState<StudyTimerStartDialog> {
  int? _courseId;
  final _notesController = TextEditingController();
  String? _error;
  bool _starting = false;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  int? _resolvedCourseId(List<Course> courses) {
    if (_courseId != null) {
      return courses.any((c) => c.id == _courseId) ? _courseId : null;
    }
    return courses.length == 1 ? courses.first.id : null;
  }

  Future<void> _start() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _error = null);
    List<Course> courses = const [];
    try {
      courses = await ref.read(coursesProvider.future);
    } catch (_) {
      // Fails closed below.
    }
    final courseId = _resolvedCourseId(courses);
    if (courseId == null) {
      setState(() => _error = l10n.studyTimerNoCourseError);
      return;
    }
    setState(() => _starting = true);
    final notes = _notesController.text.trim();
    final result = await ref
        .read(studyTimerProvider.notifier)
        .start(courseId, notes: notes.isEmpty ? null : notes);
    if (!mounted) return;
    setState(() => _starting = false);
    switch (result) {
      case Ok<void>():
        Navigator.of(context).pop(true);
      case Err<void>(:final message):
        setState(() => _error = message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final coursesAsync = ref.watch(coursesProvider);
    final courses = coursesAsync.valueOrNull ?? const [];
    final glass = ref.watch(glassEnabledProvider);
    final courseId = _resolvedCourseId(courses);

    final title = Text(l10n.studyTimerStartTitle);
    final content = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (coursesAsync.isLoading)
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: LinearProgressIndicator(),
            ),
          DropdownButtonFormField<int>(
            key: const Key('studyTimerCourseDropdown'),
            initialValue: courseId,
            isExpanded: glass,
            decoration:
                InputDecoration(labelText: l10n.studyTimerCourseLabel),
            dropdownColor: glass ? glassMenuColor(context) : null,
            borderRadius: glass
                ? BorderRadius.circular(AppSizes.glassMenuRadius)
                : null,
            items: [
              for (final c in courses)
                DropdownMenuItem<int>(
                  value: c.id,
                  child: glass
                      ? GlassMenuRow(
                          selected: courseId == c.id,
                          child: Text(c.name),
                        )
                      : Text(c.name),
                ),
            ],
            onChanged: courses.isEmpty
                ? null
                : (v) => setState(() => _courseId = v),
            validator: (v) =>
                v == null ? l10n.studyTimerNoCourseError : null,
          ),
          if (courses.isEmpty && !coursesAsync.isLoading)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                l10n.studyTimerNoCoursesHint,
                key: const Key('studyTimerNoCoursesHint'),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          const SizedBox(height: 12),
          TextFormField(
            key: const Key('studyTimerNotesField'),
            controller: _notesController,
            decoration: InputDecoration(
              labelText: l10n.sessionFormNotesLabel,
            ),
            maxLines: 2,
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(
              _error!,
              key: const Key('studyTimerFormError'),
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ],
      ),
    );
    final actions = [
      TextButton(
        onPressed:
            _starting ? null : () => Navigator.of(context).pop(false),
        child: Text(l10n.commonCancel),
      ),
      FilledButton(
        key: const Key('startTimerButton'),
        onPressed: _starting ? null : _start,
        child: Text(l10n.studyTimerStart),
      ),
    ];
    if (!glass) {
      return AlertDialog(title: title, content: content, actions: actions);
    }
    return glassAlert(context,
        title: title, content: content, actions: actions);
  }
}

class StudyTimerActiveDialog extends ConsumerStatefulWidget {
  const StudyTimerActiveDialog({super.key});

  @override
  ConsumerState<StudyTimerActiveDialog> createState() =>
      _StudyTimerActiveDialogState();
}

class _StudyTimerActiveDialogState
    extends ConsumerState<StudyTimerActiveDialog> {
  Timer? _ticker;
  late final TextEditingController _notesController;
  String? _error;
  bool _busy = false;
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
    setState(() {
      _busy = true;
      _error = null;
    });
    await ref.read(studyTimerProvider.notifier).discard();
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> _finish() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    final result =
        await ref.read(studyTimerProvider.notifier).finishAndLog();
    if (!mounted) return;
    setState(() => _busy = false);
    switch (result) {
      case Ok<int>():
        Navigator.of(context).pop();
      case Err<int>(:final message):
        setState(() => _error = message);
    }
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
    final courseName = course?.name ?? l10n.studyLogUnknownCourse(
      '${timer.courseId}',
    );
    final elapsed = timer.elapsedSec(DateTime.now());
    final minutes = studyTimerLogMinutes(elapsed);

    final title = Text(l10n.studyTimerActiveTitle(courseName));
    final content = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          const SizedBox(height: 4),
          Center(
            child: Text(
              timer.isRunning ? l10n.studyTimerPause : l10n.studyTimerResume,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            key: const Key('studyTimerActiveNotesField'),
            controller: _notesController,
            decoration: InputDecoration(
              labelText: l10n.sessionFormNotesLabel,
            ),
            maxLines: 2,
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(
              _error!,
              key: const Key('studyTimerActiveError'),
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ],
      ),
    );
    final actions = [
      TextButton(
        key: const Key('discardTimerButton'),
        onPressed: _busy ? null : _confirmDiscard,
        child: Text(l10n.studyTimerDiscard),
      ),
      FilledButton.tonal(
        key: const Key('pauseResumeTimerButton'),
        onPressed: _busy
            ? null
            : () => timer.isRunning
                ? ref.read(studyTimerProvider.notifier).pause()
                : ref.read(studyTimerProvider.notifier).resume(),
        child: Text(
          timer.isRunning ? l10n.studyTimerPause : l10n.studyTimerResume,
        ),
      ),
      FilledButton(
        key: const Key('finishTimerButton'),
        onPressed: _busy || minutes <= 0 ? null : _finish,
        child: Text(l10n.studyTimerFinishLog('$minutes')),
      ),
    ];
    if (!glass) {
      return AlertDialog(title: title, content: content, actions: actions);
    }
    return glassAlert(context,
        title: title, content: content, actions: actions);
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
    final courseName = course?.name ??
        l10n.studyLogUnknownCourse('${timer.courseId}');
    final elapsed = timer.elapsedSec(DateTime.now());
    final scheme = Theme.of(context).colorScheme;

    return Padding(
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
                        style:
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: scheme.onSecondaryContainer,
                                  fontWeight: FontWeight.w800,
                                ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        formatTimerHms(elapsed),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              color: scheme.onSecondaryContainer,
                              fontFeatures: const [
                                FontFeature.tabularFigures()
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
    );
  }
}
