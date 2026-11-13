// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Luxembourgish Letzeburgesch (`lb`).
class AppLocalizationsLb extends AppLocalizations {
  AppLocalizationsLb([String locale = 'lb']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Ofbriechen';

  @override
  String get commonClose => 'Zoumaachen';

  @override
  String get commonDelete => 'Läschen';

  @override
  String get commonEdit => 'Beaarbechten';

  @override
  String get commonError => 'Feeler';

  @override
  String get commonNone => 'Keng';

  @override
  String get commonSave => 'Späicheren';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Benéidegt Stonnen (automatesch): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Deadline läschen';

  @override
  String get courseFormClearStartTooltip => 'Startdatum läschen';

  @override
  String get courseFormColorLabel => 'Faarf';

  @override
  String get courseFormDateNotSet => 'Net gesat';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Deadline: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS-Creditten';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value St/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Numm';

  @override
  String get courseFormNotesLabel => 'Notizen (optional)';

  @override
  String get courseFormSaving => 'Späichert…';

  @override
  String courseFormStartButton(String date) {
    return 'Start: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Aus: keen Drock bis $date; ausgeschloss vum Tempo vun Haut.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Un: d\'Zäit gëtt bis elo opgedeelt an zielt fir den Tempo vun Haut.';

  @override
  String get courseFormStartEarlyTitle =>
      'Elo ufänken trotz Startdatum an der Zukunft';

  @override
  String get courseFormTitleAdd => 'Cours derbäisetzen';

  @override
  String get courseFormTitleEdit => 'Cours beaarbechten';

  @override
  String get coursesAddTooltip => 'Cours derbäisetzen';

  @override
  String coursesDeleteBody(String name) {
    return '„$name“ an all seng Léischtstonne läschen? Dëst kann net réckgängeg gemaach ginn.';
  }

  @override
  String get coursesDeleteTitle => 'Cours läschen?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Tipp op „Neie Cours“ fir däin éischte Cours ze erstellen.';

  @override
  String get coursesEmptyTitle => 'Nach keng Coursen';

  @override
  String get coursesFilterAll => 'All Statussen';

  @override
  String get coursesFilterEmpty => 'Kee Cours passt zu dësem Filter';

  @override
  String get coursesNewCourse => 'Neie Cours';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily St/Dag néideg';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily Min/Dag néideg';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily St/Dag • $weekly St/Woch néideg';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily Min/Dag • $weekly Min/Woch néideg';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily Min/Dag • $weekly St/Woch néideg';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required St • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Beispillcours ewechhuelen';

  @override
  String coursesShownCount(String count) {
    return '$count gewisen';
  }

  @override
  String coursesSortOption(String label) {
    return 'Zortéieren: $label';
  }

  @override
  String get dashboardAllDone => 'Alles fäerdeg';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours St geloggt (Bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count Cours(en)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count Cours(en) · $upcoming spéider net am Tempo vun haut';
  }

  @override
  String get dashboardCoursesTitle => 'Coursen';

  @override
  String dashboardDeadline(String date) {
    return 'Deadline $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Deadline $date ($days Deeg Rescht)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Deadline $date (1 Dag Rescht)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Deadline $date (iwwerfälleg)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Deadline $date (haut)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Haut fälleg — $hours St geloggt';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'All Coursë sinn fäerdeg — kuck den Tab Coursen fir déi komplett Lëscht.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Setz e Cours derbäi fir däin ECTS-Fortschrëtt ze verfollegen.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Hannerier = mécht $achieved/Dag, brauch $need/Dag';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Hannerier = mécht $achieved/Dag, brauch $need/Dag · fréien Start';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Hannerier: keen endlechen Tempo erreecht eng Deadline haut mat Stonne Rescht';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Um Wee: nach keen Tempo — logg déi éischt Sëtzung fir ze bestätegen';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Fänkt un an $days Deeg · gezielt vum $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Fänkt un an $days Deeg · gezielt vum $date · fréien Start un';
  }

  @override
  String get dashboardFreshStart => 'FRËSCHE START';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · ${hours}St Rescht';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required St';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours St/Dag';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes Min/Dag';
  }

  @override
  String get dashboardLogSessionAction => 'Léiersëtzung loggen';

  @override
  String get dashboardLogSessionTooltip => 'Léiersëtzung loggen';

  @override
  String get dashboardNewBadge => 'NEI';

  @override
  String get dashboardNoCourses => 'Nach keng Coursen';

  @override
  String get dashboardNoDeadline => 'Keng Deadline';

  @override
  String get dashboardNoDeadlines => 'Keng Deadlines geplangt';

  @override
  String get dashboardNoPaceDue => 'Haut keen Tempo fälleg';

  @override
  String get dashboardNothingDue => 'Näischt fälleg';

  @override
  String get dashboardNothingToTrack => 'Nach näischt ze verfollegen';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Haut fälleg — ${hours}St Rescht';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Brauch $daily St/Dag fir fäerdeg ze ginn';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Brauch $daily Min/Dag fir fäerdeg ze ginn';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Brauch $daily St/Dag · $weekly St/Woch fir fäerdeg ze ginn';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Brauch $daily Min/Dag · $weekly Min/Woch fir fäerdeg ze ginn';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Brauch $daily Min/Dag · $weekly St/Woch fir fäerdeg ze ginn';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Brauch $hours St/Dag vum $date un · net am Tempo vun Haut';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Brauch $minutes Min/Dag vum $date un · net am Tempo vun Haut';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Keng Deadline — ${hours}St Rescht · keen Drock pro Dag';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Fänkt un $date · ${hours}St ze maachen';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · onrealistesch';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMM';

  @override
  String get dashboardProgramEmptyHint => 'Setz e Cours derbäi fir unzefänken';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required St';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days Deeg Virlaf';
  }

