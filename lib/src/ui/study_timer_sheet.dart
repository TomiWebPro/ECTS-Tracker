import 'dart:async';

import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../i18n/app_locales.dart';
import '../logic/study_timer.dart';
import '../models/models.dart';
import '../state/providers.dart';
import '../state/study_timer_provider.dart';
import 'app_sizes.dart';
import 'err_text.dart';
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
    this.elapsedStyle,
    this.fullscreenLayout = false,
    this.onFinished,
    this.onDiscarded,
  });

  /// Optional notes field (the sheet edits notes live; the log dialog shares
  /// its own notes controller). Null hides the field.
  final TextEditingController? notesController;

  /// Show the course name above the readout (the sheet already has it in
  /// the title; the embedded tab does not).
  final bool showCourseName;

  /// Big-clock override for the fullscreen focus view (null keeps the
  /// compact dialog style).
  final TextStyle? elapsedStyle;

  /// Fullscreen focus layout (ECTS-099): clock vertically centered, fat
  /// actions pinned to the bottom. Same widgets/keys as the sheet.
  final bool fullscreenLayout;

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
    final l10n = l10nOf(context);
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
    final l10n = l10nOf(context);
    // Hoisted so the null-guard below promotes (fields never promote).
    final errorText = _error;
    final timer = ref.watch(studyTimerProvider);
    if (timer == null) return const SizedBox.shrink();
    final courses = ref.watch(coursesProvider).valueOrNull ?? const [];
    final course = _findCourse(courses, timer.courseId);
    final courseName =
        course?.name ?? l10n.studyLogUnknownCourse('${timer.courseId}');
    final elapsed = timer.elapsedSec(DateTime.now());
    final minutes = studyTimerLogMinutes(elapsed);
    if (widget.fullscreenLayout) {
      return _fullscreenBody(
        context,
        l10n,
        timer,
        courseName,
        elapsed,
        minutes,
        errorText,
      );
    }
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
        Center(child: _clockText(context, elapsed)),
        if (widget.notesController != null) ...[
          const SizedBox(height: 12),
          _notesField(l10n),
        ],
        if (errorText != null) ...[
          const SizedBox(height: 8),
          _errorLine(context, l10n, errorText),
        ],
        const SizedBox(height: 12),
        _actionRow(l10n, timer),
        const SizedBox(height: 8),
        _finishButton(l10n, minutes),
      ],
    );
  }

  /// Fullscreen focus layout: clock vertically centered, fat actions
  /// pinned to the bottom. Same widgets/keys as the compact sheet.
  Widget _fullscreenBody(
    BuildContext context,
    AppLocalizations l10n,
    StudyTimerState timer,
    String courseName,
    int elapsed,
    int minutes,
    String? errorText,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.showCourseName)
                    Text(
                      courseName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  if (widget.showCourseName)
                    const SizedBox(height: AppSizes.dashboardSmallGap),
                  Center(child: _clockText(context, elapsed)),
                  if (widget.notesController != null) ...[
                    const SizedBox(height: AppSizes.sectionGap),
                    _notesField(l10n),
                  ],
                  if (errorText != null) ...[
                    const SizedBox(height: AppSizes.sectionInnerGap),
                    _errorLine(context, l10n, errorText),
                  ],
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.timerFullscreenGap),
        _actionRow(l10n, timer),
        const SizedBox(height: AppSizes.timerFullscreenGap),
        _finishButton(l10n, minutes),
      ],
    );
  }

  Widget _clockText(BuildContext context, int elapsed) {
    return Text(
      formatTimerHms(elapsed),
      key: const Key('studyTimerElapsed'),
      textAlign: TextAlign.center,
      style: widget.elapsedStyle ??
          Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w800,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
    );
  }

  Widget _notesField(AppLocalizations l10n) {
    return TextFormField(
      key: const Key('studyTimerActiveNotesField'),
      controller: widget.notesController,
      decoration: InputDecoration(labelText: l10n.sessionFormNotesLabel),
      maxLines: 2,
    );
  }

  Widget _errorLine(
    BuildContext context,
    AppLocalizations l10n,
    String message,
  ) {
    return Text(
      localizeRepoMessage(message, l10n),
      key: const Key('studyTimerActiveError'),
      style: TextStyle(color: Theme.of(context).colorScheme.error),
    );
  }

  /// Wraps [child] in the fat fullscreen button height; the compact
  /// sheet keeps the default Material button height.
  Widget _maybeFat(Widget child) {
    if (!widget.fullscreenLayout) return child;
    return SizedBox(height: AppSizes.timerFullscreenButtonHeight, child: child);
  }

  Widget _actionRow(AppLocalizations l10n, StudyTimerState timer) {
    return Row(
      children: [
        Expanded(
          child: _maybeFat(
            FilledButton.tonal(
              key: const Key('pauseResumeTimerButton'),
              onPressed: _busy ? null : () => _toggle(timer),
              child: Text(
                timer.isRunning ? l10n.studyTimerPause : l10n.studyTimerResume,
              ),
            ),
          ),
        ),
        SizedBox(
          width: widget.fullscreenLayout ? AppSizes.timerFullscreenGap : 8,
        ),
        Expanded(
          child: _maybeFat(
            OutlinedButton(
              key: const Key('discardTimerButton'),
              onPressed: _busy ? null : _confirmDiscard,
              child: Text(l10n.studyTimerDiscard),
            ),
          ),
        ),
      ],
    );
  }

  Widget _finishButton(AppLocalizations l10n, int minutes) {
    return SizedBox(
      width: double.infinity,
      height: widget.fullscreenLayout
          ? AppSizes.timerFullscreenButtonHeight
          : null,
      child: FilledButton(
        key: const Key('finishTimerButton'),
        onPressed: _busy || minutes <= 0 ? null : _finish,
        child: Text(l10n.studyTimerFinishLog('$minutes')),
      ),
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
    final l10n = l10nOf(context);
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

    final title = Row(
      children: [
        Expanded(child: Text(l10n.studyTimerActiveTitle(courseName))),
        IconButton(
          key: const Key('openTimerFullscreenButton'),
          tooltip: l10n.studyTimerFullscreen,
          onPressed: () => showStudyTimerFullscreen(context),
          icon: const Icon(Icons.fullscreen),
        ),
      ],
    );
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

/// Opens the active timer in a fullscreen focus view (same elements as
/// the sheet, bigger clock).
Future<void> showStudyTimerFullscreen(BuildContext context) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const StudyTimerFullscreenPage(),
      fullscreenDialog: true,
    ),
  );
}

