import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../models/models.dart';
import '../state/providers.dart';
import 'app_sizes.dart';
import 'glass.dart';

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

class _SessionFormDialogState extends ConsumerState<SessionFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _hoursController;
  late final TextEditingController _minutesController;
  late final TextEditingController _notesController;
  int? _courseId;
  late DateTime _date;
  String? _error;
  bool _saving = false;

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _courseId = e.courseId;
      _date = DateTime(e.date.year, e.date.month, e.date.day);
      final h = e.minutes ~/ 60;
      final m = e.minutes % 60;
      _hoursController = TextEditingController(text: '$h');
      _minutesController = TextEditingController(text: '$m');
      _notesController = TextEditingController(text: e.notes ?? '');
    } else {
      final now = DateTime.now();
      _date = DateTime(now.year, now.month, now.day);
      _hoursController = TextEditingController(text: '0');
      _minutesController = TextEditingController(text: '30');
      _notesController = TextEditingController();
    }
  }

  @override
  void dispose() {
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
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    setState(() => _date = picked);
  }

  String _dateLabel(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _error = null);
    if (!_formKey.currentState!.validate()) return;
    final courseId = _courseId;
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
    final Result<void> result;
    if (_isEdit) {
      result = await repo.updateSession(
        id: widget.existing!.id,
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final coursesAsync = ref.watch(coursesProvider);
    final courses = coursesAsync.valueOrNull ?? const [];
    // Keep selection valid if courses load after first build.
    if (_courseId == null && courses.length == 1) {
      _courseId = courses.first.id;
    }
    if (_courseId != null && courses.every((c) => c.id != _courseId) && !_isEdit) {
      _courseId = null;
    }

    // Glass gate (ECTS-064): same title/content/actions/Keys; on renders
    // the glass surface, off the identical AlertDialog. Inputs stay plain
    // Material (solid, never glass).
    final glass = ref.watch(glassEnabledProvider);
    final title = Text(
      _isEdit ? l10n.sessionFormTitleEdit : l10n.sessionFormTitleAdd,
    );
    final content = SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: _sessionFormBody(context, l10n, coursesAsync, courses),
      ),
    );
    final actions = [
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
    if (!glass) {
      return AlertDialog(title: title, content: content, actions: actions);
    }
    return glassAlert(context,
        title: title, content: content, actions: actions);
  }

  Widget _sessionFormBody(
    BuildContext context,
    AppLocalizations l10n,
    AsyncValue<List<Course>> coursesAsync,
    List<Course> courses,
  ) {
    // ECTS-074: single glass read for the Apple menu styling below.
    final glassMenu = ref.watch(glassEnabledProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
              if (coursesAsync.isLoading)
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: LinearProgressIndicator(),
                ),
              DropdownButtonFormField<int>(
                key: const Key('sessionCourseDropdown'),
                initialValue: _courseId,
                // Glass dialogs (ECTS-064) are narrower than AlertDialog:
                // fill the content width so long course names ellipsize
                // instead of overflowing it. Off keeps the legacy layout.
                isExpanded: glassMenu,
                decoration: InputDecoration(labelText: l10n.sessionFormCourseLabel),
                // ECTS-074 Apple polish (glass-only): frosted rounded menu,
                // text-only selection. Legacy keeps defaults. Closed-face
                // stays plain text via selectedItemBuilder so no menu
                // padding leaks into the field (ECTS-074d).
                dropdownColor:
                    glassMenu ? glassMenuColor(context) : null,
                borderRadius: glassMenu
                    ? BorderRadius.circular(AppSizes.glassMenuRadius)
                    : null,
                menuMaxHeight:
                    glassMenu ? AppSizes.glassMenuMaxHeight : null,
                selectedItemBuilder: glassMenu
                    ? (context) => [
                          for (final c in courses) Text(c.name),
                        ]
                    : null,
                items: [
                  for (final c in courses)
                    DropdownMenuItem<int>(
                      value: c.id,
                      child: glassMenu
                          ? GlassMenuRow(
                              selected: _courseId == c.id,
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
              if (courses.isEmpty && !coursesAsync.isLoading)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    l10n.sessionFormNoCoursesHint,
                    key: const Key('sessionNoCoursesHint'),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
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
                    (_totalMinutes / 60.0).toStringAsFixed(2),
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
                label: Text(l10n.sessionFormDateButton(_dateLabel(_date))),
              ),
              const SizedBox(height: 8),
              TextFormField(
                key: const Key('sessionNotesField'),
                controller: _notesController,
                decoration: InputDecoration(labelText: l10n.sessionFormNotesLabel),
                maxLines: 2,
              ),
              if (_error != null) ...[
                const SizedBox(height: 8),
                Text(
                  _error!,
                  key: const Key('sessionFormError'),
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ],
    );
  }
}
