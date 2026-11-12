/// Global size system for ECTS Tracker.
///
/// Edit values here to resize the app. No other file should contain
/// hardcoded paddings, radii, icon sizes, bar heights or widths for
/// layout — import this file and reference [AppSizes] instead.
///
/// Keep everything `static const` so it can be used inside `const`
/// constructors. To make the whole UI denser/roomier, adjust the
/// values in one place instead of hunting through widgets.
abstract final class AppSizes {
  // ------------------------------------------------------------------
  // Page scaffold
  // ------------------------------------------------------------------
  static const double maxContentWidth = 760.0;

  static const double pageHPad = 16.0;
  static const double pageTopPad = 12.0;
  static const double pageBottomPad = 96.0;

  /// Bottom padding for pages WITHOUT a floating action button (Dashboard,
  /// Statistics, Settings). The Scaffold's docked NavigationBar already
  /// reserves its own space, so these pages only need breathing room —
  /// using [pageBottomPad] (FAB clearance) here leaves a dead gap that
  /// forces a scrollbar on screens that would otherwise fit.
  static const double pageBottomPadNoFab = 24.0;

  static const double dashboardTopPad = 16.0;

  static const double sectionGap = 16.0;
  static const double sectionInnerGap = 8.0;
  static const double cardGap = 8.0;

  // ------------------------------------------------------------------
  // Cards
  // ------------------------------------------------------------------
  static const double cardRadius = 20.0;
  static const double cardPadding = 16.0;
  static const double cardElevation = 1.0;

  static const double innerRadius = 12.0;
  static const double innerHPad = 10.0;
  static const double innerVPad = 8.0;

  static const double emptyIconBox = 56.0;
  static const double emptyIconRadius = 18.0;
  static const double emptyIcon = 28.0;
  static const double emptyGap = 12.0;
  static const double emptySmallGap = 4.0;
  static const double emptyVPadding = 28.0;
  static const double emptyHPadding = 20.0;

  // ------------------------------------------------------------------
  // Pills / badges
  // ------------------------------------------------------------------
  static const double pillRadius = 999.0;
  static const double pillHPad = 10.0;
  static const double pillVPad = 6.0;
  static const double pillIcon = 14.0;
  static const double pillGap = 5.0;

  // ------------------------------------------------------------------
  // Avatars
  // ------------------------------------------------------------------
  static const double avatarRadius = 20.0;
  static const double avatarFont = 14.0;

  // ------------------------------------------------------------------
  // Section headers
  // ------------------------------------------------------------------
  static const double headerTopPad = 4.0;
  static const double headerBottomPad = 10.0;
  static const double headerIconBox = 36.0;
  static const double headerIconRadius = 12.0;
  static const double headerIcon = 19.0;
  static const double headerGap = 10.0;
  static const double headerCountHPad = 10.0;
  static const double headerCountVPad = 5.0;

  // ------------------------------------------------------------------
  // Stat tiles (Today / This week)
  // ------------------------------------------------------------------
  static const double statBox = 40.0;
  static const double statRadius = 12.0;
  static const double statIcon = 20.0;
  static const double statGap = 10.0;
  static const double statLabelGap = 2.0;

  // ------------------------------------------------------------------
  // Filter dropdowns
  // ------------------------------------------------------------------
  static const double filterHPad = 12.0;
  static const double filterVPad = 4.0;
  static const double filterRadius = 12.0;
  static const double filterIcon = 18.0;
  static const double filterGap = 6.0;

  // ------------------------------------------------------------------
  // App chrome (AppBar / Nav / FAB / Dialog / ListTile)
  // ------------------------------------------------------------------
  static const double appBarHeight = 64.0;
  static const double appBarActionPad = 8.0;
  static const double appBarActionRadius = 12.0;
  static const double appBarActionIcon = 20.0;

  static const double navHeight = 76.0;

  static const double fabRadius = 16.0;
  static const double fabHPad = 18.0;
  static const double fabVPad = 12.0;
  static const double fabIconGap = 8.0;

  static const double dialogRadius = 24.0;
  static const double chipRadius = 10.0;

  static const double listTileHPad = 16.0;
  static const double listTileVPad = 6.0;
  static const double listTileRadius = 16.0;

  static const double dividerSpace = 20.0;

  // ------------------------------------------------------------------
  // Hero (dashboard Today card)
  // ------------------------------------------------------------------
  static const double heroRadius = 20.0;
  static const double heroPadding = 18.0;
  static const double heroIconBox = 44.0;
  static const double heroIconRadius = 14.0;
  static const double heroIcon = 24.0;
  static const double heroGap = 12.0;
  static const double heroTitleGap = 2.0;
  static const double heroAfterHeadGap = 14.0;
  static const double heroAfterPaceGap = 8.0;
  static const double heroBoxHPad = 10.0;
  static const double heroBoxVPad = 8.0;
  static const double heroBoxRadius = 12.0;
  static const double heroDot = 8.0;
  static const double heroDotGap = 8.0;
  static const double heroValueGap = 8.0;
  static const double heroRowVPad = 2.0;
  static const double heroTipGap = 8.0;
  static const double heroTipIcon = 16.0;
  static const double heroTipIconGap = 6.0;
  static const double heroBarSectionGap = 12.0;
  static const double heroBarLabelGap = 6.0;
  static const double heroTodayBar = 10.0;
  static const double heroProgramBar = 6.0;
  static const double heroAfterBarsGap = 8.0;

