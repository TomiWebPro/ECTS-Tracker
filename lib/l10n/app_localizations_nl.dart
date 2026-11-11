// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonClose => 'Sluiten';

  @override
  String get commonDelete => 'Verwijderen';

  @override
  String get commonEdit => 'Bewerken';

  @override
  String get commonError => 'Fout';

  @override
  String get commonNone => 'Geen';

  @override
  String get commonSave => 'Opslaan';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Vereiste uren (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Deadline wissen';

  @override
  String get courseFormClearStartTooltip => 'Startdatum wissen';

  @override
  String get courseFormColorLabel => 'Kleur';

  @override
  String get courseFormDateNotSet => 'Niet ingesteld';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Deadline: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS-punten';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value u/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Naam';

  @override
  String get courseFormNotesLabel => 'Notities (optioneel)';

  @override
  String get courseFormSaving => 'Opslaan…';

  @override
  String courseFormStartButton(String date) {
    return 'Start: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Uit: geen druk tot $date; uitgesloten van het tempo van Vandaag.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Aan: tijd wordt verdeeld tot nu en telt mee voor het tempo van Vandaag.';

  @override
  String get courseFormStartEarlyTitle =>
      'Nu starten ondanks toekomstige start';

  @override
  String get courseFormTitleAdd => 'Vak toevoegen';

  @override
  String get courseFormTitleEdit => 'Vak bewerken';

  @override
  String get coursesAddTooltip => 'Vak toevoegen';

  @override
  String coursesDeleteBody(String name) {
    return '\"$name\" en alle bijbehorende studiesessies verwijderen? Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String get coursesDeleteTitle => 'Vak verwijderen?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Tik op \"Nieuw vak\" om je eerste vak aan te maken.';

  @override
  String get coursesEmptyTitle => 'Nog geen vakken';

  @override
  String get coursesFilterAll => 'Alle statussen';

  @override
  String get coursesFilterEmpty => 'Geen vakken komen overeen met dit filter';

  @override
  String get coursesNewCourse => 'Nieuw vak';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily u/dag nodig';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily u/dag • $weekly u/week nodig';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required u • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Voorbeeldvak verwijderen';

  @override
  String coursesShownCount(String count) {
    return '$count weergegeven';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sorteren: $label';
  }

  @override
  String get dashboardAllDone => 'Alles klaar';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours u gelogd (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count vak(ken)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count vak(ken) • $upcoming aankomende niet in het tempo van vandaag';
  }

  @override
  String get dashboardCoursesTitle => 'Vakken';

  @override
  String dashboardDeadline(String date) {
    return 'Deadline $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Deadline $date (nog $days dagen)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Deadline $date (nog 1 dag)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Deadline $date (te laat)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Deadline $date (vandaag)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Vandaag verschuldigd — $hours u gelogd';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Alle vakken zijn afgerond — zie het tabblad Vakken voor de volledige lijst.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Voeg een vak toe om je ECTS-voortgang bij te houden.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Achter = doet $achieved/d, nodig $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Achter = doet $achieved/d, nodig $need/d • vroege start';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Achter: geen eindig tempo haalt een deadline van vandaag met resterende uren';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Op schema: nog geen tempo — log de eerste sessie om te bevestigen';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Begint over $days d • gerekend vanaf $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Begint over $days d • gerekend vanaf $date • vroege start aan';
  }

  @override
  String get dashboardFreshStart => 'FRISSE START';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '• $pct% • nog $hours u';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required u';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours u/d';
  }

  @override
  String get dashboardLogSessionAction => 'Studiesessie loggen';

  @override
  String get dashboardLogSessionTooltip => 'Studiesessie loggen';

  @override
  String get dashboardNewBadge => 'NIEUW';

  @override
  String get dashboardNoCourses => 'Nog geen vakken';

  @override
  String get dashboardNoDeadline => 'Geen deadline';

  @override
  String get dashboardNoDeadlines => 'Geen deadlines gepland';

  @override
  String get dashboardNoPaceDue => 'Vandaag geen tempo verschuldigd';

  @override
  String get dashboardNothingDue => 'Niets verschuldigd';

  @override
  String get dashboardNothingToTrack => 'Nog niets bij te houden';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Vandaag verschuldigd — nog $hours u';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return '$daily u/dag nodig om af te ronden';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return '$daily u/dag • $weekly u/week nodig om af te ronden';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$hours u/dag nodig vanaf $date • niet in het tempo van Vandaag';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Geen deadline — nog $hours u • geen dagelijkse druk';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Begint $date • nog $hours u te gaan';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace • onrealistisch';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMMA';

  @override
  String get dashboardProgramEmptyHint =>
      'Voeg een vak toe om te beginnen met bijhouden';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required u';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMMA $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return 'nog $days dagen speling';
  }

  @override
  String get dashboardStartNotSet => 'Niet ingesteld';

  @override
  String dashboardStartsIn(String days) {
    return 'Begint over $days d';
  }

  @override
  String get dashboardStartsSoon => 'Begint binnenkort';

  @override
  String get dashboardTipEmpty =>
      'Voeg je eerste vak toe — je dagelijkse tempo en voortgang verschijnen hier.';

  @override
  String get dashboardTipFirst =>
      'De eerste 25 minuten tellen het meest — kies het vak met de vroegste deadline.';

  @override
  String get dashboardTodayBare => 'VANDAAG';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace u';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'VANDAAG $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'TEMPO VAN VANDAAG';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace u vandaag';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Toekomstige starts — vandaag geen druk, uitgesloten van het tempo van Vandaag.';

  @override
  String get dashboardUpcomingTitle => 'Aankomend';

  @override
  String get devToolsActivate => 'Activeren';

  @override
  String get devToolsActivateMessage =>
      'Dit ontgrendelt verborgen stresstesttools (gegenereerde data pompen). Alleen voor ontwikkeling.';

  @override
  String get devToolsActivateTitle => 'Dev-modus activeren?';

  @override
  String get devToolsActivated => 'Dev-modus geactiveerd.';

  @override
  String get devToolsClearPumped => 'Gepompte data wissen';

  @override
  String get devToolsClearPumpedMessage =>
      'Verwijdert de gegenereerde STRESS-vakken en hun sessies. Je eigen data blijft behouden.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Gegenereerde STRESS-vakken en sessies verwijderen.';

  @override
  String get devToolsClearPumpedTitle => 'Gepompte data wissen?';

  @override
  String devToolsCleared(String count) {
    return '$count gepompte vak(ken) gewist.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Tweede bevestiging: dit blaast vakken, lijsten, grafieken en tempoberekeningen op en kan enkele seconden duren. Nu pompen?';

  @override
  String get devToolsConfirmPumpTitle => 'Stresspomp bevestigen';

  @override
  String get devToolsContinue => 'Doorgaan';

  @override
  String get devToolsExit => 'Dev-modus afsluiten';

  @override
  String get devToolsExitSubtitle => 'Dev-tools verbergen op dit apparaat.';

  @override
  String get devToolsPumpData => 'Data pompen';

  @override
  String get devToolsPumpMessage =>
      'Dit voegt een realistisch gegenereerd semester in (~10 vakken, ~800 sessies over de afgelopen 12 weken). Je bestaande data blijft behouden. Doorgaan?';

  @override
  String get devToolsPumpSubtitle =>
      'Een gegenereerd semester invoegen (~10 vakken, ~800 sessies, 12 weken). Bestaande data blijft behouden.';

  @override
  String get devToolsPumpTile => 'Testdata pompen';

  @override
  String get devToolsPumpTitle => 'Testdata pompen?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses vakken, $sessions sessies gepompt.';
  }

  @override
  String get devToolsPumping => 'Testdata pompen…';

  @override
  String get devToolsRemoveAll => 'Alle data verwijderen';

  @override
  String get devToolsRemoveAllMessage =>
      'Dev-snelkoppeling: dit verwijdert permanent ALLE vakken, sessies en instellingen. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Dev-snelkoppeling: ALLE vakken, sessies en instellingen verwijderen.';

  @override
  String get devToolsRemoveAllTitle => 'Alle data verwijderen?';

  @override
  String get navCourses => 'Vakken';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navSettings => 'Instellingen';

  @override
  String get navStatistics => 'Statistieken';

  @override
  String get navStudyLog => 'Studielogboek';

  @override
  String get sampleBadge => 'Voorbeeld';

  @override
  String get sessionFormCourseLabel => 'Vak';

  @override
  String sessionFormDateButton(String date) {
    return 'Datum: $date';
  }

  @override
  String get sessionFormDurationError => 'Duur moet groter zijn dan nul.';

  @override
  String get sessionFormHoursLabel => 'Uren';

  @override
  String get sessionFormLogAction => 'Sessie loggen';

  @override
  String get sessionFormMinutesLabel => 'Minuten';

  @override
  String get sessionFormNoCourseError => 'Selecteer een vak.';

  @override
  String get sessionFormNoCoursesHint =>
      'Voeg eerst een vak toe om een sessie te loggen.';

  @override
  String get sessionFormNotesLabel => 'Notities (optioneel)';

  @override
  String get sessionFormSaving => 'Opslaan…';

  @override
  String get sessionFormTitleAdd => 'Studiesessie loggen';

  @override
  String get sessionFormTitleEdit => 'Studiesessie bewerken';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Totaal: $hours u';
  }

  @override
  String get settingsAccent => 'Themakleur';

  @override
  String get settingsAccentBerry => 'Bes';

  @override
  String get settingsAccentClay => 'Klei';

  @override
  String get settingsAccentForest => 'Bos';

  @override
  String get settingsAccentSlate => 'Leisteen';

  @override
  String get settingsAccentTeal => 'Teal';

  @override
  String get settingsAccentUpdated => 'Themakleur bijgewerkt.';

  @override
  String get settingsAllDataDeleted => 'Alle data verwijderd.';

  @override
  String get settingsAppearance => 'Vormgeving (donker / licht)';

  @override
  String get settingsCheckingSample => 'Voorbeelddata controleren…';

  @override
  String get settingsClear => 'Wissen';

  @override
  String get settingsClearSample => 'Voorbeelddata wissen';

  @override
  String get settingsClearSampleMessage =>
      'Dit verwijdert de voorbeeldvakken en -sessies. Vakken of sessies die je zelf hebt toegevoegd, worden niet verwijderd.';

  @override
  String get settingsClearSampleSubtitle =>
      'De vooraf ingevulde voorbeeldvakken en -sessies verwijderen. Je eigen data blijft behouden.';

  @override
  String get settingsClearSampleTitle => 'Voorbeelddata wissen?';

  @override
  String get settingsCopy => 'Kopiëren';

  @override
  String get settingsDailyError => 'Voer 0 of een positief aantal minuten in.';

  @override
  String get settingsDailyLabel => 'Minuten per dag (0 = geen doel)';

  @override
  String get settingsDailyTarget => 'Dagelijks studiedoel';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dag';
  }

  @override
  String get settingsDailyUpdated => 'Dagdoel bijgewerkt.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Alles verwijderen';

  @override
  String get settingsDevMode => 'Dev-modus';

  @override
  String get settingsDisplay => 'Weergave';

  @override
  String get settingsDisplayComfortable => 'Comfortabel';

  @override
  String get settingsDisplayCompact => 'Compact';

  @override
  String get settingsDisplayLarge => 'Groot';

  @override
  String get settingsDisplaySize => 'Tekst- en elementgrootte';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Weergavegrootte bijgewerkt.';

  @override
  String get settingsExport => 'Data exporteren';

  @override
  String get settingsExportCopied => 'Export naar klembord gekopieerd.';

  @override
  String get settingsExportSubtitle =>
      'Alle vakken, sessies en instellingen als JSON kopiëren.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses vak(ken) • $sessions sessie(s) • $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (afgekapt — volledige back-up is $kb KB, gebruik Kopiëren voor alles)';
  }

  @override
  String get settingsFirstWeekday => 'Eerste dag van de week';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Eerste dag van de week bijgewerkt.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s vasthouden)';
  }

  @override
  String get settingsHoldToReplace => 'Vasthouden om alles te vervangen';

  @override
  String get settingsHoursError => 'Voer een getal groter dan nul in.';

  @override
  String get settingsHoursHelper =>
      'Standaard 30. Wijzigen herberekent vereisten; logs blijven behouden.';

  @override
  String get settingsHoursLabel => 'Uren per ECTS-punt';

  @override
  String get settingsHoursPerEcts => 'Uren per ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value u';
  }

  @override
  String get settingsHoursUpdated => 'Uren per ECTS bijgewerkt.';

  @override
  String get settingsImport => 'Data importeren';

  @override
  String get settingsImportAppend => 'Toevoegen';

  @override
  String get settingsImportAppendAction => 'Importeren (toevoegen)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Data toegevoegd: $courses vak(ken), $sessions sessie(s) toegevoegd.';
  }

  @override
  String get settingsImportInfo =>
      'Toevoegen plaatst de back-up naast je huidige data (instellingen blijven). Vervangen wist eerst ALLE vakken, sessies en instellingen.';

  @override
  String get settingsImportLabel => 'Geëxporteerde JSON plakken';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses vak(ken) • $sessions sessie(s)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '• geëxporteerd $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '• schema v$schema';
  }

  @override
  String get settingsImportReplace => 'Vervangen';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Vervangen verwijdert eerst alles. Druk op de onderstaande knop en HOUD deze $seconds seconden vast om te bevestigen.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Data vervangen: $courses vak(ken), $sessions sessie(s) hersteld.';
  }

  @override
  String get settingsImportSubtitle =>
      'Alle data vervangen vanuit een eerder geëxporteerde JSON-back-up.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Blijf vasthouden… $remaining s';
  }

  @override
  String get settingsNoSample => 'Geen voorbeelddata';

  @override
  String get settingsNoSampleSubtitle =>
      'De vooraf ingevulde voorbeelddata is al gewist.';

  @override
  String get settingsNoTarget => 'Geen doel ingesteld';

  @override
  String get settingsOverloadError => 'Voer een getal 5–100 u/week in.';

  @override
  String get settingsOverloadHelper =>
      'Aankomende belastingsweken hierboven worden rood gemarkeerd. Voltijdstudie is ~35–40 u/week.';

  @override
  String settingsOverloadHours(String value) {
    return '$value u';
  }

  @override
  String get settingsOverloadLabel => 'Uren per week (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/week wordt rood gemarkeerd';
  }

  @override
  String get settingsOverloadThreshold => 'Wekelijkse overbelastingsdrempel';

  @override
  String get settingsOverloadUpdated => 'Overbelastingsdrempel bijgewerkt.';

  @override
  String get settingsPaceTolerance => 'Voorsprong-/achterstandstolerantie';

  @override
  String get settingsPasteValidBackup => 'Plak eerst een geldige back-up';

  @override
  String get settingsReset => 'Opnieuw instellen';

  @override
  String get settingsResetAll => 'Alle data opnieuw instellen';

  @override
  String get settingsResetAllMessage =>
      'Dit verwijdert permanent ALLE vakken, sessies en instellingen. Dit kan niet ongedaan worden gemaakt. Exporteer eerst een back-up indien nodig.';

  @override
  String get settingsResetAllSubtitle =>
      'Alle vakken, sessies en instellingen verwijderen.';

  @override
  String get settingsResetAllTitle => 'Alle data opnieuw instellen?';

  @override
  String get settingsResetSettings => 'Instellingen opnieuw instellen';

  @override
  String get settingsResetSettingsDone =>
      'Instellingen teruggezet naar standaard.';

  @override
  String get settingsResetSettingsMessage =>
      'Herstelt uren per ECTS (30), dagdoel (geen), eerste weekdag (maandag), thema (systeem), tolerantie (5 dagen), overbelasting (35 u/week), grootte (comfortabel), kleur (leisteen). Vakken en sessies blijven behouden.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Standaarden herstellen: 30 u/ECTS, geen doel, maandag, systeemthema, tolerantie 5 dagen, overbelasting 35 u/week, comfortabele grootte, leisteenkleur.';

  @override
  String get settingsResetSettingsTitle => 'Instellingen opnieuw instellen?';

  @override
  String get settingsSampleData => 'Voorbeelddata';

  @override
  String settingsSampleDataError(String error) {
    return 'Fout: $error';
  }

  @override
  String get settingsStudySettings => 'Studie-instellingen';

  @override
  String get settingsThemeDark => 'Donker';

  @override
  String get settingsThemeLight => 'Licht';

  @override
  String get settingsThemeSystem => 'Systeemstandaard';

  @override
  String get settingsThemeTitle => 'Thema';

  @override
  String get settingsThemeUpdated => 'Thema bijgewerkt.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dagen';
  }

  @override
  String get settingsToleranceError => 'Voer een getal 0–30 dagen in.';

  @override
  String get settingsToleranceHelper =>
      'Voorsprong vereist +N dagen overschot, achterstand −N dagen. 5 = stabiel, 0 = gevoelig.';

  @override
  String get settingsToleranceLabel => 'Dagen werk (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance werk';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerantie bijgewerkt.';

  @override
  String get settingsWeekdayFriday => 'Vrijdag';

  @override
  String get settingsWeekdayMonday => 'Maandag';

  @override
  String get settingsWeekdaySaturday => 'Zaterdag';

  @override
  String get settingsWeekdaySunday => 'Zondag';

  @override
  String get settingsWeekdayThursday => 'Donderdag';

  @override
  String get settingsWeekdayTuesday => 'Dinsdag';

  @override
  String get settingsWeekdayWednesday => 'Woensdag';

  @override
  String get sortDeadline => 'Deadline';

  @override
  String get sortName => 'Naam';

  @override
  String get sortProgress => 'Voortgang';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'ECTS Tracker kon niet worden gestart';

  @override
  String get statsActiveDays => 'Actieve dagen';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d actief';
  }

  @override
  String get statsAddDeadlines =>
      'Voeg deadlines toe om de belasting te voorspellen.';

  @override
  String get statsComingLoad => 'Aankomende belasting';

  @override
  String get statsConsistency => 'Consistentie';

  @override
  String get statsConsistencyHint =>
      'Studiedagen in de afgelopen 30 dagen. Kleine stappen elke dag verslaan blokken.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% van de afgelopen 30 dagen';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Vak $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'V$id';
  }

  @override
  String get statsDidPerDay => 'Gedaan / dag (14 d)';

  @override
  String get statsEmpty => 'Nog geen sessies';

  @override
  String get statsGap => 'Verschil';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value u';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours u';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours u';
  }

  @override
  String get statsLast30Days => 'Afgelopen 30 dagen';

  @override
  String get statsLast7Days => 'Afgelopen 7 dagen';

  @override
  String get statsNeedPerDay => 'Nodig / dag';

  @override
  String get statsNext8Weeks => 'Volgende 8 weken';

  @override
  String get statsOfLast30DaysVolume =>
      'van het volume van de afgelopen 30 dagen';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Overbelastingsweken >$threshold u rood gemarkeerd — verplaats een deadline of verklein de omvang.';
  }

  @override
  String get statsOverview => 'Overzicht';

  @override
  String get statsPaceCovers =>
      'Het tempo tot nu toe dekt wat nodig is. Houd de reeks vast.';

  @override
  String statsPaceShort(String gap) {
    return 'Het tempo tot nu toe is $gap u/dag te kort — voeg een blok toe of verklein de omvang.';
  }

  @override
  String get statsPastVsNeeded => 'Tot nu toe vs. nodig';

  @override
  String statsPeakPerWeek(String peak) {
    return 'piek $peak u/wk';
  }

  @override
  String get statsPerCourse => 'Per vak';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done u / $required u • $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sessies';

  @override
  String statsSuggestedOrder(String order) {
    return 'Voorgestelde volgorde: $order (vroegste deadline eerst)';
  }

  @override
  String get statsTotal => 'Totaal';

  @override
  String get statsTotalVolume => 'totaal volume';

  @override
  String get statusAhead => 'Voorop';

  @override
  String get statusBehind => 'Achter';

  @override
  String get statusCompleted => 'Afgerond';

  @override
  String get statusOnTrack => 'Op schema';

  @override
  String get statusOverdue => 'Te laat';

  @override
  String get studyLogDeleteBody =>
      'Deze studiesessie verwijderen? Dit kan niet ongedaan worden gemaakt.';

  @override
  String get studyLogDeleteTitle => 'Sessie verwijderen?';

  @override
  String get studyLogEmptyHint =>
      'Log een sessie om je studietijd bij te houden.';

  @override
  String get studyLogEmptyTitle => 'Nog geen studiesessies';

  @override
  String get studyLogFabLabel => 'Sessie loggen';

  @override
  String get studyLogFabTooltip => 'Sessie loggen';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours u';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Voorbeeldsessie verwijderen';

  @override
  String get studyLogThisWeek => 'Deze week';

  @override
  String get studyLogToday => 'Vandaag';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Vak $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'V$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS moet groter zijn dan nul';

  @override
  String get validationCourseEctsRequired => 'Voer ECTS-punten in';

  @override
  String get validationCourseNameRequired => 'Naam is vereist';

  @override
  String get validationCourseNameTooLong => 'Naam is te lang';

  @override
  String get validationSessionCourseRequired => 'Selecteer een vak';

  @override
  String get validationSessionDurationRequired => 'Voer een duur in';

  @override
  String get widgetNoProgress => 'Nog geen voortgang';

  @override
  String get settingsLanguage => 'Taal';

  @override
  String get settingsLiquidGlass => 'Liquid glass';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Kaarten en balken van matglas. Uit behoudt de klassieke, effen uitstraling.';

  @override
  String get settingsLiquidGlassOn => 'Aan';

  @override
  String get settingsLiquidGlassOff => 'Uit';

  @override
  String get settingsLiquidGlassUpdated => 'Liquid glass bijgewerkt.';

  @override
  String get devToolsReminderPreview => 'Reminder preview';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'See what would notify right now. Windows-safe test feed.';

  @override
  String get reminderPreviewTitle => 'Reminder preview';

  @override
  String get reminderPreviewNow => 'Preview time';

  @override
  String get reminderPreviewReset => 'Now';

  @override
  String get reminderPreviewEmpty =>
      'All quiet — nothing would notify at this time.';

  @override
  String get reminderPreviewCustom => 'Custom schedules (demo)';

  @override
  String get reminderPreviewNoFire => 'No upcoming fire.';

  @override
  String get settingsReminders => 'Study reminders';

  @override
  String get settingsRemindersOff => 'Off — turn on for a daily nudge.';

  @override
  String get settingsReminderTime => 'Reminder time';

  @override
  String get settingsReminderDenied =>
      'Notifications are blocked — enable them in system settings.';
}
