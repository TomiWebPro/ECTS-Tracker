// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Anulo';

  @override
  String get commonClose => 'Mbyll';

  @override
  String get commonDelete => 'Fshi';

  @override
  String get commonEdit => 'Modifiko';

  @override
  String get commonError => 'Gabim';

  @override
  String get commonNone => 'Asnjë';

  @override
  String get commonSave => 'Ruaj';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Orët e nevojshme (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Hiq afatin';

  @override
  String get courseFormClearStartTooltip => 'Hiq datën e fillimit';

  @override
  String get courseFormColorLabel => 'Ngjyra';

  @override
  String get courseFormDateNotSet => 'E pacaktuar';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Afati: $date';
  }

  @override
  String get courseFormEctsLabel => 'Kredite ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value o/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Emri';

  @override
  String get courseFormNotesLabel => 'Shënime (opsionale)';

  @override
  String get courseFormSaving => 'Po ruhet…';

  @override
  String courseFormStartButton(String date) {
    return 'Fillimi: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Jo: pa presion deri më $date; përjashtuar nga ritmi i sotëm.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Po: koha ndahet deri tani dhe llogaritet në ritmin e sotëm.';

  @override
  String get courseFormStartEarlyTitle =>
      'Fillo tani pavarësisht fillimit të ardhshëm';

  @override
  String get courseFormTitleAdd => 'Shto lëndë';

  @override
  String get courseFormTitleEdit => 'Modifiko lëndën';

  @override
  String get coursesAddTooltip => 'Shto lëndë';

  @override
  String coursesDeleteBody(String name) {
    return 'Të fshihet «$name» dhe të gjitha seancat e studimit? Kjo nuk mund të zhbëhet.';
  }

  @override
  String get coursesDeleteTitle => 'Të fshihet lënda?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Prek «Lëndë e re» për të krijuar lëndën tënde të parë.';

  @override
  String get coursesEmptyTitle => 'Ende asnjë lëndë';

  @override
  String get coursesFilterAll => 'Të gjitha statuset';

  @override
  String get coursesFilterEmpty => 'Asnjë lëndë nuk përputhet me këtë filtër';

  @override
  String get coursesNewCourse => 'Lëndë e re';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily o/ditë nevojiten';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/ditë nevojiten';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily o/ditë • $weekly o/javë nevojiten';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/ditë • $weekly min/javë nevojiten';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/ditë • $weekly o/javë nevojiten';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required o • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Hiq lëndën shembull';

  @override
  String coursesShownCount(String count) {
    return '$count të shfaqura';
  }

  @override
  String coursesSortOption(String label) {
    return 'Rendit: $label';
  }

  @override
  String get dashboardAllDone => 'Gjithçka gati';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours o të regjistruara (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count lëndë';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count lëndë · $upcoming të ardhshme jo në ritmin e sotëm';
  }

  @override
  String get dashboardCoursesTitle => 'Lëndët';

  @override
  String dashboardDeadline(String date) {
    return 'Afati $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Afati $date (edhe $days ditë)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Afati $date (edhe 1 ditë)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Afati $date (i vonuar)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Afati $date (sot)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Sot për t\'u bërë — $hours o të regjistruara';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Çdo lëndë ka përfunduar — shih skedën Lëndët për listën e plotë.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Shto një lëndë për të filluar ndjekjen e progresit ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Prapa = bën $achieved/d, duhen $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Prapa = bën $achieved/d, duhen $need/d · fillim i hershëm';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Prapa: asnjë ritëm përfundimtar nuk e arrin afatin e sotëm me orët që kanë mbetur';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Në rrugë: ende asnjë ritëm — regjistro seancën e parë për ta konfirmuar';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Fillon pas $days d · llogaritur nga $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Fillon pas $days d · llogaritur nga $date · fillimi i hershëm aktiv';
  }

  @override
  String get dashboardFreshStart => 'FILLIM I RI';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · edhe $hours o';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required o';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours o/d';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/d';
  }

  @override
  String get dashboardLogSessionAction => 'Regjistro seancë studimi';

  @override
  String get dashboardLogSessionTooltip => 'Regjistro seancë studimi';

  @override
  String get dashboardNewBadge => 'E RE';

  @override
  String get dashboardNoCourses => 'Ende asnjë lëndë';

  @override
  String get dashboardNoDeadline => 'Pa afat';

  @override
  String get dashboardNoDeadlines => 'Asnjë afat i planifikuar';

  @override
  String get dashboardNoPaceDue => 'Sot asgjë nuk kërkohet';

  @override
  String get dashboardNothingDue => 'Asgjë nuk kërkohet';

  @override
  String get dashboardNothingToTrack => 'Ende asgjë për të ndjekur';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Sot për t\'u bërë — edhe $hours o';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Duhen $daily o/ditë për të përfunduar';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Duhen $daily min/ditë për të përfunduar';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Duhen $daily o/ditë · $weekly o/javë për të përfunduar';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Duhen $daily min/ditë · $weekly min/javë për të përfunduar';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Duhen $daily min/ditë · $weekly o/javë për të përfunduar';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Duhen $hours o/ditë nga $date · jo në ritmin e sotëm';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Duhen $minutes min/ditë nga $date · jo në ritmin e sotëm';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Pa afat — edhe $hours o · pa presion ditor';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Fillon $date · $hours o për t\'u bërë';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · jorealiste';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMI';

  @override
  String get dashboardProgramEmptyHint =>
      'Shto një lëndë për të filluar ndjekjen';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required o';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMI $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days ditë kohë e mbetur';
  }

  @override
  String get dashboardStartNotSet => 'E pacaktuar';

  @override
  String dashboardStartsIn(String days) {
    return 'Fillon pas $days d';
  }

  @override
  String get dashboardStartsSoon => 'Fillon së shpejti';

  @override
  String get dashboardTipEmpty =>
      'Shto lëndën tënde të parë — ritmi ditor dhe progresi do të shfaqen këtu.';

  @override
  String get dashboardTipFirst =>
      '25 minutat e para vlejnë më shumë — zgjidh lëndën me afatin më të afërt.';

  @override
  String get dashboardTodayBare => 'SOT';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace o';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'SOT $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'RITMI I SOTËM';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace o sot';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Fillime të ardhshme — sot pa presion, përjashtuar nga ritmi i sotëm.';

  @override
  String get dashboardUpcomingTitle => 'Në vijim';

  @override
  String get devToolsActivate => 'Aktivizo';

  @override
  String get devToolsActivateMessage =>
      'Kjo zhbllokon mjete të fshehura stres-testi (të dhëna të gjeneruara). Vetëm për zhvillim.';

  @override
  String get devToolsActivateTitle => 'Të aktivizohet mënyra e zhvilluesit?';

  @override
  String get devToolsActivated => 'Mënyra e zhvilluesit u aktivizua.';

  @override
  String get devToolsClearPumped => 'Pastro të dhënat e gjeneruara';

  @override
  String get devToolsClearPumpedMessage =>
      'Fshin lëndët STRESS të gjeneruara dhe seancat e tyre. Të dhënat e tua ruhen.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Fshi lëndët dhe seancat STRESS të gjeneruara.';

  @override
  String get devToolsClearPumpedTitle => 'Të pastrohen të dhënat e gjeneruara?';

  @override
  String devToolsCleared(String count) {
    return 'U pastruan $count lëndë të gjeneruara.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Konfirmimi i dytë: kjo do të mbushë lëndët, listat, grafikët dhe llogaritjet e ritmit dhe mund të zgjasë disa sekonda. Të mbushet tani?';

  @override
  String get devToolsConfirmPumpTitle => 'Konfirmo stres-testin';

  @override
  String get devToolsContinue => 'Vazhdo';

  @override
  String get devToolsExit => 'Dil nga mënyra e zhvilluesit';

  @override
  String get devToolsExitSubtitle =>
      'Fshih mjetet e zhvilluesit në këtë pajisje.';

  @override
  String get devToolsPumpData => 'Mbush të dhëna';

  @override
  String get devToolsPumpMessage =>
      'Kjo fut një semestër realiste të gjeneruar (rreth 10 lëndë, rreth 800 seanca gjatë 12 javëve të fundit). Të dhënat ekzistuese ruhen. Të vazhdohet?';

  @override
  String get devToolsPumpSubtitle =>
      'Fut një semestër të gjeneruar (rreth 10 lëndë, rreth 800 seanca, 12 javë). Të dhënat ekzistuese ruhen.';

  @override
  String get devToolsPumpTile => 'Mbush të dhëna testi';

  @override
  String get devToolsPumpTitle => 'Të mbushen të dhëna testi?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'U mbushën $courses lëndë, $sessions seanca.';
  }

  @override
  String get devToolsPumping => 'Po mbushen të dhëna testi…';

  @override
  String get devToolsRemoveAll => 'Hiq të gjitha të dhënat';

  @override
  String get devToolsRemoveAllMessage =>
      'Shkurtore zhvilluesi: kjo fshin përgjithmonë TË GJITHA lëndët, seancat dhe cilësimet. Kjo nuk mund të zhbëhet.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Shkurtore zhvilluesi: fshi TË GJITHA lëndët, seancat dhe cilësimet.';

  @override
  String get devToolsRemoveAllTitle => 'Të hiqen të gjitha të dhënat?';

  @override
  String get navCourses => 'Lëndët';

  @override
  String get navDashboard => 'Paneli';

  @override
  String get navSettings => 'Cilësimet';

  @override
  String get navStatistics => 'Statistikat';

  @override
  String get navStudyLog => 'Ditari i studimit';

  @override
  String get sampleBadge => 'Shembull';

  @override
  String get sessionFormCourseLabel => 'Lënda';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Kohëzgjatja duhet të jetë më e madhe se zero.';

  @override
  String get sessionFormHoursLabel => 'Orë';

  @override
  String get sessionFormLogAction => 'Regjistro seancën';

  @override
  String get sessionFormMinutesLabel => 'Minuta';

  @override
  String get sessionFormNoCourseError => 'Zgjidh një lëndë.';

  @override
  String get sessionFormNoCoursesHint =>
      'Shto fillimisht një lëndë për të regjistruar një seancë.';

  @override
  String get sessionFormNotesLabel => 'Shënime (opsionale)';

  @override
  String get sessionFormSaving => 'Po ruhet…';

  @override
  String get sessionFormTitleAdd => 'Regjistro seancë studimi';

  @override
  String get sessionFormTitleEdit => 'Modifiko seancën e studimit';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Gjithsej: $hours o';
  }

  @override
  String get settingsAccent => 'Ngjyra e temës';

  @override
  String get settingsAccentBerry => 'Manaferrë';

  @override
  String get settingsAccentClay => 'Argjilë';

  @override
  String get settingsAccentForest => 'Pyll';

  @override
  String get settingsAccentSlate => 'Rrasë';

  @override
  String get settingsAccentTeal => 'Bruz';

  @override
  String get settingsAccentUpdated => 'Ngjyra e temës u përditësua.';

  @override
  String get settingsAllDataDeleted => 'Të gjitha të dhënat u fshinë.';

  @override
  String get settingsAppearance => 'Pamja (errët / çelët)';

  @override
  String get settingsCheckingSample => 'Po kontrollohen të dhënat shembull…';

  @override
  String get settingsClear => 'Pastro';

  @override
  String get settingsClearSample => 'Pastro të dhënat shembull';

  @override
  String get settingsClearSampleMessage =>
      'Kjo heq lëndët dhe seancat shembull. Lëndët ose seancat që ke shtuar vetë nuk hiqen.';

  @override
  String get settingsClearSampleSubtitle =>
      'Hiq lëndët dhe seancat shembull të gatshme. Të dhënat e tua ruhen.';

  @override
  String get settingsClearSampleTitle => 'Të pastrohen të dhënat shembull?';

  @override
  String get settingsCopy => 'Kopjo';

  @override
  String get settingsDailyError => 'Shkruaj 0 ose një numër pozitiv minutash.';

  @override
  String get settingsDailyLabel => 'Minuta në ditë (0 = pa objektiv)';

  @override
  String get settingsDailyTarget => 'Objektivi ditor i studimit';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/ditë';
  }

  @override
  String get settingsDailyUpdated => 'Objektivi ditor u përditësua.';

  @override
  String get settingsData => 'Të dhënat';

  @override
  String get settingsDeleteEverything => 'Fshi gjithçka';

  @override
  String get settingsDevMode => 'Mënyra e zhvilluesit';

  @override
  String get settingsDisplay => 'Shfaqja';

  @override
  String get settingsDisplayComfortable => 'Komode';

  @override
  String get settingsDisplayCompact => 'Kompakte';

  @override
  String get settingsDisplayLarge => 'E madhe';

  @override
  String get settingsDisplaySize => 'Madhësia e tekstit dhe elementeve';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Madhësia e shfaqjes u përditësua.';

  @override
  String get settingsExport => 'Eksporto të dhënat';

  @override
  String get settingsExportCopied => 'Eksporti u kopjua në clipboard.';

  @override
  String get settingsExportSubtitle =>
      'Kopjo të gjitha lëndët, seancat dhe cilësimet si JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses lëndë · $sessions seanca · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (e shkurtuar — kopja e plotë është $kb KB, përdor Kopjo për gjithçka)';
  }

  @override
  String get settingsFirstWeekday => 'Dita e parë e javës';

  @override
  String get settingsFirstWeekdayUpdated => 'Dita e parë e javës u përditësua.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (mbaj $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Mbaj për të zëvendësuar gjithçka';

  @override
  String get settingsHoursError => 'Shkruaj një numër më të madh se zero.';

  @override
  String get settingsHoursHelper =>
      'Parazgjedhja 30. Ndryshimi rillogarit kërkesat; regjistrimet ruhen.';

  @override
  String get settingsHoursLabel => 'Orë për kredit ECTS';

  @override
  String get settingsHoursPerEcts => 'Orë për ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value o';
  }

  @override
  String get settingsHoursUpdated => 'Orët për ECTS u përditësuan.';

  @override
  String get settingsImport => 'Importo të dhëna';

  @override
  String get settingsImportAppend => 'Shto';

  @override
  String get settingsImportAppendAction => 'Importo (shto)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Të dhënat u shtuan: $courses lëndë, $sessions seanca u shtuan.';
  }

  @override
  String get settingsImportInfo =>
      'Shtimi e shton kopjen rezervë krahas të dhënave aktuale (cilësimet ruhen). Zëvendësimi fshin fillimisht TË GJITHA lëndët, seancat dhe cilësimet.';

  @override
  String get settingsImportLabel => 'Ngjit JSON-in e eksportuar';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses lëndë · $sessions seanca';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · eksportuar $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · skema v$schema';
  }

  @override
  String get settingsImportReplace => 'Zëvendëso';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Zëvendësimi fshin gjithçka fillimisht. Shtyp dhe MBAJ butonin më poshtë për $seconds sekonda për të konfirmuar.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Të dhënat u zëvendësuan: $courses lëndë, $sessions seanca u rikthyen.';
  }

  @override
  String get settingsImportSubtitle =>
      'Zëvendëso të gjitha të dhënat nga një kopje rezervë JSON e eksportuar më parë.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Vazhdo të mbash… edhe $remaining s';
  }

  @override
  String get settingsNoSample => 'Asnjë e dhënë shembull';

  @override
  String get settingsNoSampleSubtitle =>
      'Të dhënat shembull të gatshme janë pastruar tashmë.';

  @override
  String get settingsNoTarget => 'Asnjë objektiv i caktuar';

  @override
  String get settingsOverloadError => 'Shkruaj një numër 5–100 o/javë.';

  @override
  String get settingsOverloadHelper =>
      'Javët e ardhshme mbi këtë shënohen me të kuqe. Studimi me kohë të plotë është rreth 35–40 o/javë.';

  @override
  String settingsOverloadHours(String value) {
    return '$value o';
  }

  @override
  String get settingsOverloadLabel => 'Orë në javë (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/javë shënohet me të kuqe';
  }

  @override
  String get settingsOverloadThreshold => 'Pragu javor i mbingarkesës';

  @override
  String get settingsOverloadUpdated => 'Pragu i mbingarkesës u përditësua.';

  @override
  String get settingsPaceTolerance => 'Toleranca para / prapa';

  @override
  String get settingsPasteValidBackup =>
      'Ngjit fillimisht një kopje rezervë të vlefshme';

  @override
  String get settingsReset => 'Rivendos';

  @override
  String get settingsResetAll => 'Rivendos të gjitha të dhënat';

  @override
  String get settingsResetAllMessage =>
      'Kjo fshin përgjithmonë TË GJITHA lëndët, seancat dhe cilësimet. Kjo nuk mund të zhbëhet. Eksporto fillimisht një kopje rezervë nëse duhet.';

  @override
  String get settingsResetAllSubtitle =>
      'Fshi të gjitha lëndët, seancat dhe cilësimet.';

  @override
  String get settingsResetAllTitle => 'Të rivendosen të gjitha të dhënat?';

  @override
  String get settingsResetSettings => 'Rivendos cilësimet';

  @override
  String get settingsResetSettingsDone =>
      'Cilësimet u rivendosën si parazgjedhje.';

  @override
  String get settingsResetSettingsMessage =>
      'Rikthen orët për ECTS (30), objektivin ditor (asnjë), ditën e parë (e hënë), temën (sistemi), tolerancën (5 ditë), mbingarkesën (35 o/javë), madhësinë (komode), ngjyrën (rrasë). Lëndët dhe seancat ruhen.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Rikthe parazgjedhjet: 30 o/ECTS, pa objektiv, e hënë, tema e sistemit, tolerancë 5-ditore, mbingarkesë 35 o/javë, madhësi komode, ngjyrë rrasë.';

  @override
  String get settingsResetSettingsTitle => 'Të rivendosen cilësimet?';

  @override
  String get settingsSampleData => 'Të dhëna shembull';

  @override
  String settingsSampleDataError(String error) {
    return 'Gabim: $error';
  }

  @override
  String get settingsStudySettings => 'Cilësimet e studimit';

  @override
  String get settingsThemeDark => 'Errët';

  @override
  String get settingsThemeLight => 'Çelët';

  @override
  String get settingsThemeSystem => 'E sistemit';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema u përditësua.';

  @override
  String settingsToleranceDays(String value) {
    return '$value ditë';
  }

  @override
  String get settingsToleranceError => 'Shkruaj një numër 0–30 ditë.';

  @override
  String get settingsToleranceHelper =>
      'Para duhen +N ditë tepricë, prapa −N ditë. 5 = e qëndrueshme, 0 = e ndjeshme.';

  @override
  String get settingsToleranceLabel => 'Ditë pune (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance pune';
  }

  @override
  String get settingsToleranceUpdated => 'Toleranca u përditësua.';

  @override
  String get settingsWeekdayFriday => 'E premte';

  @override
  String get settingsWeekdayMonday => 'E hënë';

  @override
  String get settingsWeekdaySaturday => 'E shtunë';

  @override
  String get settingsWeekdaySunday => 'E diel';

  @override
  String get settingsWeekdayThursday => 'E enjte';

  @override
  String get settingsWeekdayTuesday => 'E martë';

  @override
  String get settingsWeekdayWednesday => 'E mërkurë';

  @override
  String get sortDeadline => 'Afati';

  @override
  String get sortName => 'Emri';

  @override
  String get sortProgress => 'Progresi';

  @override
  String get sortStatus => 'Statusi';

  @override
  String get startupTitle => 'Nuk mund të nisej ECTS Tracker';

  @override
  String get statsActiveDays => 'Ditë aktive';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d aktive';
  }

  @override
  String get statsAddDeadlines => 'Shto afate për të parashikuar ngarkesën.';

  @override
  String get statsComingLoad => 'Ngarkesa e ardhshme';

  @override
  String get statsConsistency => 'Qëndrueshmëria';

  @override
  String get statsConsistencyHint =>
      'Ditët e studimit në 30 ditët e fundit. Hapa të vegjël çdo ditë mundin mësimin përmendësh.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% e 30 ditëve të fundit';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Lënda $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'L$id';
  }

  @override
  String get statsDidPerDay => 'Bërë / ditë (14 d)';

  @override
  String get statsEmpty => 'Ende asnjë seancë';

  @override
  String get statsGap => 'Diferenca';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value o';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}o';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours o';
  }

  @override
  String get statsLast30Days => '30 ditët e fundit';

  @override
  String get statsLast7Days => '7 ditët e fundit';

  @override
  String get statsNeedPerDay => 'Nevojiten / ditë';

  @override
  String get statsNext8Weeks => '8 javët e ardhshme';

  @override
  String get statsOfLast30DaysVolume => 'e vëllimit të 30 ditëve të fundit';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Javët e mbingarkesës >$threshold o shënohen me të kuqe — zhvendos një afat ose shkurto fushën.';
  }

  @override
  String get statsOverview => 'Përmbledhja';

  @override
  String get statsPaceCovers =>
      'Ritmi i deritanishëm mbulon atë që duhet. Mbaje serinë.';

  @override
  String statsPaceShort(String gap) {
    return 'Ritmi i deritanishëm është $gap o/ditë i shkurtër — shto një bllok ose shkurto fushën.';
  }

  @override
  String get statsPastVsNeeded => 'E deritanishme kundër të nevojshmes';

  @override
  String statsPeakPerWeek(String peak) {
    return 'piku $peak o/javë';
  }

  @override
  String get statsPerCourse => 'Për lëndë';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done o / $required o · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Seancat';

  @override
  String statsSuggestedOrder(String order) {
    return 'Rendi i sugjeruar: $order (afati më i afërt i pari)';
  }

  @override
  String get statsTotal => 'Gjithsej';

  @override
  String get statsTotalVolume => 'vëllimi i përgjithshëm';

  @override
  String get statusAhead => 'Para';

  @override
  String get statusBehind => 'Prapa';

  @override
  String get statusCompleted => 'Përfunduar';

  @override
  String get statusOnTrack => 'Në rrugë';

  @override
  String get statusOverdue => 'I vonuar';

  @override
  String get studyLogDeleteBody =>
      'Të fshihet kjo seancë studimi? Kjo nuk mund të zhbëhet.';

  @override
  String get studyLogDeleteTitle => 'Të fshihet seanca?';

  @override
  String get studyLogEmptyHint =>
      'Regjistro një seancë për të ndjekur kohën e studimit.';

  @override
  String get studyLogEmptyTitle => 'Ende asnjë seancë studimi';

  @override
  String get studyLogFabLabel => 'Regjistro seancën';

  @override
  String get studyLogFabTooltip => 'Regjistro seancën';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours o';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Hiq seancën shembull';

  @override
  String get studyLogThisWeek => 'Këtë javë';

  @override
  String get studyLogToday => 'Sot';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Lënda $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'L$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'ECTS duhet të jetë më e madhe se zero';

  @override
  String get validationCourseEctsRequired => 'Shkruaj kreditë ECTS';

  @override
  String get validationCourseNameRequired => 'Emri është i detyrueshëm';

  @override
  String get validationCourseNameTooLong => 'Emri është shumë i gjatë';

  @override
  String get validationSessionCourseRequired => 'Zgjidh një lëndë';

  @override
  String get validationSessionDurationRequired => 'Shkruaj një kohëzgjatje';

  @override
  String get widgetNoProgress => 'Ende asnjë progres';

  @override
  String get settingsLanguage => 'Gjuha';

  @override
  String get settingsLiquidGlass => 'Xham i lëngshëm';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Karta dhe shirita me xham të mat. Fikur ruan pamjen klasike.';

  @override
  String get settingsLiquidGlassOn => 'Ndezur';

  @override
  String get settingsLiquidGlassOff => 'Fikur';

  @override
  String get settingsLiquidGlassUpdated => 'Xhami i lëngshëm u përditësua.';

  @override
  String get devToolsReminderPreview => 'Parashikimi i kujtesave';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Shih çfarë do të njoftohej tani. Feed testimi i sigurt për Windows.';

  @override
  String get reminderPreviewTitle => 'Parashikimi i kujtesave';

  @override
  String get reminderPreviewNow => 'Koha e parashikimit';

  @override
  String get reminderPreviewReset => 'Tani';

  @override
  String get reminderPreviewEmpty =>
      'Qetësi e plotë — asgjë nuk do të njoftohej në këtë kohë.';

  @override
  String get reminderPreviewCustom => 'Oraret e personalizuara (demo)';

  @override
  String get reminderPreviewNoFire => 'Nuk ka ndezje të ardhshme.';

  @override
  String get reminderKindDaily => 'Ditor';

  @override
  String get reminderKindBehind => 'Prapa';

  @override
  String get reminderKindDeadline => 'Afati';

  @override
  String get reminderKindOverdue => 'I vonuar';

  @override
  String get reminderKindStreak => 'Seri';

  @override
  String get reminderKindCustom => 'Personalizuar';

  @override
  String get settingsReminders => 'Kujtesat e studimit';

  @override
  String get settingsRemindersOff => 'Fikur — ndize për një kujtesë ditore.';

  @override
  String get settingsReminderTime => 'Koha e kujtesës';

  @override
  String get settingsReminderDenied =>
      'Njoftimet janë bllokuar — aktivizoji në cilësimet e sistemit.';
}
