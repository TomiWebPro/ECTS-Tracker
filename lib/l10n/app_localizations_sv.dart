// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonClose => 'Stäng';

  @override
  String get commonDelete => 'Ta bort';

  @override
  String get commonEdit => 'Redigera';

  @override
  String get commonError => 'Fel';

  @override
  String get commonNone => 'Ingen';

  @override
  String get commonSave => 'Spara';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Nödvändiga timmar (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Rensa deadline';

  @override
  String get courseFormClearStartTooltip => 'Rensa startdatum';

  @override
  String get courseFormColorLabel => 'Färg';

  @override
  String get courseFormDateNotSet => 'Inte angivet';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Deadline: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS-poäng';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value tim/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Namn';

  @override
  String get courseFormNotesLabel => 'Anteckningar (valfritt)';

  @override
  String get courseFormSaving => 'Sparar…';

  @override
  String courseFormStartButton(String date) {
    return 'Start: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Av: ingen press fram till $date; exkluderad från dagens tempo.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'På: tiden fördelas fram till nu och räknas mot dagens tempo.';

  @override
  String get courseFormStartEarlyTitle => 'Börja nu trots framtida start';

  @override
  String get courseFormTitleAdd => 'Lägg till kurs';

  @override
  String get courseFormTitleEdit => 'Redigera kurs';

  @override
  String get coursesAddTooltip => 'Lägg till kurs';

  @override
  String coursesDeleteBody(String name) {
    return 'Ta bort ”$name” och alla dess studiesessioner? Detta kan inte ångras.';
  }

  @override
  String get coursesDeleteTitle => 'Ta bort kurs?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Tryck på ”Ny kurs” för att skapa din första kurs.';

  @override
  String get coursesEmptyTitle => 'Inga kurser ännu';

  @override
  String get coursesFilterAll => 'Alla statusar';

  @override
  String get coursesFilterEmpty => 'Inga kurser matchar filtret';

  @override
  String get coursesNewCourse => 'Ny kurs';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily tim/dag behövs';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily tim/dag • $weekly tim/vecka behövs';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required tim • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Ta bort exempelkurs';

  @override
  String coursesShownCount(String count) {
    return '$count visas';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sortera: $label';
  }

  @override
  String get dashboardAllDone => 'Allt klart';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours tim loggat (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kurs(er)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kurs(er) · $upcoming kommande ingår inte i dagens tempo';
  }

  @override
  String get dashboardCoursesTitle => 'Kurser';

  @override
  String dashboardDeadline(String date) {
    return 'Deadline $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Deadline $date ($days dagar kvar)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Deadline $date (1 dag kvar)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Deadline $date (försenad)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Deadline $date (idag)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Förfaller idag — $hours tim loggat';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Alla kurser är avklarade — se fliken Kurser för hela listan.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Lägg till en kurs för att börja följa dina ECTS-framsteg.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Bakom = gör $achieved/dag, behöver $need/dag';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Bakom = gör $achieved/dag, behöver $need/dag · tidig start';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Bakom: ingen ändlig takt hinner en idag-deadline med timmar kvar';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'I fas: ingen takt ännu — logga första sessionen för att bekräfta';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Börjar om $days d · räknat från $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Börjar om $days d · räknat från $date · tidig start på';
  }

  @override
  String get dashboardFreshStart => 'NYSTART';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct % · $hours tim kvar';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required tim';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours tim/dag';
  }

  @override
  String get dashboardLogSessionAction => 'Logga studiesession';

  @override
  String get dashboardLogSessionTooltip => 'Logga studiesession';

  @override
  String get dashboardNewBadge => 'NY';

  @override
  String get dashboardNoCourses => 'Inga kurser ännu';

  @override
  String get dashboardNoDeadline => 'Ingen deadline';

  @override
  String get dashboardNoDeadlines => 'Inga deadlines schemalagda';

  @override
  String get dashboardNoPaceDue => 'Ingen takt förfaller idag';

  @override
  String get dashboardNothingDue => 'Inget förfaller';

  @override
  String get dashboardNothingToTrack => 'Inget att följa ännu';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Förfaller idag — $hours tim kvar';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Behöver $daily tim/dag för att bli klar';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Behöver $daily tim/dag · $weekly tim/vecka för att bli klar';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Behöver $hours tim/dag från $date · ingår inte i dagens tempo';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Ingen deadline — $hours tim kvar · ingen daglig press';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Börjar $date · $hours tim att göra';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · orealistisk';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint =>
      'Lägg till en kurs för att börja följa';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required tim';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct %';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days dagars marginal';
  }

  @override
  String get dashboardStartNotSet => 'Inte angivet';

  @override
  String dashboardStartsIn(String days) {
    return 'Börjar om $days d';
  }

  @override
  String get dashboardStartsSoon => 'Börjar snart';

  @override
  String get dashboardTipEmpty =>
      'Lägg till din första kurs — din dagliga takt och dina framsteg visas här.';

  @override
  String get dashboardTipFirst =>
      'Första 25 minuterna räknas mest — välj kursen med tidigaste deadline.';

  @override
  String get dashboardTodayBare => 'IDAG';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace tim';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'IDAG $pct %';
  }

  @override
  String get dashboardTodayPaceLabel => 'DAGENS TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace tim idag';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Framtida starter — ingen press idag, exkluderade från dagens tempo.';

  @override
  String get dashboardUpcomingTitle => 'Kommande';

  @override
  String get devToolsActivate => 'Aktivera';

  @override
  String get devToolsActivateMessage =>
      'Detta låser upp dolda stresstestverktyg (generera data). Endast för utveckling.';

  @override
  String get devToolsActivateTitle => 'Aktivera utvecklarläge?';

  @override
  String get devToolsActivated => 'Utvecklarläge aktiverat.';

  @override
  String get devToolsClearPumped => 'Rensa genererad data';

  @override
  String get devToolsClearPumpedMessage =>
      'Tar bort de genererade STRESS-kurserna och deras sessioner. Dina egna data behålls.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Ta bort genererade STRESS-kurser och sessioner.';

  @override
  String get devToolsClearPumpedTitle => 'Rensa genererad data?';

  @override
  String devToolsCleared(String count) {
    return 'Rensade $count genererade kurs(er).';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Andra bekräftelsen: detta blåser upp kurser, listor, diagram och taktberäkningar och kan ta några sekunder. Generera nu?';

  @override
  String get devToolsConfirmPumpTitle => 'Bekräfta stresstest';

  @override
  String get devToolsContinue => 'Fortsätt';

  @override
  String get devToolsExit => 'Avsluta utvecklarläge';

  @override
  String get devToolsExitSubtitle => 'Dölj utvecklarverktyg på denna enhet.';

  @override
  String get devToolsPumpData => 'Generera data';

  @override
  String get devToolsPumpMessage =>
      'Detta lägger in en realistisk genererad termin (~10 kurser, ~800 sessioner under de senaste 12 veckorna). Dina befintliga data behålls. Fortsätta?';

  @override
  String get devToolsPumpSubtitle =>
      'Lägg in en genererad termin (~10 kurser, ~800 sessioner, 12 veckor). Befintliga data behålls.';

  @override
  String get devToolsPumpTile => 'Generera testdata';

  @override
  String get devToolsPumpTitle => 'Generera testdata?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Genererade $courses kurser, $sessions sessioner.';
  }

  @override
  String get devToolsPumping => 'Genererar testdata…';

  @override
  String get devToolsRemoveAll => 'Ta bort all data';

  @override
  String get devToolsRemoveAllMessage =>
      'Utvecklargenväg: detta tar permanent bort ALLA kurser, sessioner och inställningar. Detta kan inte ångras.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Utvecklargenväg: ta bort ALLA kurser, sessioner och inställningar.';

  @override
  String get devToolsRemoveAllTitle => 'Ta bort all data?';

  @override
  String get navCourses => 'Kurser';

  @override
  String get navDashboard => 'Översikt';

  @override
  String get navSettings => 'Inställningar';

  @override
  String get navStatistics => 'Statistik';

  @override
  String get navStudyLog => 'Studielogg';

  @override
  String get sampleBadge => 'Exempel';

  @override
  String get sessionFormCourseLabel => 'Kurs';

  @override
  String sessionFormDateButton(String date) {
    return 'Datum: $date';
  }

  @override
  String get sessionFormDurationError => 'Längden måste vara större än noll.';

  @override
  String get sessionFormHoursLabel => 'Timmar';

  @override
  String get sessionFormLogAction => 'Logga session';

  @override
  String get sessionFormMinutesLabel => 'Minuter';

  @override
  String get sessionFormNoCourseError => 'Välj en kurs.';

  @override
  String get sessionFormNoCoursesHint =>
      'Lägg till en kurs först för att logga en session.';

  @override
  String get sessionFormNotesLabel => 'Anteckningar (valfritt)';

  @override
  String get sessionFormSaving => 'Sparar…';

  @override
  String get sessionFormTitleAdd => 'Logga studiesession';

  @override
  String get sessionFormTitleEdit => 'Redigera studiesession';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Totalt: $hours tim';
  }

  @override
  String get settingsAccent => 'Temafärg';

  @override
  String get settingsAccentBerry => 'Bär';

  @override
  String get settingsAccentClay => 'Lera';

  @override
  String get settingsAccentForest => 'Skog';

  @override
  String get settingsAccentSlate => 'Skiffer';

  @override
  String get settingsAccentTeal => 'Teal';

  @override
  String get settingsAccentUpdated => 'Temafärg uppdaterad.';

  @override
  String get settingsAllDataDeleted => 'All data raderad.';

  @override
  String get settingsAppearance => 'Utseende (mörkt / ljust)';

  @override
  String get settingsCheckingSample => 'Kontrollerar exempeldata…';

  @override
  String get settingsClear => 'Rensa';

  @override
  String get settingsClearSample => 'Rensa exempeldata';

  @override
  String get settingsClearSampleMessage =>
      'Detta tar bort exempelkurserna och sessionerna. Kurser eller sessioner du lagt till själv tas inte bort.';

  @override
  String get settingsClearSampleSubtitle =>
      'Ta bort de förifyllda exempelkurserna och sessionerna. Dina egna data behålls.';

  @override
  String get settingsClearSampleTitle => 'Rensa exempeldata?';

  @override
  String get settingsCopy => 'Kopiera';

  @override
  String get settingsDailyError => 'Ange 0 eller ett positivt antal minuter.';

  @override
  String get settingsDailyLabel => 'Minuter per dag (0 = inget mål)';

  @override
  String get settingsDailyTarget => 'Dagligt studiemål';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dag';
  }

  @override
  String get settingsDailyUpdated => 'Dagligt mål uppdaterat.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Ta bort allt';

  @override
  String get settingsDevMode => 'Utvecklarläge';

  @override
  String get settingsDisplay => 'Visning';

  @override
  String get settingsDisplayComfortable => 'Bekväm';

  @override
  String get settingsDisplayCompact => 'Kompakt';

  @override
  String get settingsDisplayLarge => 'Stor';

  @override
  String get settingsDisplaySize => 'Text- och elementstorlek';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent %)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Visningsstorlek uppdaterad.';

  @override
  String get settingsExport => 'Exportera data';

  @override
  String get settingsExportCopied => 'Export kopierad till urklipp.';

  @override
  String get settingsExportSubtitle =>
      'Kopiera alla kurser, sessioner och inställningar som JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kurs(er) · $sessions session(er) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (avkortad — fullständig backup är $kb KB, använd Kopiera för allt)';
  }

  @override
  String get settingsFirstWeekday => 'Veckans första dag';

  @override
  String get settingsFirstWeekdayUpdated => 'Veckans första dag uppdaterad.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (håll $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Håll för att ersätta allt';

  @override
  String get settingsHoursError => 'Ange ett tal större än noll.';

  @override
  String get settingsHoursHelper =>
      'Standard 30. Ändring räknar om kraven; loggar behålls.';

  @override
  String get settingsHoursLabel => 'Timmar per ECTS-poäng';

  @override
  String get settingsHoursPerEcts => 'Timmar per ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value tim';
  }

  @override
  String get settingsHoursUpdated => 'Timmar per ECTS uppdaterat.';

  @override
  String get settingsImport => 'Importera data';

  @override
  String get settingsImportAppend => 'Lägg till';

  @override
  String get settingsImportAppendAction => 'Importera (lägg till)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Data tillagd: $courses kurs(er), $sessions session(er) tillagda.';
  }

  @override
  String get settingsImportInfo =>
      'Lägg till lägger backupen vid sidan av dina nuvarande data (inställningar behålls). Ersätt raderar först ALLA kurser, sessioner och inställningar.';

  @override
  String get settingsImportLabel => 'Klistra in exporterad JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kurs(er) · $sessions session(er)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · exporterad $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · schema v$schema';
  }

  @override
  String get settingsImportReplace => 'Ersätt';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Ersätt raderar allt först. TRYCK och HÅLL knappen nedan i $seconds sekunder för att bekräfta.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Data ersatt: $courses kurs(er), $sessions sessioner återställda.';
  }

  @override
  String get settingsImportSubtitle =>
      'Ersätt all data från en tidigare exporterad JSON-backup.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Fortsätt hålla… $remaining s';
  }

  @override
  String get settingsNoSample => 'Ingen exempeldata';

  @override
  String get settingsNoSampleSubtitle =>
      'Förifylld exempeldata har redan rensats.';

  @override
  String get settingsNoTarget => 'Inget mål angivet';

  @override
  String get settingsOverloadError => 'Ange ett tal 5–100 tim/vecka.';

  @override
  String get settingsOverloadHelper =>
      'Kommande veckor över detta flaggas rött. Heltidsstudier är ~35–40 tim/vecka.';

  @override
  String settingsOverloadHours(String value) {
    return '$value tim';
  }

  @override
  String get settingsOverloadLabel => 'Timmar per vecka (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/vecka flaggas rött';
  }

  @override
  String get settingsOverloadThreshold => 'Veckotröskel för överbelastning';

  @override
  String get settingsOverloadUpdated =>
      'Tröskel för överbelastning uppdaterad.';

  @override
  String get settingsPaceTolerance => 'Tolerans framåt / bakom';

  @override
  String get settingsPasteValidBackup => 'Klistra in en giltig backup först';

  @override
  String get settingsReset => 'Återställ';

  @override
  String get settingsResetAll => 'Återställ all data';

  @override
  String get settingsResetAllMessage =>
      'Detta tar permanent bort ALLA kurser, sessioner och inställningar. Detta kan inte ångras. Exportera en backup först vid behov.';

  @override
  String get settingsResetAllSubtitle =>
      'Ta bort alla kurser, sessioner och inställningar.';

  @override
  String get settingsResetAllTitle => 'Återställa all data?';

  @override
  String get settingsResetSettings => 'Återställ inställningar';

  @override
  String get settingsResetSettingsDone =>
      'Inställningar återställda till standard.';

  @override
  String get settingsResetSettingsMessage =>
      'Återställer timmar-per-ECTS (30), dagligt mål (inget), veckans första dag (måndag), tema (system), tolerans (5 dagar), överbelastning (35 tim/vecka), storlek (bekväm), färg (skiffer). Kurser och sessioner behålls.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Återställ standard: 30 tim/ECTS, inget mål, måndag, systemtema, 5-dagarstolerans, 35 tim/vecka överbelastning, bekväm storlek, skifferfärg.';

  @override
  String get settingsResetSettingsTitle => 'Återställa inställningar?';

  @override
  String get settingsSampleData => 'Exempeldata';

  @override
  String settingsSampleDataError(String error) {
    return 'Fel: $error';
  }

  @override
  String get settingsStudySettings => 'Studieinställningar';

  @override
  String get settingsThemeDark => 'Mörkt';

  @override
  String get settingsThemeLight => 'Ljust';

  @override
  String get settingsThemeSystem => 'Systemstandard';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema uppdaterat.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dagar';
  }

  @override
  String get settingsToleranceError => 'Ange ett tal 0–30 dagar.';

  @override
  String get settingsToleranceHelper =>
      'Framåt kräver +N dagars överskott, bakom −N dagar. 5 = stabilt, 0 = känsligt.';

  @override
  String get settingsToleranceLabel => 'Dagar av arbete (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance av arbete';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerans uppdaterad.';

  @override
  String get settingsWeekdayFriday => 'Fredag';

  @override
  String get settingsWeekdayMonday => 'Måndag';

  @override
  String get settingsWeekdaySaturday => 'Lördag';

  @override
  String get settingsWeekdaySunday => 'Söndag';

  @override
  String get settingsWeekdayThursday => 'Torsdag';

  @override
  String get settingsWeekdayTuesday => 'Tisdag';

  @override
  String get settingsWeekdayWednesday => 'Onsdag';

  @override
  String get sortDeadline => 'Deadline';

  @override
  String get sortName => 'Namn';

  @override
  String get sortProgress => 'Framsteg';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'Kunde inte starta ECTS Tracker';

  @override
  String get statsActiveDays => 'Aktiva dagar';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d aktiv';
  }

  @override
  String get statsAddDeadlines =>
      'Lägg till deadlines för att förutse belastningen.';

  @override
  String get statsComingLoad => 'Kommande belastning';

  @override
  String get statsConsistency => 'Kontinuitet';

  @override
  String get statsConsistencyHint =>
      'Studiedagar de senaste 30 dagarna. Små steg varje dag slår intensivplugg.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent % av senaste 30 dagarna';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Kurs $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'K$id';
  }

  @override
  String get statsDidPerDay => 'Gjort / dag (14 d)';

  @override
  String get statsEmpty => 'Inga sessioner ännu';

  @override
  String get statsGap => 'Gap';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value tim';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}h';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours tim';
  }

  @override
  String get statsLast30Days => 'Senaste 30 dagarna';

  @override
  String get statsLast7Days => 'Senaste 7 dagarna';

  @override
  String get statsNeedPerDay => 'Behövs / dag';

  @override
  String get statsNext8Weeks => 'Kommande 8 veckorna';

  @override
  String get statsOfLast30DaysVolume => 'av senaste 30 dagarnas volym';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Överbelastningsveckor >${threshold}h flaggas rött — flytta en deadline eller minska omfattningen.';
  }

  @override
  String get statsOverview => 'Översikt';

  @override
  String get statsPaceCovers =>
      'Tidigare takt täcker det som behövs. Håll streaken.';

  @override
  String statsPaceShort(String gap) {
    return 'Tidigare takt är $gap tim/dag kort — lägg till ett block eller minska omfattningen.';
  }

  @override
  String get statsPastVsNeeded => 'Tidigare mot behövs';

  @override
  String statsPeakPerWeek(String peak) {
    return 'topp $peak tim/v';
  }

  @override
  String get statsPerCourse => 'Per kurs';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done tim / $required tim · $percent %';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent %';
  }

  @override
  String get statsSessions => 'Sessioner';

  @override
  String statsSuggestedOrder(String order) {
    return 'Föreslagen ordning: $order (tidigaste deadline först)';
  }

  @override
  String get statsTotal => 'Totalt';

  @override
  String get statsTotalVolume => 'total volym';

  @override
  String get statusAhead => 'Före';

  @override
  String get statusBehind => 'Bakom';

  @override
  String get statusCompleted => 'Avklarad';

  @override
  String get statusOnTrack => 'I fas';

  @override
  String get statusOverdue => 'Försenad';

  @override
  String get studyLogDeleteBody =>
      'Ta bort denna studiesession? Detta kan inte ångras.';

  @override
  String get studyLogDeleteTitle => 'Ta bort session?';

  @override
  String get studyLogEmptyHint =>
      'Logga en session för att följa din studietid.';

  @override
  String get studyLogEmptyTitle => 'Inga studiesessioner ännu';

  @override
  String get studyLogFabLabel => 'Logga session';

  @override
  String get studyLogFabTooltip => 'Logga session';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours tim';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Ta bort exempelsession';

  @override
  String get studyLogThisWeek => 'Denna vecka';

  @override
  String get studyLogToday => 'Idag';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Kurs $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS måste vara större än noll';

  @override
  String get validationCourseEctsRequired => 'Ange ECTS-poäng';

  @override
  String get validationCourseNameRequired => 'Namn krävs';

  @override
  String get validationCourseNameTooLong => 'Namnet är för långt';

  @override
  String get validationSessionCourseRequired => 'Välj en kurs';

  @override
  String get validationSessionDurationRequired => 'Ange en längd';

  @override
  String get widgetNoProgress => 'Inga framsteg ännu';

  @override
  String get settingsLanguage => 'Språk';

  @override
  String get settingsLiquidGlass => 'Flytande glas';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Kort och fält i frostat glas. Av behåller det klassiska solida utseendet.';

  @override
  String get settingsLiquidGlassOn => 'På';

  @override
  String get settingsLiquidGlassOff => 'Av';

  @override
  String get settingsLiquidGlassUpdated => 'Flytande glas uppdaterat.';
}
