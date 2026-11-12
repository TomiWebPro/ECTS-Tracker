import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/glass.dart';
import 'package:ects_tracker/src/ui/reminder_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// Dev-mode reminder preview (ECTS-071): the feed renders what WOULD
/// notify, driven by a fake clock — the Windows-safe way to test nudges.
void main() {
  final fakeNow = DateTime(2026, 11, 11, 19, 0);

  Course course({
    required int id,
    required String name,
    required double ects,
    DateTime? deadline,
  }) =>
      Course(id: id, name: name, ectsCredits: ects, deadline: deadline);

  Future<void> pumpPreview(
    WidgetTester tester, {
    List<Course> courses = const [],
    List<StudySession> sessions = const [],
    DateTime? nowOverride,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          coursesProvider.overrideWith((ref) => Stream.value(courses)),
          sessionsProvider
              .overrideWith((ref) => Stream.value(sessions)),
          settingsProvider.overrideWith(
            (ref) => Stream.value(const AppSettings()),
          ),
          if (nowOverride != null)
            previewNowProvider.overrideWith((ref) => nowOverride),
        ],
        child: const MaterialApp(
          locale: Locale('en'),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en')],
          home: ReminderPreviewPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  // GlassCard forwards its key to the underlying Card/lens (ECTS-061), so
  // key finders match the wrapper and the surface — filter by type, like
  // glass_cards_test.dart does.
  Finder glassCardByKey(String key) => find.byWidgetPredicate(
      (w) => w is GlassCard && w.key == Key(key));

  testWidgets(
    'feed shows the daily plan due at the fake now',
    (tester) async {
      await pumpPreview(
        tester,
        courses: [
          course(id: 1, name: 'Linear Algebra', ects: 5,
              deadline: DateTime(2026, 11, 21, 19)),
        ],
        nowOverride: fakeNow,
      );
      expect(find.textContaining('Tonight:'), findsOneWidget);
      expect(glassCardByKey('reminderCard_0'), findsOneWidget);
      expect(glassCardByKey('demoRow_0'), findsOneWidget);
    },
  );

  testWidgets(
    'empty data renders the quiet state',
    (tester) async {
      await pumpPreview(tester, nowOverride: fakeNow);
      expect(find.byKey(const Key('reminderEmpty')), findsOneWidget);
      expect(find.byKey(const Key('reminderCard_0')), findsNothing);
    },
  );

  testWidgets(
    'stepping the fake clock across a deadline flips in overdue',
    (tester) async {
      await pumpPreview(
        tester,
        courses: [
          course(id: 1, name: 'Linear Algebra', ects: 5,
              deadline: DateTime(2026, 11, 13, 19)),
        ],
        nowOverride: fakeNow,
      );
      // Due in 2 days: countdown, not overdue.
      expect(find.textContaining('in 2 days'), findsOneWidget);
      expect(find.textContaining('passed its deadline'), findsNothing);

      await tester.tap(find.byKey(const Key('previewFwdDay')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('previewFwdDay')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('previewFwdDay')));
      await tester.pumpAndSettle();
      // Now 2026-11-14: past the deadline day.
      expect(find.textContaining('passed its deadline'), findsOneWidget);
    },
  );
}