  @override
  String get dashboardStartNotSet => 'Net gesat';

  @override
  String dashboardStartsIn(String days) {
    return 'Fänkt un an ${days}Deeg';
  }

  @override
  String get dashboardStartsSoon => 'Fänkt geschwën un';

  @override
  String get dashboardTipEmpty =>
      'Setz däin éischte Cours derbäi — däin Tempo pro Dag a Fortschrëtt erschéngen hei.';

  @override
  String get dashboardTipFirst =>
      'Déi éischt 25 Minutte zielen am meeschten — wiel de Cours mat der éischter Deadline.';

  @override
  String get dashboardTodayBare => 'HAUT';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace St';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'HAUT $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'TEMPO VUN HAUT';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace St haut';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Spéider Ufänk — haut keen Drock, ausgeschloss vum Tempo vun Haut.';

  @override
  String get dashboardUpcomingTitle => 'Spéider';

  @override
  String get devToolsActivate => 'Aktivéieren';

  @override
  String get devToolsActivateMessage =>
      'Dëst spärt verstoppt Stress-Test-Tools op (generéiert Donnéeën). Nëmme fir Entwécklung.';

  @override
  String get devToolsActivateTitle => 'Entwécklermodus aktivéieren?';

  @override
  String get devToolsActivated => 'Entwécklermodus aktivéiert.';

  @override
  String get devToolsClearPumped => 'Gepompte Donnéeën läschen';

  @override
  String get devToolsClearPumpedMessage =>
      'Läscht déi generéiert STRESS-Coursen an hir Sëtzungen. Deng eegen Donnéeën bleiwen erhalen.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Generéiert STRESS-Coursen a Sëtzunge läschen.';

  @override
  String get devToolsClearPumpedTitle => 'Gepompte Donnéeën läschen?';

  @override
  String devToolsCleared(String count) {
    return '$count gepompte Cours(en) geläscht.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Zweet Bestätegung: dëst wäert Coursen, Lëschten, Diagrammer an Tempo-Berechnungen opblosen an e puer Sekonne daueren. Elo pompen?';

  @override
  String get devToolsConfirmPumpTitle => 'Stress-Pomp bestätegen';

  @override
  String get devToolsContinue => 'Weider';

  @override
  String get devToolsExit => 'Entwécklermodus verloossen';

  @override
  String get devToolsExitSubtitle =>
      'Entwéckler-Tools op dësem Apparat verstoppen.';

  @override
  String get devToolsPumpData => 'Donnéeën pompen';

  @override
  String get devToolsPumpMessage =>
      'Dëst setzt e realistescht generéiert Semester an (~10 Coursen, ~800 Sëtzungen iwwer déi lescht 12 Wochen). Deng Donnéeën bleiwen erhalen. Weider?';

  @override
  String get devToolsPumpSubtitle =>
      'E generéiert Semester asetzen (~10 Coursen, ~800 Sëtzungen, 12 Wochen). Donnéeën bleiwen erhalen.';

  @override
  String get devToolsPumpTile => 'Testdaten pompen';

  @override
  String get devToolsPumpTitle => 'Testdaten pompen?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses Coursen, $sessions Sëtzunge gepompt.';
  }

