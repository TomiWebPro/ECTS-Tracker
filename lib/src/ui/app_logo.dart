import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_sizes.dart';

/// Project logo (ECTS Tracker brand mark).
///
/// Uses the desktop SVG source (`assets/images/ects-tracker-logo.svg`) with a
/// PNG fallback (`assets/images/ects-tracker-logo.png`) for contexts where
/// SVG rendering is unavailable. Sizes come from [AppSizes] — no hardcoded
/// dimensions here.
class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.size = AppSizes.logoDefault,
    this.radius = AppSizes.logoRadius,
    this.useSvg = true,
  });

  final double size;
  final double radius;
  final bool useSvg;

  static const String svgAsset = 'assets/images/ects-tracker-logo.svg';
  static const String pngAsset = 'assets/images/ects-tracker-logo.png';

  /// Warm paper backdrop behind the mark (brand token, not theme surface).
  static const Color backdrop = Color(0xFFFAF9F4);

  @override
  Widget build(BuildContext context) {
    // Missing-asset red screen becomes a plain icon: the errorBuilder
    // covers a broken/missing SVG, and the PNG branch needs none (a
    // missing PNG falls back to the icon the same way).
    final child = useSvg
        ? SvgPicture.asset(
            svgAsset,
            width: size,
            height: size,
            fit: BoxFit.contain,
            semanticsLabel: 'ECTS Tracker logo',
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.school_outlined,
              size: size * 0.6,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        : Image.asset(
            pngAsset,
            width: size,
            height: size,
            fit: BoxFit.contain,
            semanticLabel: 'ECTS Tracker logo',
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.school_outlined,
              size: size * 0.6,
              color: Theme.of(context).colorScheme.primary,
            ),
          );
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: size,
        height: size,
        color: AppLogo.backdrop,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
