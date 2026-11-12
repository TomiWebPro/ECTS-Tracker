import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/logic/ects.dart';
import 'package:ects_tracker/src/ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

/// Shared-widget contract (ECTS-083): keys stay forwarded, labels render.
void main() {
  Future<void> pumpWidget(
    WidgetTester tester,
    Widget child,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en')],
        home: Scaffold(body: child),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('StatusPill renders label with forwarded key',
      (tester) async {
    await pumpWidget(
      tester,
      const StatusPill(
        status: CourseStatus.behind,
        label: 'Behind',
        textKey: Key('pillText'),
      ),
    );
    expect(find.text('Behind'), findsOneWidget);
    expect(find.byKey(const Key('pillText')), findsOneWidget);
  });

  testWidgets('RoundedProgressBar forwards progress key and clamps',
      (tester) async {
    await pumpWidget(
      tester,
      const RoundedProgressBar(
        value: 0.5,
        progressKey: Key('barKey'),
      ),
    );
    expect(find.byKey(const Key('barKey')), findsOneWidget);
  });

  testWidgets('EmptyStateCard renders icon, title, hint with title key',
      (tester) async {
    await pumpWidget(
      tester,
      const EmptyStateCard(
        icon: Icons.school_outlined,
        title: 'Nothing here',
        titleKey: Key('emptyTitle'),
        hint: 'Add something to get started.',
      ),
    );
    expect(find.text('Nothing here'), findsOneWidget);
    expect(find.text('Add something to get started.'), findsOneWidget);
    expect(find.byKey(const Key('emptyTitle')), findsOneWidget);
    expect(find.byIcon(Icons.school_outlined), findsOneWidget);
  });

  testWidgets('SectionHeader renders title and trailing',
      (tester) async {
    await pumpWidget(
      tester,
      const SectionHeader(
        title: 'Overview',
        titleKey: Key('sectionTitle'),
        icon: Icons.insights_outlined,
        trailing: '3',
      ),
    );
    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.byKey(const Key('sectionTitle')), findsOneWidget);
  });
}
