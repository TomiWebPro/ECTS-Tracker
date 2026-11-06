import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../logic/ects.dart';
import '../models/models.dart';
import '../state/providers.dart';

/// Preset colors for courses (ARGB values). Null means "no color".
const List<int?> courseColorOptions = [
  null,
  0xFFE57373, // red
  0xFF64B5F6, // blue
  0xFF81C784, // green
  0xFFFFB74D, // orange
  0xFFBA68C8, // purple
  0xFF4DB6AC, // teal
  0xFFFFF176, // yellow
];

/// Shows the add/edit course form. Returns true if a change was saved.
Future<bool> showCourseFormDialog(
  BuildContext context, {
  Course? existing,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => CourseFormDialog(existing: existing),
  );
  return result ?? false;
}

class CourseFormDialog extends ConsumerStatefulWidget {
  const CourseFormDialog({super.key, this.existing});

  final Course? existing;

  @override
  ConsumerState<CourseFormDialog> createState() => _CourseFormDialogState();
}

class _CourseFormDialogState extends ConsumerState<CourseFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _ects;
  late final TextEditingController _notes;
  DateTime? _startDate;
  DateTime? _deadline;
  int? _colorValue;
  String? _error;
  bool _saving = false;

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final c = widget.existing;
    _name = TextEditingController(text: c?.name ?? '');
    _ects = TextEditingController(
      text: c != null ? _formatEcts(c.ectsCredits) : '',
    );
    _notes = TextEditingController(text: c?.notes ?? '');
    _startDate = c?.startDate;
    _deadline = c?.deadline;
    _colorValue = c?.colorValue;
  }

  String _formatEcts(double v) {
    if (v == v.roundToDouble()) return v.toInt().toString();
    return v.toString();
  }

  @override
  void dispose() {
    _name.dispose();
    _ects.dispose();
    _notes.dispose();
    super.dispose();
  }

  double? _parseEcts() {
    final raw = _ects.text.trim().replaceAll(',', '.');
    if (raw.isEmpty) return null;
    return double.tryParse(raw);
  }

  Future<void> _pickDate({required bool start}) async {
    final initial = start ? (_startDate ?? DateTime.now()) : (_deadline ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    setState(() {
      if (start) {
        _startDate = picked;
      } else {
        _deadline = picked;
      }
    });
  }

  Future<void> _save() {
    setState(() => _error = null);
    if (!_formKey.currentState!.validate()) return Future.value();
    return _doSave();
  }

  Future<void> _doSave() async {
    setState(() => _saving = true);
    final repo = ref.read(courseRepositoryProvider);
    final ects = _parseEcts()!;
    final notes = _notes.text.trim();
    final Result<void> result;
    if (_isEdit) {
      result = await repo.updateCourse(
        id: widget.existing!.id,
        name: _name.text,
        ectsCredits: ects,
        startDate: _startDate,
        deadline: _deadline,
        notes: notes.isEmpty ? null : notes,
        colorValue: _colorValue,
      );
    } else {
      final addResult = await repo.addCourse(
        name: _name.text,
        ectsCredits: ects,
        startDate: _startDate,
        deadline: _deadline,
        notes: notes.isEmpty ? null : notes,
        colorValue: _colorValue,
      );
      result = switch (addResult) {
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

  String _dateLabel(DateTime? d) {
    if (d == null) return 'Not set';
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(settingsProvider);
    final hoursPerEcts = settingsAsync.valueOrNull?.hoursPerEcts ?? AppSettings.defaultHoursPerEcts;
    final ects = _parseEcts();
    final computedHours = (ects != null && ects > 0)
        ? requiredHours(ects, hoursPerEcts)
        : null;

    return AlertDialog(
      title: Text(_isEdit ? 'Edit course' : 'Add course'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                key: const Key('courseNameField'),
                controller: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                textCapitalization: TextCapitalization.words,
                validator: (v) {
                  final t = v?.trim() ?? '';
                  if (t.isEmpty) return 'Name is required';
                  if (t.length > courseNameMaxLength) return 'Name is too long';
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                key: const Key('courseEctsField'),
                controller: _ects,
                decoration: const InputDecoration(labelText: 'ECTS credits'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                ],
                onChanged: (_) => setState(() {}),
                validator: (v) {
                  final parsed = _parseEcts();
                  if (parsed == null) return 'Enter ECTS credits';
                  if (parsed <= 0) return 'ECTS must be greater than zero';
                  return null;
                },
              ),
              const SizedBox(height: 4),
              Text(
                computedHours != null
                    ? 'Required hours (auto): ${computedHours.toStringAsFixed(1)} h (${hoursPerEcts.toStringAsFixed(0)} h/ECTS)'
                    : 'Required hours (auto): —',
                key: const Key('courseAutoHours'),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      key: const Key('courseStartDateButton'),
                      onPressed: () => _pickDate(start: true),
                      child: Text('Start: ${_dateLabel(_startDate)}'),
                    ),
                  ),
                  IconButton(
                    key: const Key('clearCourseStartDate'),
                    tooltip: 'Clear start date',
                    onPressed: _startDate == null ? null : () => setState(() => _startDate = null),
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      key: const Key('courseDeadlineButton'),
                      onPressed: () => _pickDate(start: false),
                      child: Text('Deadline: ${_dateLabel(_deadline)}'),
                    ),
                  ),
                  IconButton(
                    key: const Key('clearCourseDeadline'),
                    tooltip: 'Clear deadline',
                    onPressed: _deadline == null ? null : () => setState(() => _deadline = null),
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextFormField(
                key: const Key('courseNotesField'),
                controller: _notes,
                decoration: const InputDecoration(labelText: 'Notes (optional)'),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              Text('Color', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                children: [
                  for (final c in courseColorOptions)
                    ChoiceChip(
                      key: Key('courseColor_${c ?? 'none'}'),
                      label: c == null
                          ? const Text('None')
                          : const SizedBox(width: 16, height: 16),
                      selected: _colorValue == c,
                      selectedColor: c == null ? null : Color(c),
                      backgroundColor: c == null ? null : Color(c).withValues(alpha: 0.6),
                      onSelected: (_) => setState(() => _colorValue = c),
                    ),
                ],
              ),
              if (_error != null) ...[
                const SizedBox(height: 8),
                Text(
                  _error!,
                  key: const Key('courseFormError'),
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
          key: const Key('saveCourseButton'),
          onPressed: _saving ? null : _save,
          child: Text(_saving ? 'Saving…' : 'Save'),
        ),
      ],
    );
  }
}
