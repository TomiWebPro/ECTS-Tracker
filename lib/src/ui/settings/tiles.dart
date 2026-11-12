part of '../settings_page.dart';

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // Glass cards (ECTS-067): lite lens when on (GlassCard gate renders
    // the identical Card when off). Tiles keep Keys/taps/dividers.
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(children: children),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    this.tileKey,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.onIconTap,
    this.trailing,
    this.showDivider = true,
    this.topDivider = false,
  });

  final Key? tileKey;
  final IconData icon;
  final String title;
  final Widget subtitle;
  final VoidCallback? onTap;

  /// Optional trailing control (e.g. a [Switch]). When given it replaces
  /// the chevron; when null the tile keeps the legacy behavior (chevron
  /// iff [onTap] is set).
  final Widget? trailing;

  /// Hidden dev-mode unlock hook: taps on the leading icon with zero
  /// visual feedback (no splash/animation).
  final VoidCallback? onIconTap;
  final bool showDivider;
  final bool topDivider;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final iconBox = Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: scheme.primaryContainer.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(icon, size: 20, color: scheme.onPrimaryContainer),
    );
    return Column(
      children: [
        if (topDivider)
          Divider(
            height: 1,
            indent: 62,
            endIndent: 16,
            color: scheme.outlineVariant.withValues(alpha: 0.6),
          ),
        ListTile(
          key: tileKey,
          onTap: onTap,
          leading: onIconTap == null
              ? iconBox
              : GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onIconTap,
                  child: iconBox,
                ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          subtitle: DefaultTextStyle.merge(
            style: TextStyle(color: scheme.onSurfaceVariant),
            child: subtitle,
          ),
          trailing: trailing ??
              (onTap == null
                  ? null
                  : Icon(Icons.chevron_right,
                      color: scheme.onSurfaceVariant.withValues(alpha: 0.7))),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 62,
            endIndent: 16,
            color: scheme.outlineVariant.withValues(alpha: 0.6),
          ),
      ],
    );
  }
}

/// Section header whose icon is a hidden tap target: [onIconTap] fires with
/// zero visual feedback (plain [GestureDetector], no splash/animation).
class _UnlockableSectionHeader extends StatelessWidget {
  const _UnlockableSectionHeader({
    required this.title,
    required this.icon,
    required this.onIconTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onIconTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onIconTap,
            child: Container(
              width: AppSizes.headerIconBox,
              height: AppSizes.headerIconBox,
              margin: const EdgeInsets.only(right: AppSizes.headerGap),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius:
                    BorderRadius.circular(AppSizes.headerIconRadius),
              ),
              child: Icon(icon,
                  size: AppSizes.headerIcon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
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
        ],
      ),
    );
  }
}
