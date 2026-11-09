// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Nigerian Pidgin (`pcm`).
class AppLocalizationsPcm extends AppLocalizations {
  AppLocalizationsPcm([String locale = 'pcm']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonClose => 'Close';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonError => 'Error';

  @override
  String get commonNone => 'None';

  @override
  String get commonSave => 'Save';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Hours wey you need (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Clear deadline';

  @override
  String get courseFormClearStartTooltip => 'Clear start date';

  @override
  String get courseFormColorLabel => 'Colour';

  @override
  String get courseFormDateNotSet => 'No set';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Deadline: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS credits';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Name';

  @override
  String get courseFormNotesLabel => 'Notes (optional)';

  @override
  String get courseFormSaving => 'Dey save…';

  @override
  String courseFormStartButton(String date) {
    return 'Start: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Off: no pressure till $date; e no dey inside Today pace.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'On: time don share till now and e dey count for Today pace.';

  @override
  String get courseFormStartEarlyTitle =>
      'Start now even though start dey for future';

  @override
  String get courseFormTitleAdd => 'Add course';

  @override
  String get courseFormTitleEdit => 'Edit course';

  @override
  String get coursesAddTooltip => 'Add course';

  @override
  String coursesDeleteBody(String name) {
    return 'Delete “$name” and all im study sessions? You no fit undo am.';
  }

  @override
  String get coursesDeleteTitle => 'Delete course?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Tap “New course” make you create your first course.';

  @override
  String get coursesEmptyTitle => 'No course yet';

  @override
  String get coursesFilterAll => 'All statuses';

  @override
  String get coursesFilterEmpty => 'No course match dis filter';

  @override
  String get coursesNewCourse => 'New course';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily h/day needed';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily h/day • $weekly h/week need to finish';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required h • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Remove sample course';

  @override
  String coursesShownCount(String count) {
    return '$count shown';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sort: $label';
  }

  @override
  String get dashboardAllDone => 'All done';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h don enter (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count course(s)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count course(s) · $upcoming upcoming no dey inside today pace';
  }

  @override
  String get dashboardCoursesTitle => 'Courses';

  @override
  String dashboardDeadline(String date) {
    return 'Deadline $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Deadline $date ($days days remain)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Deadline $date (1 day remain)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Deadline $date (e don pass)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Deadline $date (na today)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Dey due today — $hours h don enter';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Every course don finish — check Courses tab for full list.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Add course to start track your ECTS progress.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Behind = you dey do $achieved/d, you need $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Behind = you dey do $achieved/d, you need $need/d · early start';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Behind: no pace fit meet today deadline wit hours wey remain';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'You dey on track: no pace yet — log first session to confirm';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'E go start in $days d · dem dey count from $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'E go start in $days d · dem dey count from $date · early start on';
  }

  @override
  String get dashboardFreshStart => 'FRESH START';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · ${hours}h remain';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/d';
  }

  @override
  String get dashboardLogSessionAction => 'Log study session';

  @override
  String get dashboardLogSessionTooltip => 'Log study session';

  @override
  String get dashboardNewBadge => 'NEW';

  @override
  String get dashboardNoCourses => 'No course yet';

  @override
  String get dashboardNoDeadline => 'No deadline';

  @override
  String get dashboardNoDeadlines => 'No deadline scheduled';

  @override
  String get dashboardNoPaceDue => 'No pace due today';

  @override
  String get dashboardNothingDue => 'Nothing due';

  @override
  String get dashboardNothingToTrack => 'Nothing to track yet';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Dey due today — ${hours}h remain';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'You need $daily h/day to finish';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'You need $daily h/day · $weekly h/week to finish';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'You need $hours h/day from $date · e no dey inside Today pace';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'No deadline — ${hours}h remain · no daily pressure';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'E go start $date · ${hours}h to do';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · unrealistic';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Add course to start tracking';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days days runway dey';
  }

  @override
  String get dashboardStartNotSet => 'No set';

  @override
  String dashboardStartsIn(String days) {
    return 'E go start in ${days}d';
  }

  @override
  String get dashboardStartsSoon => 'E go start soon';

  @override
  String get dashboardTipEmpty =>
      'Add your first course — your daily pace and progress go appear here.';

  @override
  String get dashboardTipFirst =>
      'First 25 min matter pass — pick di course wey due first.';

  @override
  String get dashboardTodayBare => 'TODAY';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'TODAY $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'TODAY PACE';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h for today';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Future starts — no pressure today, e no dey inside Today pace.';

  @override
  String get dashboardUpcomingTitle => 'Upcoming';

  @override
  String get devToolsActivate => 'Activate';

  @override
  String get devToolsActivateMessage =>
      'Dis go unlock hidden stress-test tools (e go pump generated data). Na for development only.';

  @override
  String get devToolsActivateTitle => 'Activate dev mode?';

  @override
  String get devToolsActivated => 'Dev mode don activate.';

  @override
  String get devToolsClearPumped => 'Clear pumped data';

  @override
  String get devToolsClearPumpedMessage =>
      'E go delete di generated STRESS courses and dia sessions. Your own data go remain.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Delete di generated STRESS courses and sessions.';

  @override
  String get devToolsClearPumpedTitle => 'Clear pumped data?';

  @override
  String devToolsCleared(String count) {
    return 'Don clear $count pumped course(s).';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Second confirmation: dis go inflate courses, lists, charts, and pace calculations, and e fit take few seconds. Pump now?';

  @override
  String get devToolsConfirmPumpTitle => 'Confirm stress pump';

  @override
  String get devToolsContinue => 'Continue';

  @override
  String get devToolsExit => 'Exit dev mode';

  @override
  String get devToolsExitSubtitle => 'Hide dev tools for dis device.';

  @override
  String get devToolsPumpData => 'Pump data';

  @override
  String get devToolsPumpMessage =>
      'Dis go insert realistic generated semester (~10 courses, ~800 sessions for last 12 weeks). Your existing data go remain. Continue?';

  @override
  String get devToolsPumpSubtitle =>
      'Insert generated semester (~10 courses, ~800 sessions, 12 weeks). Existing data remain.';

  @override
  String get devToolsPumpTile => 'Pump test data';

  @override
  String get devToolsPumpTitle => 'Pump test data?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Don pump $courses courses, $sessions sessions.';
  }

  @override
  String get devToolsPumping => 'Dey pump test data…';

  @override
  String get devToolsRemoveAll => 'Remove all data';

  @override
  String get devToolsRemoveAllMessage =>
      'Dev shortcut: dis go permanently delete ALL courses, sessions, and settings. You no fit undo am.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Dev shortcut: e go delete ALL courses, sessions, and settings.';

  @override
  String get devToolsRemoveAllTitle => 'Remove all data?';

  @override
  String get navCourses => 'Courses';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navSettings => 'Settings';

  @override
  String get navStatistics => 'Statistics';

  @override
  String get navStudyLog => 'Study Log';

  @override
  String get sampleBadge => 'Sample';

  @override
  String get sessionFormCourseLabel => 'Course';

  @override
  String sessionFormDateButton(String date) {
    return 'Date: $date';
  }

  @override
  String get sessionFormDurationError => 'Duration must pass zero.';

  @override
  String get sessionFormHoursLabel => 'Hours';

  @override
  String get sessionFormLogAction => 'Log session';

  @override
  String get sessionFormMinutesLabel => 'Minutes';

  @override
  String get sessionFormNoCourseError => 'Select course.';

  @override
  String get sessionFormNoCoursesHint => 'Add course first to log session.';

  @override
  String get sessionFormNotesLabel => 'Notes (optional)';

  @override
  String get sessionFormSaving => 'Dey save…';

  @override
  String get sessionFormTitleAdd => 'Log study session';

  @override
  String get sessionFormTitleEdit => 'Edit study session';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total: $hours h';
  }

