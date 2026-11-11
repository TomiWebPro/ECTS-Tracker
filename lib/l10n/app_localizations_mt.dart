// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Maltese (`mt`).
class AppLocalizationsMt extends AppLocalizations {
  AppLocalizationsMt([String locale = 'mt']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Ikkanċella';

  @override
  String get commonClose => 'Agħlaq';

  @override
  String get commonDelete => 'Ħassar';

  @override
  String get commonEdit => 'Editja';

  @override
  String get commonError => 'Żball';

  @override
  String get commonNone => 'Xejn';

  @override
  String get commonSave => 'Issejvja';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Sigħat meħtieġa (awtomatiku): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Neħħi d-data taʼ għeluq';

  @override
  String get courseFormClearStartTooltip => 'Neħħi d-data tal-bidu';

  @override
  String get courseFormColorLabel => 'Kulur';

  @override
  String get courseFormDateNotSet => 'Mhux issettjat';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Għeluq: $date';
  }

  @override
  String get courseFormEctsLabel => 'Krediti ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value s/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Isem';

  @override
  String get courseFormNotesLabel => 'Noti (mhux obbligatorji)';

  @override
  String get courseFormSaving => 'Qed jissejvja…';

  @override
  String courseFormStartButton(String date) {
    return 'Bidu: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Mitfi: l-ebda pressjoni sa $date; eskluż mill-pass tal-lum.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Mixgħul: il-ħin jinqasam sa issa u jgħodd għall-pass tal-lum.';

  @override
  String get courseFormStartEarlyTitle => 'Ibda issa minkejja bidu futur';

  @override
  String get courseFormTitleAdd => 'Żid kors';

  @override
  String get courseFormTitleEdit => 'Editja l-kors';

  @override
  String get coursesAddTooltip => 'Żid kors';

  @override
  String coursesDeleteBody(String name) {
    return 'Tħassar “$name” u s-sessjonijiet kollha taʼ studju tiegħu? Dan ma jistax jitneħħa.';
  }

  @override
  String get coursesDeleteTitle => 'Tħassar il-kors?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Miss “Kors ġdid” biex toħloq l-ewwel kors tiegħek.';

  @override
  String get coursesEmptyTitle => 'L-ebda kors sʼissa';

  @override
  String get coursesFilterAll => 'L-istati kollha';

  @override
  String get coursesFilterEmpty => 'L-ebda kors ma jaqbel maʼ dan il-filtru';

  @override
  String get coursesNewCourse => 'Kors ġdid';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Meħtieġ $daily s/jum';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Meħtieġ $daily s/jum • $weekly s/ġimgħa';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required s • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Neħħi l-kors taʼ kampjun';

  @override
  String coursesShownCount(String count) {
    return 'Murija: $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Issortja: $label';
  }

  @override
  String get dashboardAllDone => 'Kollox lest';

  @override
  String dashboardBonusLogged(String hours) {
    return 'Irreġistrati $hours s (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kors(ijiet)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kors(ijiet) · $upcoming futuri mhux fil-pass tal-lum';
  }

  @override
  String get dashboardCoursesTitle => 'Korsijiet';

  @override
  String dashboardDeadline(String date) {
    return 'Għeluq $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Għeluq $date (fadal $days ijiem)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Għeluq $date (fadal jum 1)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Għeluq $date (skadut)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Għeluq $date (illum)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Tal-lum — irreġistrati $hours s';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Kull kors huwa lest — ara t-tab Korsijiet għal-lista sħiħa.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Żid kors biex tibda ssegwi l-progress ECTS tiegħek.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Lura = tagħmel $achieved/j, għandek bżonn $need/j';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Lura = tagħmel $achieved/j, għandek bżonn $need/j · bidu bikri';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Lura: l-ebda pass finit ma jilħaq għeluq tal-lum bis-sigħat li fadal';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Fit-triq it-tajba: l-ebda pass sʼissa — irreġistra l-ewwel sessjoni biex tikkonferma';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Jibda fi żmien $days ijiem · magħdud minn $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Jibda fi żmien $days ijiem · magħdud minn $date · bidu bikri mixgħul';
  }

  @override
  String get dashboardFreshStart => 'BIDU FRISK';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · fadal $hours s';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required s';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours s/jum';
  }