/// Fullscreen focus view for the running timer: a big tabular clock plus
/// the same notes/pause/discard/finish elements as the sheet.
class StudyTimerFullscreenPage extends ConsumerStatefulWidget {
  const StudyTimerFullscreenPage({super.key});

  @override
  ConsumerState<StudyTimerFullscreenPage> createState() =>
      _StudyTimerFullscreenPageState();
}

class _StudyTimerFullscreenPageState
    extends ConsumerState<StudyTimerFullscreenPage> {
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
    final l10n = l10nOf(context);
    final timer = ref.watch(studyTimerProvider);
    if (timer == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            tooltip: l10n.studyTimerExitFullscreen,
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.fullscreen_exit),
          ),
          title: Text(l10n.studyTimerStartTitle),
        ),
        body: Center(child: Text(l10n.studyTimerTooShort)),
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
    final bigClock = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontWeight: FontWeight.w800,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: const Key('closeTimerFullscreenButton'),
          tooltip: l10n.studyTimerExitFullscreen,
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.fullscreen_exit),
        ),
        title: Text(l10n.studyTimerActiveTitle(courseName)),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSizes.maxContentWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.pageHPad,
                AppSizes.timerFullscreenTopPad,
                AppSizes.pageHPad,
                AppSizes.timerFullscreenBottomPad,
              ),
              child: StudyTimerActiveControls(
                key: const Key('studyTimerFullscreenControls'),
                notesController: _notesController,
                elapsedStyle: bigClock,
                fullscreenLayout: true,
                onFinished: () => Navigator.of(context).pop(),
                onDiscarded: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ),
      ),
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
    final l10n = l10nOf(context);
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
            AppSizes.sectionInnerGap,
            AppSizes.pageHPad,
            0,
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
