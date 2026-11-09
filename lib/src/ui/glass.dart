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

/// Shared lite-glass style for cards (ECTS-061).
///
/// Shape is the app's card radius ([AppSizes.cardRadius]) as a continuous
/// rounded rectangle; optics stay subtle (refractionIndex ~1.02, narrow-ish
/// band, light blur) with a `primaryContainer` tint and a soft contact
/// shadow. `liteGlass: true` forces the shader-free path (frost + tint +
/// rim) on every engine, so no `LiquidGlassView` is ever required.
LiquidGlassStyle glassStyle(BuildContext context) {
  final scheme = Theme.of(context).colorScheme;
  return LiquidGlassStyle(
    shape: const LiquidGlassShape.continuousRoundedRectangle(
      cornerRadius: AppSizes.cardRadius,
    ),
    refractionIndex: 1.02,
    refractionWidth: 30,
    blur: 2.5,
    color: scheme.primaryContainer.withValues(alpha: 0.55),
    shadow: const LiquidGlassShadow(blur: 3.5, opacity: 0.2),
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
