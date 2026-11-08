// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Annuller';

  @override
  String get commonClose => 'Luk';

  @override
  String get commonDelete => 'Slet';

  @override
  String get commonEdit => 'Rediger';

  @override
  String get commonError => 'Fejl';

  @override
  String get commonNone => 'Ingen';

  @override
  String get commonSave => 'Gem';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Krævede timer (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Ryd deadline';

  @override
  String get courseFormClearStartTooltip => 'Ryd startdato';

  @override
  String get courseFormColorLabel => 'Farve';

  @override
  String get courseFormDateNotSet => 'Ikke angivet';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Deadline: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS-point';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value t/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Navn';

  @override
  String get courseFormNotesLabel => 'Noter (valgfrit)';

  @override
  String get courseFormSaving => 'Gemmer…';

  @override
  String courseFormStartButton(String date) {
    return 'Start: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Fra: intet pres indtil $date; udelukket fra Dagens tempo.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Til: tiden fordeles indtil nu og tæller med i Dagens tempo.';

  @override
  String get courseFormStartEarlyTitle => 'Start nu trods fremtidig start';

  @override
  String get courseFormTitleAdd => 'Tilføj fag';

  @override
  String get courseFormTitleEdit => 'Rediger fag';

  @override
  String get coursesAddTooltip => 'Tilføj fag';

  @override
  String coursesDeleteBody(String name) {
    return 'Slet \"$name\" og alle dens studiesessioner? Dette kan ikke fortrydes.';
  }

  @override
  String get coursesDeleteTitle => 'Slet fag?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Tryk på \"Nyt fag\" for at oprette dit første fag.';

  @override
  String get coursesEmptyTitle => 'Ingen fag endnu';

  @override
  String get coursesFilterAll => 'Alle statusser';

  @override
  String get coursesFilterEmpty => 'Ingen fag matcher dette filter';

  @override
  String get coursesNewCourse => 'Nyt fag';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily t/dag nødvendig';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily t/dag • $weekly t/uge nødvendig';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required t • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Fjern eksempelfag';

  @override
  String coursesShownCount(String count) {
    return '$count vist';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sortér: $label';
  }

  @override
  String get dashboardAllDone => 'Alt færdigt';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours t logget (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count fag';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count fag • $upcoming kommende ikke i dagens tempo';
  }

  @override
  String get dashboardCoursesTitle => 'Fag';

  @override
  String dashboardDeadline(String date) {
    return 'Deadline $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Deadline $date ($days dage tilbage)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Deadline $date (1 dag tilbage)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Deadline $date (overskredet)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Deadline $date (i dag)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Forfalden i dag — $hours t logget';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Alle fag er gennemført — se hele listen under fanen Fag.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Tilføj et fag for at begynde at følge dine ECTS-fremskridt.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Bagud = laver $achieved/d, skal bruge $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Bagud = laver $achieved/d, skal bruge $need/d • tidlig start';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Bagud: intet endeligt tempo når en deadline i dag med timer tilbage';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'På rette spor: intet tempo endnu — log første session for at bekræfte';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Starter om $days d • regnet fra $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Starter om $days d • regnet fra $date • tidlig start til';
  }

  @override
  String get dashboardFreshStart => 'FRISK START';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '• $pct% • $hours t tilbage';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required t';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours t/d';
  }

  @override
  String get dashboardLogSessionAction => 'Log studiesession';

  @override
  String get dashboardLogSessionTooltip => 'Log studiesession';

  @override
  String get dashboardNewBadge => 'NY';

  @override
  String get dashboardNoCourses => 'Ingen fag endnu';

  @override
  String get dashboardNoDeadline => 'Ingen deadline';

  @override
  String get dashboardNoDeadlines => 'Ingen deadlines planlagt';

  @override
  String get dashboardNoPaceDue => 'Intet tempo forfaldent i dag';

  @override
  String get dashboardNothingDue => 'Intet forfaldent';

  @override
  String get dashboardNothingToTrack => 'Intet at følge endnu';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Forfalden i dag — $hours t tilbage';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Skal bruge $daily t/dag for at blive færdig';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Skal bruge $daily t/dag • $weekly t/uge for at blive færdig';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Skal bruge $hours t/dag fra $date • ikke i Dagens tempo';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Ingen deadline — $hours t tilbage • intet dagligt pres';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Starter $date • $hours t at lave';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace • urealistisk';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint =>
      'Tilføj et fag for at begynde at følge';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required t';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days dages råderum';
  }

  @override
  String get dashboardStartNotSet => 'Ikke angivet';

  @override
  String dashboardStartsIn(String days) {
    return 'Starter om $days d';
  }

  @override
  String get dashboardStartsSoon => 'Starter snart';

  @override
  String get dashboardTipEmpty =>
      'Tilføj dit første fag — dit daglige tempo og dine fremskridt vises her.';

  @override
  String get dashboardTipFirst =>
      'De første 25 minutter tæller mest — vælg faget med den tidligste deadline.';

  @override
  String get dashboardTodayBare => 'I DAG';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace t';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'I DAG $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'DAGENS TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace t i dag';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Fremtidige starter — intet pres i dag, udelukket fra Dagens tempo.';

  @override
  String get dashboardUpcomingTitle => 'Kommende';

  @override
  String get devToolsActivate => 'Aktivér';

  @override
  String get devToolsActivateMessage =>
      'Dette låser op for skjulte stresstest-værktøjer (pump genererede data). Kun til udvikling.';

  @override
  String get devToolsActivateTitle => 'Aktivér udviklertilstand?';

  @override
  String get devToolsActivated => 'Udviklertilstand aktiveret.';

  @override
  String get devToolsClearPumped => 'Ryd pumpede data';

  @override
  String get devToolsClearPumpedMessage =>
      'Sletter de genererede STRESS-fag og deres sessioner. Dine egne data bevares.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Slet genererede STRESS-fag og sessioner.';

  @override
  String get devToolsClearPumpedTitle => 'Ryd pumpede data?';

  @override
  String devToolsCleared(String count) {
    return 'Ryddede $count pumpede fag.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Anden bekræftelse: dette vil oppuste fag, lister, diagrammer og tempoberegninger og kan tage et par sekunder. Pump nu?';

  @override
  String get devToolsConfirmPumpTitle => 'Bekræft stresspump';

  @override
  String get devToolsContinue => 'Fortsæt';

  @override
  String get devToolsExit => 'Afslut udviklertilstand';

  @override
  String get devToolsExitSubtitle => 'Skjul udviklerværktøjer på denne enhed.';

  @override
  String get devToolsPumpData => 'Pump data';

  @override
  String get devToolsPumpMessage =>
      'Dette indsætter et realistisk genereret semester (~10 fag, ~800 sessioner over de sidste 12 uger). Dine eksisterende data bevares. Fortsæt?';

  @override
  String get devToolsPumpSubtitle =>
      'Indsæt et genereret semester (~10 fag, ~800 sessioner, 12 uger). Eksisterende data bevares.';

  @override
  String get devToolsPumpTile => 'Pump testdata';

  @override
  String get devToolsPumpTitle => 'Pump testdata?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Pumpede $courses fag, $sessions sessioner.';
  }

  @override
  String get devToolsPumping => 'Pumper testdata…';

  @override
  String get devToolsRemoveAll => 'Fjern alle data';

  @override
  String get devToolsRemoveAllMessage =>
      'Udviklergenvej: dette sletter permanent ALLE fag, sessioner og indstillinger. Dette kan ikke fortrydes.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Udviklergenvej: slet ALLE fag, sessioner og indstillinger.';

  @override
  String get devToolsRemoveAllTitle => 'Fjern alle data?';

  @override
  String get navCourses => 'Fag';

  @override
  String get navDashboard => 'Overblik';

  @override
  String get navSettings => 'Indstillinger';

  @override
  String get navStatistics => 'Statistik';

  @override
  String get navStudyLog => 'Studielog';

  @override
  String get sampleBadge => 'Eksempel';

  @override
  String get sessionFormCourseLabel => 'Fag';

  @override
  String sessionFormDateButton(String date) {
    return 'Dato: $date';
  }

  @override
  String get sessionFormDurationError => 'Varigheden skal være større end nul.';

  @override
  String get sessionFormHoursLabel => 'Timer';

  @override
  String get sessionFormLogAction => 'Log session';

  @override
  String get sessionFormMinutesLabel => 'Minutter';

  @override
  String get sessionFormNoCourseError => 'Vælg et fag.';

  @override
  String get sessionFormNoCoursesHint =>
      'Tilføj først et fag for at logge en session.';

  @override
  String get sessionFormNotesLabel => 'Noter (valgfrit)';

  @override
  String get sessionFormSaving => 'Gemmer…';

  @override
  String get sessionFormTitleAdd => 'Log studiesession';

  @override
  String get sessionFormTitleEdit => 'Rediger studiesession';

  @override
  String sessionFormTotalHours(String hours) {
    return 'I alt: $hours t';
  }

  @override
  String get settingsAccent => 'Temafarve';

  @override
  String get settingsAccentBerry => 'Bær';

  @override
  String get settingsAccentClay => 'Ler';

  @override
  String get settingsAccentForest => 'Skov';

  @override
  String get settingsAccentSlate => 'Skifer';

  @override
  String get settingsAccentTeal => 'Blågrøn';

  @override
  String get settingsAccentUpdated => 'Temafarve opdateret.';

  @override
  String get settingsAllDataDeleted => 'Alle data slettet.';

  @override
  String get settingsAppearance => 'Udseende (mørk / lys)';

  @override
  String get settingsCheckingSample => 'Tjekker eksempeldata…';

  @override
  String get settingsClear => 'Ryd';

  @override
  String get settingsClearSample => 'Ryd eksempeldata';

  @override
  String get settingsClearSampleMessage =>
      'Dette fjerner eksempelfagene og -sessionerne. Fag eller sessioner, du selv har tilføjet, fjernes ikke.';

  @override
  String get settingsClearSampleSubtitle =>
      'Fjern de forudfyldte eksempelfag og -sessioner. Dine egne data bevares.';

  @override
  String get settingsClearSampleTitle => 'Ryd eksempeldata?';

  @override
  String get settingsCopy => 'Kopiér';

  @override
  String get settingsDailyError =>
      'Indtast 0 eller et positivt antal minutter.';

  @override
  String get settingsDailyLabel => 'Minutter pr. dag (0 = intet mål)';

  @override
  String get settingsDailyTarget => 'Dagligt studiemål';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dag';
  }

  @override
  String get settingsDailyUpdated => 'Dagligt mål opdateret.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Slet alt';

  @override
  String get settingsDevMode => 'Udviklertilstand';

  @override
  String get settingsDisplay => 'Visning';

  @override
  String get settingsDisplayComfortable => 'Komfortabel';

  @override
  String get settingsDisplayCompact => 'Kompakt';

  @override
  String get settingsDisplayLarge => 'Stor';

  @override
  String get settingsDisplaySize => 'Tekst- og elementstørrelse';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Visningsstørrelse opdateret.';

  @override
  String get settingsExport => 'Eksportér data';

  @override
  String get settingsExportCopied => 'Eksport kopieret til udklipsholderen.';

  @override
  String get settingsExportSubtitle =>
      'Kopiér alle fag, sessioner og indstillinger som JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses fag • $sessions sessioner • $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (afkortet — fuld sikkerhedskopi er $kb KB, brug Kopiér for det hele)';
  }

  @override
  String get settingsFirstWeekday => 'Første ugedag';

  @override
  String get settingsFirstWeekdayUpdated => 'Første ugedag opdateret.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s hold)';
  }

  @override
  String get settingsHoldToReplace => 'Hold for at erstatte alt';

  @override
  String get settingsHoursError => 'Indtast et tal større end nul.';

  @override
  String get settingsHoursHelper =>
      'Standard 30. Ændring genberegner kravene; logfiler bevares.';

  @override
  String get settingsHoursLabel => 'Timer pr. ECTS-point';

  @override
  String get settingsHoursPerEcts => 'Timer pr. ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value t';
  }

  @override
  String get settingsHoursUpdated => 'Timer pr. ECTS opdateret.';

  @override
  String get settingsImport => 'Importér data';

  @override
  String get settingsImportAppend => 'Tilføj';

  @override
  String get settingsImportAppendAction => 'Importér (tilføj)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Data tilføjet: $courses fag, $sessions sessioner tilføjet.';
  }

  @override
  String get settingsImportInfo =>
      'Tilføj lægger sikkerhedskopien oven i dine aktuelle data (indstillinger bevares). Erstat sletter først ALLE fag, sessioner og indstillinger.';

  @override
  String get settingsImportLabel => 'Indsæt eksporteret JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses fag • $sessions sessioner';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '• eksporteret $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '• skema v$schema';
  }

  @override
  String get settingsImportReplace => 'Erstat';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Erstat sletter først det hele. Tryk og HOLD knappen nedenfor i $seconds sekunder for at bekræfte.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Data erstattet: $courses fag, $sessions sessioner gendannet.';
  }

  @override
  String get settingsImportSubtitle =>
      'Erstat alle data fra en tidligere eksporteret JSON-sikkerhedskopi.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Bliv ved med at holde… $remaining s';
  }

  @override
  String get settingsNoSample => 'Ingen eksempeldata';

  @override
  String get settingsNoSampleSubtitle =>
      'De forudfyldte eksempeldata er allerede ryddet.';

  @override
  String get settingsNoTarget => 'Intet mål angivet';

  @override
  String get settingsOverloadError => 'Indtast et tal 5–100 t/uge.';

  @override
  String get settingsOverloadHelper =>
      'Kommende belastningsuger over dette markeres med rødt. Fuldtidsstudier er ~35–40 t/uge.';

  @override
  String settingsOverloadHours(String value) {
    return '$value t';
  }

  @override
  String get settingsOverloadLabel => 'Timer pr. uge (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/uge markeres med rødt';
  }

  @override
  String get settingsOverloadThreshold => 'Ugentlig overbelastningstærskel';

  @override
  String get settingsOverloadUpdated => 'Overbelastningstærskel opdateret.';

  @override
  String get settingsPaceTolerance => 'Foran/bagud-tolerance';

  @override
  String get settingsPasteValidBackup =>
      'Indsæt først en gyldig sikkerhedskopi';

  @override
  String get settingsReset => 'Nulstil';

  @override
  String get settingsResetAll => 'Nulstil alle data';

  @override
  String get settingsResetAllMessage =>
      'Dette sletter permanent ALLE fag, sessioner og indstillinger. Dette kan ikke fortrydes. Eksportér først en sikkerhedskopi, hvis nødvendigt.';

  @override
  String get settingsResetAllSubtitle =>
      'Slet alle fag, sessioner og indstillinger.';

  @override
  String get settingsResetAllTitle => 'Nulstil alle data?';

  @override
  String get settingsResetSettings => 'Nulstil indstillinger';

  @override
  String get settingsResetSettingsDone =>
      'Indstillinger nulstillet til standard.';

  @override
  String get settingsResetSettingsMessage =>
      'Gendanner timer pr. ECTS (30), dagligt mål (ingen), første ugedag (mandag), tema (system), tolerance (5 dage), overbelastning (35 t/uge), størrelse (komfortabel), farve (skifer). Fag og sessioner bevares.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Gendan standarder: 30 t/ECTS, intet mål, mandag, systemtema, 5 dages tolerance, 35 t/uge overbelastning, komfortabel størrelse, skifer farve.';

  @override
  String get settingsResetSettingsTitle => 'Nulstil indstillinger?';

  @override
  String get settingsSampleData => 'Eksempeldata';

  @override
  String settingsSampleDataError(String error) {
    return 'Fejl: $error';
  }

  @override
  String get settingsStudySettings => 'Studieindstillinger';

  @override
  String get settingsThemeDark => 'Mørk';

  @override
  String get settingsThemeLight => 'Lys';

  @override
  String get settingsThemeSystem => 'Systemstandard';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema opdateret.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dage';
  }

  @override
  String get settingsToleranceError => 'Indtast et tal 0–30 dage.';

  @override
  String get settingsToleranceHelper =>
      'Foran kræver +N dages overskud, bagud −N dage. 5 = stabil, 0 = følsom.';

  @override
  String get settingsToleranceLabel => 'Dages arbejde (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance arbejde';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerance opdateret.';

  @override
  String get settingsWeekdayFriday => 'Fredag';

  @override
  String get settingsWeekdayMonday => 'Mandag';

  @override
  String get settingsWeekdaySaturday => 'Lørdag';

  @override
  String get settingsWeekdaySunday => 'Søndag';

  @override
  String get settingsWeekdayThursday => 'Torsdag';

  @override
  String get settingsWeekdayTuesday => 'Tirsdag';

  @override
  String get settingsWeekdayWednesday => 'Onsdag';

  @override
  String get sortDeadline => 'Deadline';

  @override
  String get sortName => 'Navn';

  @override
  String get sortProgress => 'Fremskridt';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'Kunne ikke starte ECTS Tracker';

  @override
  String get statsActiveDays => 'Aktive dage';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d aktiv';
  }

  @override
  String get statsAddDeadlines =>
      'Tilføj deadlines for at forudsige belastningen.';

  @override
  String get statsComingLoad => 'Kommende belastning';

  @override
  String get statsConsistency => 'Konsistens';

  @override
  String get statsConsistencyHint =>
      'Studiedage i de sidste 30 dage. Små skridt hver dag slår intensiv læsning.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% af de sidste 30 dage';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Fag $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'F$id';
  }

  @override
  String get statsDidPerDay => 'Lavet / dag (14 d)';

  @override
  String get statsEmpty => 'Ingen sessioner endnu';

  @override
  String get statsGap => 'Forskel';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value t';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours t';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours t';
  }

  @override
  String get statsLast30Days => 'Sidste 30 dage';

  @override
  String get statsLast7Days => 'Sidste 7 dage';

  @override
  String get statsNeedPerDay => 'Skal bruge / dag';

  @override
  String get statsNext8Weeks => 'Næste 8 uger';

  @override
  String get statsOfLast30DaysVolume => 'af de sidste 30 dages volumen';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Overbelastningsuger >$threshold t markeres med rødt — flyt en deadline eller skær omfanget.';
  }

  @override
  String get statsOverview => 'Overblik';

  @override
  String get statsPaceCovers =>
      'Det hidtidige tempo dækker behovet. Hold stimen.';

  @override
  String statsPaceShort(String gap) {
    return 'Det hidtidige tempo er $gap t/dag for kort — tilføj en blok eller skær omfanget.';
  }

  @override
  String get statsPastVsNeeded => 'Hidtidig vs. nødvendig';

  @override
  String statsPeakPerWeek(String peak) {
    return 'spidsbelastning $peak t/uge';
  }

  @override
  String get statsPerCourse => 'Pr. fag';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done t / $required t • $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sessioner';

  @override
  String statsSuggestedOrder(String order) {
    return 'Foreslået rækkefølge: $order (tidligste deadline først)';
  }

  @override
  String get statsTotal => 'I alt';

  @override
  String get statsTotalVolume => 'samlet volumen';

  @override
  String get statusAhead => 'Foran';

  @override
  String get statusBehind => 'Bagud';

  @override
  String get statusCompleted => 'Gennemført';

  @override
  String get statusOnTrack => 'På rette spor';

  @override
  String get statusOverdue => 'Overskredet';

  @override
  String get studyLogDeleteBody =>
      'Slet denne studiesession? Dette kan ikke fortrydes.';

  @override
  String get studyLogDeleteTitle => 'Slet session?';

  @override
  String get studyLogEmptyHint => 'Log en session for at følge din studietid.';

  @override
  String get studyLogEmptyTitle => 'Ingen studiesessioner endnu';

  @override
  String get studyLogFabLabel => 'Log session';

  @override
  String get studyLogFabTooltip => 'Log session';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours t';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Fjern eksempelsession';

  @override
  String get studyLogThisWeek => 'Denne uge';

  @override
  String get studyLogToday => 'I dag';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Fag $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'F$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS skal være større end nul';

  @override
  String get validationCourseEctsRequired => 'Indtast ECTS-point';

  @override
  String get validationCourseNameRequired => 'Navn er påkrævet';

  @override
  String get validationCourseNameTooLong => 'Navnet er for langt';

  @override
  String get validationSessionCourseRequired => 'Vælg et fag';

  @override
  String get validationSessionDurationRequired => 'Indtast en varighed';

  @override
  String get widgetNoProgress => 'Ingen fremskridt endnu';

  @override
  String get settingsLanguage => 'Sprog';
}
