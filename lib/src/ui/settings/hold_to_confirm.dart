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
  double _held = 0;
  bool _fired = false;

  void _cancel() {
    _timer?.cancel();
    _timer = null;
    if (mounted && !_fired) setState(() => _held = 0);
  }

  void _start() {
    if (!widget.enabled || _fired) return;
    _timer?.cancel();
    const step = Duration(milliseconds: 100);
    _timer = Timer.periodic(step, (t) {
      if (!mounted) return t.cancel();
      setState(() => _held += 0.1);
      if (_held >= widget.seconds && !_fired) {
        _fired = true;
        t.cancel();
        widget.onConfirmed();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final progress = (_held / widget.seconds).clamp(0.0, 1.0);
    final remaining = (widget.seconds - _held).ceil().clamp(0, widget.seconds);
    return Opacity(
      opacity: widget.enabled ? 1 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onLongPressStart: (_) => _start(),
            onLongPressEnd: (_) => _cancel(),
            onLongPressCancel: _cancel,
            child: FilledButton(
              key: const Key('holdToConfirmReplace'),
              onPressed: null,
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                disabledBackgroundColor:
                    Theme.of(context).colorScheme.error.withValues(alpha: 0.6),
              ),
              child: Text(widget.enabled
                  ? (_held > 0
                      ? l10n.settingsKeepHolding('$remaining')
                      : l10n.settingsHoldLabel(
                          widget.label, '${widget.seconds}'))
                  : l10n.settingsPasteValidBackup),
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
