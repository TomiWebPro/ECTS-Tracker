import 'dart:math';

import 'package:ects_tracker/src/dev/stress_seed.dart';
import 'package:ects_tracker/src/logic/course_list.dart';
import 'package:ects_tracker/src/logic/ects.dart';
import 'package:ects_tracker/src/logic/statistics.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

/// Test-only adapters from pump drafts to domain models.
List<Course> _pumpCourses(StressPayload payload) => [
      for (var i = 0; i < payload.courses.length; i++)
        Course(
          id: i + 1,
          name: payload.courses[i].name,
          ectsCredits: payload.courses[i].ectsCredits,
          startDate: payload.courses[i].startDate,
          deadline: payload.courses[i].deadline,
          startEarly: payload.courses[i].startEarly,
        ),
    ];

List<StudySession> _pumpSessions(StressPayload payload) => [
      for (var k = 0; k < payload.sessions.length; k++)
        StudySession(
          id: k + 1,
          courseId: payload.sessions[k].courseIndex + 1,
          minutes: payload.sessions[k].minutes,
          date: payload.sessions[k].date,
        ),
    ];

void main() {
  group('buildStressPayload', () {
    test('produces requested counts and covers every loggable course', () {
      final payload = buildStressPayload(
        random: Random(42),
        now: DateTime(2026, 11, 7),
        courseCount: 10,
        sessionCount: 200,
      );
      expect(payload.courses, hasLength(10));
      expect(payload.sessions, hasLength(200));
      final covered = payload.sessions.map((s) => s.courseIndex).toSet();
      // Every course except untracked upcoming ones gets sessions.
      final loggable = <int>[];
      for (var i = 0; i < payload.courses.length; i++) {
        final c = payload.courses[i];
        final future =
            c.startDate != null && c.startDate!.isAfter(DateTime(2026, 11, 7));
        if (!future || c.startEarly) loggable.add(i);
      }
      expect(covered, hasLength(loggable.length));
      for (final i in loggable) {
        expect(covered, contains(i));
      }
      // Untracked upcoming courses get zero sessions.
      for (var i = 0; i < payload.courses.length; i++) {
        final c = payload.courses[i];
        final future =
            c.startDate != null && c.startDate!.isAfter(DateTime(2026, 11, 7));
        if (future && !c.startEarly) {
          expect(covered, isNot(contains(i)));
        }
      }
    });

    test('is deterministic for the same seed', () {
      final a = buildStressPayload(random: Random(7), now: DateTime(2026, 11, 7));
      final b = buildStressPayload(random: Random(7), now: DateTime(2026, 11, 7));
      expect(
        a.sessions.map((s) => (s.courseIndex, s.minutes)).toList(),
        b.sessions.map((s) => (s.courseIndex, s.minutes)).toList(),
      );
      expect(
        a.courses
            .map((c) => (c.name, c.ectsCredits, c.startEarly))
            .toList(),
        b.courses
            .map((c) => (c.name, c.ectsCredits, c.startEarly))
            .toList(),
      );
    });

    test('courses look real: named picks, valid ECTS, sane timelines', () {
      final payload = buildStressPayload(
        random: Random(99),
        now: DateTime(2026, 11, 7),
        courseCount: 12,
        sessionCount: 300,
      );
      final names = payload.courses.map((c) => c.name).toList();
      // Unique, prefixed for cleanup, from the real name list.
      expect(names.toSet(), hasLength(12));
      for (final n in names) {
        expect(n.startsWith(stressCoursePrefix), isTrue);
        final base = n.substring(stressCoursePrefix.length);
        expect(
          stressCourseNames.any((real) => base.startsWith(real)),
          isTrue,
          reason: 'unexpected name: $n',
        );
      }
      for (final c in payload.courses) {
        expect(stressEctsOptions, contains(c.ectsCredits));
        expect(c.startDate, isNotNull);
        expect(c.deadline, isNotNull);
        expect(c.deadline!.isAfter(c.startDate!), isTrue);
        final future =
            c.startDate!.isAfter(DateTime(2026, 11, 7));
        if (future) {
          // Future starts are near-term (1–6 weeks out).
          expect(
            c.startDate!.difference(DateTime(2026, 11, 7)).inDays,
            inInclusiveRange(1, 42),
          );
        } else {
          // Started within the last 12 weeks.
          expect(
            DateTime(2026, 11, 7).difference(c.startDate!).inDays,
            inInclusiveRange(0, stressHistoryDays),
          );
        }
      }
      // Exactly two future-start courses: one tracked, one untracked.
      final futureOnes =
          payload.courses.where((c) => c.startDate!.isAfter(DateTime(2026, 11, 7))).toList();
      expect(futureOnes, hasLength(2));
      expect(futureOnes.where((c) => c.startEarly), hasLength(1));
      expect(futureOnes.where((c) => !c.startEarly), hasLength(1));
    });

    test('sessions span 12 weeks with daytime hours and valid refs', () {
      final now = DateTime(2026, 11, 7);
      final endOfToday = DateTime(2026, 11, 8);
      final payload = buildStressPayload(
        random: Random(123),
        now: now,
        courseCount: 8,
        sessionCount: 400,
      );
      var earliest = now;
      for (final s in payload.sessions) {
        expect(s.courseIndex, inInclusiveRange(0, 7));
        expect(s.minutes, greaterThan(0));
        // Nothing beyond today.
        expect(s.date.isAfter(endOfToday), isFalse);
        if (s.date.isBefore(earliest)) earliest = s.date;
        // Daytime study hours, quarter-hour starts.
        expect(s.date.hour, inInclusiveRange(0, 23));
        expect([0, 15, 30, 45], contains(s.date.minute));
        // No session before its course started (start-early courses may
        // log ahead of their official start).
        final loggedCourse = payload.courses[s.courseIndex];
        final start = loggedCourse.startDate;
        if (start != null && !loggedCourse.startEarly) {
          expect(s.date.isBefore(start), isFalse);
        }
      }
      // 12 weeks of history is actually covered.
      expect(now.difference(earliest).inDays, greaterThanOrEqualTo(70));
    });
    test('generates tracked and untracked future courses', () {
      // Across many seeds: exactly two future-start courses — one
      // start-early (tracked in Today's pace), one plain (Upcoming).
      for (var seed = 0; seed < 10; seed++) {
        final payload = buildStressPayload(
          random: Random(seed),
          now: DateTime(2026, 11, 7),
          courseCount: 12,
          sessionCount: 120,
        );
        final futureOnes = payload.courses
            .where((c) =>
                c.startDate != null &&
                c.startDate!.isAfter(DateTime(2026, 11, 7)))
            .toList();
        expect(futureOnes, hasLength(2), reason: 'seed $seed');
        expect(futureOnes.where((c) => c.startEarly), hasLength(1));
        expect(futureOnes.where((c) => !c.startEarly), hasLength(1));
        for (final c in futureOnes) {
          expect(c.deadline!.isAfter(c.startDate!), isTrue);
        }
      }
    });
  });

  group('workload model coherence', () {
    test('semester shares one window with a plausible ECTS total', () {
      for (var seed = 0; seed < 5; seed++) {
        final payload = buildStressPayload(
          random: Random(seed),
          now: DateTime(2026, 11, 7),
          courseCount: 10,
          sessionCount: 800,
        );
        final now = DateTime(2026, 11, 7);
        final started = payload.courses
            .where((c) =>
                c.startDate != null && !c.startDate!.isAfter(now))
            .toList();
        // 10 courses minus the 2 converted futures.
        expect(started, hasLength(8), reason: 'seed $seed');
        // One shared semester: starts cluster within ~3 weeks …
        final startDays = started
            .map((c) => now.difference(c.startDate!).inDays)
            .toList()
          ..sort();
        expect(startDays.last - startDays.first, lessThanOrEqualTo(21),
            reason: 'seed $seed');
        // … and non-overdue deadlines cluster within ~4 weeks.
        final deadlines = started
            .where((c) => !c.deadline!.isBefore(now))
            .map((c) => c.deadline!)
            .toList();
        expect(deadlines.length, greaterThanOrEqualTo(6),
            reason: 'seed $seed');
        deadlines.sort();
        expect(
            deadlines.last.difference(deadlines.first).inDays,
            lessThanOrEqualTo(28),
            reason: 'seed $seed');
        // Full-time semester territory, not an impossible mega-load.
        final totalEcts =
            started.fold(0.0, (sum, c) => sum + c.ectsCredits);
        expect(totalEcts, inInclusiveRange(12.0, 55.0),
            reason: 'seed $seed total=$totalEcts');
      }
    });

    test('logged hours land near each course workload target', () {
      for (var seed = 0; seed < 10; seed++) {
        final now = DateTime(2026, 11, 7);
        final payload = buildStressPayload(
          random: Random(seed),
          now: now,
          courseCount: 10,
          sessionCount: 800,
        );
        final logged = List<int>.filled(payload.courses.length, 0);
        for (final s in payload.sessions) {
          logged[s.courseIndex] += s.minutes;
        }
        for (var i = 0; i < payload.courses.length; i++) {
          final c = payload.courses[i];
          final requiredMin = c.ectsCredits * 30 * 60;
          final frac = logged[i] / requiredMin;
          final isFuture = c.startDate!.isAfter(now);
          if (isFuture && !c.startEarly) {
            expect(logged[i], 0, reason: 'seed $seed course $i');
          } else if (isFuture && c.startEarly) {
            // A few hours of early prep, not a full workload.
            expect(logged[i], inInclusiveRange(60, 720),
                reason: 'seed $seed course $i');
          } else {
            expect(frac, inInclusiveRange(0.05, 1.0),
                reason: 'seed $seed course $i frac=$frac');
          }
        }
      }
    });

    test('pump covers several dashboard statuses', () {
      for (var seed = 0; seed < 5; seed++) {
        final now = DateTime(2026, 11, 7);
        final payload = buildStressPayload(
          random: Random(seed),
          now: now,
          courseCount: 10,
          sessionCount: 800,
        );
        final items = coursesWithProgress(
          _pumpCourses(payload),
          _pumpSessions(payload),
          hoursPerEcts: 30,
          now: now,
        );
        final started =
            items.where((e) => !isScheduledCourse(e.course, now)).toList();
        final statuses = started.map((e) => e.progress.status).toSet();
        expect(statuses.length, greaterThanOrEqualTo(3),
            reason: 'seed $seed: $statuses');
        expect(statuses, contains(CourseStatus.overdue),
            reason: 'seed $seed');
      }
      // Across seeds the archetypes produce the full behind/onTrack/ahead mix.
      final seen = <CourseStatus>{};
      for (var seed = 0; seed < 5; seed++) {
        final now = DateTime(2026, 11, 7);
        final payload = buildStressPayload(
          random: Random(seed),
          now: now,
          courseCount: 10,
          sessionCount: 800,
        );
        final items = coursesWithProgress(
          _pumpCourses(payload),
          _pumpSessions(payload),
          hoursPerEcts: 30,
          now: now,
        );
        for (final e in items) {
          if (!isScheduledCourse(e.course, now)) seen.add(e.progress.status);
        }
      }
      expect(seen,
          containsAll([CourseStatus.behind, CourseStatus.onTrack]));
    });

    test('study days favour weekdays over weekends', () {
      final payload = buildStressPayload(
        random: Random(11),
        now: DateTime(2026, 11, 7),
        courseCount: 10,
        sessionCount: 800,
      );
      var weekday = 0;
      var saturday = 0;
      var sunday = 0;
      for (final s in payload.sessions) {
        if (s.date.weekday == DateTime.sunday) {
          sunday++;
        } else if (s.date.weekday == DateTime.saturday) {
          saturday++;
        } else {
          weekday++;
        }
      }
      expect(weekday, greaterThan(saturday));
      expect(saturday, greaterThan(sunday));
      expect(sunday / payload.sessions.length, lessThan(0.12));
    });

    test('coming-load forecast peaks at a believable full-time level', () {
      final now = DateTime(2026, 11, 7);
      final payload = buildStressPayload(
        random: Random(7),
        now: now,
        courseCount: 10,
        sessionCount: 800,
      );
      final items = coursesWithProgress(
        _pumpCourses(payload),
        _pumpSessions(payload),
        hoursPerEcts: 30,
        now: now,
      );
      final forecast = forecastWeeklyLoad(items, now: now, weeks: 8);
      expect(forecast, hasLength(8));
      final peak =
          forecast.map((w) => w.hours).reduce((a, b) => a > b ? a : b);
      // A full-time semester crunches at tens of h/week — never near zero,
      // never hundreds.
      expect(peak, inInclusiveRange(5.0, 120.0));
    });
  });
}
