import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../logic/ects.dart';
import 'app_sizes.dart';

/// Shared visual language for ECTS Tracker (no logic, only styling).
///
/// All widgets preserve the `Key`s expected by widget tests — keys are
/// forwarded to the underlying `Text` / `LinearProgressIndicator`, never
/// swallowed by wrappers.
///
/// Sizing: all paddings / radii / icon sizes come from [AppSizes].
/// To make the UI denser or roomier, edit `app_sizes.dart` only.

/// Status → (background, foreground) pair that works in light + dark.
(Color, Color) statusColors(BuildContext context, CourseStatus status) {
  final scheme = Theme.of(context).colorScheme;
  final dark = Theme.of(context).brightness == Brightness.dark;
  switch (status) {
    case CourseStatus.completed:
      return dark
          ? (const Color(0xFF123B26), const Color(0xFF8BD8A4))
          : (const Color(0xFFE4F4E9), const Color(0xFF0F6B3A));
    case CourseStatus.overdue:
      return (scheme.errorContainer, scheme.onErrorContainer);
    case CourseStatus.behind:
      return dark
          ? (const Color(0xFF573300), const Color(0xFFFFC98A))
          : (const Color(0xFFFFEDD6), const Color(0xFF965200));
    case CourseStatus.ahead:
      return (scheme.tertiaryContainer, scheme.onTertiaryContainer);
    case CourseStatus.onTrack:
      return (scheme.primaryContainer, scheme.onPrimaryContainer);
  }
}

/// Small pill badge for `Behind` / `Overdue` / `On track` / …
/// The inner [Text] keeps the caller-provided [textKey] so tests keep passing.
class StatusPill extends StatelessWidget {
  const StatusPill({
    super.key,
    required this.status,
    required this.label,
    this.textKey,
  });

  final CourseStatus status;
  final String label;
  final Key? textKey;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = statusColors(context, status);
    final icon = switch (status) {
      CourseStatus.completed => Icons.check_circle_outline,
      CourseStatus.overdue => Icons.error_outline,
      CourseStatus.behind => Icons.trending_down,
      CourseStatus.ahead => Icons.trending_up,
      CourseStatus.onTrack => Icons.check,
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.pillHPad,
        vertical: AppSizes.pillVPad,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppSizes.pillRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: AppSizes.pillIcon, color: fg),
          const SizedBox(width: AppSizes.pillGap),
          Text(
            label,
            key: textKey,
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                  height: 1.1,
                ),
          ),
        ],
      ),
    );
  }
}

/// Rounded, slightly taller progress bar. [progressKey] is forwarded to the
/// underlying [LinearProgressIndicator] (tests look it up by key).
class RoundedProgressBar extends StatelessWidget {
  const RoundedProgressBar({
    super.key,
    required this.value,
    this.progressKey,
    this.color,
    this.minHeight = AppSizes.barDefault,
  });

  final double? value;
  final Key? progressKey;
  final Color? color;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;
    final fill = color ?? scheme.primary;
    // Zero state: a bare grey track reads as broken/disabled. Render an
    // intentional "ready" state instead — same track with a starter dot at
    // the left edge so it looks like a meter at 0, not an error.
    if ((value ?? 0) <= 0) {
      return Semantics(
        label: l10n.widgetNoProgress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.pillRadius),
          child: Container(
            key: progressKey,
            height: minHeight,
            color: scheme.surfaceContainerHighest,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: minHeight * 0.25),
            child: Container(
              width: minHeight * 0.5,
              height: minHeight * 0.5,
              decoration: BoxDecoration(
                color: fill,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.pillRadius),
      child: LinearProgressIndicator(
        key: progressKey,
        value: value,
        minHeight: minHeight,
        backgroundColor: scheme.surfaceContainerHighest,
        valueColor: AlwaysStoppedAnimation<Color>(fill),
      ),
    );
  }
}

/// Course avatar with initials. Falls back to the theme when the course
/// has no custom color. Size from [AppSizes.avatarRadius].
class CourseAvatar extends StatelessWidget {
  const CourseAvatar({super.key, required this.name, this.colorValue});

