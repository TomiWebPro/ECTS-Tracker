// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Welsh (`cy`).
class AppLocalizationsCy extends AppLocalizations {
  AppLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Diddymu';

  @override
  String get commonClose => 'Cau';

  @override
  String get commonDelete => 'Dileu';

  @override
  String get commonEdit => 'Golygu';

  @override
  String get commonError => 'Gwall';

  @override
  String get commonNone => 'Dim';

  @override
  String get commonSave => 'Cadw';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Oriau gofynnol (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Clirio\'r dyddiad cau';

  @override
  String get courseFormClearStartTooltip => 'Clirio\'r dyddiad dechrau';

  @override
  String get courseFormColorLabel => 'Lliw';

  @override
  String get courseFormDateNotSet => 'Heb ei osod';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Dyddiad cau: $date';
  }

  @override
  String get courseFormEctsLabel => 'Credydau ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Enw';

  @override
  String get courseFormNotesLabel => 'Nodiadau (dewisol)';

  @override
  String get courseFormSaving => 'Yn cadw…';

  @override
  String courseFormStartButton(String date) {
    return 'Dechrau: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'I ffwrdd: dim pwysau tan $date; wedi\'i eithrio o gyflymder heddiw.';
  }

  @override
  String get courseFormStartEarlyOn => 'Ymlaen: mae\'r amser yn cael ei rannu hyd yn hyn ac yn cyfrif tuag at gyflymder heddiw.';

  @override
  String get courseFormStartEarlyTitle => 'Dechrau nawr er gwaethaf dechrau yn y dyfodol';

  @override
  String get courseFormTitleAdd => 'Ychwanegu modiwl';

  @override
  String get courseFormTitleEdit => 'Golygu\'r modiwl';

  @override
  String get coursesAddTooltip => 'Ychwanegu modiwl';

  @override
  String coursesDeleteBody(String name) {
    return 'Dileu “$name” a\'i holl sesiynau astudio? Ni ellir dadwneud hyn.';
  }

  @override
  String get coursesDeleteTitle => 'Dileu\'r modiwl?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Tapiwch “Modiwl newydd” i greu eich modiwl cyntaf.';

  @override
  String get coursesEmptyTitle => 'Dim modiwlau eto';

  @override
  String get coursesFilterAll => 'Pob statws';

  @override
  String get coursesFilterEmpty => 'Nid yw unrhyw fodiwl yn cyd-fynd â\'r hidlydd hwn';

