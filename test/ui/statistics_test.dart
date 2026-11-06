import 'package:ects_tracker/src/models/models.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 11, 6, 12);

  Widget app({
    required List<Course> courses,
    required List<StudySession> sessions,
    AppSettings settings = const AppSettings(),
  }) {
    return ProviderScope(
      overrides: [
        coursesProvider.overrideWith((ref) => Stream.value(courses)),
        sessionsProvider.overrideWith((ref) => Stream.value(sessions)),
        settingsProvider.overrideWith((ref) => Stream.value(settings)),
      ],
      child: MaterialApp(home: HomeShell(now: now)),
    );
  }

  testWidgets('Statistics page shows overview and per-course stats', (tester) async {
    final course = Course(
      id: 1,
      name: 'Math',
      ectsCredits: 5,
    );
    final sessions = [
      StudySession(id: 1, courseId: 1, minutes: 120, date: DateTime(2026, 11, 6)),
      StudySession(id: 2, courseId: 1, minutes: 60, date: DateTime(2026, 11, 5)),
    ];

    await tester.pumpWidget(app(courses: [course], sessions: sessions));
    await tester.pumpAndSettle();

    // Navigate to Statistics tab
    await tester.tap(find.byIcon(Icons.bar_chart));
    await tester.pumpAndSettle();

    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Last 7 days'), findsOneWidget);
    expect(find.text('Last 30 days'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Per course'), 100);
    expect(find.text('Per course'), findsOneWidget);
    expect(find.text('Math'), findsWidgets);
  });
}
