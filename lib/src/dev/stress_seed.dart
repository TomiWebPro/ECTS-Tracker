/// Pure stress-data generator for the hidden dev mode.
///
/// Builds a realistic semester from one coherent mathematical model instead
/// of independent random draws:
///
/// - One shared semester: it started ~11 weeks ago, runs 150–180 days, and
///   every started course shares that window (small per-course jitter).
///   ECTS totals stay near a full-time semester (~30 ECTS) by favouring
///   small courses when many are requested.
/// - Each course gets a workload archetype (behind / onTrack / ahead /
///   overdue / completed) that sets its logged-hours target as a fraction of
///   its requirement relative to elapsed semester time. Session volume is
///   then budgeted proportionally to those targets and block sizes are
///   scaled so actual logged hours land near the target — progress,
///   dashboard status, and the Coming-load forecast all agree with each
///   other instead of contradicting.
/// - Study days follow a weekly rhythm (Mon–Fri heavy, Sat light, Sun
///   mostly off) with a mild recency ramp (exam buildup) and per-course
///   preferred weekdays; start times cluster midday (triangular 8–21h);
///   sessions never land in the future or before their course started
///   (except start-early logs, which is the point).
/// - Two future-start courses give Upcoming coverage: one untracked (zero
///   sessions) and one tracked start-early (a few early-prep sessions).
///
/// Deterministic for a given [Random] seed, so tests get stable output while
/// the app gets a different semester on every pump.
library;

import 'dart:math';

import '../models/models.dart';

/// Draft for one course row to insert.
class StressCourseDraft {
  const StressCourseDraft({
    required this.name,
    required this.ectsCredits,
    this.startDate,
    this.deadline,
    this.colorValue,
    this.startEarly = false,
  });

  final String name;
  final double ectsCredits;
  final DateTime? startDate;
  final DateTime? deadline;
  final int? colorValue;

  /// True for a future-start course the student already started anyway
  /// (tracked in Today's pace); false leaves it untracked under Upcoming.
  final bool startEarly;
}

/// Draft for one session row to insert (references a course by index).
class StressSessionDraft {
  const StressSessionDraft({
    required this.courseIndex,
    required this.minutes,
    required this.date,
    this.notes,
  });

  final int courseIndex;
  final int minutes;
  final DateTime date;
  final String? notes;
}

/// A full pump payload: courses plus sessions pointing at them by index.
class StressPayload {
  const StressPayload({required this.courses, required this.sessions});

  final List<StressCourseDraft> courses;
  final List<StressSessionDraft> sessions;
}

/// Marker prefix for pumped courses so dev mode can clear them without
/// touching real user data.
const String stressCoursePrefix = 'STRESS ';

/// Default pump size: a full realistic semester. Big enough to stress lists,
/// charts, and pace math (hundreds of sessions), small enough to finish in
/// a couple of seconds.
const int defaultStressCourseCount = 10;
const int defaultStressSessionCount = 800;

/// 12 weeks of history, in days.
const int stressHistoryDays = 84;

/// Hours-per-ECTS the workload model assumes (matches the app default).
const double _stressHoursPerEcts = AppSettings.defaultHoursPerEcts;

/// Real university course names to pick from. Shuffled per pump; suffixed
/// only when more courses are requested than names available.
const List<String> stressCourseNames = [
  'Algorithms & Data Structures',
  'Calculus II',
  'Linear Algebra',
  'Operating Systems',
  'Databases',
  'Computer Networks',
  'Machine Learning',
  'Probability & Statistics',
  'Software Engineering Project',
  'Physics I',
  'Organic Chemistry',
  'Microeconomics',
  'Cognitive Psychology',
  'Academic Writing',
  'Discrete Mathematics',
  'Web Development',
  'Mobile App Development',
  'Artificial Intelligence',
  'Computer Graphics',
  'Cybersecurity Basics',
  'Data Science Lab',
  'Macroeconomics',
  'Philosophy of Science',
  'German B2',
  'French A2',
  'Biochemistry',
  'Genetics',
  'Thermodynamics',
  'Control Systems',
  'Signal Processing',
  'Embedded Systems',
  'Game Design',
  'Human-Computer Interaction',
  'Cloud Computing',
  'DevOps Practices',
  'Financial Accounting',
  'Marketing Fundamentals',
  'Organizational Behavior',
  'Research Methods',
  'Ethics in Technology',
];

