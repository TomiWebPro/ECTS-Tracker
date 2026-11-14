import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../i18n/app_locales.dart';
import 'glass.dart';

/// Creator easter egg (ECTS-108): 20 consecutive taps on the top-right
/// AppBar icon open a graffiti-styled tribute dialog.
const int kCreatorEggTaps = 20;

/// Gap that breaks the tap streak: taps further apart start over at 1.
const Duration kCreatorEggTimeout = Duration(seconds: 2);

/// Profile links shown in the dialog.
final Uri kCreatorGithubUrl = Uri.parse('https://github.com/TomiWebPro');
final Uri kCreatorLinkedinUrl =
    Uri.parse('https://linkedin.com/in/tomiwebpro');

/// Pure tap-streak step, kept outside the widget for tests.
///
/// Returns the new streak count, the tap time to store, and whether the
/// dialog should open. Reaching [kCreatorEggTaps] unlocks and resets to 0.
({int count, DateTime tap, bool unlocked}) creatorEggNext({
  required int count,
  required DateTime? lastTap,
  required DateTime now,
  Duration timeout = kCreatorEggTimeout,
  int target = kCreatorEggTaps,
}) {
  final continued =
      lastTap != null && now.difference(lastTap) <= timeout;
  final next = continued ? count + 1 : 1;
  if (next >= target) {
    return (count: 0, tap: now, unlocked: true);
  }
  return (count: next, tap: now, unlocked: false);
}

/// Bounds each platform attempt: a missing plugin answers with an error,
/// but a dead channel may never answer at all — never hang the UI on it.
const Duration kCreatorLinkTimeout = Duration(seconds: 3);

/// Opens a creator profile URL in the external browser on any platform.
/// When the browser cannot be opened (missing plugin, stale desktop build,
/// platform failure, or a channel that never answers), falls back to
/// copying the URL to the clipboard and confirming with the shared
/// copied-to-clipboard note.
Future<void> openCreatorLink(
  BuildContext context,
  Uri url,
  AppLocalizations l10n,
) async {
  try {
    final opened = await launchUrl(url, mode: LaunchMode.externalApplication)
        .timeout(kCreatorLinkTimeout);
    if (opened) return;
  } on TimeoutException {
    // Dead channel — fall through to the clipboard fallback below.
  } catch (_) {
    // Fall through to the clipboard fallback below.
  }
  try {
    await Clipboard.setData(ClipboardData(text: url.toString()))
        .timeout(kCreatorLinkTimeout);
  } on TimeoutException {
    // Clipboard unavailable; the note below still shows the outcome.
  } catch (_) {
    // Clipboard unavailable; the note below still shows the outcome.
  }
  if (!context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(l10n.settingsExportCopied)),
  );
}

/// Shows the creator tribute dialog.
Future<void> showCreatorEggDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final l10n = l10nOf(dialogContext);
      return GlassAlertDialog(
        key: const Key('creatorEggDialog'),
        title: GraffitiTitle(text: l10n.creatorEggTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.rotate(
              angle: -0.06,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF2FB3),
                      Color(0xFFFFB020),
                      Color(0xFF22D3EE),
                      Color(0xFFA3E635),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x6622D3EE),
                      blurRadius: 12,
                      offset: Offset(3, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/tomi-profile.jpg',
                    width: 96,
                    height: 96,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 96,
                      height: 96,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(
                        Icons.person,
                        size: 56,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.creatorEggBody,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: [
                OutlinedButton.icon(
                  key: const Key('creatorEggGithubButton'),
                  onPressed: () =>
                      openCreatorLink(dialogContext, kCreatorGithubUrl, l10n),
                  icon: const Icon(Icons.code, size: 18),
                  label: Text(l10n.creatorEggGithub),
                ),
                OutlinedButton.icon(
                  key: const Key('creatorEggLinkedinButton'),
                  onPressed: () =>
                      openCreatorLink(dialogContext, kCreatorLinkedinUrl, l10n),
                  icon: const Icon(Icons.work_outline, size: 18),
                  label: Text(l10n.creatorEggLinkedin),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.commonClose),
          ),
        ],
      );
    },
  );
}

/// Graffiti-style dialog title: gradient fill, heavy black outline,
/// cyan/magenta offsets and a small spray-splatter row.
class GraffitiTitle extends StatelessWidget {
  const GraffitiTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 26,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          letterSpacing: 0.5,
        ) ??
        const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
        );
    final outline = base.copyWith(
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5
        ..color = const Color(0xFF1A1A1A),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: -0.03,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: const Offset(3, 3),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: base.copyWith(color: const Color(0xFF22D3EE)),
                ),
              ),
              Transform.translate(
                offset: const Offset(-2, 2),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: base.copyWith(color: const Color(0xFFFF2FB3)),
                ),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: outline,
              ),
              ShaderMask(
                shaderCallback: (bounds) =>
                    const LinearGradient(
                      colors: [
                        Color(0xFFFFF200),
                        Color(0xFFFFB020),
                        Color(0xFFFF2FB3),
                        Color(0xFF7C3AED),
                        Color(0xFF22D3EE),
                      ],
                    ).createShader(bounds),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: base.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        const _GraffitiSplatter(),
      ],
    );
  }
}

/// Deterministic spray dots under the graffiti title.
class _GraffitiSplatter extends StatelessWidget {
  const _GraffitiSplatter();

  @override
  Widget build(BuildContext context) {
    const dots = [
      (Offset(-72, 0), 3.5, Color(0xFFFF2FB3)),
      (Offset(-48, 3), 2.2, Color(0xFF22D3EE)),
      (Offset(-20, -2), 2.8, Color(0xFFFFB020)),
      (Offset(8, 2), 2.0, Color(0xFFA3E635)),
      (Offset(36, -1), 3.0, Color(0xFF7C3AED)),
      (Offset(62, 3), 2.2, Color(0xFFFF2FB3)),
      (Offset(84, 0), 3.2, Color(0xFF22D3EE)),
    ];
    return SizedBox(
      height: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final d in dots)
            Transform.translate(
              offset: d.$1,
              child: Container(
                width: d.$2 * 2,
                height: d.$2 * 2,
                decoration: BoxDecoration(
                  color: d.$3,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
