import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories.dart';
import '../logic/date_utils.dart';
import '../logic/ects.dart';
import '../models/models.dart';
import '../state/providers.dart';
import 'app_sizes.dart';
import 'err_text.dart';
import 'glass.dart';

/// Preset colors for courses (ARGB values). Null means "no color".
const List<int?> courseColorOptions = [
  null,
  0xFFE57373, // red
  0xFF4E8CA8, // steel cyan (replaces Material default blue)
  0xFF81C784, // green
  0xFFFFB74D, // orange
  0xFFC27A8A, // dusty rose (replaces Material default purple)
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
  bool _startEarly = false;

  bool get _isEdit => widget.existing != null;

  bool get _isFutureStart {
    final s = _startDate;
    if (s == null) return false;
    return dateOnly(s).isAfter(dateOnly(DateTime.now()));
  }

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
    _startEarly = c?.startEarly ?? false;
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
      firstDate: minPickerDate,
      lastDate: maxPickerDate,
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
        startEarly: _isFutureStart ? _startEarly : false,
      );
    } else {
      final addResult = await repo.addCourse(
        name: _name.text,
        ectsCredits: ects,
        startDate: _startDate,
        deadline: _deadline,
        notes: notes.isEmpty ? null : notes,
        colorValue: _colorValue,
        startEarly: _isFutureStart ? _startEarly : false,
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

  String _dateLabel(DateTime? d, String notSet) {
    if (d == null) return notSet;
    return formatYmd(d);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final settingsAsync = ref.watch(settingsProvider);
    final hoursPerEcts = settingsAsync.valueOrNull?.hoursPerEcts ?? AppSettings.defaultHoursPerEcts;
    final ects = _parseEcts();
    final computedHours = (ects != null && ects > 0)
        ? requiredHours(ects, hoursPerEcts)
        : null;

    // Glass dialogs (ECTS-064): same title/content/actions/Keys in both
    // branches; on renders the glass surface, off the identical AlertDialog.
    // Form controls stay plain Material (solid, never glass lenses).
    final title =
        Text(_isEdit ? l10n.courseFormTitleEdit : l10n.courseFormTitleAdd);
    final content = SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                key: const Key('courseNameField'),
                controller: _name,
                decoration: InputDecoration(labelText: l10n.courseFormNameLabel),
                textCapitalization: TextCapitalization.words,
                validator: (v) {
                  final t = v?.trim() ?? '';
                  if (t.isEmpty) return l10n.validationCourseNameRequired;
                  if (t.length > courseNameMaxLength) {
                    return l10n.validationCourseNameTooLong;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                key: const Key('courseEctsField'),
                controller: _ects,
                decoration: InputDecoration(labelText: l10n.courseFormEctsLabel),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                ],
                onChanged: (_) => setState(() {}),
                validator: (v) {
                  final parsed = _parseEcts();
                  if (parsed == null) return l10n.validationCourseEctsRequired;
                  if (parsed <= 0) return l10n.validationCourseEctsPositive;
                  return null;
                },
              ),
              const SizedBox(height: 4),
              Text(
                l10n.courseFormAutoHoursValue(
                  computedHours != null
                      ? '${l10n.statsHoursValue(computedHours.toStringAsFixed(1))} (${l10n.courseFormHoursPerEctsValue(hoursPerEcts.toStringAsFixed(0))})'
                      : '—',
                ),
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
                      child: Text(
                        l10n.courseFormStartButton(
                          _dateLabel(_startDate, l10n.courseFormDateNotSet),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    key: const Key('clearCourseStartDate'),
                    tooltip: l10n.courseFormClearStartTooltip,
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
                      child: Text(
                        l10n.courseFormDeadlineButton(
                          _dateLabel(_deadline, l10n.courseFormDateNotSet),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    key: const Key('clearCourseDeadline'),
                    tooltip: l10n.courseFormClearDeadlineTooltip,
                    onPressed: _deadline == null ? null : () => setState(() => _deadline = null),
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              if (_isFutureStart) ...[
                const SizedBox(height: 4),
                CheckboxListTile(
                  key: const Key('courseStartEarlyCheckbox'),
                  value: _startEarly,
                  onChanged: (v) =>
                      setState(() => _startEarly = v ?? false),
                  title: Text(l10n.courseFormStartEarlyTitle),
                  subtitle: Text(
                    _startEarly
                        ? l10n.courseFormStartEarlyOn
                        : l10n.courseFormStartEarlyOff(
                            _dateLabel(_startDate, l10n.courseFormDateNotSet),
                          ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ],
              const SizedBox(height: 8),
              TextFormField(
                key: const Key('courseNotesField'),
                controller: _notes,
                decoration: InputDecoration(labelText: l10n.courseFormNotesLabel),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              Text(l10n.courseFormColorLabel, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 4),
              Wrap(
                spacing: AppSizes.colorOptionSpacing,
                runSpacing: AppSizes.colorOptionRunSpacing,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (final c in courseColorOptions)
                    ChoiceChip(
                      key: Key('courseColor_${c ?? 'none'}'),
                      // Only "None" shows a checkmark. Color swatches use
                      // opacity (selected vs unselected) instead — otherwise
                      // the check icon makes the selected chip taller and the
                      // wrapped rows look vertically cranked.
                      showCheckmark: c == null,
                      label: c == null
                          ? Text(l10n.commonNone)
                          : const SizedBox(
                              width: AppSizes.colorSwatchW,
                              height: AppSizes.colorSwatchH,
                            ),
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
                  localizeRepoMessage(_error!, l10n),
                  key: const Key('courseFormError'),
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ],
          ),
        ),
      );
    final actions = [
        TextButton(
          onPressed: _saving ? null : () => Navigator.of(context).pop(false),
          child: Text(l10n.commonCancel),
        ),
        FilledButton(
          key: const Key('saveCourseButton'),
          onPressed: _saving ? null : _save,
          child: Text(_saving ? l10n.courseFormSaving : l10n.commonSave),
        ),
      ];
    if (!ref.watch(glassEnabledProvider)) {
      return AlertDialog(title: title, content: content, actions: actions);
    }
    return glassAlert(context, title: title, content: content, actions: actions);
  }
}