/// Typical ECTS values seen in the wild.
const List<double> stressEctsOptions = [
  2,
  3,
  4,
  5,
  6,
  7.5,
  8,
  9,
  10,
  12,
];

/// Small-course-biased ECTS pool used when many courses are requested, so a
/// 10-course pump still totals near a full-time semester (~30 ECTS) instead
/// of an impossible 60+.
const List<double> _smallEctsPool = [2, 2, 3, 3, 3, 4, 4, 5];

const List<String> _sessionNotes = [
  'Lecture review',
  'Problem set',
  'Exam prep',
  'Lab report',
  'Reading chapters',
  'Flashcards',
  'Group study',
  'Past paper',
  'Tutorial exercises',
  'Project work',
];

/// Muted, realistic accent colors (ARGB).
const List<int> _palette = [
  0xFF4F7ED1,
  0xFF5BA37E,
  0xFFC08A4B,
  0xFF9A6FC0,
  0xFFC05B6E,
  0xFF4FA3B8,
  0xFF7A8A99,
  0xFF8FAE4E,
];

/// Builds a realistic pump payload (see library docs for the model).
StressPayload buildStressPayload({
  required Random random,
  DateTime? now,
  int courseCount = defaultStressCourseCount,
  int sessionCount = defaultStressSessionCount,
}) {
  final ref = now ?? DateTime.now();
  final today = DateTime(ref.year, ref.month, ref.day);
  final horizon =
      DateTime(today.year, today.month, today.day - (stressHistoryDays - 1));

  // One shared semester: started ~11 weeks ago, 150–180 days long.
  final semStartAgo = 77 + random.nextInt(7);
  final semesterStart =
      DateTime(today.year, today.month, today.day - semStartAgo);
  final semesterLen = 150 + random.nextInt(31);
  final semesterEnd = DateTime(
      semesterStart.year, semesterStart.month, semesterStart.day + semesterLen);

  final names = List<String>.of(stressCourseNames)..shuffle(random);
  // Small semesters use the full ECTS range; big ones favour small courses
  // so the total stays near a full-time semester (~30 ECTS).
  final smallSemester = courseCount > 6;
  final ectsPool = smallSemester ? _smallEctsPool : stressEctsOptions;

  final futureCount = courseCount >= 4 ? 2 : 0;

  // Role flags: course 0 overdue (if enough courses), course 1 completed.
  final hasOverdue = courseCount >= 6;
  final hasCompleted = courseCount >= 8;
  const archetypes = ['behind', 'onTrack', 'ahead', 'onTrack'];

  final courses = <StressCourseDraft>[];
  // Logged-hours target per course, in minutes (0 for untracked futures).
  final targets = <int>[];
  for (var i = 0; i < courseCount; i++) {
    final baseName = names[i % names.length];
    final extra =
        i >= names.length ? ' · group ${i ~/ names.length + 1}' : '';
    final ects = ectsPool[random.nextInt(ectsPool.length)];
    final requiredMin = (ects * _stressHoursPerEcts * 60).round();

    var start = DateTime(semesterStart.year, semesterStart.month,
        semesterStart.day - 2 + random.nextInt(9));
    if (start.isBefore(horizon)) start = horizon;
    if (start.isAfter(today)) start = today;
    var deadline = DateTime(semesterEnd.year, semesterEnd.month,
        semesterEnd.day - 7 + random.nextInt(22));
    if (!deadline.isAfter(start)) {
      deadline =
          DateTime(start.year, start.month, start.day + 120);
    }

    final isOverdue = hasOverdue && i == 0;
    final isCompleted = hasCompleted && i == 1;
    if (isOverdue) {
      deadline = DateTime(
          today.year, today.month, today.day - (3 + random.nextInt(8)));
      if (!deadline.isAfter(start)) {
        deadline =
            DateTime(start.year, start.month, start.day + 120);
      }
    }

    final color = random.nextDouble() < 0.75
        ? _palette[random.nextInt(_palette.length)]
        : null;
    courses.add(StressCourseDraft(
      name: '$stressCoursePrefix$baseName$extra',
      ectsCredits: ects,
      startDate: start,
      deadline: deadline,
      colorValue: color,
    ));

    // Workload target from elapsed semester fraction plus archetype bias.
    final spanDays = deadline.difference(start).inDays;
    final elapsedDays = today.difference(start).inDays;
    final elapsedFrac =
        spanDays <= 0 ? 1.0 : (elapsedDays / spanDays).clamp(0.0, 1.0);
    double targetFrac;
    if (isCompleted) {
      targetFrac = 1.0;
    } else if (isOverdue) {
      targetFrac = 0.35 + random.nextDouble() * 0.25;
    } else {
      final arch = archetypes[i % archetypes.length];
      final bias = switch (arch) {
        'behind' => -(0.15 + random.nextDouble() * 0.15),
        'ahead' => 0.10 + random.nextDouble() * 0.15,
        _ => (random.nextDouble() - 0.5) * 0.08,
      };
      targetFrac = (elapsedFrac + bias).clamp(0.05, 0.98);
    }
    targets.add((requiredMin * targetFrac).round());
  }

  // Two future-start courses for Upcoming coverage: one tracked start-early
  // (a few early-prep sessions), one untracked (zero sessions). Role
  // courses (overdue/completed at indices 0/1) are never converted so every
  // pump keeps its status mix.
  final futureIdx = <int>{};
  var guard = 0;
  while (futureIdx.length < futureCount &&
      futureIdx.length < courses.length &&
      guard++ < 100) {
    final pick = random.nextInt(courses.length);
    if (pick < 2 && courses.length > 4) continue;
    futureIdx.add(pick);
  }
  var tracked = true;
  for (final i in futureIdx) {
    final base = courses[i];
    final start = DateTime(
        today.year, today.month, today.day + 7 + random.nextInt(36));
    final deadline = DateTime(
        start.year, start.month, start.day + 120 + random.nextInt(61));
    courses[i] = StressCourseDraft(
      name: base.name,
      ectsCredits: base.ectsCredits,
      startDate: start,
      deadline: deadline,
      colorValue: base.colorValue,
      startEarly: tracked,
    );
    targets[i] = tracked ? 150 + random.nextInt(301) : 0;
    tracked = false;
  }

  // Session-eligible courses: started ones always; future-start ones only
  // when tracked start-early. Untracked upcoming courses get zero sessions.
  final eligible = <int>[];
  for (var i = 0; i < courses.length; i++) {
    final s = courses[i].startDate;
    if (s == null || !s.isAfter(today) || courses[i].startEarly) {
      if (targets[i] > 0) eligible.add(i);
    }
  }

  // Budget session counts proportionally to workload targets so big courses
  // get more sessions and small ones fewer.
  final counts = List<int>.filled(courses.length, 0);
  var totalTarget = 0;
  for (final i in eligible) {
    totalTarget += targets[i];
  }
  if (eligible.isNotEmpty && sessionCount > 0) {
    if (sessionCount >= eligible.length && totalTarget > 0) {
      var assigned = 0;
      final frac = <int, double>{};
      for (final i in eligible) {
        final exact = sessionCount * targets[i] / totalTarget;
        counts[i] = exact.floor();
        frac[i] = exact - counts[i];
        assigned += counts[i];
      }
      final order = List<int>.of(eligible)
        ..sort((a, b) => frac[b]!.compareTo(frac[a]!));
      var k = 0;
      while (assigned < sessionCount) {
        counts[order[k % order.length]]++;
        assigned++;
        k++;
      }
      // Every eligible course logs at least once: steal from the largest.
      for (final i in eligible) {
        if (counts[i] == 0) {
          var donor = order.first;
          if (counts[donor] > 1) {
            counts[donor]--;
            counts[i]++;
          }
        }
      }
    } else {
      // Fewer sessions than courses: cover the first ones.
      for (var k = 0; k < sessionCount && k < eligible.length; k++) {
        counts[eligible[k]] = 1;
      }
    }
  }

  final sessions = <StressSessionDraft>[];
  for (final i in eligible) {
    final n = counts[i];
    if (n <= 0) continue;
    // Normalized jittered shares of the course target: every block scales
    // with the course budget, so the course total lands on target with
    // natural-looking variation instead of drifting.
    final weights = [
      for (var k = 0; k < n; k++) 0.5 + random.nextDouble(),
    ];
    final totalW = weights.fold(0.0, (a, b) => a + b);
    var soFar = 0;
    for (var k = 0; k < n; k++) {
      final int minutes;
      if (k < n - 1) {
        minutes =
            (targets[i] * weights[k] / totalW).round().clamp(15, 180);
        soFar += minutes;
      } else {
        // Trim the final block onto the target. Clamping keeps every block
        // realistic; any residual is negligible next to the target.
        minutes = (targets[i] - soFar).clamp(15, 180);
      }
      sessions.add(_randomSession(random, today, horizon, courses, i,
          minutes: minutes));
    }
  }
  // Deterministic shuffle.
  for (var k = sessions.length - 1; k > 0; k--) {
    final j = random.nextInt(k + 1);
    final tmp = sessions[k];
    sessions[k] = sessions[j];
    sessions[j] = tmp;
  }
  return StressPayload(courses: courses, sessions: sessions);
}

