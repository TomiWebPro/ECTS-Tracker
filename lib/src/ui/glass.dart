import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

import '../state/providers.dart';
import 'app_sizes.dart';

/// Whether liquid-glass chrome is enabled (ECTS-061).
///
/// Follows the persisted `AppSettings.liquidGlass` opt-in (default false):
/// off renders the identical legacy chrome, on swaps gated surfaces to
/// lite glass (frost + tint + rim, no shader pass).
final glassEnabledProvider = Provider<bool>(
  (ref) => ref.watch(settingsProvider).valueOrNull?.liquidGlass ?? false,
);

/// Unified shadow depths (ECTS-066): the only shadow definitions in the
/// app — every glass surface references one of these, so depth is tuned
/// in exactly one place. Two tiers, like Material elevations:
/// [glassCardShadow] for in-flow surfaces (cards, action pills, dialogs)
/// and [glassChromeShadow] for the floating bars (the app bar mirrors the
/// tab bar's package default 24/0.12). The card shadow is exterior-only
/// (`insideGlass: false`) with an explicit downward-RIGHT offset: the
/// default ring straddles the rim, so its blur halo spills past the top
/// corners too and the light direction breaks. Offset (4, 5) tucks the
/// ring just below-right of the outline — close contact, no float —
/// the exterior clip eats the rest, so shadow pools only at the
/// bottom-right, like light shining from the top-left.
const glassCardShadow = LiquidGlassShadow(
  blur: 3.5,
  opacity: 0.2,
  insideGlass: false,
  offset: Offset(4, 5),
);

/// Floating-chrome shadow (see [glassCardShadow]): matches the tab bar's
/// package default so both bars share one depth language.
const glassChromeShadow = LiquidGlassShadow(blur: 24, opacity: 0.12);

/// Glass tint with separate transparency + brightness knobs (ECTS-066).
///
/// A single alpha conflates the two: raising it to hide the backdrop
/// also deepens the hue (muddy), lowering it to lighten also exposes
/// the dimmed backdrop (gray). [opacity] sets coverage alone;
/// [lighten] mixes [base] toward the theme surface (white in light
/// mode, dark in dark mode) without touching coverage. Defaults
/// reproduce the card look, so call sites only name what differs.
Color glassTint(
  ColorScheme scheme,
  Color base, {
  double lighten = 0,
  double opacity = 0.55,
}) {
  final lightened = Color.lerp(base, scheme.surface, lighten) ?? base;
  return lightened.withValues(alpha: opacity);
}

/// Shared lite-glass style for cards (ECTS-061).
///
/// Shape is the app's card radius ([AppSizes.cardRadius]) as a continuous
/// rounded rectangle; optics stay subtle (refractionIndex ~1.02, narrow-ish
/// band, light blur) with a `primaryContainer` wash and the shared card
/// shadow. The wash is deliberately sheer (ECTS-066): glass OVER the
/// solid page, not solid paint over the glass — a heavy tint buries the
/// frost/rim and the lens reads flat. `liteGlass: true` forces the
/// shader-free path (frost + tint + rim) on every engine, so no
/// `LiquidGlassView` is ever required.
LiquidGlassStyle glassStyle(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return LiquidGlassStyle(
    shape: const LiquidGlassShape.continuousRoundedRectangle(
      cornerRadius: AppSizes.cardRadius,
    ),
    refractionIndex: 1.02,
    refractionWidth: 30,
    blur: 2.5,
    color: glassTint(scheme, scheme.primaryContainer, opacity: 0.35),
    shadow: glassCardShadow,
    liteGlass: true,
  );
}

/// A card that renders as lite glass when the opt-in is on, else as the
/// identical legacy [Card] (ECTS-061).
///
/// The widget [key] is forwarded to the underlying [Card]/[LiquidGlassLens]
/// in both branches so keyed lookups keep passing regardless of the toggle.
/// Extra [Card] parameters ([margin], [color], [elevation], [clipBehavior])
/// apply to the legacy branch only; the glass branch tints via [glassStyle]
/// (overridden by [color] when given) and clips via the lens shape.
/// [cornerRadius] overrides the lens corner radius on the glass branch only
/// (default keeps [glassStyle]'s [AppSizes.cardRadius]); use it where the
/// legacy surface is not a 20-pt card (filter chips, count pills).
class GlassCard extends ConsumerWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.margin,
    this.color,
    this.elevation,
    this.clipBehavior,
    this.cornerRadius,
  });

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;
  final Clip? clipBehavior;
  final double? cornerRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(glassEnabledProvider);
    if (!enabled) {
      return Card(
        key: key,
        margin: margin,
        color: color,
        elevation: elevation,
        clipBehavior: clipBehavior,
        child: child,
      );
    }
    var style = glassStyle(context);
    if (color != null) style = style.copyWith(color: color);
    if (cornerRadius != null) {
      style = style.copyWith(
        shape: LiquidGlassShape.continuousRoundedRectangle(
          cornerRadius: cornerRadius!,
        ),
      );
    }
    final Widget content = margin == null
        ? child
        : Padding(padding: margin!, child: child);
    return LiquidGlassLens(key: key, style: style, child: content);
  }
}