  @override
  String get settingsAccent => 'Theme colour';

  @override
  String get settingsAccentBerry => 'Berry';

  @override
  String get settingsAccentClay => 'Clay';

  @override
  String get settingsAccentForest => 'Forest';

  @override
  String get settingsAccentSlate => 'Slate';

  @override
  String get settingsAccentTeal => 'Teal';

  @override
  String get settingsAccentUpdated => 'Theme colour don update.';

  @override
  String get settingsAllDataDeleted => 'All data don delete.';

  @override
  String get settingsAppearance => 'Look (dark / light)';

  @override
  String get settingsCheckingSample => 'Dey check sample data…';

  @override
  String get settingsClear => 'Clear';

  @override
  String get settingsClearSample => 'Clear sample data';

  @override
  String get settingsClearSampleMessage =>
      'Dis go remove di example courses and sessions. Courses or sessions wey you add yourself no go remove.';

  @override
  String get settingsClearSampleSubtitle =>
      'Remove di seeded example courses and sessions. Your own data go remain.';

  @override
  String get settingsClearSampleTitle => 'Clear sample data?';

  @override
  String get settingsCopy => 'Copy';

  @override
  String get settingsDailyError => 'Enter 0 or positive number of minutes.';

  @override
  String get settingsDailyLabel => 'Minutes per day (0 mean no target)';