  final String name;
  final int? colorValue;

  String get _initials {
    final parts =
        name.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) {
      final p = parts.first;
      return p.length == 1 ? p.toUpperCase() : p.substring(0, 2).toUpperCase();
    }
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = colorValue != null
        ? Color(colorValue!)
        : scheme.primaryContainer;
    // Pick readable foreground: dark text on light custom colors, light text
    // on dark custom colors; theme color otherwise.
    final fg = colorValue != null
        ? (ThemeData.estimateBrightnessForColor(bg) == Brightness.dark
            ? Colors.white
            : Colors.black87)
        : scheme.onPrimaryContainer;
    return CircleAvatar(
      backgroundColor: bg,
      foregroundColor: fg,
      radius: AppSizes.avatarRadius,
      child: Text(
        _initials,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: AppSizes.avatarFont,
        ),
      ),
    );
  }
}

/// Section heading with a small tonal icon + optional trailing count.
/// [titleKey] stays on the [Text] (e.g. `needsAttentionTitle`).
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.titleKey,
    this.icon,
    this.trailing,
  });

  final String title;
  final Key? titleKey;
  final IconData? icon;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSizes.headerTopPad,
        bottom: AppSizes.headerBottomPad,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Container(
              width: AppSizes.headerIconBox,
              height: AppSizes.headerIconBox,
              margin: const EdgeInsets.only(right: AppSizes.headerGap),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius:
                    BorderRadius.circular(AppSizes.headerIconRadius),
              ),
              child: Icon(
                icon,
                size: AppSizes.headerIcon,
                color: scheme.onPrimaryContainer,
              ),
            ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                key: titleKey,
                textHeightBehavior: const TextHeightBehavior(
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.2,
                      height: 1.05,
                    ),
              ),
            ),
          ),
          if (trailing != null)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.headerCountHPad,
                vertical: AppSizes.headerCountVPad,
              ),
              decoration: BoxDecoration(
                color: scheme.surfaceContainerHighest,
                borderRadius:
                    BorderRadius.circular(AppSizes.pillRadius),
              ),
              child: Text(
                trailing!,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: scheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}

/// One stat cell used by the totals / statistics cards.
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.valueKey,
  });

  final IconData icon;
  final String label;
  final String value;
  final Key? valueKey;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: AppSizes.statBox,
          height: AppSizes.statBox,
          decoration: BoxDecoration(
            color: scheme.primaryContainer.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(AppSizes.statRadius),
          ),
          child: Icon(
            icon,
            size: AppSizes.statIcon,
            color: scheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(width: AppSizes.statGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                    ),
              ),
              const SizedBox(height: AppSizes.statLabelGap),
              Text(
                value,
                key: valueKey,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.2,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Styled wrapper for the two sort/filter dropdowns. Keeps the original
/// [DropdownButton] (and its key/items) untouched for tests.
class FilterDropdownShell extends StatelessWidget {
  const FilterDropdownShell({
    super.key,
    required this.icon,
    required this.child,
    this.transparent = false,
  });

  final IconData icon;
  final Widget child;

  /// Glass-only Apple polish (ECTS-074): when true, skip the solid fill +
  /// border so the surrounding [GlassCard] frost shows through as a single
  /// layer instead of solid paint over glass. Padding is kept identical
  /// (ECTS-074e) — dropping it jams content against the lens edge.
  final bool transparent;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    if (transparent) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.filterHPad,
          vertical: AppSizes.filterVPad,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon,
                size: AppSizes.filterIcon,
                color: scheme.onSurfaceVariant),
            const SizedBox(width: AppSizes.filterGap),
            child,
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.filterHPad,
        vertical: AppSizes.filterVPad,
      ),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(AppSizes.filterRadius),
        border:
            Border.all(color: scheme.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: AppSizes.filterIcon, color: scheme.onSurfaceVariant),
          const SizedBox(width: AppSizes.filterGap),
          child,
        ],
      ),
    );
  }
}