  @override
  String get coursesNewCourse => 'Modiwl newydd';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Angen $daily h/dydd';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return 'Angen $daily mun/dydd';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Angen $daily h/dydd • $weekly h/wythnos';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return 'Angen $daily mun/dydd • $weekly mun/wythnos';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return 'Angen $daily mun/dydd • $weekly h/wythnos';
  }

  @override
  String coursesProgressWithStatus(String done, String required, String status) {
    return '$done / $required h • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Tynnu\'r modiwl enghreifftiol';

  @override
  String coursesShownCount(String count) {
    return '$count wedi\'u dangos';
  }

  @override
  String coursesSortOption(String label) {
    return 'Trefnu: $label';
  }

  @override
  String get dashboardAllDone => 'Popeth wedi\'i wneud';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h wedi\'u cofnodi (bonws)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count modiwl(au)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count modiwl(au) · $upcoming yn y dyfodol heb eu cynnwys yng nghyflymder heddiw';
  }

  @override
  String get dashboardCoursesTitle => 'Modiwlau';

  @override
  String dashboardDeadline(String date) {
    return 'Dyddiad cau $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Dyddiad cau $date ($days diwrnod ar ôl)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Dyddiad cau $date (1 diwrnod ar ôl)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Dyddiad cau $date (wedi mynd heibio)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Dyddiad cau $date (heddiw)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Yn ddyledus heddiw — $hours h wedi\'u cofnodi';
  }

  @override
  String get dashboardEmptyHintAllDone => 'Mae pob modiwl wedi\'i gwblhau — gweler y tab Modiwlau am y rhestr lawn.';

  @override
  String get dashboardEmptyHintNoCourses => 'Ychwanegwch fmodiwl i ddechrau olrhain eich cynnydd ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Ar ei hôl hi = gwneud $achieved/dydd, angen $need/dydd';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Ar ei hôl hi = gwneud $achieved/dydd, angen $need/dydd · dechrau cynnar';
  }

  @override
  String get dashboardExplainerBehindNoPace => 'Ar ei hôl hi: nid yw unrhyw gyflymder pendant yn cyrraedd dyddiad cau heddiw gydag oriau ar ôl';

  @override
  String get dashboardExplainerOnTrackNoPace => 'Ar y trywydd iawn: dim cyflymder eto — cofnodwch y sesiwn gyntaf i gadarnhau';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Yn dechrau mewn $days diwrnod · wedi\'i gyfrif o $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Yn dechrau mewn $days diwrnod · wedi\'i gyfrif o $date · dechrau cynnar ymlaen';
  }

  @override
  String get dashboardFreshStart => 'DECHRAU O\'R NEWYDD';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · ${hours}h ar ôl';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/dydd';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes mun/dydd';
  }

  @override
  String get dashboardLogSessionAction => 'Cofnodi sesiwn astudio';

  @override
  String get dashboardLogSessionTooltip => 'Cofnodi sesiwn astudio';

  @override
  String get dashboardNewBadge => 'NEWYDD';

  @override
  String get dashboardNoCourses => 'Dim modiwlau eto';

  @override
  String get dashboardNoDeadline => 'Dim dyddiad cau';

  @override
  String get dashboardNoDeadlines => 'Dim dyddiadau cau wedi\'u trefnu';

  @override
  String get dashboardNoPaceDue => 'Dim cyflymder yn ddyledus heddiw';

  @override
  String get dashboardNothingDue => 'Dim byd yn ddyledus';

  @override
  String get dashboardNothingToTrack => 'Dim byd i\'w olrhain eto';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Yn ddyledus heddiw — ${hours}h ar ôl';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Angen $daily h/dydd i orffen';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Angen $daily mun/dydd i orffen';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Angen $daily h/dydd · $weekly h/wythnos i orffen';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Angen $daily mun/dydd · $weekly mun/wythnos i orffen';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Angen $daily mun/dydd · $weekly h/wythnos i orffen';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Angen $hours h/dydd o $date · heb ei gynnwys yng nghyflymder heddiw';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Angen $minutes mun/dydd o $date · heb ei gynnwys yng nghyflymder heddiw';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Dim dyddiad cau — ${hours}h ar ôl · dim pwysau dyddiol';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Yn dechrau $date · ${hours}h i\'w wneud';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · afrealistig';
  }

  @override
  String get dashboardProgramBare => 'RHAGLEN';

  @override
  String get dashboardProgramEmptyHint => 'Ychwanegwch fmodiwl i ddechrau olrhain';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'RHAGLEN $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days diwrnod o seibiant';
  }

  @override
  String get dashboardStartNotSet => 'Heb ei osod';

  @override
  String dashboardStartsIn(String days) {
    return 'Yn dechrau mewn ${days}d';
  }

  @override
  String get dashboardStartsSoon => 'Yn dechrau\'n fuan';

  @override
  String get dashboardTipEmpty => 'Ychwanegwch eich modiwl cyntaf — bydd eich cyflymder dyddiol a\'ch cynnydd yn ymddangos yma.';

  @override
  String get dashboardTipFirst => 'Mae\'r 25 munud cyntaf yn cyfrif fwyaf — dewiswch y modiwl sy\'n ddyledus gyntaf.';

  @override
  String get dashboardTodayBare => 'HEDDIW';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'HEDDIW $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'CYFLYMDER HEDDIW';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h heddiw';
  }

  @override
  String get dashboardUpcomingSubtitle => 'Dechreuadau yn y dyfodol — dim pwysau heddiw, wedi\'u heithrio o gyflymder heddiw.';

  @override
  String get dashboardUpcomingTitle => 'Ar y gweill';

  @override
  String get devToolsActivate => 'Gweithredu';

  @override
  String get devToolsActivateMessage => 'Mae hyn yn datgloi offer cudd profi straen (cynhyrchu data). Ar gyfer datblygu yn unig.';

  @override
  String get devToolsActivateTitle => 'Gweithredu\'r modd datblygu?';

  @override
  String get devToolsActivated => 'Modd datblygu wedi\'i weithredu.';

  @override
  String get devToolsClearPumped => 'Clirio data wedi\'i bwmpio';

  @override
  String get devToolsClearPumpedMessage => 'Yn dileu\'r modiwlau STRESS a gynhyrchwyd a\'u sesiynau. Cedwir eich data.';

  @override
  String get devToolsClearPumpedSubtitle => 'Dileu modiwlau a sesiynau STRESS wedi\'u cynhyrchu.';

  @override
  String get devToolsClearPumpedTitle => 'Clirio data wedi\'i bwmpio?';

  @override
  String devToolsCleared(String count) {
    return 'Wedi clirio $count modiwl wedi\'u pwmpio.';
  }

  @override
  String get devToolsConfirmPumpMessage => 'Ail gadarnhad: bydd hyn yn chwyddo modiwlau, rhestrau, siartiau a chyfrifiadau cyflymder, a gall gymryd ychydig eiliadau. Pwmpio nawr?';

  @override
  String get devToolsConfirmPumpTitle => 'Cadarnhau pwmp straen';

  @override
  String get devToolsContinue => 'Parhau';

  @override
  String get devToolsExit => 'Gadael y modd datblygu';

  @override
  String get devToolsExitSubtitle => 'Cuddio offer datblygu ar y ddyfais hon.';

  @override
  String get devToolsPumpData => 'Pwmpio data';

  @override
  String get devToolsPumpMessage => 'Mae hyn yn mewnosod semester realistig wedi\'i gynhyrchu (~10 modiwl, ~800 sesiwn dros y 12 wythnos diwethaf). Cedwir eich data presennol. Parhau?';

  @override
  String get devToolsPumpSubtitle => 'Mewnosod semester wedi\'i gynhyrchu (~10 modiwl, ~800 sesiwn, 12 wythnos). Cedwir data presennol.';

  @override
  String get devToolsPumpTile => 'Pwmpio data prawf';

  @override
  String get devToolsPumpTitle => 'Pwmpio data prawf?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Wedi pwmpio $courses modiwl, $sessions sesiwn.';
  }

  @override
  String get devToolsPumping => 'Yn pwmpio data prawf…';

  @override
  String get devToolsRemoveAll => 'Tynnu pob data';

  @override
  String get devToolsRemoveAllMessage => 'Llwybr byr datblygu: mae hyn yn dileu pob modiwl, sesiwn a gosodiad yn barhaol. Ni ellir dadwneud hyn.';

  @override
  String get devToolsRemoveAllSubtitle => 'Llwybr byr datblygu: dileu pob modiwl, sesiwn a gosodiad.';

  @override
  String get devToolsRemoveAllTitle => 'Tynnu pob data?';

  @override
  String get navCourses => 'Modiwlau';

  @override
  String get navDashboard => 'Dangosfwrdd';

  @override
  String get navSettings => 'Gosodiadau';

  @override
  String get navStatistics => 'Ystadegau';

  @override
  String get navStudyLog => 'Log Astudio';

  @override
  String get sampleBadge => 'Enghraifft';

  @override
  String get sessionFormCourseLabel => 'Modiwl';

  @override
  String sessionFormDateButton(String date) {
    return 'Dyddiad: $date';
  }

  @override
  String get sessionFormDurationError => 'Rhaid i\'r hyd fod yn fwy na sero.';

  @override
  String get sessionFormHoursLabel => 'Oriau';

  @override
  String get sessionFormLogAction => 'Cofnodi sesiwn';

  @override
  String get sessionFormMinutesLabel => 'Munudau';

  @override
  String get sessionFormNoCourseError => 'Dewiswch fmodiwl.';

  @override
  String get sessionFormNoCoursesHint => 'Ychwanegwch fmodiwl yn gyntaf i gofnodi sesiwn.';

  @override
  String get sessionFormNotesLabel => 'Nodiadau (dewisol)';

  @override
  String get sessionFormSaving => 'Yn cadw…';

  @override
  String get sessionFormTitleAdd => 'Cofnodi sesiwn astudio';

  @override
  String get sessionFormTitleEdit => 'Golygu sesiwn astudio';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Cyfanswm: $hours h';
  }

  @override
  String get settingsAccent => 'Lliw\'r thema';

  @override
  String get settingsAccentBerry => 'Aeron';

  @override
  String get settingsAccentClay => 'Clai';

  @override
  String get settingsAccentForest => 'Coedwig';

  @override
  String get settingsAccentSlate => 'Llechen';

  @override
  String get settingsAccentTeal => 'Gwyrddlas';

  @override
  String get settingsAccentUpdated => 'Lliw\'r thema wedi\'i ddiweddaru.';

  @override
  String get settingsAllDataDeleted => 'Pob data wedi\'i ddileu.';

  @override
  String get settingsAppearance => 'Ymddangosiad (tywyll / golau)';

  @override
  String get settingsCheckingSample => 'Yn gwirio data enghreifftiol…';

  @override
  String get settingsClear => 'Clirio';

  @override
  String get settingsClearSample => 'Clirio data enghreifftiol';

  @override
  String get settingsClearSampleMessage => 'Mae hyn yn tynnu\'r modiwlau a\'r sesiynau enghreifftiol. Ni chaiff modiwlau na sesiynau a ychwanegwyd gennych eu tynnu.';

  @override
  String get settingsClearSampleSubtitle => 'Tynnu\'r modiwlau a\'r sesiynau enghreifftiol. Cedwir eich data.';

  @override
  String get settingsClearSampleTitle => 'Clirio data enghreifftiol?';

  @override
  String get settingsCopy => 'Copïo';

  @override
  String get settingsDailyError => 'Rhowch 0 neu nifer cadarnhaol o funudau.';

  @override
  String get settingsDailyLabel => 'Munudau y dydd (0 = dim targed)';

  @override
  String get settingsDailyTarget => 'Targed astudio dyddiol';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes mun/dydd';
  }

  @override
  String get settingsDailyUpdated => 'Targed dyddiol wedi\'i ddiweddaru.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Dileu popeth';

  @override
  String get settingsDevMode => 'Modd datblygu';

  @override
  String get settingsDisplay => 'Arddangos';

  @override
  String get settingsDisplayComfortable => 'Cyfforddus';

  @override
  String get settingsDisplayCompact => 'Cryno';

  @override
  String get settingsDisplayLarge => 'Mawr';

  @override
  String get settingsDisplaySize => 'Maint testun ac elfennau';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Maint arddangos wedi\'i ddiweddaru.';

  @override
  String get settingsExport => 'Allforio data';

  @override
  String get settingsExportCopied => 'Allforiad wedi\'i gopïo i\'r clipfwrdd.';

  @override
  String get settingsExportSubtitle => 'Copïo pob modiwl, sesiwn a gosodiad fel JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses modiwl(au) · $sessions sesiwn(au) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (wedi\'i fyrhau — mae\'r copi llawn yn $kb KB, defnyddiwch Copïo am bopeth)';
  }

  @override
  String get settingsFirstWeekday => 'Diwrnod cyntaf yr wythnos';

  @override
  String get settingsFirstWeekdayUpdated => 'Diwrnod cyntaf yr wythnos wedi\'i ddiweddaru.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (dal ${seconds}s)';
  }

  @override
  String get settingsHoldToReplace => 'Daliwch i ddisodli popeth';

  @override
  String get settingsHoursError => 'Rhowch rif sy\'n fwy na sero.';

  @override
  String get settingsHoursHelper => 'Diofyn 30. Mae newid yn ailgyfrifo\'r gofynion; cedwir logiau.';

  @override
  String get settingsHoursLabel => 'Oriau fesul credyd ECTS';

  @override
  String get settingsHoursPerEcts => 'Oriau fesul ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Oriau fesul ECTS wedi\'u diweddaru.';

  @override
  String get settingsImport => 'Mewnforio data';

  @override
  String get settingsImportAppend => 'Atodi';

  @override
  String get settingsImportAppendAction => 'Mewnforio (atodi)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Data wedi\'i atodi: $courses modiwl(au), $sessions sesiwn(au) wedi\'u hychwanegu.';
  }

  @override
  String get settingsImportInfo => 'Mae atodi yn ychwanegu\'r copi wrth gefn at eich data presennol (cedwir gosodiadau). Mae disodli yn dileu pob modiwl, sesiwn a gosodiad YN GYNTAF.';

  @override
  String get settingsImportLabel => 'Gludwch y JSON wedi\'i allforio';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses modiwl(au) · $sessions sesiwn(au)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· wedi\'i allforio $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· sgema v$schema';
  }

  @override
  String get settingsImportReplace => 'Disodli';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Mae disodli yn dileu popeth yn gyntaf. Pwyswch A DALIWCH y botwm isod am $seconds eiliad i gadarnhau.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Data wedi\'i disodli: $courses modiwl(au), $sessions sesiwn(au) wedi\'u hadfer.';
  }

  @override
  String get settingsImportSubtitle => 'Disodli pob data o gopi wrth gefn JSON wedi\'i allforio.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Daliwch ati… $remaining s';
  }

  @override
  String get settingsNoSample => 'Dim data enghreifftiol';

  @override
  String get settingsNoSampleSubtitle => 'Mae\'r data enghreifftiol eisoes wedi\'i chlirio.';

  @override
  String get settingsNoTarget => 'Dim targed wedi\'i osod';

  @override
  String get settingsOverloadError => 'Rhowch rif 5–100 h/wythnos.';

  @override
  String get settingsOverloadHelper => 'Mae wythnosau llwyth dod â mwy na hyn wedi\'u nodi\'n goch. Mae astudio llawn amser tua 35–40 h/wythnos.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Oriau yr wythnos (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return 'mae $value/wythnos yn goch';
  }

  @override
  String get settingsOverloadThreshold => 'Trothwy gorlwytho wythnosol';

  @override
  String get settingsOverloadUpdated => 'Trothwy gorlwytho wedi\'i ddiweddaru.';

  @override
  String get settingsPaceTolerance => 'Goddefiant arwain / ar ei hôl';

  @override
  String get settingsPasteValidBackup => 'Gludwch gopi wrth gefn dilys yn gyntaf';

  @override
  String get settingsReset => 'Ailosod';

  @override
  String get settingsResetAll => 'Ailosod pob data';

  @override
  String get settingsResetAllMessage => 'Mae hyn yn dileu pob modiwl, sesiwn a gosodiad yn barhaol. Ni ellir dadwneud hyn. Allforiwch gopi wrth gefn yn gyntaf os oes angen.';

  @override
  String get settingsResetAllSubtitle => 'Dileu pob modiwl, sesiwn a gosodiad.';

  @override
  String get settingsResetAllTitle => 'Ailosod pob data?';

  @override
  String get settingsResetSettings => 'Ailosod gosodiadau';

  @override
  String get settingsResetSettingsDone => 'Gosodiadau wedi\'u hailosod i\'r diofyn.';

  @override
  String get settingsResetSettingsMessage => 'Yn adfer oriau-fesul-ECTS (30), targed dyddiol (dim), dydd cyntaf yr wythnos (dydd Llun), thema (system), goddefiant (5 diwrnod), gorlwytho (35 h/wythnos), maint (cyfforddus), lliw (llechen). Cedwir modiwlau a sesiynau.';

  @override
  String get settingsResetSettingsSubtitle => 'Adfer diofynion: 30 h/ECTS, dim targed, dydd Llun, thema system, goddefiant 5 diwrnod, gorlwytho 35 h/wythnos, maint cyfforddus, lliw llechen.';

  @override
  String get settingsResetSettingsTitle => 'Ailosod gosodiadau?';

  @override
  String get settingsSampleData => 'Data enghreifftiol';

  @override
  String settingsSampleDataError(String error) {
    return 'Gwall: $error';
  }

  @override
  String get settingsStudySettings => 'Gosodiadau astudio';

  @override
  String get settingsThemeDark => 'Tywyll';

  @override
  String get settingsThemeLight => 'Golau';

  @override
  String get settingsThemeSystem => 'Diofyn y system';

  @override
  String get settingsThemeTitle => 'Thema';

  @override
  String get settingsThemeUpdated => 'Thema wedi\'i diweddaru.';

  @override
  String settingsToleranceDays(String value) {
    return '$value diwrnod';
  }

  @override
  String get settingsToleranceError => 'Rhowch rif 0–30 diwrnod.';

  @override
  String get settingsToleranceHelper => 'Mae arwain angen +N diwrnod o warged, ar ei hôl −N diwrnod. 5 = sefydlog, 0 = sensitif.';

  @override
  String get settingsToleranceLabel => 'Diwrnodau gwaith (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance o waith';
  }

  @override
  String get settingsToleranceUpdated => 'Goddefiant wedi\'i ddiweddaru.';

  @override
  String get settingsWeekdayFriday => 'Dydd Gwener';

  @override
  String get settingsWeekdayMonday => 'Dydd Llun';

  @override
  String get settingsWeekdaySaturday => 'Dydd Sadwrn';

  @override
  String get settingsWeekdaySunday => 'Dydd Sul';

  @override
  String get settingsWeekdayThursday => 'Dydd Iau';

  @override
  String get settingsWeekdayTuesday => 'Dydd Mawrth';

  @override
  String get settingsWeekdayWednesday => 'Dydd Mercher';

  @override
  String get sortDeadline => 'Dyddiad cau';

  @override
  String get sortName => 'Enw';

  @override
  String get sortProgress => 'Cynnydd';

  @override
  String get sortStatus => 'Statws';

  @override
  String get startupTitle => 'Methu cychwyn ECTS Tracker';

  @override
  String get statsActiveDays => 'Diwrnodau gweithredol';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}d yn weithredol';
  }

  @override
  String get statsAddDeadlines => 'Ychwanegwch ddyddiadau cau i ragweld y llwyth.';

  @override
  String get statsComingLoad => 'Llwyth dod';

  @override
  String get statsConsistency => 'Cysondeb';

  @override
  String get statsConsistencyHint => 'Diwrnodau astudio yn y 30 diwrnod diwethaf. Mae camau bach bob dydd yn trechu cramio.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% o\'r 30 diwrnod diwethaf';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Modiwl $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Wedi\'i wneud / dydd (14d)';

  @override
  String get statsEmpty => 'Dim sesiynau eto';

  @override
  String get statsGap => 'Bwlch';

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
  String get statsLast30Days => 'Y 30 diwrnod diwethaf';

  @override
  String get statsLast7Days => 'Y 7 diwrnod diwethaf';

  @override
  String get statsNeedPerDay => 'Angen / dydd';

  @override
  String get statsNext8Weeks => 'Yr 8 wythnos nesaf';

  @override
  String get statsOfLast30DaysVolume => 'o gyfaint y 30 diwrnod diwethaf';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Mae wythnosau gorlwytho >${threshold}h wedi\'u nodi\'n goch — symudwch ddyddiad cau neu torri cwmpas.';
  }

  @override
  String get statsOverview => 'Trosolwg';

  @override
  String get statsPaceCovers => 'Mae cyflymder y gorffennol yn cwmpasu\'r hyn sydd ei angen. Daliwch ati.';

  @override
  String statsPaceShort(String gap) {
    return 'Mae cyflymder y gorffennol yn $gap h/dydd yn brin — ychwanegwch floc neu torrwch gwmpas.';
  }

  @override
  String get statsPastVsNeeded => 'Gorffennol yn erbyn angen';

  @override
  String statsPeakPerWeek(String peak) {
    return 'brig ${peak}h/wyth';
  }

  @override
  String get statsPerCourse => 'Fesul modiwl';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sesiynau';

  @override
  String statsSuggestedOrder(String order) {
    return 'Trefn awgrymedig: $order (dyddiad cau cynharaf yn gyntaf)';
  }

  @override
  String get statsTotal => 'Cyfanswm';

  @override
  String get statsTotalVolume => 'cyfaint llawn';

  @override
  String get statusAhead => 'Ar y blaen';

  @override
  String get statusBehind => 'Ar ei hôl hi';

  @override
  String get statusCompleted => 'Wedi\'i gwblhau';

  @override
  String get statusOnTrack => 'Ar y trywydd iawn';

  @override
  String get statusOverdue => 'Wedi mynd heibio';

  @override
  String get studyLogDeleteBody => 'Dileu\'r sesiwn astudio hon? Ni ellir dadwneud hyn.';

  @override
  String get studyLogDeleteTitle => 'Dileu sesiwn?';

  @override
  String get studyLogEmptyHint => 'Cofnodwch sesiwn i olrhain eich amser astudio.';

  @override
  String get studyLogEmptyTitle => 'Dim sesiynau astudio eto';

  @override
  String get studyLogFabLabel => 'Cofnodi sesiwn';

  @override
  String get studyLogFabTooltip => 'Cofnodi sesiwn';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Tynnu sesiwn enghreifftiol';

  @override
  String get studyLogThisWeek => 'Yr wythnos hon';

  @override
  String get studyLogToday => 'Heddiw';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Modiwl $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return 'Timing $course';
  }

  @override
  String get studyTimerAlreadyRunning => 'A timer is already running. Finish or discard it first.';

  @override
  String get studyTimerCourseLabel => 'Course';

  @override
  String get studyTimerDiscard => 'Discard';

  @override
  String get studyTimerDiscardBody => 'Throw away the current timer without logging? This cannot be undone.';

  @override
  String get studyTimerDiscardTitle => 'Discard timer?';

  @override
  String studyTimerFinishLog(String minutes) {
    return 'Finish & log $minutes min';
  }

  @override
  String get studyTimerNoCourseError => 'Select a course.';

  @override
  String get studyTimerNoCoursesHint => 'Add a course first to start a timer.';

  @override
  String get studyTimerPause => 'Pause';

  @override
  String get studyTimerResume => 'Resume';

  @override
  String get studyTimerStart => 'Start timer';

  @override
  String get studyTimerStartTitle => 'Start study timer';

  @override
  String get studyTimerTooShort => 'Timer has not run yet.';

  @override
  String get validationCourseEctsPositive => 'Rhaid i ECTS fod yn fwy na sero';

  @override
  String get validationCourseEctsRequired => 'Rhowch gredydau ECTS';

  @override
  String get validationCourseNameRequired => 'Mae\'r enw\'n ofynnol';

  @override
  String get validationCourseNameTooLong => 'Mae\'r enw\'n rhy hir';

  @override
  String get validationSessionCourseRequired => 'Dewiswch fmodiwl';

  @override
  String get validationSessionDurationRequired => 'Rhowch hyd';

  @override
  String get widgetNoProgress => 'Dim cynnydd eto';

  @override
  String get settingsLanguage => 'Iaith';

  @override
  String get settingsLiquidGlass => 'Gwydr hylif';

  @override
  String get settingsLiquidGlassSubtitle => 'Cardiau a bariau gwydr barugog. Mae I ffwrdd yn cadw\'r olwg solet glasurol.';

  @override
  String get settingsLiquidGlassOn => 'Ymlaen';

  @override
  String get settingsLiquidGlassOff => 'I ffwrdd';

  @override
  String get settingsLiquidGlassUpdated => 'Gwydr hylif wedi\'i ddiweddaru.';

  @override
  String get devToolsReminderPreview => 'Rhagolwg atgoffa';

  @override
  String get devToolsReminderPreviewSubtitle => 'Gweld beth fyddai\'n hysbysu ar hyn o bryd. Ffrwd prawf sy\'n ddiogel i Windows.';

  @override
  String get reminderPreviewTitle => 'Rhagolwg atgoffa';

  @override
  String get reminderPreviewNow => 'Amser rhagolwg';

  @override
  String get reminderPreviewReset => 'Nawr';

  @override
  String get reminderPreviewEmpty => 'Popeth yn dawel — fyddai dim yn hysbysu ar yr adeg hon.';

  @override
  String get reminderPreviewCustom => 'Amserlenni personol (demo)';

  @override
  String get reminderPreviewNoFire => 'Dim tanio i ddod.';

  @override
  String get reminderKindDaily => 'Dyddiol';

  @override
  String get reminderKindBehind => 'Ar ei hôl hi';

  @override
  String get reminderKindDeadline => 'Dyddiad cau';

  @override
  String get reminderKindOverdue => 'Wedi mynd heibio';

  @override
  String get reminderKindStreak => 'Cyfres';

  @override
  String get reminderKindCustom => 'Personol';

  @override
  String get settingsReminders => 'Atgoffa astudio';

  @override
  String get settingsRemindersOff => 'I ffwrdd — trowch ymlaen am hwb dyddiol.';

  @override
  String get settingsReminderTime => 'Amser atgoffa';

  @override
  String get settingsReminderDenied => 'Mae hysbysiadau wedi\'u blocio — galluogwch nhw yng ngosodiadau\'r system.';

  @override
  String notifDurationHours(String value) {
    return '$value h';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value mun';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Heno: $duration i aros ar y trywydd iawn';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course: $duration ar ôl heddiw';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count mwy)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Cofnodwch sesiwn i glirio heddiw.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 Mae $course ar ei hôl hi';
  }

  @override
  String notifBehindBodyPace(String left, String days, String pace, String catchUp) {
    return '$left ar ôl, $days diwrnod i fynd — $pace/dydd o hyn ymlaen. Cofnodwch $catchUp i fynd yn ôl ar y trywydd iawn.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left ar ôl, $days diwrnod i fynd — $pace/dydd o hyn ymlaen. Dim ond gorffen y $left llawn fydd yn clirio hyn — dechreuwch heno.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left yn dal ar agor a’r dyddiad cau yma. Mae popeth rydych chi’n ei gofnodi nawr yn cyfrif.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 Mae $course i fod yfory ac mae $left ar agor o hyd';
  }

  @override
  String get notifDeadlineTomorrowBody => 'Mae popeth rydych chi’n ei gofnodi heddiw yn cyfrif ddwywaith.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Arholiad $course ymhen $days diwrnod — $left ar ôl';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return '$pace/dydd yw hynny. Rhannwch ef: mae 2 sesiwn y dydd yn trechu un marathon.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Mae pob awr rydych chi’n ei chofnodi nawr yn cyfrif.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ Mae $course wedi mynd heibio’r dyddiad cau gyda $left ar agor';
  }

  @override
  String get notifOverdueBody => 'Symudwch y dyddiad cau neu gorffennwch yr oriau — mae’r modiwl yn aros yn «angen sylw» tan hynny.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 Cyfres o $days diwrnod — $week yr wythnos hon';
  }

  @override
  String get notifStreakBody => 'Pob modiwl ar y trywydd iawn neu ar y blaen. Rhediad braf.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Cofnodi astudio: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Amser diweddaru: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left ar agor · $pace/dydd i orffen mewn pryd. Cofnodwch sesiwn i ddiweddaru’r cynnydd.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left yn dal ar agor — mae popeth rydych chi’n ei gofnodi nawr yn cyfrif.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Nesaf: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1d';

  @override
  String get reminderPreviewFwdDay => '+1d';

  @override
  String get reminderPreviewFake => '(fake)';

  @override
  String get reminderPreviewDemoLabel => 'Mewngofnodi Demo';
}
