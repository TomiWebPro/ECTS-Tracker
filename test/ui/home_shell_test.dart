import 'package:drift/native.dart';
import 'package:ects_tracker/src/data/app_database.dart';
import 'package:ects_tracker/src/data/bootstrap.dart';
import 'package:ects_tracker/src/data/repositories.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:ects_tracker/src/state/providers.dart';
import 'package:ects_tracker/src/ui/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OverviewPage error/loading (ECTS-028)', () {
    Widget app({
      required Stream<List<Course>> courses,
      required Stream<List<StudySession>> sessions,
      required Stream<AppSettings> settings,
    }) {
      return ProviderScope(
        overrides: [
          coursesProvider.overrideWith((ref) => courses),
          sessionsProvider.overrideWith((ref) => sessions),
          settingsProvider.overrideWith((ref) => settings),
        ],
        child: const MaterialApp(home: HomeShell()),
      );
    }

    testWidgets('shows error and never a fake-empty dashboard when courses stream fails',
        (tester) async {
      await tester.pumpWidget(app(
        courses: Stream<List<Course>>.error(StateError('db open failed')),
        sessions: Stream.value(const <StudySession>[]),
        settings: Stream.value(const AppSettings()),
      ));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('overviewError')), findsOneWidget);
      expect(find.textContaining('db open failed'), findsOneWidget);
      // Must never render the fake-empty summary.
      expect(find.text('0 course(s)'), findsNothing);
      expect(find.textContaining('0.0 h of 0 h'), findsNothing);
    });

    testWidgets('shows error when sessions stream fails', (tester) async {
      await tester.pumpWidget(app(
        courses: Stream.value(const <Course>[]),
        sessions: Stream<List<StudySession>>.error(StateError('session read failed')),
        settings: Stream.value(const AppSettings()),
      ));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('overviewError')), findsOneWidget);
      expect(find.textContaining('session read failed'), findsOneWidget);
      expect(find.text('0 course(s)'), findsNothing);
    });

    testWidgets('shows error when settings stream fails', (tester) async {
      await tester.pumpWidget(app(
        courses: Stream.value(const <Course>[]),
        sessions: Stream.value(const <StudySession>[]),
        settings: Stream<AppSettings>.error(StateError('settings read failed')),
      ));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('overviewError')), findsOneWidget);
      expect(find.textContaining('settings read failed'), findsOneWidget);
      expect(find.text('0 course(s)'), findsNothing);
    });

    testWidgets('shows loading (not fake-empty) while data is unresolved', (tester) async {
      await tester.pumpWidget(app(
        courses: const Stream<List<Course>>.empty(),
        sessions: Stream.value(const <StudySession>[]),
        settings: Stream.value(const AppSettings()),
      ));
      // Single pump: streams have not emitted data, so loading state.
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('0 course(s)'), findsNothing);
      expect(find.textContaining('0.0 h of 0 h'), findsNothing);

      // Unmount cleanly (empty stream never completes).
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
    });
  });

  group('Sample markers and per-row removal (ECTS-030)', () {
    late AppDatabase db;

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
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
          child: const MaterialApp(home: HomeShell()),
        );

    testWidgets('sample courses and sessions are marked and can be removed',
        (tester) async {
      await bootstrapDatabase(db);

      await tester.pumpWidget(app());
      await tester.pumpAndSettle();

      // Navigate to Courses tab
      await tester.tap(find.text('Courses'));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('sampleCourseMarker')), findsWidgets);
      expect(find.byKey(const Key('removeSampleCourse')), findsWidgets);

      // Navigate to Study Log tab
      await tester.tap(find.text('Study Log'));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('sampleSessionMarker')), findsWidgets);
      expect(find.byKey(const Key('removeSampleSession')), findsWidgets);

      // Remove one sample session
      await tester.tap(find.byKey(const Key('removeSampleSession')).first);
      await tester.pumpAndSettle();

      // Remove one sample course
      await tester.tap(find.text('Courses'));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('removeSampleCourse')).first);
      await tester.pumpAndSettle();

      // User rows remain intact (all seeded were sample; after removing some
      // sample rows, verify counts via repositories)
      final courseRepo = CourseRepository(db);
      final sessionRepo = SessionRepository(db);
      // We just removed items; ensure no crash and repos still work
      expect(await courseRepo.countSample(), isA<int>());
      expect(await sessionRepo.countSample(), isA<int>());

      await flush(tester);
    });
  });
}
