// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonClose => 'Lukk';

  @override
  String get commonDelete => 'Slett';

  @override
  String get commonEdit => 'Rediger';

  @override
  String get commonError => 'Feil';

  @override
  String get commonNone => 'Ingen';

  @override
  String get commonSave => 'Lagre';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Nødvendige timer (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Fjern frist';

  @override
  String get courseFormClearStartTooltip => 'Fjern startdato';

  @override
  String get courseFormColorLabel => 'Farge';

  @override
  String get courseFormDateNotSet => 'Ikke satt';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Frist: $date';
  }

  @override
  String get courseFormEctsLabel => 'Studiepoeng';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value t/studiepoeng';
  }

  @override
  String get courseFormNameLabel => 'Navn';

  @override
  String get courseFormNotesLabel => 'Notater (valgfritt)';

  @override
  String get courseFormSaving => 'Lagrer…';

  @override
  String courseFormStartButton(String date) {
    return 'Start: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Av: ikke noe press før $date; utelatt fra dagens tempo.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'På: tiden fordeles frem til nå og teller mot dagens tempo.';

  @override
  String get courseFormStartEarlyTitle =>
      'Start nå til tross for fremtidig start';

  @override
  String get courseFormTitleAdd => 'Legg til emne';

  @override
  String get courseFormTitleEdit => 'Rediger emne';

  @override
  String get coursesAddTooltip => 'Legg til emne';

  @override
  String coursesDeleteBody(String name) {
    return 'Slette «$name» og alle tilhørende studieøkter? Dette kan ikke angres.';
  }

  @override
  String get coursesDeleteTitle => 'Slette emne?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits studiepoeng';
  }

  @override
  String get coursesEmptyHint =>
      'Trykk «Nytt emne» for å opprette ditt første emne.';

  @override
  String get coursesEmptyTitle => 'Ingen emner ennå';

  @override
  String get coursesFilterAll => 'Alle statuser';

  @override
  String get coursesFilterEmpty => 'Ingen emner samsvarer med dette filteret';

  @override
  String get coursesNewCourse => 'Nytt emne';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily t/dag nødvendig';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/dag nødvendig';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily t/dag • $weekly t/uke nødvendig';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/dag • $weekly min/uke nødvendig';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/dag • $weekly t/uke nødvendig';
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
  String get coursesRemoveSampleTooltip => 'Fjern eksempel-emne';

  @override
  String coursesShownCount(String count) {
    return '$count vist';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sortering: $label';
  }

  @override
  String get dashboardAllDone => 'Alt ferdig';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours t logget (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count emne(r)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count emne(r) · $upcoming kommende ikke i dagens tempo';
  }

  @override
  String get dashboardCoursesTitle => 'Emner';

  @override
  String dashboardDeadline(String date) {
    return 'Frist $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Frist $date ($days dager igjen)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Frist $date (1 dag igjen)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Frist $date (forsinket)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Frist $date (i dag)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Forfaller i dag — $hours t logget';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Alle emner er fullført — se Emner-fanen for hele listen.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Legg til et emne for å begynne å følge studiepoengfremgangen.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Bak = gjør $achieved/d, trenger $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Bak = gjør $achieved/d, trenger $need/d · tidlig start';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Bak: ikke noe endelig tempo når fristen er i dag og timer gjenstår';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'I rute: ikke noe tempo ennå — logg første økt for å bekrefte';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Starter om $days d · regnet fra $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Starter om $days d · regnet fra $date · tidlig start på';
  }

  @override
  String get dashboardFreshStart => 'NY START';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct % · $hours t igjen';
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
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/d';
  }

  @override
  String get dashboardLogSessionAction => 'Logg studieøkt';

  @override
  String get dashboardLogSessionTooltip => 'Logg studieøkt';

  @override
  String get dashboardNewBadge => 'NY';

  @override
  String get dashboardNoCourses => 'Ingen emner ennå';

  @override
  String get dashboardNoDeadline => 'Ingen frist';

  @override
  String get dashboardNoDeadlines => 'Ingen frister planlagt';

  @override
  String get dashboardNoPaceDue => 'Ikke noe tempo forfaller i dag';

  @override
  String get dashboardNothingDue => 'Ingenting forfaller';

  @override
  String get dashboardNothingToTrack => 'Ingenting å følge ennå';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Forfaller i dag — $hours t igjen';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Trenger $daily t/dag for å bli ferdig';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Trenger $daily min/dag for å bli ferdig';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Trenger $daily t/dag · $weekly t/uke for å bli ferdig';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Trenger $daily min/dag · $weekly min/uke for å bli ferdig';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Trenger $daily min/dag · $weekly t/uke for å bli ferdig';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Trenger $hours t/dag fra $date · ikke i dagens tempo';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Trenger $minutes min/dag fra $date · ikke i dagens tempo';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Ingen frist — $hours t igjen · ikke noe daglig press';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Starter $date · $hours t å gjøre';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · urealistisk';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint =>
      'Legg til et emne for å begynne å følge';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required t';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct %';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days dager med tid igjen';
  }

  @override
  String get dashboardStartNotSet => 'Ikke satt';

  @override
  String dashboardStartsIn(String days) {
    return 'Starter om $days d';
  }

  @override
  String get dashboardStartsSoon => 'Starter snart';

  @override
  String get dashboardTipEmpty =>
      'Legg til ditt første emne — daglig tempo og fremgang vises her.';

  @override
  String get dashboardTipFirst =>
      'De første 25 minuttene teller mest — velg emnet med tidligste frist.';

  @override
  String get dashboardTodayBare => 'I DAG';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace t';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'I DAG $pct %';
  }

  @override
  String get dashboardTodayPaceLabel => 'DAGENS TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace t i dag';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Fremtidige starter — ikke noe press i dag, utelatt fra dagens tempo.';

  @override
  String get dashboardUpcomingTitle => 'Kommende';

  @override
  String get devToolsActivate => 'Aktiver';

  @override
  String get devToolsActivateMessage =>
      'Dette låser opp skjulte stresstestverktøy (genererte data). Kun for utvikling.';

  @override
  String get devToolsActivateTitle => 'Aktivere utviklermodus?';

  @override
  String get devToolsActivated => 'Utviklermodus aktivert.';

  @override
  String get devToolsClearPumped => 'Tøm genererte data';

  @override
  String get devToolsClearPumpedMessage =>
      'Sletter de genererte STRESS-emnene og øktene deres. Dine egne data beholdes.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Slett genererte STRESS-emner og økter.';

  @override
  String get devToolsClearPumpedTitle => 'Tømme genererte data?';

  @override
  String devToolsCleared(String count) {
    return 'Tømte $count genererte emne(r).';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Andre bekreftelse: dette fyller opp emner, lister, diagrammer og tempoberegninger, og kan ta noen sekunder. Fylle på nå?';

  @override
  String get devToolsConfirmPumpTitle => 'Bekreft stresstest';

  @override
  String get devToolsContinue => 'Fortsett';

  @override
  String get devToolsExit => 'Avslutt utviklermodus';

  @override
  String get devToolsExitSubtitle => 'Skjul utviklerverktøy på denne enheten.';

  @override
  String get devToolsPumpData => 'Fyll på data';

  @override
  String get devToolsPumpMessage =>
      'Dette setter inn et realistisk generert semester (ca. 10 emner, ca. 800 økter over de siste 12 ukene). Eksisterende data beholdes. Fortsette?';

  @override
  String get devToolsPumpSubtitle =>
      'Sett inn et generert semester (ca. 10 emner, ca. 800 økter, 12 uker). Eksisterende data beholdes.';

  @override
  String get devToolsPumpTile => 'Fyll på testdata';

  @override
  String get devToolsPumpTitle => 'Fylle på testdata?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Fylte på $courses emner, $sessions økter.';
  }

  @override
  String get devToolsPumping => 'Fyller på testdata…';

  @override
  String get devToolsRemoveAll => 'Fjern alle data';

  @override
  String get devToolsRemoveAllMessage =>
      'Utviklersnarvei: dette sletter permanent ALLE emner, økter og innstillinger. Dette kan ikke angres.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Utviklersnarvei: slett ALLE emner, økter og innstillinger.';

  @override
  String get devToolsRemoveAllTitle => 'Fjerne alle data?';

  @override
  String get navCourses => 'Emner';

  @override
  String get navDashboard => 'Oversikt';

  @override
  String get navSettings => 'Innstillinger';

  @override
  String get navStatistics => 'Statistikk';

  @override
  String get navStudyLog => 'Studielogg';

  @override
  String get sampleBadge => 'Eksempel';

  @override
  String get sessionFormCourseLabel => 'Emne';

  @override
  String sessionFormDateButton(String date) {
    return 'Dato: $date';
  }

  @override
  String get sessionFormDurationError => 'Varigheten må være større enn null.';

  @override
  String get sessionFormHoursLabel => 'Timer';

  @override
  String get sessionFormLogAction => 'Logg økt';

  @override
  String get sessionFormMinutesLabel => 'Minutter';

  @override
  String get sessionFormNoCourseError => 'Velg et emne.';

  @override
  String get sessionFormNoCoursesHint =>
      'Legg til et emne først for å logge en økt.';

  @override
  String get sessionFormNotesLabel => 'Notater (valgfritt)';

  @override
  String get sessionFormSaving => 'Lagrer…';

  @override
  String get sessionFormTitleAdd => 'Logg studieøkt';

  @override
  String get sessionFormTitleEdit => 'Rediger studieøkt';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Totalt: $hours t';
  }

  @override
  String get settingsAccent => 'Temafarge';

  @override
  String get settingsAccentBerry => 'Bær';

  @override
  String get settingsAccentClay => 'Leire';

  @override
  String get settingsAccentForest => 'Skog';

  @override
  String get settingsAccentSlate => 'Skifer';

  @override
  String get settingsAccentTeal => 'Blågrønn';

  @override
  String get settingsAccentUpdated => 'Temafarge oppdatert.';

  @override
  String get settingsAllDataDeleted => 'Alle data slettet.';

  @override
  String get settingsAppearance => 'Utseende (mørk / lys)';

  @override
  String get settingsCheckingSample => 'Sjekker eksempeldata…';

  @override
  String get settingsClear => 'Tøm';

  @override
  String get settingsClearSample => 'Tøm eksempeldata';

  @override
  String get settingsClearSampleMessage =>
      'Dette fjerner eksempel-emnene og øktene. Emner eller økter du har lagt til selv, fjernes ikke.';

  @override
  String get settingsClearSampleSubtitle =>
      'Fjern de forhåndsutfylte eksempel-emnene og øktene. Dine egne data beholdes.';

  @override
  String get settingsClearSampleTitle => 'Tømme eksempeldata?';

  @override
  String get settingsCopy => 'Kopier';

  @override
  String get settingsDailyError => 'Skriv 0 eller et positivt antall minutter.';

  @override
  String get settingsDailyLabel => 'Minutter per dag (0 = ikke noe mål)';

  @override
  String get settingsDailyTarget => 'Daglig studiemål';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dag';
  }

  @override
  String get settingsDailyUpdated => 'Daglig mål oppdatert.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Slett alt';

  @override
  String get settingsDevMode => 'Utviklermodus';

  @override
  String get settingsDisplay => 'Visning';

  @override
  String get settingsDisplayComfortable => 'Behagelig';

  @override
  String get settingsDisplayCompact => 'Kompakt';

  @override
  String get settingsDisplayLarge => 'Stor';

  @override
  String get settingsDisplaySize => 'Tekst- og elementstørrelse';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent %)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Skjermstørrelse oppdatert.';

  @override
  String get settingsExport => 'Eksporter data';

  @override
  String get settingsExportCopied => 'Eksport kopiert til utklippstavlen.';

  @override
  String get settingsExportSubtitle =>
      'Kopier alle emner, økter og innstillinger som JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses emne(r) · $sessions økt(er) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (avkortet — full sikkerhetskopi er $kb KB, bruk Kopier for alt)';
  }

  @override
  String get settingsFirstWeekday => 'Første ukedag';

  @override
  String get settingsFirstWeekdayUpdated => 'Første ukedag oppdatert.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s hold)';
  }

  @override
  String get settingsHoldToReplace => 'Hold for å erstatte alt';

  @override
  String get settingsHoursError => 'Skriv et tall større enn null.';

  @override
  String get settingsHoursHelper =>
      'Standard 30. Endring beregner krav på nytt; logger beholdes.';

  @override
  String get settingsHoursLabel => 'Timer per studiepoeng';

  @override
  String get settingsHoursPerEcts => 'Timer per studiepoeng';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value t';
  }

  @override
  String get settingsHoursUpdated => 'Timer per studiepoeng oppdatert.';

  @override
  String get settingsImport => 'Importer data';

  @override
  String get settingsImportAppend => 'Legg til';

  @override
  String get settingsImportAppendAction => 'Importer (legg til)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Data lagt til: $courses emne(r), $sessions økt(er) lagt til.';
  }

  @override
  String get settingsImportInfo =>
      'Legg til legger sikkerhetskopien til ved siden av gjeldende data (innstillinger beholdes). Erstatt sletter ALLE emner, økter og innstillinger først.';

  @override
  String get settingsImportLabel => 'Lim inn eksportert JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses emne(r) · $sessions økt(er)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · eksportert $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · skjema v$schema';
  }

  @override
  String get settingsImportReplace => 'Erstatt';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Erstatt sletter alt først. Trykk og HOLD knappen nedenfor i $seconds sekunder for å bekrefte.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Data erstattet: $courses emne(r), $sessions økt(er) gjenopprettet.';
  }

  @override
  String get settingsImportSubtitle =>
      'Erstatt alle data fra en tidligere eksportert JSON-sikkerhetskopi.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Fortsett å holde… $remaining s';
  }

  @override
  String get settingsNoSample => 'Ingen eksempeldata';

  @override
  String get settingsNoSampleSubtitle =>
      'De forhåndsutfylte eksempeldataene er allerede tømt.';

  @override
  String get settingsNoTarget => 'Ikke noe mål satt';

  @override
  String get settingsOverloadError => 'Skriv et tall 5–100 t/uke.';

  @override
  String get settingsOverloadHelper =>
      'Kommende uker over dette flagges rødt. Fulltidsstudier er ca. 35–40 t/uke.';

  @override
  String settingsOverloadHours(String value) {
    return '$value t';
  }

  @override
  String get settingsOverloadLabel => 'Timer per uke (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/uke flagges rødt';
  }

  @override
  String get settingsOverloadThreshold => 'Ukentlig overbelastningsgrense';

  @override
  String get settingsOverloadUpdated => 'Overbelastningsgrense oppdatert.';

  @override
  String get settingsPaceTolerance => 'Foran-/bak-toleranse';

  @override
  String get settingsPasteValidBackup =>
      'Lim inn en gyldig sikkerhetskopi først';

  @override
  String get settingsReset => 'Tilbakestill';

  @override
  String get settingsResetAll => 'Tilbakestill alle data';

  @override
  String get settingsResetAllMessage =>
      'Dette sletter permanent ALLE emner, økter og innstillinger. Dette kan ikke angres. Eksporter en sikkerhetskopi først ved behov.';

  @override
  String get settingsResetAllSubtitle =>
      'Slett alle emner, økter og innstillinger.';

  @override
  String get settingsResetAllTitle => 'Tilbakestille alle data?';

  @override
  String get settingsResetSettings => 'Tilbakestill innstillinger';

  @override
  String get settingsResetSettingsDone =>
      'Innstillinger tilbakestilt til standard.';

  @override
  String get settingsResetSettingsMessage =>
      'Gjenoppretter timer per studiepoeng (30), daglig mål (ingen), første ukedag (mandag), tema (system), toleranse (5 dager), overbelastning (35 t/uke), størrelse (behagelig), farge (skifer). Emner og økter beholdes.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Gjenopprett standard: 30 t/studiepoeng, ikke noe mål, mandag, systemtema, 5 dagers toleranse, 35 t/uke overbelastning, behagelig størrelse, skifer farge.';

  @override
  String get settingsResetSettingsTitle => 'Tilbakestille innstillinger?';

  @override
  String get settingsSampleData => 'Eksempeldata';

  @override
  String settingsSampleDataError(String error) {
    return 'Feil: $error';
  }

  @override
  String get settingsStudySettings => 'Studieinnstillinger';

  @override
  String get settingsThemeDark => 'Mørk';

  @override
  String get settingsThemeLight => 'Lys';

  @override
  String get settingsThemeSystem => 'Systemstandard';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema oppdatert.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dager';
  }

  @override
  String get settingsToleranceError => 'Skriv et tall 0–30 dager.';

  @override
  String get settingsToleranceHelper =>
      'Foran trenger +N dagers overskudd, bak −N dager. 5 = stabil, 0 = følsom.';

  @override
  String get settingsToleranceLabel => 'Dager med arbeid (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance med arbeid';
  }

  @override
  String get settingsToleranceUpdated => 'Toleranse oppdatert.';

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
  String get sortDeadline => 'Frist';

  @override
  String get sortName => 'Navn';

  @override
  String get sortProgress => 'Fremgang';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'Kunne ikke starte ECTS Tracker';

  @override
  String get statsActiveDays => 'Aktive dager';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d aktiv';
  }

  @override
  String get statsAddDeadlines =>
      'Legg til frister for å forutsi belastningen.';

  @override
  String get statsComingLoad => 'Kommende belastning';

  @override
  String get statsConsistency => 'Konsistens';

  @override
  String get statsConsistencyHint =>
      'Studiedager de siste 30 dagene. Små steg hver dag slår pugging.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent % av de siste 30 dagene';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Emne $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'E$id';
  }

  @override
  String get statsDidPerDay => 'Gjort / dag (14 d)';

  @override
  String get statsEmpty => 'Ingen økter ennå';

  @override
  String get statsGap => 'Avvik';

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
  String get statsLast30Days => 'Siste 30 dager';

  @override
  String get statsLast7Days => 'Siste 7 dager';

  @override
  String get statsNeedPerDay => 'Trenger / dag';

  @override
  String get statsNext8Weeks => 'Neste 8 uker';

  @override
  String get statsOfLast30DaysVolume => 'av de siste 30 dagers volum';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Overbelastningsuker >$threshold t flagges rødt — flytt en frist eller kutt omfang.';
  }

  @override
  String get statsOverview => 'Oversikt';

  @override
  String get statsPaceCovers =>
      'Tidligere tempo dekker det som trengs. Hold stimen.';

  @override
  String statsPaceShort(String gap) {
    return 'Tidligere tempo er $gap t/dag for lavt — legg til en blokk eller kutt omfang.';
  }

  @override
  String get statsPastVsNeeded => 'Tidligere mot nødvendig';

  @override
  String statsPeakPerWeek(String peak) {
    return 'topp $peak t/uke';
  }

  @override
  String get statsPerCourse => 'Per emne';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done t / $required t · $percent %';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent %';
  }

  @override
  String get statsSessions => 'Økter';

  @override
  String statsSuggestedOrder(String order) {
    return 'Foreslått rekkefølge: $order (tidligste frist først)';
  }

  @override
  String get statsTotal => 'Totalt';

  @override
  String get statsTotalVolume => 'totalt volum';

  @override
  String get statusAhead => 'Foran';

  @override
  String get statusBehind => 'Bak';

  @override
  String get statusCompleted => 'Fullført';

  @override
  String get statusOnTrack => 'I rute';

  @override
  String get statusOverdue => 'Forsinket';

  @override
  String get studyLogDeleteBody =>
      'Slette denne studieøkten? Dette kan ikke angres.';

  @override
  String get studyLogDeleteTitle => 'Slette økt?';

  @override
  String get studyLogEmptyHint => 'Logg en økt for å følge studietiden din.';

  @override
  String get studyLogEmptyTitle => 'Ingen studieøkter ennå';

  @override
  String get studyLogFabLabel => 'Logg økt';

  @override
  String get studyLogFabTooltip => 'Logg økt';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours t';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Fjern eksempel-økt';

  @override
  String get studyLogThisWeek => 'Denne uken';

  @override
  String get studyLogToday => 'I dag';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Emne $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'E$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'Studiepoeng må være større enn null';

  @override
  String get validationCourseEctsRequired => 'Skriv inn studiepoeng';

  @override
  String get validationCourseNameRequired => 'Navn er påkrevd';

  @override
  String get validationCourseNameTooLong => 'Navnet er for langt';

  @override
  String get validationSessionCourseRequired => 'Velg et emne';

  @override
  String get validationSessionDurationRequired => 'Skriv inn en varighet';

  @override
  String get widgetNoProgress => 'Ingen fremgang ennå';

  @override
  String get settingsLanguage => 'Språk';

  @override
  String get settingsLiquidGlass => 'Flytende glass';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Kort og felt i frostet glass. Av beholder det klassiske, heldekkende utseendet.';

  @override
  String get settingsLiquidGlassOn => 'På';

  @override
  String get settingsLiquidGlassOff => 'Av';

  @override
  String get settingsLiquidGlassUpdated => 'Flytende glass oppdatert.';

  @override
  String get devToolsReminderPreview => 'Forhåndsvisning av påminnelse';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Se hva som ville varslet akkurat nå. Windows-sikker testfeed.';

  @override
  String get reminderPreviewTitle => 'Forhåndsvisning av påminnelse';

  @override
  String get reminderPreviewNow => 'Forhåndsvisningstid';

  @override
  String get reminderPreviewReset => 'Nå';

  @override
  String get reminderPreviewEmpty =>
      'Helt stille — ingenting ville varslet på dette tidspunktet.';

  @override
  String get reminderPreviewCustom => 'Egendefinerte planer (demo)';

  @override
  String get reminderPreviewNoFire => 'Ingen kommende varsling.';

  @override
  String get reminderKindDaily => 'Daglig';

  @override
  String get reminderKindBehind => 'Bak';

  @override
  String get reminderKindDeadline => 'Frist';

  @override
  String get reminderKindOverdue => 'Forsinket';

  @override
  String get reminderKindStreak => 'Stime';

  @override
  String get reminderKindCustom => 'Egendefinert';

  @override
  String get settingsReminders => 'Studiepåminnelser';

  @override
  String get settingsRemindersOff => 'Av — slå på for en daglig påminnelse.';

  @override
  String get settingsReminderTime => 'Påminnelsestid';

  @override
  String get settingsReminderDenied =>
      'Varsler er blokkert — slå dem på i systeminnstillingene.';

  @override
  String notifDurationHours(String value) {
    return '$value t';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value min';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 I kveld: $duration for å holde deg i rute';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course $duration igjen i dag';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count til)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Logg en økt for å bli ferdig med i dag.';
  }

  @override
  String notifBehindTitle(String course) {
    return '⚠️ $course har falt Bak';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return '$left igjen, $days dager igjen — $pace/dag herfra. Logg $catchUp for å komme I rute igjen.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left igjen, $days dager igjen — $pace/dag herfra. Bare å fullføre hele $left fjerner dette — start i kveld.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left står fortsatt åpent og fristen er her. Alt du logger nå teller.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course har frist i morgen og har fortsatt $left åpent';
  }

  @override
  String get notifDeadlineTomorrowBody => 'Alt du logger i dag teller dobbelt.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ $course-eksamen om $days dager — $left igjen';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Det er $pace/dag. Del det opp: 2 økter om dagen slår én maratonøkt.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Hver time du logger nå teller.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course passerte fristen med $left åpent';
  }

  @override
  String get notifOverdueBody =>
      'Flytt fristen eller fullfør timene — emnet forblir i Trenger oppmerksomhet til da.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days dagers stime — $week denne uken';
  }

  @override
  String get notifStreakBody =>
      'Alle emner er I rute eller Foran. Godt jobbet.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Studieinnsjekk: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Tid for oppdatering: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left åpent · $pace/dag for å bli ferdig i tide. Logg en økt for å oppdatere fremgangen.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left fortsatt åpent — alt du logger nå teller.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Neste: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1d';

  @override
  String get reminderPreviewFwdDay => '+1d';

  @override
  String get reminderPreviewFake => '(falsk)';

  @override
  String get reminderPreviewDemoLabel => 'Demo-innsjekk';
}