  @override
  String get settingsDailyTarget => 'Daily study target';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/day';
  }

  @override
  String get settingsDailyUpdated => 'Daily target don update.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Delete everything';

  @override
  String get settingsDevMode => 'Dev mode';

  @override
  String get settingsDisplay => 'Display';

  @override
  String get settingsDisplayComfortable => 'Comfortable';

  @override
  String get settingsDisplayCompact => 'Compact';

  @override
  String get settingsDisplayLarge => 'Large';

  @override
  String get settingsDisplaySize => 'Text & element size';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Display size don update.';

  @override
  String get settingsExport => 'Export data';

  @override
  String get settingsExportCopied => 'Export don copy to clipboard.';

  @override
  String get settingsExportSubtitle =>
      'Copy all courses, sessions, plus settings as JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses courses · $sessions sessions · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (truncated — full backup na $kb KB, use Copy for everything)';
  }

  @override
  String get settingsFirstWeekday => 'First day of week';

  @override
  String get settingsFirstWeekdayUpdated => 'First day of week don update.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (hold am ${seconds}s)';
  }

  @override
  String get settingsHoldToReplace => 'Hold am to replace everything';

  @override
  String get settingsHoursError => 'Enter number wey pass zero.';

  @override
  String get settingsHoursHelper =>
      'Default 30. If you change am, e go recalculate wetin you need; logs go remain.';

  @override
  String get settingsHoursLabel => 'Hours for every ECTS credit';

  @override
  String get settingsHoursPerEcts => 'Hours per ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Hours per ECTS don update.';

  @override
  String get settingsImport => 'Import data';

  @override
  String get settingsImportAppend => 'Append';

  @override
  String get settingsImportAppendAction => 'Import (append)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Data don join: $courses courses, $sessions sessions don enter.';
  }

  @override
  String get settingsImportInfo =>
      'Append go add di backup join your current data (settings go remain). Replace go wipe ALL courses, sessions, and settings first.';

  @override
  String get settingsImportLabel => 'Paste exported JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses courses · $sessions sessions';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · dem export am $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · schema v$schema';
  }

  @override
  String get settingsImportReplace => 'Replace';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Replace go delete everything first. Press and HOLD di button below for $seconds seconds to confirm.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Data don replace: $courses courses, $sessions sessions don restore.';
  }

  @override
  String get settingsImportSubtitle =>
      'Replace all data from previously exported JSON backup.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Dey hold am… $remaining s';
  }

  @override
  String get settingsNoSample => 'No sample data';

  @override
  String get settingsNoSampleSubtitle =>
      'Seeded example data don already clear.';

  @override
  String get settingsNoTarget => 'No target set';

  @override
  String get settingsOverloadError => 'Enter number 5–100 h/week.';

  @override
  String get settingsOverloadHelper =>
      'Coming-load weeks wey pass dis go flag red. Full-time study na ~35–40 h/week.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Hours for each week (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/week go flag red';
  }

  @override
  String get settingsOverloadThreshold => 'Overload limit for week';

  @override
  String get settingsOverloadUpdated => 'Overload threshold don update.';

  @override
  String get settingsPaceTolerance => 'Ahead / behind margin';

  @override
  String get settingsPasteValidBackup => 'Paste valid backup first';

  @override
  String get settingsReset => 'Reset';

  @override
  String get settingsResetAll => 'Reset all data';

  @override
  String get settingsResetAllMessage =>
      'Dis go permanently delete ALL courses, sessions, and settings. You no fit undo am. Export backup first if you need am.';

  @override
  String get settingsResetAllSubtitle =>
      'Delete all courses, sessions, plus settings.';

  @override
  String get settingsResetAllTitle => 'Reset all data?';

  @override
  String get settingsResetSettings => 'Reset settings';

  @override
  String get settingsResetSettingsDone => 'Settings don reset to defaults.';

  @override
  String get settingsResetSettingsMessage =>
      'E go restore hours-per-ECTS (30), daily target (none), first weekday (Monday), theme (system), tolerance (5 days), overload (35 h/week), size (comfortable), colour (slate). Courses and sessions go remain.';

  @override
  String get settingsResetSettingsSubtitle =>
      'E go restore defaults: 30 h/ECTS, no target, Monday, system theme, 5-day tolerance, 35 h/week overload, comfortable size, slate colour.';

  @override
  String get settingsResetSettingsTitle => 'Reset settings?';

  @override
  String get settingsSampleData => 'Sample data';

  @override
  String settingsSampleDataError(String error) {
    return 'Error: $error';
  }

  @override
  String get settingsStudySettings => 'Study settings';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeSystem => 'System default';

  @override
  String get settingsThemeTitle => 'Theme';

  @override
  String get settingsThemeUpdated => 'Theme don update.';

  @override
  String settingsToleranceDays(String value) {
    return '$value days';
  }

  @override
  String get settingsToleranceError => 'Enter number 0–30 days.';

  @override
  String get settingsToleranceHelper =>
      'Ahead need +N days surplus, behind na −N days. 5 = stable, 0 = sensitive.';

  @override
  String get settingsToleranceLabel => 'Days of work (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance of work';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerance don update.';

  @override
  String get settingsWeekdayFriday => 'Friday';

  @override
  String get settingsWeekdayMonday => 'Monday';

  @override
  String get settingsWeekdaySaturday => 'Saturday';

  @override
  String get settingsWeekdaySunday => 'Sunday';

  @override
  String get settingsWeekdayThursday => 'Thursday';

  @override
  String get settingsWeekdayTuesday => 'Tuesday';

  @override
  String get settingsWeekdayWednesday => 'Wednesday';

  @override
  String get sortDeadline => 'Deadline';

  @override
  String get sortName => 'Name';

  @override
  String get sortProgress => 'Progress';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'No fit start ECTS Tracker';

  @override
  String get statsActiveDays => 'Active days';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}d active';
  }

  @override
  String get statsAddDeadlines => 'Add deadlines to forecast di load.';

  @override
  String get statsComingLoad => 'Coming load';

  @override
  String get statsConsistency => 'Consistency';

  @override
  String get statsConsistencyHint =>
      'Study days for last 30 days. Small steps everyday pass cramming.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% for last 30 days';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Course $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Did / day (14d)';

  @override
  String get statsEmpty => 'No session yet';

  @override
  String get statsGap => 'Gap';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value h';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}h';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get statsLast30Days => 'Last 30 days';

  @override
  String get statsLast7Days => 'Last 7 days';

  @override
  String get statsNeedPerDay => 'Need / day';

  @override
  String get statsNext8Weeks => 'Next 8 weeks';

  @override
  String get statsOfLast30DaysVolume => 'for last 30 days volume';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Overload weeks >${threshold}h flagged red — move deadline or cut scope.';
  }

  @override
  String get statsOverview => 'Overview';

  @override
  String get statsPaceCovers =>
      'Past pace cover wetin you need. Keep di streak.';

  @override
  String statsPaceShort(String gap) {
    return 'Past pace short $gap h/day — add block or trim scope.';
  }

  @override
  String get statsPastVsNeeded => 'Past vs needed';

  @override
  String statsPeakPerWeek(String peak) {
    return 'peak ${peak}h/wk';
  }

  @override
  String get statsPerCourse => 'Per course';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sessions';

  @override
  String statsSuggestedOrder(String order) {
    return 'Order wey make sense: $order (earliest deadline first)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'total volume';

  @override
  String get statusAhead => 'Ahead';

  @override
  String get statusBehind => 'Behind';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusOnTrack => 'On track';

  @override
  String get statusOverdue => 'Overdue';

  @override
  String get studyLogDeleteBody =>
      'Delete dis study session? You no fit undo am.';

  @override
  String get studyLogDeleteTitle => 'Delete session?';

  @override
  String get studyLogEmptyHint => 'Log session to track your study time.';

  @override
  String get studyLogEmptyTitle => 'No study session yet';

  @override
  String get studyLogFabLabel => 'Log session';

  @override
  String get studyLogFabTooltip => 'Log session';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Comot sample session';

  @override
  String get studyLogThisWeek => 'Dis week';

  @override
  String get studyLogToday => 'Today';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Course $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS must pass zero.';

  @override
  String get validationCourseEctsRequired => 'Enter ECTS credits';

  @override
  String get validationCourseNameRequired => 'Name required.';

  @override
  String get validationCourseNameTooLong => 'Name too long.';

  @override
  String get validationSessionCourseRequired => 'Select course';

  @override
  String get validationSessionDurationRequired => 'Enter duration';

  @override
  String get widgetNoProgress => 'No progress yet';

  @override
  String get settingsLanguage => 'Langwej';

  @override
  String get settingsLiquidGlass => 'Liquid glass';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Cards and bars wit frosted glass. Off go keep di classic solid look.';

  @override
  String get settingsLiquidGlassOn => 'On';

  @override
  String get settingsLiquidGlassOff => 'Off';

  @override
  String get settingsLiquidGlassUpdated => 'Liquid glass don update.';
}
