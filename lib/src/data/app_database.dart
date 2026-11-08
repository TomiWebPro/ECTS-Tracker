import 'package:drift/drift.dart';

part 'app_database.g.dart';

/// Persistent tables for the ECTS tracker.
///
/// Derived values (required hours, progress, pace, status) are NEVER stored —
/// they are computed in `lib/src/logic/` from these raw rows.

@DataClassName('CourseRow')
class Courses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  RealColumn get ectsCredits => real()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get deadline => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get colorValue => integer().nullable()();
  BoolColumn get isSample => boolean().withDefault(const Constant(false))();
  BoolColumn get startEarly =>
      boolean().withDefault(const Constant(false))();
}

@DataClassName('SessionRow')
class StudySessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get courseId =>
      integer().references(Courses, #id, onDelete: KeyAction.cascade)();
  /// Duration stored in minutes; hours are derived.
  IntColumn get minutes => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isSample => boolean().withDefault(const Constant(false))();
}

/// Single-row settings table (id always 1).
@DataClassName('SettingsRow')
class Settings extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  RealColumn get hoursPerEcts => real().withDefault(const Constant(30))();
  IntColumn get dailyTargetMinutes => integer().withDefault(const Constant(0))();
  /// ISO weekday 1..7 (Monday=1). Default Monday.
  IntColumn get firstWeekday => integer().withDefault(const Constant(1))();
  /// 0=system, 1=light, 2=dark.
  IntColumn get themeMode => integer().withDefault(const Constant(0))();
  /// Ahead/behind tolerance in days of current need. Default 5.
  RealColumn get paceToleranceDays => real().withDefault(const Constant(5))();
  /// Coming-load overload cutoff in hours/week. Default 35.
  RealColumn get weeklyOverloadHours => real().withDefault(const Constant(35))();

  /// Display size 0=compact, 1=comfortable, 2=large. Default 1.
  IntColumn get displaySize => integer().withDefault(const Constant(1))();

  /// Theme accent 0=teal, 1=forest, 2=clay, 3=slate, 4=berry. Default 0.
  IntColumn get accent => integer().withDefault(const Constant(0))();

  /// App-language code (ARB `@@locale` tag, e.g. `de`, `zh_Hans`).
  /// Null means "follow the system language". Default null.
  TextColumn get localeCode => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Courses, StudySessions, Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 7;

  /// SQLite does not enforce foreign keys (and thus ON DELETE CASCADE) unless
  /// explicitly asked, on every connection.
  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(settings, settings.firstWeekday);
            await m.addColumn(settings, settings.themeMode);
          }
          if (from < 3) {
            await m.addColumn(courses, courses.startEarly);
          }
          if (from < 4) {
            await m.addColumn(settings, settings.paceToleranceDays);
          }
          if (from < 5) {
            await m.addColumn(settings, settings.weeklyOverloadHours);
          }
          if (from < 6) {
            await m.addColumn(settings, settings.displaySize);
            await m.addColumn(settings, settings.accent);
          }
          if (from < 7) {
            await m.addColumn(settings, settings.localeCode);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