  @override
  String get devToolsPumping => 'Testdaten gi gepompt…';

  @override
  String get devToolsRemoveAll => 'All Donnéeën ewechhuelen';

  @override
  String get devToolsRemoveAllMessage =>
      'Entwéckler-Ofkierzung: dëst läscht permanent ALL Coursen, Sëtzungen an Astellungen. Dëst kann net réckgängeg gemaach ginn.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Entwéckler-Ofkierzung: ALL Coursen, Sëtzungen an Astellungen läschen.';

  @override
  String get devToolsRemoveAllTitle => 'All Donnéeën ewechhuelen?';

  @override
  String get navCourses => 'Coursen';

  @override
  String get navDashboard => 'Iwwersiicht';

  @override
  String get navSettings => 'Astellungen';

  @override
  String get navStatistics => 'Statistiken';

  @override
  String get navStudyLog => 'Léierlog';

  @override
  String get sampleBadge => 'Beispill';

  @override
  String get sessionFormCourseLabel => 'Cours';

  @override
  String sessionFormDateButton(String date) {
    return 'Datum: $date';
  }

  @override
  String get sessionFormDurationError => 'D\'Dauer muss méi wéi null sinn.';

  @override
  String get sessionFormHoursLabel => 'Stonnen';

  @override
  String get sessionFormLogAction => 'Sëtzung loggen';

  @override
  String get sessionFormMinutesLabel => 'Minutten';

  @override
  String get sessionFormModeManual => 'Manuell';

  @override
  String get sessionFormModeTimer => 'Timer';

  @override
  String get sessionFormNoCourseError => 'Wiel e Cours.';

  @override
  String get sessionFormNoCoursesHint =>
      'Setz éischt e Cours derbäi fir eng Sëtzung ze loggen.';

  @override
  String get sessionFormNotesLabel => 'Notizen (optional)';

  @override
  String get sessionFormSaving => 'Späichert…';

  @override
  String get sessionFormTitleAdd => 'Léiersëtzung loggen';

