import 'package:ects_tracker/src/ui/app_sizes.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';

/// ECTS-068: the floating tab bar used a fixed 328-pt width while the package
/// centers its capsule with a computed `(parentWidth - width) / 2` inset, so
/// any window narrower than the bar made that inset negative and tripped
/// RenderPadding's `isNonNegative` assert on the Impeller morph-pill path
/// (Windows crash + cascading lifecycle/Duplicate-GlobalKey errors).
/// The bar width now clamps to the available width.
void main() {
  group('glassTabBarWidthFor', () {
    test('wide window keeps the full bar', () {
      expect(glassTabBarWidthFor(1280), AppSizes.glassTabWidth);
      expect(glassTabBarWidthFor(800), AppSizes.glassTabWidth);
    });

    test('bar plus side margins keeps the full bar', () {
      expect(
        glassTabBarWidthFor(
            AppSizes.glassTabWidth + AppSizes.pageHPad * 2),
        AppSizes.glassTabWidth,
      );
    });

    test('narrow window shrinks the bar to fit', () {
      expect(glassTabBarWidthFor(300), 300 - AppSizes.pageHPad * 2);
    });

    test('tiny window never goes negative', () {
      expect(glassTabBarWidthFor(0), 0.0);
      expect(glassTabBarWidthFor(10), 0.0);
    });

    test('unbounded constraints keep the full bar', () {
      expect(glassTabBarWidthFor(double.infinity), AppSizes.glassTabWidth);
    });
  });

  group('morph-pill bar at narrow width (regression)', () {
    Future<void> pumpClampedBar(WidgetTester tester, double surfaceWidth) async {
      await tester.binding.setSurfaceSize(Size(surfaceWidth, 700));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      final bar = LiquidGlassTabBar(
        items: const [
          LiquidGlassTabBarItem(icon: Icons.dashboard, label: 'Dashboard'),
          LiquidGlassTabBarItem(icon: Icons.book, label: 'Courses'),
          LiquidGlassTabBarItem(icon: Icons.timer, label: 'Study Log'),
          LiquidGlassTabBarItem(icon: Icons.bar_chart, label: 'Statistics'),
          LiquidGlassTabBarItem(icon: Icons.settings, label: 'Settings'),
        ],
        selectedIndex: 0,
        onChanged: (_) {},
        pillStyle: const LiquidGlassTabPillStyle(
          mode: LiquidGlassPillMode.impellerOnly,
        ),
        itemStyle: const LiquidGlassTabItemStyle(
          iconSize: AppSizes.glassTabIconSize,
        ),
        width: glassTabBarWidthFor(surfaceWidth),
        height: AppSizes.glassTabHeight,
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.only(
          bottom: AppSizes.glassTabBottomMargin,
        ),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: bar.buildGlassPillBar(body: const SizedBox.expand()),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));
      expect(tester.takeException(), isNull);
    }

    testWidgets('300-pt window lays out without padding asserts',
        (tester) async {
      await pumpClampedBar(tester, 300);
    });

    testWidgets('360-pt window keeps the full bar without asserts',
        (tester) async {
      await pumpClampedBar(tester, 360);
    });
  });
}
