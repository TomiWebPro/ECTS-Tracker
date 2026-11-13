import 'package:ects_tracker/l10n/app_localizations.dart';
import 'package:ects_tracker/src/logic/reminders.dart';
import 'package:ects_tracker/src/models/models.dart';
import 'package:ects_tracker/src/notifications/reminder_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

final DateTime now = DateTime(2026, 11, 11, 19, 0);

AppLocalizations l10nFor(String code) =>
    lookupAppLocalizations(Locale(code));

Course course({
  required int id,
  required String name,
  required double ects,
  DateTime? deadline,
}) =>
    Course(id: id, name: name, ectsCredits: ects, deadline: deadline);

void main() {
  final en = l10nFor('en');

  group('notifDuration', () {
    test('sub-hour renders whole minutes, hours stay trimmed', () {
      expect(notifDuration(en, 0.7), '42 min');
      expect(notifDuration(en, 27.0), '27 h');
      expect(notifDuration(en, 2.5), '2.5 h');
    });
  });

  group('localizeReminder (en renders the v1 copy)', () {
    test('daily plan localizes title, body and folded suffix', () {
      final plan = computeDailyPlan(
        courses: [
          course(id: 1, name: 'A', ects: 5,
              deadline: DateTime(2026, 11, 21, 19)),
          course(id: 2, name: 'B', ects: 4,
              deadline: DateTime(2026, 11, 21, 19)),
          course(id: 3, name: 'C', ects: 3,
              deadline: DateTime(2026, 11, 21, 19)),
        ],
        sessions: const [],
        hoursPerEcts: 30,
        now: now,
      )!;
      final text = localizeReminder(en, plan);
      expect(text.title, plan.title);
      expect(text.title, '📚 Tonight: 36 h to stay on track');
      expect(text.body, contains('(+1 more)'));
    });

    test('behind variants keep the honest catch-up figure', () {
      // catchUp carries the display (rounded-up) figure the English copy
      // uses — producers store it post-rounding, never the raw bisection.
      const base = ReminderContent(
        kind: ReminderKind.behind,
        title: 'x',
        body: 'y',
        messageId: 'behindPace',
        args: {
          'course': 'Linear Algebra',
          'left': 30.9,
          'days': 68,
          'pace': 0.45,
          'catchUp': 1.2,
        },
      );
      final text = localizeReminder(en, base);
      expect(text.title, '🔻 Linear Algebra slipped to Behind');
      expect(text.body, contains('27 min/day'));
      expect(text.body, contains('1.2 h to get back On track.'));
    });

    test('overdue and streak render', () {
      const overdue = ReminderContent(
        kind: ReminderKind.overdue,
        title: 'x',
        body: 'y',
        messageId: 'overdue',
        args: {'course': 'Late', 'left': 53.1},
      );
      expect(localizeReminder(en, overdue).title,
          '❌ Late passed its deadline with 53.1 h open');
      const streak = ReminderContent(
        kind: ReminderKind.streak,
        title: 'x',
        body: 'y',
        messageId: 'streak',
        args: {'days': 4, 'week': 6.5},
      );
      final text = localizeReminder(en, streak);
      expect(text.title, '🔥 4-day streak — 6.5 h this week');
      expect(text.body, contains('Nice run.'));
    });

    test('custom label titles pass through, bodies localize', () {
      const custom = ReminderContent(
        kind: ReminderKind.custom,
        title: 'My exam prep',
        body: 'y',
        messageId: 'customLabelPace',
        args: {
          'label': 'My exam prep',
          'course': 'Steady',
          'automatic': false,
          'left': 5.0,
          'pace': 0.5,
        },
      );
      final text = localizeReminder(en, custom);
      expect(text.title, 'My exam prep');
      expect(text.body, contains('30 min/day'));
    });

    test('other locales render without crashing', () {
      // Holds before AND after the bulk translation pass: names pass
      // through, templates come from the locale (or English fallback).
      final plan = computeDailyPlan(
        courses: [
          course(id: 1, name: 'Linear Algebra', ects: 5,
              deadline: DateTime(2026, 11, 21, 19)),
        ],
        sessions: const [],
        hoursPerEcts: 30,
        now: now,
      )!;
      for (final code in ['de', 'fr', 'ja', 'zh']) {
        final text = localizeReminder(l10nFor(code), plan);
        expect(text.title.isNotEmpty, isTrue);
        expect(text.body, contains('Linear Algebra'));
      }
    });
  });
}