/// One shared-backdrop batch for a page of glass cards (ECTS-063).
///
/// Off renders [child] directly (the identical legacy tree); on wraps it in
/// a [LiquidGlassBatch] so every [GlassCard] lens below shares one backdrop
/// read. Members must not overlap — cards in a scroll list don't. Nesting
/// inside the ECTS-062 chrome batch is intended: lenses join the nearest
/// batch, so cards share the page read while the floating chrome keeps its
/// own (cross-batch overlap is fine; only same-batch overlap is banned).
class GlassBatch extends ConsumerWidget {
  const GlassBatch({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(glassEnabledProvider)) return child;
    return LiquidGlassBatch(child: child);
  }
}

/// Alert dialog honoring the glass gate (ECTS-064).
///
/// Off renders the identical Material [AlertDialog] (same title/content/
/// actions/scrollable); on renders a [LiquidGlassAlertDialog] with the same
/// slots and Keys. The glass surface uses the shared lite [glassStyle] so
/// no ancestor `LiquidGlassView` is required on any engine (frosted
/// fallback under lite, per docs). Title/content text follows the theme's
/// `onSurface` ink — not the package's white default — so the dialog stays
/// legible on light themes. Form controls inside (TextFields, Dropdowns,
/// ChoiceChips) stay plain Material: solid surfaces, never glass lenses.
class GlassAlertDialog extends ConsumerWidget {
  const GlassAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.scrollable = false,
  });

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool scrollable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(glassEnabledProvider)) {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions,
        scrollable: scrollable,
      );
    }
    return glassAlert(context,
        key: key, title: title, content: content, actions: actions);
  }
}

/// Builds the glass branch of [GlassAlertDialog] for call sites that
/// already read the gate (e.g. `showDialog` builders holding a `WidgetRef`).
///
/// Same slots as [AlertDialog]; [key] is forwarded to the
/// [LiquidGlassAlertDialog] so keyed lookups keep passing. Text styles
/// follow the theme (see [GlassAlertDialog]); the surface is the shared
/// lite [glassStyle].
///
/// The dialog is always `scrollable`: unlike [AlertDialog] (whose content
/// area scrolls once it exceeds the viewport), the package dialog lays out
/// its column at natural height and would push tall forms (course/session
/// editors) plus their actions past the viewport edge. Scrolling the whole
/// dialog keeps every Key reachable via `ensureVisible` in both modes.
LiquidGlassAlertDialog glassAlert(
  BuildContext context, {
  Key? key,
  Widget? title,
  Widget? content,
  List<Widget>? actions,
  bool scrollable = true,
}) {
  final theme = Theme.of(context);
  final ink = theme.colorScheme.onSurface;
  return LiquidGlassAlertDialog(
    key: key,
    title: title,
    content: content,
    actions: actions,
    scrollable: scrollable,
    // Solid "one color" surface (ECTS-066): the modal barrier dims the
    // backdrop dark, so translucency only pulls gray into the dialog.
    // 0.95 coverage — reads solid, keeps a breath of frost at the rim;
    // lightened tint; lens rim and shadow keep the glass edge.
    style: glassStyle(context).copyWith(
      color: glassTint(
        theme.colorScheme,
        theme.colorScheme.primaryContainer,
        lighten: 0.35,
        opacity: 0.95,
      ),
    ),
    titleTextStyle:
        (theme.textTheme.headlineSmall ?? const TextStyle(fontSize: 20))
            .copyWith(color: ink, fontWeight: FontWeight.w600),
    contentTextStyle:
        (theme.textTheme.bodyMedium ?? const TextStyle(fontSize: 14))
            .copyWith(color: ink),
  );
}

/// Option row for glass pickers (ECTS-064).
///
/// Preserves the caller's [key] and tap while rendering the same [child]
/// row in a plain Material [ListTile] (solid ink, never glass). Use as the
/// content row inside [glassAlert] when routing a `SimpleDialog` picker to
/// glass: off keeps the `SimpleDialog`/`SimpleDialogOption` tree, on shows
/// the same options (same Keys, same taps) in a glass alert.
class GlassOption extends StatelessWidget {
  const GlassOption({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      onTap: onTap,
      title: child,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      minVerticalPadding: 8,
    );
  }
}