  @override
  String get sessionFormTitleEdit => 'Léiersëtzung beaarbechten';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total: $hours St';
  }

  @override
  String get settingsAccent => 'Faarf-Akzent';

  @override
  String get settingsAccentBerry => 'Bier';

  @override
  String get settingsAccentClay => 'Leem';

  @override
  String get settingsAccentForest => 'Bësch';

  @override
  String get settingsAccentSlate => 'Schifer';

  @override
  String get settingsAccentTeal => 'Petrol';

  @override
  String get settingsAccentUpdated => 'Faarf-Akzent aktualiséiert.';

  @override
  String get settingsAllDataDeleted => 'All Donnéeën geläscht.';

  @override
  String get settingsAppearance => 'Erscheinungsbild (donkel / hell)';

  @override
  String get settingsCheckingSample => 'Iwwerpréift Beispilldonnéeën…';

  @override
  String get settingsClear => 'Läschen';

  @override
  String get settingsClearSample => 'Beispilldonnéeën läschen';

  @override
  String get settingsClearSampleMessage =>
      'Dëst läscht d\'Beispillcoursen a Sëtzungen. Coursen oder Sëtzungen déi s du selwer derbäigesat hues ginn net geläscht.';

  @override
  String get settingsClearSampleSubtitle =>
      'Déi geséit Beispillcoursen a Sëtzunge läschen. Deng Donnéeën bleiwen erhalen.';

  @override
  String get settingsClearSampleTitle => 'Beispilldonnéeën läschen?';

  @override
  String get settingsCopy => 'Kopéieren';

  @override
  String get settingsDailyError =>
      'Gëff 0 oder eng positiv Zuel vu Minutten an.';

  @override
  String get settingsDailyLabel => 'Minutten pro Dag (0 = keen Zil)';

  @override
  String get settingsDailyTarget => 'Deeglecht Léierzil';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes Min/Dag';
  }

  @override
  String get settingsDailyUpdated => 'Deeglecht Zil aktualiséiert.';

  @override
  String get settingsData => 'Donnéeën';

  @override
  String get settingsDeleteEverything => 'Alles läschen';

  @override
  String get settingsDevMode => 'Entwécklermodus';

  @override
  String get settingsDisplay => 'Affichage';

  @override
  String get settingsDisplayComfortable => 'Confortabel';

  @override
  String get settingsDisplayCompact => 'Kompakt';

  @override
  String get settingsDisplayLarge => 'Grouss';

  @override
  String get settingsDisplaySize => 'Text- & Elementgréisst';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Affichagegréisst aktualiséiert.';

  @override
  String get settingsExport => 'Donnéeën exportéieren';

  @override
  String get settingsExportCopied => 'Export an d\'Zwëschenlag kopéiert.';

  @override
  String get settingsExportSubtitle =>
      'Kopéiert all Coursen, Sëtzungen an Astellungen als JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses Cours(en) · $sessions Sëtzung(en) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (ofgeschnidden — de komplette Backup ass $kb KB, benotz Kopéiere fir alles)';
  }

  @override
  String get settingsFirstWeekday => 'Éischten Dag vun der Woch';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Éischten Dag vun der Woch aktualiséiert.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (${seconds}s halen)';
  }

  @override
  String get settingsHoldToReplace => 'Hale fir alles z\'ersetzen';

  @override
  String get settingsHoursError => 'Gëff eng Zuel méi wéi null an.';

  @override
  String get settingsHoursHelper =>
      'Standard 30. Änneren berechent d\'Ufuerderungen nei; Logge bleiwen erhalen.';

  @override
  String get settingsHoursLabel => 'Stonne pro ECTS-Credit';

  @override
  String get settingsHoursPerEcts => 'Stonne pro ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value St';
  }

  @override
  String get settingsHoursUpdated => 'Stonne pro ECTS aktualiséiert.';

  @override
  String get settingsImport => 'Donnéeën importéieren';

  @override
  String get settingsImportAppend => 'Derbäisetzen';

  @override
  String get settingsImportAppendAction => 'Importéieren (derbäisetzen)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Donnéeën derbäigesat: $courses Cours(en), $sessions Sëtzung(en) derbäigesat.';
  }

  @override
  String get settingsImportInfo =>
      'Derbäisetze setzt de Backup nieft deng aktuell Donnéeën (Astellunge bleiwen). Ersetze läscht éischt ALL Coursen, Sëtzungen an Astellungen.';

  @override
  String get settingsImportLabel => 'Exportéiert JSON afeien';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses Cours(en) · $sessions Sëtzung(en)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· exportéiert $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· Schema v$schema';
  }

  @override
  String get settingsImportReplace => 'Ersetzen';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Ersetze läscht éischt alles. Dréck an HAL de Knäppchen hei ënnendrënner fir $seconds Sekonne fir ze bestätegen.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Donnéeën ersat: $courses Cours(en), $sessions Sëtzung(en) restauréiert.';
  }

  @override
  String get settingsImportSubtitle =>
      'All Donnéeën aus engem virdrun exportéierte JSON-Backup ersetzen.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Weider halen… $remaining s';
  }

  @override
  String get settingsNoSample => 'Keng Beispilldonnéeën';

  @override
  String get settingsNoSampleSubtitle =>
      'Déi geséit Beispilldonnéeë si scho geläscht.';

  @override
  String get settingsNoTarget => 'Kee Zil gesat';

  @override
  String get settingsOverloadError => 'Gëff eng Zuel 5–100 St/Woch an.';

  @override
  String get settingsOverloadHelper =>
      'Woche mat kommender Laascht driwwer gi rout markéiert. Vollzäitléiere sinn ~35–40 St/Woch.';

  @override
  String settingsOverloadHours(String value) {
    return '$value St';
  }

  @override
  String get settingsOverloadLabel => 'Stonne pro Woch (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/Woch gi rout markéiert';
  }

  @override
  String get settingsOverloadThreshold => 'Wëchentlech Iwwerlaascht-Schwell';

  @override
  String get settingsOverloadUpdated => 'Iwwerlaascht-Schwell aktualiséiert.';

  @override
  String get settingsPaceTolerance => 'Vir / hanner Toleranz';

  @override
  String get settingsPasteValidBackup => 'Éischt e gültege Backup afeien';

  @override
  String get settingsReset => 'Zrécksetzen';

  @override
  String get settingsResetAll => 'All Donnéeën zrécksetzen';

  @override
  String get settingsResetAllMessage =>
      'Dëst läscht permanent ALL Coursen, Sëtzungen an Astellungen. Dëst kann net réckgängeg gemaach ginn. Exportéier éischt e Backup wann néideg.';

  @override
  String get settingsResetAllSubtitle =>
      'All Coursen, Sëtzungen an Astellungen läschen.';

  @override
  String get settingsResetAllTitle => 'All Donnéeën zrécksetzen?';

  @override
  String get settingsResetSettings => 'Astellungen zrécksetzen';

  @override
  String get settingsResetSettingsDone => 'Astellungen op Standard zréckgesat.';

  @override
  String get settingsResetSettingsMessage =>
      'Stellt Stonne-pro-ECTS (30), deeglecht Zil (keng), éischte Wochendag (Méindeg), Theme (System), Toleranz (5 Deeg), Iwwerlaascht (35 St/Woch), Gréisst (confortabel), Faarf (Schifer) erëm hier. Coursen a Sëtzunge bleiwen erhalen.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Standard erëm hierstellen: 30 St/ECTS, kee Zil, Méindeg, System-Theme, 5-Deeg-Toleranz, 35 St/Woch Iwwerlaascht, confortabel Gréisst, Schifer-Faarf.';

  @override
  String get settingsResetSettingsTitle => 'Astellungen zrécksetzen?';

  @override
  String get settingsSampleData => 'Beispilldonnéeën';

  @override
  String settingsSampleDataError(String error) {
    return 'Feeler: $error';
  }

  @override
  String get settingsStudySettings => 'Léierastellungen';

  @override
  String get settingsThemeDark => 'Donkel';

  @override
  String get settingsThemeLight => 'Hell';

  @override
  String get settingsThemeSystem => 'Systemstandard';

  @override
  String get settingsThemeTitle => 'Theme';

  @override
  String get settingsThemeUpdated => 'Theme aktualiséiert.';

  @override
  String settingsToleranceDays(String value) {
    return '$value Deeg';
  }

  @override
  String get settingsToleranceError => 'Gëff eng Zuel 0–30 Deeg an.';

  @override
  String get settingsToleranceHelper =>
      'Vir brauch +N Deeg Iwwerschoss, hanner −N Deeg. 5 = stabil, 0 = sensibel.';

  @override
  String get settingsToleranceLabel => 'Deeg Aarbecht (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance Aarbecht';
  }

  @override
  String get settingsToleranceUpdated => 'Toleranz aktualiséiert.';

  @override
  String get settingsWeekdayFriday => 'Freideg';

  @override
  String get settingsWeekdayMonday => 'Méindeg';

  @override
  String get settingsWeekdaySaturday => 'Samschdeg';

  @override
  String get settingsWeekdaySunday => 'Sonndeg';

  @override
  String get settingsWeekdayThursday => 'Donneschdeg';

  @override
  String get settingsWeekdayTuesday => 'Dënschdeg';

  @override
  String get settingsWeekdayWednesday => 'Mëttwoch';

  @override
  String get sortDeadline => 'Deadline';

  @override
  String get sortName => 'Numm';

  @override
  String get sortProgress => 'Fortschrëtt';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'ECTS Tracker konnt net starten';

  @override
  String get statsActiveDays => 'Aktiv Deeg';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}d aktiv';
  }

  @override
  String get statsAddDeadlines =>
      'Setz Deadlines derbäi fir d\'Laascht virauszesoen.';

  @override
  String get statsComingLoad => 'Kommend Laascht';

  @override
  String get statsConsistency => 'Konsequenz';

  @override
  String get statsConsistencyHint =>
      'Léierdeeg an de leschten 30 Deeg. Kleng Schrëtt all Dag schloe Cramming.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% vun de leschten 30 Deeg';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Cours $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Gemécht / Dag (14d)';

  @override
  String get statsEmpty => 'Nach keng Sëtzungen';

  @override
  String get statsGap => 'Lück';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value St';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}St';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours St';
  }

  @override
  String get statsLast30Days => 'Lescht 30 Deeg';

  @override
  String get statsLast7Days => 'Lescht 7 Deeg';

  @override
  String get statsNeedPerDay => 'Brauch / Dag';

  @override
  String get statsNext8Weeks => 'Nächst 8 Wochen';

  @override
  String get statsOfLast30DaysVolume => 'vum Volume vun de leschten 30 Deeg';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Iwwerlaascht-Wochen >${threshold}St gi rout markéiert — verréckel eng Deadline oder reduzéier den Ëmfang.';
  }

  @override
  String get statsOverview => 'Iwwersiicht';

  @override
  String get statsPaceCovers =>
      'De vergaangene Tempo deckt wat néideg ass. Bleif drun.';

  @override
  String statsPaceShort(String gap) {
    return 'De vergaangene Tempo ass $gap St/Dag ze kuerz — setz e Block derbäi oder reduzéier den Ëmfang.';
  }

  @override
  String get statsPastVsNeeded => 'Vergaangenheet vs Brauch';

  @override
  String statsPeakPerWeek(String peak) {
    return 'Spëtzt ${peak}St/W';
  }

  @override
  String get statsPerCourse => 'Pro Cours';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done St / $required St · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sëtzungen';

  @override
  String statsSuggestedOrder(String order) {
    return 'Virgeschloen Uerdnung: $order (éischt Deadline éischt)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'Gesamtvolume';

  @override
  String get statusAhead => 'Viraus';

  @override
  String get statusBehind => 'Hannerier';

  @override
  String get statusCompleted => 'Fäerdeg';

  @override
  String get statusOnTrack => 'Um Wee';

  @override
  String get statusOverdue => 'Iwwerfälleg';

  @override
  String get studyLogDeleteBody =>
      'Dës Léiersëtzung läschen? Dëst kann net réckgängeg gemaach ginn.';

  @override
  String get studyLogDeleteTitle => 'Sëtzung läschen?';

  @override
  String get studyLogEmptyHint =>
      'Logg eng Sëtzung fir deng Léierzäit ze verfollegen.';

  @override
  String get studyLogEmptyTitle => 'Nach keng Léiersëtzungen';

  @override
  String get studyLogFabLabel => 'Sëtzung loggen';

  @override
  String get studyLogFabTooltip => 'Sëtzung loggen';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours St';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Beispillsëtzung ewechhuelen';

  @override
  String get studyLogThisWeek => 'Dës Woch';

  @override
  String get studyLogToday => 'Haut';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Cours $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return 'Timer $course';
  }

  @override
  String get studyTimerAlreadyRunning =>
      'Et leeft schonn en Timer. Maach en éischt fäerdeg oder verworf en.';

  @override
  String get studyTimerCourseLabel => 'Cours';

  @override
  String get studyTimerDiscard => 'Verwerfen';

  @override
  String get studyTimerDiscardBody =>
      'Den aktuellen Timer ouni Loggen verwerfen? Dëst kann net réckgängeg gemaach ginn.';

  @override
  String get studyTimerDiscardTitle => 'Timer verwerfen?';

  @override
  String studyTimerFinishLog(String minutes) {
    return 'Fäerdeg & $minutes Min loggen';
  }

  @override
  String get studyTimerNoCourseError => 'Wiel e Cours.';

  @override
  String get studyTimerNoCoursesHint =>
      'Setz éischt e Cours derbäi fir en Timer ze starten.';

  @override
  String studyTimerNotifPaused(String elapsed) {
    return 'Pauséiert · $elapsed';
  }

  @override
  String get studyTimerNotifRunning => 'Tippe fir den Timer opzemaachen';

  @override
  String get studyTimerPause => 'Paus';

  @override
  String get studyTimerResume => 'Weidermaachen';

  @override
  String get studyTimerStart => 'Timer starten';

  @override
  String get studyTimerStartTitle => 'Léiertimer starten';

  @override
  String get studyTimerTooShort => 'Den Timer ass nach net gelaf.';

  @override
  String get validationCourseEctsPositive => 'ECTS muss méi wéi null sinn';

  @override
  String get validationCourseEctsRequired => 'Gëff ECTS-Creditter an';

  @override
  String get validationCourseNameRequired => 'Numm ass erfuerderlech';

  @override
  String get validationCourseNameTooLong => 'Den Numm ass ze laang';

  @override
  String get validationSessionCourseRequired => 'Wiel e Cours';

  @override
  String get validationSessionDurationRequired => 'Gëff eng Dauer an';

  @override
  String get widgetNoProgress => 'Nach kee Fortschrëtt';

  @override
  String get settingsLanguage => 'Sprooch';

  @override
  String get settingsLiquidGlass => 'Flëssegt Glas';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Kaarten a Barre vu Mëllechglas. Aus behält de klassesche massiven Look.';

  @override
  String get settingsLiquidGlassOn => 'Un';

  @override
  String get settingsLiquidGlassOff => 'Aus';

  @override
  String get settingsLiquidGlassUpdated => 'Flëssegt Glas aktualiséiert.';

  @override
  String get devToolsReminderPreview => 'Erënnerungsvirschau';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Kuck wat elo mellen géif. Séchere Testfeed fir Windows.';

  @override
  String get reminderPreviewTitle => 'Erënnerungsvirschau';

  @override
  String get reminderPreviewNow => 'Virschau-Zäit';

  @override
  String get reminderPreviewReset => 'Elo';

  @override
  String get reminderPreviewEmpty =>
      'Alles roueg — keng Notifikatioun zu dëser Zäit.';

  @override
  String get reminderPreviewCustom => 'Eegen Zäitpläng (Demo)';

  @override
  String get reminderPreviewNoFire => 'Keng Notifikatioun geplangt.';

  @override
  String get reminderKindDaily => 'Deeglech';

  @override
  String get reminderKindBehind => 'Hannerier';

  @override
  String get reminderKindDeadline => 'Deadline';

  @override
  String get reminderKindOverdue => 'Iwwerfälleg';

  @override
  String get reminderKindStreak => 'Serie';

  @override
  String get reminderKindCustom => 'Eegen';

  @override
  String get settingsReminders => 'Léier-Erënnerungen';

  @override
  String get settingsRemindersOff => 'Aus — schalt deeglech Erënnerung un.';

  @override
  String get settingsReminderTime => 'Erënnerungszäit';

  @override
  String get settingsReminderDenied =>
      'Notifikatioune si blockéiert — aktivéier se an den Systemastellungen.';

  @override
  String notifDurationHours(String value) {
    return '$value St';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value Min';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Haut den Owend: $duration fir um Wee ze bleiwen';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course $duration Rescht haut';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count weider)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Logg eng Sëtzung fir haut ofzeschléissen.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course ass hannerier geroden';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return '$left Rescht, $days Deeg Rescht — $pace/Dag vun hei un. Logg $catchUp fir erëm um Wee ze kommen.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left Rescht, $days Deeg Rescht — $pace/Dag vun hei un. Nëmmen déi ganz $left fäerdeg ze maachen hëlleft — fänk haut den Owend un.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left nach op an dDeadline ass haut. Alles wat s de elo loggs zielt.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course ass muer fälleg an huet nach $left op';
  }

  @override
  String get notifDeadlineTomorrowBody =>
      'Alles wat s de haut loggs zielt duebel.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ $course-Examen an $days Deeg — $left Rescht';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Dat sinn $pace/Dag. Deel et op: 2 Sëtzungen den Dag schloe een Marathon.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace =>
      'All Stonn déi s de elo loggs zielt.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course huet dDeadline verpasst mat $left op';
  }

  @override
  String get notifOverdueBody =>
      'Verréckel dDeadline oder maach dStonnen fäerdeg — de Cours brauch bis dohin Opmierksamkeet.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days Deeg Serie — $week dës Woch';
  }

  @override
  String get notifStreakBody => 'All Coursen um Wee oder viraus. Gutt gemaach.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Léier-Check-in: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Zäit fir ze aktualiséieren: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left op · $pace/Dag fir reegelrecht fäerdeg ze ginn. Logg eng Sëtzung fir de Fortschrëtt ze aktualiséieren.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left nach op — alles wat s de elo loggs zielt.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Nächst: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1Dag';

  @override
  String get reminderPreviewFwdDay => '+1Dag';

  @override
  String get reminderPreviewFake => '(Fake)';

  @override
  String get reminderPreviewDemoLabel => 'Demo-Check-in';
}