  @override
  String get dashboardLogSessionAction => 'Irreġistra sessjoni taʼ studju';

  @override
  String get dashboardLogSessionTooltip => 'Irreġistra sessjoni taʼ studju';

  @override
  String get dashboardNewBadge => 'ĠDID';

  @override
  String get dashboardNoCourses => 'L-ebda kors sʼissa';

  @override
  String get dashboardNoDeadline => 'L-ebda għeluq';

  @override
  String get dashboardNoDeadlines => 'L-ebda għeluq skedat';

  @override
  String get dashboardNoPaceDue => 'L-ebda pass tal-lum';

  @override
  String get dashboardNothingDue => 'Xejn dovut';

  @override
  String get dashboardNothingToTrack => 'Xejn xʼtissewwa sʼissa';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Tal-lum — fadal $hours s';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Bżonn $daily s/jum biex tlesti';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Bżonn $daily s/jum · $weekly s/ġimgħa biex tlesti';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Bżonn $hours s/jum minn $date · mhux fil-pass tal-lum';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'L-ebda għeluq — fadal $hours s · l-ebda pressjoni taʼ kuljum';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Jibda $date · fadal $hours s xʼtagħmel';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · mhux realistiku';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMM';

  @override
  String get dashboardProgramEmptyHint => 'Żid kors biex tibda ssegwi';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required s';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return 'Fadal $days ijiem riżerva';
  }

  @override
  String get dashboardStartNotSet => 'Mhux issettjat';

  @override
  String dashboardStartsIn(String days) {
    return 'Jibda fi $days ijiem';
  }

  @override
  String get dashboardStartsSoon => 'Jibda dalwaqt';

  @override
  String get dashboardTipEmpty =>
      'Żid l-ewwel kors tiegħek — il-pass taʼ kuljum u l-progress jidhru hawn.';

  @override
  String get dashboardTipFirst =>
      'L-ewwel 25 minuta jgħoddu l-aktar — agħżel il-kors bl-eqreb għeluq.';

  @override
  String get dashboardTodayBare => 'LUM';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace s';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'LUM $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'PASS TAL-LUM';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Illum $logged / $pace s';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Bidu futur — l-ebda pressjoni llum, esklużi mill-pass tal-lum.';

  @override
  String get dashboardUpcomingTitle => 'Futuri';

  @override
  String get devToolsActivate => 'Attiva';

  @override
  String get devToolsActivateMessage =>
      'Dan jiftaħ għodod moħbija tat-test tal-istress (iddaħħal data ġġenerata). Biss għall-iżvilupp.';

  @override
  String get devToolsActivateTitle => 'Tattiva l-modalità taʼ żvilupp?';

  @override
  String get devToolsActivated => 'Il-modalità taʼ żvilupp ġiet attivata.';

  @override
  String get devToolsClearPumped => 'Neħħi d-data ġġenerata';

  @override
  String get devToolsClearPumpedMessage =>
      'Tħassar il-korsijiet STRESS iġġenerati u s-sessjonijiet tagħhom. Id-data tiegħek tinżamm.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Ħassar il-korsijiet u s-sessjonijiet STRESS iġġenerati.';

  @override
  String get devToolsClearPumpedTitle => 'Tneħħi d-data ġġenerata?';

  @override
  String devToolsCleared(String count) {
    return 'Tneħħew $count kors(ijiet) iġġenerati.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'It-tieni konferma: dan se jkabbar il-korsijiet, il-listi, iċ-ċarts u l-kalkoli tal-pass, u jistaʼ jieħu ftit sekondi. Riddaħħal issa?';

  @override
  String get devToolsConfirmPumpTitle => 'Ikkonferma d-daħħal tal-istress';

  @override
  String get devToolsContinue => 'Kompli';

  @override
  String get devToolsExit => 'Oħroġ mill-modalità taʼ żvilupp';

  @override
  String get devToolsExitSubtitle =>
      'Aħbi l-għodod taʼ żvilupp fuq dan l-apparat.';

  @override
  String get devToolsPumpData => 'Daħħal id-data';

  @override
  String get devToolsPumpMessage =>
      'Dan idaħħal semestru ġġenerat realistiku (~10 korsijiet, ~800 sessjoni fl-aħħar 12-il ġimgħa). Id-data eżistenti tiegħek tinżamm. Tkompli?';

  @override
  String get devToolsPumpSubtitle =>
      'Daħħal semestru ġġenerat (~10 korsijiet, ~800 sessjoni, 12-il ġimgħa). Id-data eżistenti tinżamm.';

  @override
  String get devToolsPumpTile => 'Daħħal data tat-test';

  @override
  String get devToolsPumpTitle => 'Riddaħħal data tat-test?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Ddaħħlu $courses korsijiet, $sessions sessjoni.';
  }

  @override
  String get devToolsPumping => 'Qed iddaħħal data tat-test…';

  @override
  String get devToolsRemoveAll => 'Neħħi d-data kollha';

  @override
  String get devToolsRemoveAllMessage =>
      'Shortcut tal-iżvilupp: dan iħassar bʼmod permanenti l-korsijiet, is-sessjonijiet u l-issettjar KOLLHA. Dan ma jistax jitneħħa.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Shortcut tal-iżvilupp: ħassar il-korsijiet, is-sessjonijiet u l-issettjar KOLLHA.';

  @override
  String get devToolsRemoveAllTitle => 'Tneħħi d-data kollha?';

  @override
  String get navCourses => 'Korsijiet';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navSettings => 'Issettjar';

  @override
  String get navStatistics => 'Statistika';

  @override
  String get navStudyLog => 'Ġurnal tal-istudju';

  @override
  String get sampleBadge => 'Kampjun';

  @override
  String get sessionFormCourseLabel => 'Kors';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError => 'It-tul għandu jkun akbar minn żero.';

  @override
  String get sessionFormHoursLabel => 'Sigħat';

  @override
  String get sessionFormLogAction => 'Irreġistra s-sessjoni';

  @override
  String get sessionFormMinutesLabel => 'Minuti';

  @override
  String get sessionFormNoCourseError => 'Agħżel kors.';

  @override
  String get sessionFormNoCoursesHint =>
      'Żid kors l-ewwel biex tirreġistra sessjoni.';

  @override
  String get sessionFormNotesLabel => 'Noti (mhux obbligatorji)';

  @override
  String get sessionFormSaving => 'Qed jissejvja…';

  @override
  String get sessionFormTitleAdd => 'Irreġistra sessjoni taʼ studju';

  @override
  String get sessionFormTitleEdit => 'Editja s-sessjoni taʼ studju';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total: $hours s';
  }

  @override
  String get settingsAccent => 'Kulur tat-tema';

  @override
  String get settingsAccentBerry => 'Berqa';

  @override
  String get settingsAccentClay => 'Tafal';

  @override
  String get settingsAccentForest => 'Foresta';

  @override
  String get settingsAccentSlate => 'Lavanja';

  @override
  String get settingsAccentTeal => 'Aħdar ikħal';

  @override
  String get settingsAccentUpdated => 'Il-kulur tat-tema ġie aġġornat.';

  @override
  String get settingsAllDataDeleted => 'Id-data kollha tħassret.';

  @override
  String get settingsAppearance => 'Dehra (skur / ċar)';

  @override
  String get settingsCheckingSample => 'Qed jiċċekkja d-data taʼ kampjun…';

  @override
  String get settingsClear => 'Neħħi';

  @override
  String get settingsClearSample => 'Neħħi d-data taʼ kampjun';

  @override
  String get settingsClearSampleMessage =>
      'Dan ineħħi l-korsijiet u s-sessjonijiet taʼ kampjun. Il-korsijiet jew is-sessjonijiet li żidt int mʼhumiex imneħħija.';

  @override
  String get settingsClearSampleSubtitle =>
      'Neħħi l-korsijiet u s-sessjonijiet taʼ kampjun miżrugħa. Id-data tiegħek tinżamm.';

  @override
  String get settingsClearSampleTitle => 'Tneħħi d-data taʼ kampjun?';

  @override
  String get settingsCopy => 'Ikkopja';

  @override
  String get settingsDailyError => 'Daħħal 0 jew numru pożittiv taʼ minuti.';

  @override
  String get settingsDailyLabel => 'Minuti kuljum (0 = l-ebda miri)';

  @override
  String get settingsDailyTarget => 'Miri taʼ studju taʼ kuljum';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/jum';
  }

  @override
  String get settingsDailyUpdated => 'Il-miri taʼ kuljum ġie aġġornat.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Ħassar kollox';

  @override
  String get settingsDevMode => 'Modalità taʼ żvilupp';

  @override
  String get settingsDisplay => 'Wirja';

  @override
  String get settingsDisplayComfortable => 'Komdu';

  @override
  String get settingsDisplayCompact => 'Kompatt';

  @override
  String get settingsDisplayLarge => 'Kbir';

  @override
  String get settingsDisplaySize => 'Daqs tat-test u tal-elementi';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Id-daqs tal-wirja ġie aġġornat.';

  @override
  String get settingsExport => 'Esporta d-data';

  @override
  String get settingsExportCopied =>
      'L-esportazzjoni ġiet ikkupjata fil-clipboard.';

  @override
  String get settingsExportSubtitle =>
      'Ikkopja l-korsijiet, is-sessjonijiet u l-issettjar kollha bħala JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kors(ijiet) · $sessions sessjoni · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (imqassra — il-backup sħiħ huwa $kb KB, uża Ikkopja għal kollox)';
  }

  @override
  String get settingsFirstWeekday => 'L-ewwel jum tal-ġimgħa';

  @override
  String get settingsFirstWeekdayUpdated =>
      'L-ewwel jum tal-ġimgħa ġie aġġornat.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s żamma)';
  }

  @override
  String get settingsHoldToReplace => 'Żomm biex tissostitwixxi kollox';

  @override
  String get settingsHoursError => 'Daħħal numru akbar minn żero.';

  @override
  String get settingsHoursHelper =>
      'Normal 30. Il-bidla tikkalkula mill-ġdid ir-rekwiżiti; ir-reġistri jinżammu.';

  @override
  String get settingsHoursLabel => 'Sigħat għal kull kreditu ECTS';

  @override
  String get settingsHoursPerEcts => 'Sigħat għal kull ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value s';
  }

  @override
  String get settingsHoursUpdated => 'Is-sigħat għal kull ECTS ġew aġġornati.';

  @override
  String get settingsImport => 'Importa d-data';

  @override
  String get settingsImportAppend => 'Żid';

  @override
  String get settingsImportAppendAction => 'Importa (żid)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Id-data ġiet miżjuda: żdiedu $courses kors(ijiet), $sessions sessjoni.';
  }

  @override
  String get settingsImportInfo =>
      'Iż-żieda żżid il-backup malajr mad-data attwali tiegħek (l-issettjar jinżamm). Is-sostituzzjoni tħassar l-ewwel il-korsijiet, is-sessjonijiet u l-issettjar KOLLHA.';

  @override
  String get settingsImportLabel => 'Waħħal il-JSON esportat';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kors(ijiet) · $sessions sessjoni';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · esportat $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · skema v$schema';
  }

  @override
  String get settingsImportReplace => 'Issostitwixxi';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Is-sostituzzjoni tħassar kollox l-ewwel. Agħfas u ŻOMM il-buttuna taʼ taħt għal $seconds sekondi biex tikkonferma.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Id-data ġiet sostitwita: ġew restawrati $courses kors(ijiet), $sessions sessjoni.';
  }

  @override
  String get settingsImportSubtitle =>
      'Issostitwixxi d-data kollha minn backup JSON esportat qabel.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Kompli żomm… $remaining s';
  }

  @override
  String get settingsNoSample => 'L-ebda data taʼ kampjun';

  @override
  String get settingsNoSampleSubtitle =>
      'Id-data taʼ kampjun miżrugħa diġà tneħħiet.';

  @override
  String get settingsNoTarget => 'L-ebda miri issettjat';

  @override
  String get settingsOverloadError => 'Daħħal numru 5–100 s/ġimgħa.';

  @override
  String get settingsOverloadHelper =>
      'Il-ġimgħat tat-tagħbija futura fuq dan jiġu mmarkati bl-aħmar. Studju full-time huwa ~35–40 s/ġimgħa.';

  @override
  String settingsOverloadHours(String value) {
    return '$value s';
  }

  @override
  String get settingsOverloadLabel => 'Sigħat fil-ġimgħa (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/ġimgħa jimmarka bl-aħmar';
  }

  @override
  String get settingsOverloadThreshold =>
      'Limitu taʼ tagħbija żejda fil-ġimgħa';

  @override
  String get settingsOverloadUpdated =>
      'Il-limitu taʼ tagħbija żejda ġie aġġornat.';

  @override
  String get settingsPaceTolerance => 'Tolleranza taʼ quddiem / lura';

  @override
  String get settingsPasteValidBackup => 'Waħħal backup validu l-ewwel';

  @override
  String get settingsReset => 'Irrisettja';

  @override
  String get settingsResetAll => 'Irrisettja d-data kollha';

  @override
  String get settingsResetAllMessage =>
      'Dan iħassar bʼmod permanenti l-korsijiet, is-sessjonijiet u l-issettjar KOLLHA. Dan ma jistax jitneħħa. Esporta backup l-ewwel jekk meħtieġ.';

  @override
  String get settingsResetAllSubtitle =>
      'Ħassar il-korsijiet, is-sessjonijiet u l-issettjar kollha.';

  @override
  String get settingsResetAllTitle => 'Tirrisettja d-data kollha?';

  @override
  String get settingsResetSettings => 'Irrisettja l-issettjar';

  @override
  String get settingsResetSettingsDone =>
      'L-issettjar ġie rrisettjat għan-normal.';

  @override
  String get settingsResetSettingsMessage =>
      'Jerġaʼ jġib is-sigħat għal kull ECTS (30), il-miri taʼ kuljum (xejn), l-ewwel jum tal-ġimgħa (it-Tnejn), it-tema (sistema), it-tolleranza (5 ijiem), it-tagħbija żejda (35 s/ġimgħa), id-daqs (komdu), il-kulur (lavanja). Il-korsijiet u s-sessjonijiet jinżammu.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Erġaʼ ġib in-normal: 30 s/ECTS, l-ebda miri, it-Tnejn, tema tas-sistema, tolleranza taʼ 5 ijiem, tagħbija żejda taʼ 35 s/ġimgħa, daqs komdu, kulur lavanja.';

  @override
  String get settingsResetSettingsTitle => 'Tirrisettja l-issettjar?';

  @override
  String get settingsSampleData => 'Data taʼ kampjun';

  @override
  String settingsSampleDataError(String error) {
    return 'Żball: $error';
  }

  @override
  String get settingsStudySettings => 'Issettjar tal-istudju';

  @override
  String get settingsThemeDark => 'Skur';

  @override
  String get settingsThemeLight => 'Ċar';

  @override
  String get settingsThemeSystem => 'Normal tas-sistema';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'It-tema ġiet aġġornata.';

  @override
  String settingsToleranceDays(String value) {
    return '$value ijiem';
  }

  @override
  String get settingsToleranceError => 'Daħħal numru 0–30 jum.';

  @override
  String get settingsToleranceHelper =>
      'Quddiem teħtieġ +N ijiem riżerva, lura −N ijiem. 5 = stabbli, 0 = sensittiv.';

  @override
  String get settingsToleranceLabel => 'Ijiem taʼ xogħol (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance xogħol';
  }

  @override
  String get settingsToleranceUpdated => 'It-tolleranza ġiet aġġornata.';

  @override
  String get settingsWeekdayFriday => 'Il-Ġimgħa';

  @override
  String get settingsWeekdayMonday => 'It-Tnejn';

  @override
  String get settingsWeekdaySaturday => 'Is-Sibt';

  @override
  String get settingsWeekdaySunday => 'Il-Ħadd';

  @override
  String get settingsWeekdayThursday => 'Il-Ħamis';

  @override
  String get settingsWeekdayTuesday => 'It-Tlieta';

  @override
  String get settingsWeekdayWednesday => 'L-Erbgħa';

  @override
  String get sortDeadline => 'Għeluq';

  @override
  String get sortName => 'Isem';

  @override
  String get sortProgress => 'Progress';

  @override
  String get sortStatus => 'Stat';

  @override
  String get startupTitle => 'Ma setax jinbeda ECTS Tracker';

  @override
  String get statsActiveDays => 'Ijiem attivi';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days jiem attivi';
  }

  @override
  String get statsAddDeadlines =>
      'Żid dati taʼ għeluq biex tbassar it-tagħbija.';

  @override
  String get statsComingLoad => 'Tagħbija li ġejja';

  @override
  String get statsConsistency => 'Konsistenza';

  @override
  String get statsConsistencyHint =>
      'Ijiem taʼ studju fl-aħħar 30 jum. Passi żgħar kuljum jegħlbu t-tħaffif.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% tal-aħħar 30 jum';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Kors $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'K$id';
  }

  @override
  String get statsDidPerDay => 'Magħmul / jum (14-il jum)';

  @override
  String get statsEmpty => 'L-ebda sessjoni sʼissa';

  @override
  String get statsGap => 'Distakk';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value s';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours s';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours s';
  }

  @override
  String get statsLast30Days => 'L-aħħar 30 jum';

  @override
  String get statsLast7Days => 'L-aħħar 7 ijiem';

  @override
  String get statsNeedPerDay => 'Bżonn / jum';

  @override
  String get statsNext8Weeks => 'It-8 ġimgħat li ġejjin';

  @override
  String get statsOfLast30DaysVolume => 'mill-volum tal-aħħar 30 jum';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Il-ġimgħat taʼ tagħbija żejda >$threshold s immarkati bl-aħmar — ċaqlaq għeluq jew naqqas l-ambitu.';
  }

  @override
  String get statsOverview => 'Ħarsa ġenerali';

  @override
  String get statsPaceCovers =>
      'Il-pass passat ikopri dak meħtieġ. Żomm ir-ritmu.';

  @override
  String statsPaceShort(String gap) {
    return 'Il-pass passat huwa nieqes $gap s/jum — żid blokk jew naqqas l-ambitu.';
  }

  @override
  String get statsPastVsNeeded => 'Passat vs meħtieġ';

  @override
  String statsPeakPerWeek(String peak) {
    return 'quċċata $peak s/ġimgħa';
  }

  @override
  String get statsPerCourse => 'Għal kull kors';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done s / $required s · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sessjonijiet';

  @override
  String statsSuggestedOrder(String order) {
    return 'Ordni ssuġġerita: $order (l-eqreb għeluq l-ewwel)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'volum totali';

  @override
  String get statusAhead => 'Quddiem';

  @override
  String get statusBehind => 'Lura';

  @override
  String get statusCompleted => 'Lest';

  @override
  String get statusOnTrack => 'Fit-triq it-tajba';

  @override
  String get statusOverdue => 'Skadut';

  @override
  String get studyLogDeleteBody =>
      'Tħassar din is-sessjoni taʼ studju? Dan ma jistax jitneħħa.';

  @override
  String get studyLogDeleteTitle => 'Tħassar is-sessjoni?';

  @override
  String get studyLogEmptyHint =>
      'Irreġistra sessjoni biex issegwi l-ħin taʼ studju tiegħek.';

  @override
  String get studyLogEmptyTitle => 'L-ebda sessjoni taʼ studju sʼissa';

  @override
  String get studyLogFabLabel => 'Irreġistra sessjoni';

  @override
  String get studyLogFabTooltip => 'Irreġistra sessjoni';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours s';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Neħħi s-sessjoni taʼ kampjun';

  @override
  String get studyLogThisWeek => 'Din il-ġimgħa';

  @override
  String get studyLogToday => 'Illum';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Kors $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'L-ECTS għandu jkun akbar minn żero';

  @override
  String get validationCourseEctsRequired => 'Daħħal il-krediti ECTS';

  @override
  String get validationCourseNameRequired => 'L-isem huwa meħtieġ';

  @override
  String get validationCourseNameTooLong => 'L-isem huwa twil wisq';

  @override
  String get validationSessionCourseRequired => 'Agħżel kors';

  @override
  String get validationSessionDurationRequired => 'Daħħal tul';

  @override
  String get widgetNoProgress => 'L-ebda progress sʼissa';

  @override
  String get settingsLanguage => 'Lingwa';

  @override
  String get settingsLiquidGlass => 'Ħġieġ likwidu';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Kards u bars tal-ħġieġ imċajpar. Mitfi jżomm id-dehra klassika solida.';

  @override
  String get settingsLiquidGlassOn => 'Mixgħul';

  @override
  String get settingsLiquidGlassOff => 'Mitfi';

  @override
  String get settingsLiquidGlassUpdated => 'Il-ħġieġ likwidu ġie aġġornat.';

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
