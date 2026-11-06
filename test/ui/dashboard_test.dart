import 'package:ects_tracker/src/models/models.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime(2026, 6, 10, 12);

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

  group('Dashboard (ECTS-009)', () {
    testWidgets('shows totals, overall progress, and per-course cards',
        (tester) async {
      final course = Course(
        id: 1,
        name: 'Math',
        ectsCredits: 5, // 150h
        deadline: DateTime(2026, 12, 1),
      );
      final sessions = [
        StudySession(
          id: 1,
          courseId: 1,
          minutes: 600, // 10h
          date: DateTime(2026, 6, 1),
        ),
      ];

      await tester.pumpWidget(app(courses: [course], sessions: sessions));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('dashboardTotals')), findsOneWidget);
      expect(find.text('10.0 h of 150 h'), findsOneWidget);
      expect(find.byKey(const Key('dashboardOverallProgress')), findsOneWidget);
      expect(find.byKey(const Key('dashboardCourseCount')), findsOneWidget);
      expect(find.text('1 course(s)'), findsOneWidget);

      expect(find.byKey(const Key('dashboardCourseCard_1')), findsOneWidget);
      expect(find.byKey(const Key('dashboardStatus_1')), findsOneWidget);
      expect(find.byKey(const Key('dashboardProgress_1')), findsOneWidget);
      expect(find.byKey(const Key('dashboardHours_1')), findsOneWidget);
      expect(find.byKey(const Key('dashboardDeadline_1')), findsOneWidget);
      expect(find.text('Math'), findsWidgets);
      expect(find.text('10.0 / 150.0 h'), findsOneWidget);
      expect(find.textContaining('Deadline 2026-12-01'), findsOneWidget);
    });

    testWidgets('shows needs-attention section for overdue and behind courses',
        (tester) async {
      final overdue = Course(
        id: 1,
        name: 'Overdue Course',
        ectsCredits: 2, // 60h
        deadline: DateTime(2026, 6, 1), // past
      );
      // Behind: tight deadline, very little progress, started in past
      final behind = Course(
        id: 2,
        name: 'Behind Course',
        ectsCredits: 10, // 300h
        startDate: DateTime(2026, 1, 1),
        deadline: DateTime(2026, 6, 20), // 10 days left
      );
      final onTrack = Course(
        id: 3,
        name: 'Done Course',
        ectsCredits: 1, // 30h
        deadline: DateTime(2026, 12, 1),
      );
      final sessions = [
        // overdue has 0h
        // behind has 5h over a long period -> behind
        StudySession(
          id: 1,
          courseId: 2,
          minutes: 300, // 5h
          date: DateTime(2026, 1, 10),
        ),
        // done course completed
        StudySession(
          id: 2,
          courseId: 3,
          minutes: 1800, // 30h
          date: DateTime(2026, 5, 1),
        ),
      ];

      await tester.pumpWidget(
        app(courses: [overdue, behind, onTrack], sessions: sessions),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('needsAttentionTitle')), findsOneWidget);
      expect(find.byKey(const Key('needsAttentionCard_1')), findsOneWidget);
      expect(find.byKey(const Key('needsAttentionCard_2')), findsOneWidget);
      // onTrack/completed should not appear as needs-attention card
      expect(find.byKey(const Key('needsAttentionCard_3')), findsNothing);
      expect(find.text('Overdue'), findsWidgets);

      // All courses appear in per-course cards list (scroll if needed).
      for (final id in [1, 2, 3]) {
        await tester.scrollUntilVisible(
          find.byKey(Key('dashboardCourseCard_$id')),
          200,
          scrollable: find.byType(Scrollable).first,
        );
        expect(find.byKey(Key('dashboardCourseCard_$id')), findsOneWidget);
      }
    });

    testWidgets('shows no-courses state without needs-attention section',
        (tester) async {
      await tester.pumpWidget(app(courses: const [], sessions: const []));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('dashboardTotals')), findsOneWidget);
      expect(find.text('0.0 h of 0 h'), findsOneWidget);
      expect(find.byKey(const Key('dashboardNoCourses')), findsOneWidget);
      expect(find.byKey(const Key('needsAttentionTitle')), findsNothing);
    });
  });
}
