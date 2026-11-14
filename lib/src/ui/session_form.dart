import 'dart:async';

import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../i18n/app_locales.dart';
import '../logic/date_utils.dart';
import '../logic/locale_format.dart';
import '../logic/study_timer.dart';
import '../models/models.dart';
import '../state/providers.dart';
import '../state/study_timer_provider.dart';
import 'app_sizes.dart';
import 'err_text.dart';
import 'glass.dart';
import 'study_timer_sheet.dart';

/// Shows the log/edit-study-session form. Returns true if a session was saved.
Future<bool> showSessionFormDialog(
  BuildContext context, {
  StudySession? existing,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => SessionFormDialog(existing: existing),
  );
  return result ?? false;
}

class SessionFormDialog extends ConsumerStatefulWidget {
  const SessionFormDialog({super.key, this.existing});

  final StudySession? existing;

  @override
  ConsumerState<SessionFormDialog> createState() => _SessionFormDialogState();
}

/// Manual entry vs. timer, switched inside the log-session dialog.
enum _LogMode { manual, timer }

class _SessionFormDialogState extends ConsumerState<SessionFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _hoursController;
  late final TextEditingController _minutesController;
  late final TextEditingController _notesController;
  int? _courseId;
  late DateTime _date;
  String? _error;
  bool _saving = false;
  _LogMode _mode = _LogMode.manual;
  Timer? _ticker;

  bool get _isEdit => widget.existing != null;

  /// Effective course selection: pure function of the loaded courses, so
  /// build never mutates state. Auto-selects the only course, clears a
  /// stale id; edit mode keeps the edited session's course untouched.
  int? _resolvedCourseId(List<Course> courses) {
    if (_isEdit) return _courseId;
    if (_courseId != null) {
      return courses.any((c) => c.id == _courseId) ? _courseId : null;
    }
    return courses.length == 1 ? courses.first.id : null;
  }

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _courseId = e.courseId;
      _date = dateOnly(e.date);
      final h = e.minutes ~/ 60;
      final m = e.minutes % 60;
      _hoursController = TextEditingController(text: '$h');
      _minutesController = TextEditingController(text: '$m');
      _notesController = TextEditingController(text: e.notes ?? '');
    } else {
      _date = dateOnly(DateTime.now());
      _hoursController = TextEditingController(text: '0');
      _minutesController = TextEditingController(text: '30');
      _notesController = TextEditingController();
    }
    // Persist note edits to a running timer live (best-effort).
    _notesController.addListener(_syncNotesToTimer);
  }

  void _syncNotesToTimer() {
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
  }

  void _ensureTicker() {
    // Display-only ticking for the timer tab. Manual mode (and the existing
    // widget tests, which never leave it) creates no timer, so pumpAndSettle
    // stays deterministic.
    _ticker ??= Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_mode != _LogMode.timer) return;
      // Tick only while the timer runs: paused/idle dialogs schedule no
      // frames, so pumpAndSettle stays deterministic in widget tests.
      final t = ref.read(studyTimerProvider);
      if (t != null && t.isRunning) {
        setState(() {});
      }
    });
  }

  void _cancelTicker() {
    _ticker?.cancel();
    _ticker = null;
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _notesController.removeListener(_syncNotesToTimer);
    _hoursController.dispose();
    _minutesController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  int _parseNonNegative(TextEditingController c) {
    final v = int.tryParse(c.text.trim());
    if (v == null || v < 0) return 0;
    return v;
  }

  int get _totalMinutes =>
      _parseNonNegative(_hoursController) * 60 +
      _parseNonNegative(_minutesController);

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: minPickerDate,
      lastDate: maxPickerDate,
    );
    if (picked == null) return;
    setState(() => _date = picked);
  }

  String _dateLabel(DateTime d, String? locale) =>
      formatDateLocalized(d, locale: locale);

  Future<void> _save() async {
    final l10n = l10nOf(context);
    setState(() => _error = null);
    if (_formKey.currentState?.validate() != true) return;
    // Resolve against live courses (same pure function the dropdown uses):
    // a course deleted while the dialog was open fails closed with the
    // no-course error instead of a FK rejection.
    List<Course> courses = const [];
    try {
      courses = await ref.read(coursesProvider.future);
    } catch (_) {
      // Stream fault: resolve against nothing (fails closed below).
    }
    final courseId = _resolvedCourseId(courses);
    if (courseId == null) {
      setState(() => _error = l10n.sessionFormNoCourseError);
      return;
    }
    final minutes = _totalMinutes;
    if (minutes <= 0) {
      setState(() => _error = l10n.sessionFormDurationError);
      return;
    }
    setState(() => _saving = true);
    final notes = _notesController.text.trim();
    final repo = ref.read(sessionRepositoryProvider);
    // Branch on the row itself (`_isEdit` is `widget.existing != null`,
    // so this is equivalent); bail (never throw) if it is gone.
    final existing = widget.existing;
    final Result<void> result;
    if (existing != null) {
      result = await repo.updateSession(
        id: existing.id,
        courseId: courseId,
        minutes: minutes,
        date: _date,
        notes: notes.isEmpty ? null : notes,
      );
    } else {
      final add = await repo.addSession(
        courseId: courseId,
        minutes: minutes,
        date: _date,
        notes: notes.isEmpty ? null : notes,
      );
      result = switch (add) {
        Ok<int>() => const Ok(null),
        Err<int>(:final message) => Err(message),
      };
    }
    if (!mounted) return;
    setState(() => _saving = false);
    switch (result) {
      case Ok<void>():
        Navigator.of(context).pop(true);
      case Err<void>(:final message):
        setState(() => _error = message);
    }
  }

  Future<void> _startTimer() async {
    final l10n = l10nOf(context);
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
    setState(() => _saving = true);
    final notes = _notesController.text.trim();
    final result = await ref
        .read(studyTimerProvider.notifier)
        .start(courseId, notes: notes.isEmpty ? null : notes);
    if (!mounted) return;
    setState(() => _saving = false);
    switch (result) {
      case Ok<void>():
        // The banner takes over as the persistent timer surface.
        Navigator.of(context).pop(false);
      case Err<void>(:final message):
        setState(() => _error = message);
    }
  }

  Widget _timerTabBody(
    BuildContext context,
    AppLocalizations l10n,
    AsyncValue<List<Course>> coursesAsync,
    List<Course> courses,
    StudyTimerState? timer,
  ) {
    // Hoisted so the null-guard below promotes (fields never promote).
    final errorText = _error;
    final glassMenu = ref.watch(glassEnabledProvider);
    // An active timer is driven from here: same shared controls as the
    // standalone active sheet, closing the dialog on finish.
    if (timer != null) {
      return StudyTimerActiveControls(
        showCourseName: true,
        notesController: _notesController,
        onFinished: () => Navigator.of(context).pop(true),
      );
    }
    final courseId = _resolvedCourseId(courses);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (coursesAsync.isLoading)
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: LinearProgressIndicator(),
          ),
        GlassInkClear(
          enabled: glassMenu,
          child: DropdownButtonFormField<int>(
            key: const Key('studyTimerCourseDropdown'),
            initialValue: courseId,
            isExpanded: glassMenu,
            decoration: InputDecoration(labelText: l10n.studyTimerCourseLabel),
            dropdownColor: glassMenu ? glassMenuColor(context) : null,
            borderRadius: glassMenu
                ? BorderRadius.circular(AppSizes.glassMenuRadius)
                : null,
            focusColor: glassMenu ? Colors.transparent : null,
            elevation: glassMenu ? AppSizes.glassMenuElevation.toInt() : 8,
            menuMaxHeight: glassMenu ? AppSizes.glassMenuMaxHeight : null,
            selectedItemBuilder: glassMenu
                ? (context) => [for (final c in courses) Text(c.name)]
                : null,
            items: [
              for (final c in courses)
                DropdownMenuItem<int>(
                  value: c.id,
                  child: glassMenu
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
            validator: (v) => v == null ? l10n.studyTimerNoCourseError : null,
          ),
        ),
        if (courses.isEmpty && !coursesAsync.isLoading)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              l10n.studyTimerNoCoursesHint,
              key: const Key('studyTimerNoCoursesHint'),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        const SizedBox(height: 12),
        TextFormField(
          key: const Key('studyTimerNotesField'),
          controller: _notesController,
          decoration: InputDecoration(labelText: l10n.sessionFormNotesLabel),
          maxLines: 2,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            key: const Key('sessionStartTimerButton'),
            onPressed: _saving ? null : _startTimer,
            icon: const Icon(Icons.play_arrow),
            label: Text(
              _saving ? l10n.sessionFormSaving : l10n.studyTimerStart,
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            localizeRepoMessage(errorText, l10n),
            key: const Key('studyTimerFormError'),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);
    final coursesAsync = ref.watch(coursesProvider);
    final courses = coursesAsync.valueOrNull ?? const [];

    // Glass gate (ECTS-064): same title/content/actions/Keys; on renders
    // the glass surface, off the identical AlertDialog. Inputs stay plain
    // Material (solid, never glass).
    final glass = ref.watch(glassEnabledProvider);
    final title = Text(
      _isEdit ? l10n.sessionFormTitleEdit : l10n.sessionFormTitleAdd,
    );
    final timer = _isEdit ? null : ref.watch(studyTimerProvider);
    final inTimerTab = !_isEdit && _mode == _LogMode.timer;
    final content = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!_isEdit)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SegmentedButton<_LogMode>(
                key: const Key('sessionModeSwitch'),
                segments: [
                  ButtonSegment<_LogMode>(
                    value: _LogMode.manual,
                    label: Text(l10n.sessionFormModeManual),
                    icon: const Icon(Icons.edit_outlined),
                  ),
                  ButtonSegment<_LogMode>(
                    value: _LogMode.timer,
                    label: Text(l10n.sessionFormModeTimer),
                    icon: const Icon(Icons.play_arrow),
                  ),
                ],
                selected: {_mode},
                showSelectedIcon: false,
                onSelectionChanged: (s) {
                  setState(() {
                    _mode = s.first;
                    _error = null;
                  });
                  if (s.first == _LogMode.timer) {
                    _ensureTicker();
                  } else {
                    _cancelTicker();
                  }
                },
              ),
            ),
          if (inTimerTab)
            _timerTabBody(context, l10n, coursesAsync, courses, timer)
          else
            Form(
              key: _formKey,
              child: _sessionFormBody(context, l10n, coursesAsync, courses),
            ),
        ],
      ),
    );
    final manualActions = [
      TextButton(
        onPressed: _saving ? null : () => Navigator.of(context).pop(false),
        child: Text(l10n.commonCancel),
      ),
      FilledButton(
        key: const Key('saveSessionButton'),
        onPressed: _saving ? null : _save,
        child: Text(
          _saving
              ? l10n.sessionFormSaving
              : (_isEdit ? l10n.commonSave : l10n.sessionFormLogAction),
        ),
      ),
    ];
    // The timer tab drives itself inline (start / pause / finish / discard):
    // the dialog frame only needs a way out. Cancel never stops the timer.
    final actions = inTimerTab
        ? [
            TextButton(
              onPressed: _saving
                  ? null
                  : () => Navigator.of(context).pop(false),
              child: Text(l10n.commonCancel),
            ),
          ]
        : manualActions;
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

  Widget _sessionFormBody(
    BuildContext context,
    AppLocalizations l10n,
    AsyncValue<List<Course>> coursesAsync,
    List<Course> courses,
  ) {
    // Hoisted so the null-guard below promotes (fields never promote).
    final errorText = _error;
    // ECTS-074: single glass read for the Apple menu styling below.
    final glassMenu = ref.watch(glassEnabledProvider);
    // Resolved (not stored) selection: pure in build, so a course list
    // arriving after first build still yields a valid dropdown value.
    final courseId = _resolvedCourseId(courses);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (coursesAsync.isLoading)
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: LinearProgressIndicator(),
          ),
        GlassInkClear(
          enabled: glassMenu,
          child: DropdownButtonFormField<int>(
            key: const Key('sessionCourseDropdown'),
            initialValue: courseId,
            // Glass dialogs (ECTS-064) are narrower than AlertDialog:
            // fill the content width so long course names ellipsize
            // instead of overflowing it. Off keeps the legacy layout.
            isExpanded: glassMenu,
            decoration: InputDecoration(labelText: l10n.sessionFormCourseLabel),
            // ECTS-074 Apple polish (glass-only): frosted rounded menu,
            // text-only selection. Legacy keeps defaults. Closed-face
            // stays plain text via selectedItemBuilder so no menu
            // padding leaks into the field (ECTS-074d).
            dropdownColor: glassMenu ? glassMenuColor(context) : null,
            borderRadius: glassMenu
                ? BorderRadius.circular(AppSizes.glassMenuRadius)
                : null,
            focusColor: glassMenu ? Colors.transparent : null,
            elevation: glassMenu ? AppSizes.glassMenuElevation.toInt() : 8,
            menuMaxHeight: glassMenu ? AppSizes.glassMenuMaxHeight : null,
            selectedItemBuilder: glassMenu
                ? (context) => [for (final c in courses) Text(c.name)]
                : null,
            items: [
              for (final c in courses)
                DropdownMenuItem<int>(
                  value: c.id,
                  child: glassMenu
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
                v == null ? l10n.validationSessionCourseRequired : null,
          ),
        ),
        if (courses.isEmpty && !coursesAsync.isLoading)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              l10n.sessionFormNoCoursesHint,
              key: const Key('sessionNoCoursesHint'),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                key: const Key('sessionHoursField'),
                controller: _hoursController,
                decoration: InputDecoration(
                  labelText: l10n.sessionFormHoursLabel,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                key: const Key('sessionMinutesField'),
                controller: _minutesController,
                decoration: InputDecoration(
                  labelText: l10n.sessionFormMinutesLabel,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (_) => setState(() {}),
                validator: (_) {
                  if (_totalMinutes <= 0) {
                    return l10n.validationSessionDurationRequired;
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            l10n.sessionFormTotalHours(
              formatDecimal(_totalMinutes / 60.0, 2, locale: l10n.localeName),
            ),
            key: const Key('sessionTotalDuration'),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          key: const Key('sessionDateButton'),
          onPressed: _pickDate,
          icon: const Icon(Icons.calendar_today),
          label: Text(
            l10n.sessionFormDateButton(_dateLabel(_date, l10n.localeName)),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          key: const Key('sessionNotesField'),
          controller: _notesController,
          decoration: InputDecoration(labelText: l10n.sessionFormNotesLabel),
          maxLines: 2,
        ),
        if (errorText != null) ...[
          const SizedBox(height: 8),
          Text(
            localizeRepoMessage(errorText, l10n),
            key: const Key('sessionFormError'),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ],
    );
  }
}