/// One study session for [courseIndex] on a weighted-pick day:
///
/// - Day pool runs from the course start (or the 12-week horizon / the last
///   week for start-early futures) up to today — never future, never before
///   the course started (start-early courses may log ahead of their official
///   start, which is the point).
/// - Weights: weekday rhythm (Mon–Fri 1.0, Sat 0.55, Sun 0.22) × recency
///   ramp (exam buildup toward today) × per-course preferred weekdays.
/// - Start times cluster midday (triangular 8–21h), quarter-hour starts.
StressSessionDraft _randomSession(
  Random random,
  DateTime today,
  DateTime horizon,
  List<StressCourseDraft> courses,
  int courseIndex, {
  required int minutes,
}) {
  final course = courses[courseIndex];
  final DateTime earliest;
  if (course.startEarly &&
      course.startDate != null &&
      course.startDate!.isAfter(today)) {
    earliest = DateTime(today.year, today.month, today.day - 6);
  } else {
    final s = course.startDate;
    earliest = (s != null && s.isAfter(horizon))
        ? DateTime(s.year, s.month, s.day)
        : horizon;
  }

  // Day pool with weights.
  final days = <DateTime>[];
  var d = earliest;
  while (!d.isAfter(today)) {
    days.add(d);
    d = DateTime(d.year, d.month, d.day + 1);
  }
  final prefA = 1 + (courseIndex * 2 + 1) % 5;
  final prefB = 1 + (courseIndex * 3 + 2) % 7;
  final weights = <double>[];
  for (var k = 0; k < days.length; k++) {
    final day = days[k];
    double w = switch (day.weekday) {
      DateTime.saturday => 0.55,
      DateTime.sunday => 0.22,
      _ => 1.0,
    };
    // Recency ramp: recent days weigh up to ~1.3×, oldest ~0.7×.
    final t = days.length <= 1 ? 1.0 : k / (days.length - 1);
    w *= 0.7 + 0.6 * t;
    if (day.weekday == prefA || day.weekday == prefB) w *= 1.35;
    weights.add(w);
  }
  var total = weights.fold(0.0, (a, b) => a + b);
  if (total <= 0) total = 1.0;
  var pick = random.nextDouble() * total;
  var day = days.last;
  for (var k = 0; k < days.length; k++) {
    pick -= weights[k];
    if (pick <= 0) {
      day = days[k];
      break;
    }
  }
  // Weekly rhythm escape hatch: a picked Sunday is skipped half the time.
  if (day.weekday == DateTime.sunday && random.nextBool()) {
    final prev = DateTime(day.year, day.month, day.day - 1);
    if (!prev.isBefore(earliest)) day = prev;
  }

  // Triangular midday start hour: two uniform draws averaged → peak ~14–15h.
  final a = random.nextInt(14);
  final b = random.nextInt(14);
  final hour = 8 + ((a + b) >> 1);
  const quarters = [0, 15, 30, 45];
  var date = DateTime(day.year, day.month, day.day, hour,
      quarters[random.nextInt(quarters.length)]);
  if (date.isAfter(today)) date = today;

  return StressSessionDraft(
    courseIndex: courseIndex,
    minutes: minutes,
    date: date,
    notes: random.nextDouble() < 0.3
        ? _sessionNotes[random.nextInt(_sessionNotes.length)]
        : null,
  );
}
