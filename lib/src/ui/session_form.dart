import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../models/models.dart';
import '../state/providers.dart';

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
    setState(() => _error = null);
    if (!_formKey.currentState!.validate()) return;
    final courseId = _courseId;
    if (courseId == null) {
      setState(() => _error = 'Select a course.');
      return;
    }
    final minutes = _totalMinutes;
    if (minutes <= 0) {
      setState(() => _error = 'Duration must be greater than zero.');
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
    final coursesAsync = ref.watch(coursesProvider);
    final courses = coursesAsync.valueOrNull ?? const [];
    // Keep selection valid if courses load after first build.
    if (_courseId == null && courses.length == 1) {
      _courseId = courses.first.id;
    }
    if (_courseId != null && courses.every((c) => c.id != _courseId) && !_isEdit) {
      _courseId = null;
    }

    return AlertDialog(
      title: Text(_isEdit ? 'Edit study session' : 'Log study session'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                key: const Key('sessionCourseDropdown'),
                initialValue: _courseId,
                decoration: const InputDecoration(labelText: 'Course'),
                items: [
                  for (final c in courses)
                    DropdownMenuItem<int>(
                      value: c.id,
                      child: Text(c.name),
                    ),
                ],
                onChanged: courses.isEmpty
                    ? null
                    : (v) => setState(() => _courseId = v),
                validator: (v) => v == null ? 'Select a course' : null,
              ),
              if (courses.isEmpty && !coursesAsync.isLoading)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Add a course first to log a session.',
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
                      decoration: const InputDecoration(labelText: 'Hours'),
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
                      decoration: const InputDecoration(labelText: 'Minutes'),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (_) => setState(() {}),
                      validator: (_) {
                        if (_totalMinutes <= 0) {
                          return 'Enter a duration';
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
                  'Total: ${(_totalMinutes / 60.0).toStringAsFixed(2)} h',
                  key: const Key('sessionTotalDuration'),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                key: const Key('sessionDateButton'),
                onPressed: _pickDate,
                icon: const Icon(Icons.calendar_today),
                label: Text('Date: ${_dateLabel(_date)}'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                key: const Key('sessionNotesField'),
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes (optional)'),
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
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _saving ? null : () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          key: const Key('saveSessionButton'),
          onPressed: _saving ? null : _save,
          child: Text(_saving ? 'Saving…' : (_isEdit ? 'Save' : 'Log session')),
        ),
      ],
    );
  }
}
