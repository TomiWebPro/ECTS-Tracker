import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Session history/edit/delete + totals (ECTS-007)', () {
    late AppDatabase db;
    late int courseId;
    final now = DateTime(2026, 11, 6, 12); // Fri

    setUp(() async {
      db = AppDatabase(NativeDatabase.memory());
      final repo = CourseRepository(db);
      final add = await repo.addCourse(name: 'Algorithms', ectsCredits: 5);
      courseId = (add as Ok<int>).value;
    });

    tearDown(() async {
      await db.close();
    });

    Future<void> flush(WidgetTester tester) async {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
    }

    Widget app() => ProviderScope(
          overrides: [databaseProvider.overrideWithValue(db)],
          child: MaterialApp(home: HomeShell(now: now)),
        );

    Future<void> goToStudyLog(WidgetTester tester) async {
      await tester.tap(find.text('Study Log'));
      await tester.pumpAndSettle();
    }

    testWidgets('shows daily/weekly totals and session history', (tester) async {
      final sessionRepo = SessionRepository(db);
      await sessionRepo.addSession(
        courseId: courseId,
        minutes: 60,
        date: DateTime(2026, 11, 6), // today
      );
      await sessionRepo.addSession(
        courseId: courseId,
        minutes: 30,
        date: DateTime(2026, 11, 2), // Mon same week
      );
      await sessionRepo.addSession(
        courseId: courseId,
        minutes: 45,
        date: DateTime(2026, 11, 1), // previous week
      );

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToStudyLog(tester);

      expect(find.byKey(const Key('studyTotalsCard')), findsOneWidget);
      expect(find.byKey(const Key('dailyTotal')), findsOneWidget);
      expect(find.byKey(const Key('weeklyTotal')), findsOneWidget);
      // daily = 1.0h (today only), weekly = 1.5h (Mon+Fri)
      expect(
        tester.widget<Text>(find.byKey(const Key('dailyTotal'))).data,
        '1.0 h',
      );
      expect(
        tester.widget<Text>(find.byKey(const Key('weeklyTotal'))).data,
        '1.5 h',
      );

      // History shows sessions (sorted newest first by UI) - all present.
      expect(find.byKey(const Key('studyLogList')), findsOneWidget);
      expect(find.textContaining('1.0 h'), findsWidgets);
      await flush(tester);
    });

    testWidgets('edits a user session and updates totals/history', (tester) async {
      final sessionRepo = SessionRepository(db);
      final add = await sessionRepo.addSession(
        courseId: courseId,
        minutes: 60,
        date: DateTime(2026, 11, 6),
        notes: 'Old',
      );
      final sessionId = (add as Ok<int>).value;

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToStudyLog(tester);

      // Open menu and edit.
      await tester.tap(find.byKey(Key('sessionMenu_$sessionId')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.text('Edit study session'), findsOneWidget);
      await tester.enterText(find.byKey(const Key('sessionHoursField')), '2');
      await tester.enterText(find.byKey(const Key('sessionMinutesField')), '0');
      await tester.enterText(find.byKey(const Key('sessionNotesField')), 'New');
      await tester.tap(find.byKey(const Key('saveSessionButton')));
      await tester.pumpAndSettle();

      final row = await (db.select(db.studySessions)
            ..where((t) => t.id.equals(sessionId)))
          .getSingle();
      expect(row.minutes, 120);
      expect(row.notes, 'New');

      expect(
        tester.widget<Text>(find.byKey(const Key('dailyTotal'))).data,
        '2.0 h',
      );
      await flush(tester);
    });

    testWidgets('deletes a user session with confirmation', (tester) async {
      final sessionRepo = SessionRepository(db);
      final add = await sessionRepo.addSession(
        courseId: courseId,
        minutes: 90,
        date: DateTime(2026, 11, 6),
      );
      final sessionId = (add as Ok<int>).value;

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();
      await goToStudyLog(tester);

      await tester.tap(find.byKey(Key('sessionMenu_$sessionId')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.text('Delete session?'), findsOneWidget);
      await tester.tap(find.byKey(const Key('confirmDeleteSession')));
      await tester.pumpAndSettle();

      final rows = await db.select(db.studySessions).get();
      expect(rows, isEmpty);
      expect(find.byKey(const Key('studyLogEmpty')), findsOneWidget);
      await flush(tester);
    });
  });
}
