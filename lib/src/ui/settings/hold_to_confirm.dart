part of '../settings_page.dart';

/// Destructive-action guard: the user must press AND HOLD for [seconds]
/// (default 10 s). Releasing early resets progress. Disabled until the
/// backup preview validates ([enabled]).
class _HoldToConfirmButton extends StatefulWidget {
  const _HoldToConfirmButton({
    required this.enabled,
    required this.onConfirmed,
    required this.label,
    this.seconds = 10,
  });

  final bool enabled;
  final Future<void> Function() onConfirmed;
  final int seconds;
  final String label;

  @override
  State<_HoldToConfirmButton> createState() => _HoldToConfirmButtonState();
}

class _HoldToConfirmButtonState extends State<_HoldToConfirmButton> {
  Timer? _timer;
  final _stopwatch = Stopwatch();
  bool _fired = false;

  double get _heldSeconds => _stopwatch.elapsedMilliseconds / 1000.0;

  void _cancel() {
    _timer?.cancel();
    _timer = null;
    _stopwatch
      ..stop()
      ..reset();
    // A cancelled hold never fired: rebuild to clear the progress bar.
    if (mounted && !_fired) setState(() {});
  }

  void _start() {
    if (!widget.enabled || _fired) return;
    _timer?.cancel();
    _stopwatch
      ..reset()
      ..start();
    const step = Duration(milliseconds: 100);
    _timer = Timer.periodic(step, (t) {
      if (!mounted) return t.cancel();
      setState(() {});
      if (_heldSeconds >= widget.seconds && !_fired) {
        _fired = true;
        t.cancel();
        widget.onConfirmed();
      }
    });
  }

  @override
  void didUpdateWidget(covariant _HoldToConfirmButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Disabling mid-hold (e.g. preview invalidated) resets the guard so a
    // re-enabled button always starts from zero and can fire again.
    if (!widget.enabled && (oldWidget.enabled || _fired)) {
      _fired = false;
      _cancel();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);
    final held = _heldSeconds;
    final progress = (held / widget.seconds).clamp(0.0, 1.0);
    final remaining = (widget.seconds - held).ceil().clamp(0, widget.seconds);
    final labelText = widget.enabled
        ? (held > 0
            ? l10n.settingsKeepHolding('$remaining')
            : l10n.settingsHoldLabel(widget.label, '${widget.seconds}'))
        : l10n.settingsPasteValidBackup;
    return Opacity(
      opacity: widget.enabled ? 1 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // The inner button is display-only (null action): the hold
          // gesture and its screen-reader announcement live on the
          // container so assistive tech does not see a disabled button.
          Semantics(
            button: true,
            enabled: widget.enabled,
            label: labelText,
            child: GestureDetector(
              onLongPressStart: (_) => _start(),
              onLongPressEnd: (_) => _cancel(),
              onLongPressCancel: _cancel,
              child: ExcludeSemantics(
                child: FilledButton(
                  key: const Key('holdToConfirmReplace'),
                  onPressed: null,
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    disabledBackgroundColor: Theme.of(context)
                        .colorScheme
                        .error
                        .withValues(alpha: 0.6),
                  ),
                  child: Text(labelText),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.error),
          ),
        ],
      ),
    );
  }
}