  // ------------------------------------------------------------------
  // Project logo (assets/images/ects-tracker-logo.{svg,png}, bg #FAF9F4)
  // ------------------------------------------------------------------
  static const double logoDefault = 44.0;
  static const double logoRadius = 14.0;
  static const double logoAppBar = 36.0;
  static const double logoAppBarRadius = 10.0;

  // ------------------------------------------------------------------
  // Progress bars
  // ------------------------------------------------------------------
  static const double barDefault = 8.0;
  static const double barDashboard = 8.0;
  static const double barCourse = 8.0;

  // ------------------------------------------------------------------
  // Dashboard / course / study-log cards
  // ------------------------------------------------------------------
  static const double dashboardCardPad = 16.0;
  static const double dashboardTitleGap = 12.0;
  static const double dashboardBarGap = 10.0;
  static const double dashboardRowGap = 8.0;
  static const double dashboardSmallGap = 6.0;
  static const double dashboardIcon = 16.0;
  static const double dashboardIconGap = 6.0;
  static const double dashboardPaceHPad = 10.0;
  static const double dashboardPaceVPad = 8.0;
  static const double dashboardPaceRadius = 12.0;
  static const double dashboardPaceIcon = 16.0;

  static const double coursePadH = 16.0;
  static const double coursePadV = 8.0;
  static const double courseTitleGap = 4.0;
  static const double courseMetaGap = 8.0;
  static const double courseBarGap = 8.0;
  static const double coursePaceGap = 6.0;
  static const double courseIcon = 16.0;

  static const double studyTotalsHPad = 16.0;
  static const double studyTotalsVPad = 14.0;
  static const double studyDividerH = 40.0;
  static const double studyDividerGap = 12.0;
  static const double studyRowHPad = 14.0;
  static const double studyHourHPad = 9.0;
  static const double studyHourVPad = 4.0;

  // ------------------------------------------------------------------
  // Course color selector (Add/Edit course dialog)
  // ------------------------------------------------------------------
  static const double colorOptionSpacing = 8.0;
  static const double colorOptionRunSpacing = 8.0;
  static const double colorSwatchW = 24.0;
  static const double colorSwatchH = 16.0;

  // ------------------------------------------------------------------
  // Liquid glass floating chrome (ECTS-062)
  // ------------------------------------------------------------------
  /// Floating tab-bar capsule size. Height 68 (not the 62 component
  /// default): five labeled tabs need the extra cell height — the
  /// default icon size overflows a 62-pt bar by 3 px (probe ECTS-062).
  /// Glyph size 24 follows the package's own tab-bar example.
  static const double glassTabWidth = 328.0;
  static const double glassTabHeight = 68.0;
  static const double glassTabIconSize = 24.0;

  /// Gap between floating chrome and the screen edges / page body.
  static const double glassChromeGap = 8.0;

  /// Bottom offset of the floating tab bar (safe-area inset applies
  /// on top of this via the enclosing SafeArea).
  static const double glassTabBottomMargin = 24.0;

  /// Floating app-bar height (LiquidGlassAppBar default) + width clamps
  /// for the responsive bar width.
  static const double glassBarHeight = 56.0;
  static const double glassBarMinWidth = 280.0;
  static const double glassBarMaxWidth = 520.0;

  /// Leading inset + title size inside the floating app bar (match the
  /// legacy AppBar look).
  static const double glassBarLeadingPad = 12.0;
  static const double glassBarTitleSize = 26.0;

  /// FAB bottom offset in glass mode: clears the floating tab bar
  /// (glassTabBottomMargin + glassTabHeight + glassChromeGap = 100).
  static const double glassFabLift = 100.0;

  /// Page insets so the first/last content clears the floating chrome:
  /// top clears the app bar (glassBarHeight + 2 x glassChromeGap = 72),
  /// bottom clears the tab bar (glassTabHeight + glassTabBottomMargin
  /// + glassChromeGap + breathing room = 108).
  static const double glassPageTopInset = 72.0;
  static const double glassPageBottomInset = 108.0;

  // ------------------------------------------------------------------
  // Liquid glass Apple polish (ECTS-074/074b, glass-only).
  //
  // Apple-style air: larger gaps so frosted cards breathe. Legacy values
  // above stay untouched — these are picked only when the glass gate is
  // on (see home_shell.dart ternaries). ECTS-074b: 12px still read as
  // touching once the margin-outside fix landed, so step up to 16/24/16.
  // ------------------------------------------------------------------
  static const double glassCardGap = 16.0;
  static const double glassSectionGap = 24.0;
  static const double glassSectionInnerGap = 16.0;
  static const double glassPageTopPad = 20.0;
  static const double glassDashboardTopPad = 24.0;

  // Apple-style menus (glass-only): rounded frosted overlays.
  static const double glassMenuRadius = 18.0;
  static const double glassMenuElevation = 12.0;
  static const double glassMenuItemVPad = 10.0;
  static const double glassMenuItemHPad = 12.0;
  static const double glassMenuMaxHeight = 340.0;
}
