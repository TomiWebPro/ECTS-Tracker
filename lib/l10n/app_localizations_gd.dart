// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Scottish Gaelic Gaelic (`gd`).
class AppLocalizationsGd extends AppLocalizations {
  AppLocalizationsGd([String locale = 'gd']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Sguir dheth';

  @override
  String get commonClose => 'Dùin';

  @override
  String get commonDelete => 'Sguab às';

  @override
  String get commonEdit => 'Deasaich';

  @override
  String get commonError => 'Mearachd';

  @override
  String get commonNone => 'Gun dad';

  @override
  String get commonSave => 'Sàbhail';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Uairean a dhìth (fèin-obrach): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Glan an ceann-latha';

  @override
  String get courseFormClearStartTooltip => 'Glan an ceann-tòiseachaidh';

  @override
  String get courseFormColorLabel => 'Dath';

  @override
  String get courseFormDateNotSet => 'Gun suidheachadh';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Ceann-latha: $date';
  }

  @override
  String get courseFormEctsLabel => 'Creideasan ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value u/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Ainm';

  @override
  String get courseFormNotesLabel => 'Notaichean (roghainneil)';

  @override
  String get courseFormSaving => 'A’ sàbhaladh…';

  @override
  String courseFormStartButton(String date) {
    return 'Tòiseachadh: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Dheth: gun chuideam gu $date; air a dhùnadh a-mach à astar An-diugh.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Air: tha an ùine air a roinn gu ruige seo agus a’ cunntadh gu astar An-diugh.';

  @override
  String get courseFormStartEarlyTitle =>
      'Tòisich a-nis a dh’aindeoin toiseach san àm ri teachd';

  @override
  String get courseFormTitleAdd => 'Cuir cùrsa ris';

  @override
  String get courseFormTitleEdit => 'Deasaich an cùrsa';

  @override
  String get coursesAddTooltip => 'Cuir cùrsa ris';

  @override
  String coursesDeleteBody(String name) {
    return 'Sguab às “$name” agus a h-uile seisean ionnsachaidh? Cha ghabh seo a thilleadh.';
  }

  @override
  String get coursesDeleteTitle => 'Sguab às an cùrsa?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Brùth “Cùrsa ùr” gus a’ chiad chùrsa agad a chruthachadh.';

  @override
  String get coursesEmptyTitle => 'Gun chùrsaichean fhathast';

  @override
  String get coursesFilterAll => 'A h-uile inbhe';

  @override
  String get coursesFilterEmpty =>
      'Cha fhreagair cùrsaichean ris a’ chriathar seo';

  @override
  String get coursesNewCourse => 'Cùrsa ùr';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily u/latha a dhìth';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily u/latha • $weekly u/seachdain a dhìth';
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
  String get coursesRemoveSampleTooltip => 'Thoir air falbh an cùrsa sampall';

  @override
  String coursesShownCount(String count) {
    return '$count air an sealltainn';
  }

  @override
  String coursesSortOption(String label) {
    return 'Seòrsachadh: $label';
  }

  @override
  String get dashboardAllDone => 'Uile deiseil';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours u air an logadh (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count chùrsa(ean)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count chùrsa(ean) · $upcoming ri thighinn gun a bhith ann an astar an-diugh';
  }

  @override
  String get dashboardCoursesTitle => 'Cùrsaichean';

  @override
  String dashboardDeadline(String date) {
    return 'Ceann-latha $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Ceann-latha $date ($days latha air fhàgail)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Ceann-latha $date (1 latha air fhàgail)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Ceann-latha $date (fadalach)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Ceann-latha $date (an-diugh)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Ri phàigheadh an-diugh — $hours u air an logadh';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Tha gach cùrsa deiseil — faic taba nan Cùrsaichean airson na liosta slàn.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Cuir cùrsa ris gus sùil a chumail air an adhartas ECTS agad.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Air dheireadh = a’ dèanamh $achieved/l, feumach air $need/l';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Air dheireadh = a’ dèanamh $achieved/l, feumach air $need/l · toiseach tràth';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Air dheireadh: chan eil astar chrìochnaichte a’ ruighinn ceann-latha an-diugh le uairean air fhàgail';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Air an t-slighe: gun astar fhathast — log a’ chiad sheisean gus dearbhadh';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'A’ tòiseachadh ann an $days l · air a chunntadh bho $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'A’ tòiseachadh ann an $days l · air a chunntadh bho $date · toiseach tràth air';
  }

  @override
  String get dashboardFreshStart => 'TOISEACH ÙR';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · ${hours}u air fhàgail';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required u';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours u/l';
  }

  @override
  String get dashboardLogSessionAction => 'Log seisean ionnsachaidh';

  @override
  String get dashboardLogSessionTooltip => 'Log seisean ionnsachaidh';

  @override
  String get dashboardNewBadge => 'ÙR';

  @override
  String get dashboardNoCourses => 'Gun chùrsaichean fhathast';

  @override
  String get dashboardNoDeadline => 'Gun cheann-latha';

  @override
  String get dashboardNoDeadlines => 'Gun chinn-latha clàraichte';

  @override
  String get dashboardNoPaceDue => 'Gun astar ri phàigheadh an-diugh';

  @override
  String get dashboardNothingDue => 'Chan eil dad ri phàigheadh';

  @override
  String get dashboardNothingToTrack => 'Chan eil dad ri lorg fhathast';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Ri phàigheadh an-diugh — ${hours}u air fhàgail';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Feumach air $daily u/latha gus crìochnachadh';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Feumach air $daily u/latha · $weekly u/seachdain gus crìochnachadh';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Feumach air $hours u/latha bho $date · chan eil ann an astar An-diugh';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Gun cheann-latha — ${hours}u air fhàgail · gun chuideam làitheil';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'A’ tòiseachadh $date · ${hours}u ri dhèanamh';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · mì-reusanta';
  }

  @override
  String get dashboardProgramBare => 'PRÒGRAM';

  @override
  String get dashboardProgramEmptyHint =>
      'Cuir cùrsa ris gus tòiseachadh air lorg';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required u';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PRÒGRAM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days latha de rùm';
  }

  @override
  String get dashboardStartNotSet => 'Gun suidheachadh';

  @override
  String dashboardStartsIn(String days) {
    return 'A’ tòiseachadh ann an ${days}l';
  }

  @override
  String get dashboardStartsSoon => 'A’ tòiseachadh a dh’aithghearr';

  @override
  String get dashboardTipEmpty =>
      'Cuir a’ chiad chùrsa agad ris — nochdaidh d’ astar làitheil agus adhartas an seo.';

  @override
  String get dashboardTipFirst =>
      'Is e a’ chiad 25 mion as cudromaiche — tagh an cùrsa as fhaisge air ceann-latha.';

  @override
  String get dashboardTodayBare => 'AN-DIUGH';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace u';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'AN-DIUGH $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'ASTAR AN-DIUGH';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace u an-diugh';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Toiseachaidhean san àm ri teachd — gun chuideam an-diugh, air an dùnadh a-mach à astar An-diugh.';

  @override
  String get dashboardUpcomingTitle => 'Ri thighinn';

  @override
  String get devToolsActivate => 'Cuir an gnìomh';

  @override
  String get devToolsActivateMessage =>
      'Tha seo a’ fosgladh innealan falaichte airson deuchainn-cuideam (dàta ginealaichte). Airson leasachadh a-mhàin.';

  @override
  String get devToolsActivateTitle => 'An cuir thu modh leasachaidh an gnìomh?';

  @override
  String get devToolsActivated => 'Modh leasachaidh air a chur an gnìomh.';

  @override
  String get devToolsClearPumped => 'Glan dàta pumpaichte';

  @override
  String get devToolsClearPumpedMessage =>
      'A’ sguabadh às na cùrsaichean STRESS ginealaichte agus na seiseanan aca. Tha an dàta agad fhèin air a ghleidheadh.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Sguab às cùrsaichean is seiseanan STRESS ginealaichte.';

  @override
  String get devToolsClearPumpedTitle => 'An glan thu dàta pumpaichte?';

  @override
  String devToolsCleared(String count) {
    return 'Air a ghlanadh: $count chùrsa(ean) pumpaichte.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Dàrna dearbhadh: lìonaidh seo cùrsaichean, liostaichean, clàran is àireamhachadh astair, agus faodaidh e beagan dhiog a thoirt. Pump a-nis?';

  @override
  String get devToolsConfirmPumpTitle => 'Dearbhaich am pump cuideam';

  @override
  String get devToolsContinue => 'Lean air adhart';

  @override
  String get devToolsExit => 'Fàg modh leasachaidh';

  @override
  String get devToolsExitSubtitle =>
      'Falaich innealan leasachaidh air an inneal seo.';

  @override
  String get devToolsPumpData => 'Pump dàta';

  @override
  String get devToolsPumpMessage =>
      'Tha seo a’ cur a-steach semeastar ginealaichte reusanta (~10 cùrsaichean, ~800 seisean thairis air 12 seachdainean). Tha an dàta a th’ agad air a ghleidheadh. Lean air adhart?';

  @override
  String get devToolsPumpSubtitle =>
      'Cuir a-steach semeastar ginealaichte (~10 cùrsaichean, ~800 seisean, 12 seachdainean). Dàta a th’ ann air a ghleidheadh.';

  @override
  String get devToolsPumpTile => 'Pump dàta deuchainn';

  @override
  String get devToolsPumpTitle => 'Am pump thu dàta deuchainn?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Air a phumpadh: $courses cùrsaichean, $sessions seiseanan.';
  }

  @override
  String get devToolsPumping => 'A’ pumpadh dàta deuchainn…';

  @override
  String get devToolsRemoveAll => 'Thoir air falbh a h-uile dàta';

  @override
  String get devToolsRemoveAllMessage =>
      'Ath-ghoirid leasachaidh: sguabaidh seo às gu buan A H-UILE cùrsa, seisean is suidheachadh. Cha ghabh seo a thilleadh.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Ath-ghoirid leasachaidh: sguab às A H-UILE cùrsa, seisean is suidheachadh.';

  @override
  String get devToolsRemoveAllTitle => 'An toir thu air falbh a h-uile dàta?';

  @override
  String get navCourses => 'Cùrsaichean';

  @override
  String get navDashboard => 'Deas-bhòrd';

  @override
  String get navSettings => 'Suidheachaidhean';

  @override
  String get navStatistics => 'Staitistig';

  @override
  String get navStudyLog => 'Log Ionnsachaidh';

  @override
  String get sampleBadge => 'Sampall';

  @override
  String get sessionFormCourseLabel => 'Cùrsa';

  @override
  String sessionFormDateButton(String date) {
    return 'Ceann-latha: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Feumaidh an fhaid a bhith nas motha na neoni.';

  @override
  String get sessionFormHoursLabel => 'Uairean';

  @override
  String get sessionFormLogAction => 'Log seisean';

  @override
  String get sessionFormMinutesLabel => 'Mionaidean';

  @override
  String get sessionFormNoCourseError => 'Tagh cùrsa.';

  @override
  String get sessionFormNoCoursesHint =>
      'Cuir cùrsa ris an toiseach gus seisean a logadh.';

  @override
  String get sessionFormNotesLabel => 'Notaichean (roghainneil)';

  @override
  String get sessionFormSaving => 'A’ sàbhaladh…';

  @override
  String get sessionFormTitleAdd => 'Log seisean ionnsachaidh';

  @override
  String get sessionFormTitleEdit => 'Deasaich an seisean ionnsachaidh';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Iomlan: $hours u';
  }

  @override
  String get settingsAccent => 'Dath an ùrlair';

  @override
  String get settingsAccentBerry => 'Caor';

  @override
  String get settingsAccentClay => 'Crèadh';

  @override
  String get settingsAccentForest => 'Coille';

  @override
  String get settingsAccentSlate => 'Sglèat';

  @override
  String get settingsAccentTeal => 'Gorm-uaine';

  @override
  String get settingsAccentUpdated => 'Dath an ùrlair air ùrachadh.';

  @override
  String get settingsAllDataDeleted => 'Chaidh a h-uile dàta a sguabadh às.';

  @override
  String get settingsAppearance => 'Coltas (dorcha / soilleir)';

  @override
  String get settingsCheckingSample => 'A’ sgrùdadh dàta sampall…';

  @override
  String get settingsClear => 'Glan';

  @override
  String get settingsClearSample => 'Glan dàta sampall';

  @override
  String get settingsClearSampleMessage =>
      'Tha seo a’ toirt air falbh nan cùrsaichean is seiseanan eisimpleir. Cha tèid cùrsaichean no seiseanan a chuir thu fhèin ris a thoirt air falbh.';

  @override
  String get settingsClearSampleSubtitle =>
      'Thoir air falbh na cùrsaichean is seiseanan eisimpleir. Tha an dàta agad fhèin air a ghleidheadh.';

  @override
  String get settingsClearSampleTitle => 'An glan thu dàta sampall?';

  @override
  String get settingsCopy => 'Dèan lethbhreac';

  @override
  String get settingsDailyError =>
      'Cuir a-steach 0 no àireamh dheimhinneach de mhionaidean.';

  @override
  String get settingsDailyLabel => 'Mionaidean gach latha (0 = gun targaid)';

  @override
  String get settingsDailyTarget => 'Targaid ionnsachaidh làitheil';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes mion/latha';
  }

  @override
  String get settingsDailyUpdated => 'Targaid làitheil air ùrachadh.';

  @override
  String get settingsData => 'Dàta';

  @override
  String get settingsDeleteEverything => 'Sguab às a h-uile rud';

  @override
  String get settingsDevMode => 'Modh leasachaidh';

  @override
  String get settingsDisplay => 'Taisbeanadh';

  @override
  String get settingsDisplayComfortable => 'Cofhurtail';

  @override
  String get settingsDisplayCompact => 'Dlùth';

  @override
  String get settingsDisplayLarge => 'Mòr';

  @override
  String get settingsDisplaySize => 'Meud teacsa & eileamaidean';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Meud taisbeanaidh air ùrachadh.';

  @override
  String get settingsExport => 'Às-phortaich dàta';

  @override
  String get settingsExportCopied =>
      'Chaidh an às-phortadh a chopaigeadh dhan chlàr-bhòrd.';

  @override
  String get settingsExportSubtitle =>
      'Dèan lethbhreac de gach cùrsa, seisean is suidheachadh mar JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses chùrsa(ean) · $sessions sheisean(an) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (air a ghiorrachadh — tha an cùl-taic slàn $kb KB, cleachd Dèan lethbhreac airson a h-uile rud)';
  }

  @override
  String get settingsFirstWeekday => 'A’ chiad latha den t-seachdain';

  @override
  String get settingsFirstWeekdayUpdated =>
      'A’ chiad latha den t-seachdain air ùrachadh.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (cum ${seconds}s)';
  }

  @override
  String get settingsHoldToReplace => 'Cum gus a h-uile rud a chur na àite';

  @override
  String get settingsHoursError => 'Cuir a-steach àireamh nas motha na neoni.';

  @override
  String get settingsHoursHelper =>
      'Bun-roghainn 30. Bidh atharrachadh ag ath-àireamhachadh riatanasan; tha logaichean air an gleidheadh.';

  @override
  String get settingsHoursLabel => 'Uairean gach creideas ECTS';

  @override
  String get settingsHoursPerEcts => 'Uairean gach ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value u';
  }

  @override
  String get settingsHoursUpdated => 'Uairean gach ECTS air ùrachadh.';

  @override
  String get settingsImport => 'Ion-phortaich dàta';

  @override
  String get settingsImportAppend => 'Cuir ris';

  @override
  String get settingsImportAppendAction => 'Ion-phortaich (cuir ris)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Dàta air a chur ris: $courses chùrsa(ean), $sessions sheisean(an) air an cur ris.';
  }

  @override
  String get settingsImportInfo =>
      'Tha Cuir ris a’ cur a’ chùl-taic ri taobh an dàta làithreach agad (suidheachaidhean air an gleidheadh). Tha Cuir na àite a’ sguabadh às A H-UILE cùrsa, seisean is suidheachadh an toiseach.';

  @override
  String get settingsImportLabel => 'Cuir a-steach an JSON às-phortaichte';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses chùrsa(ean) · $sessions sheisean(an)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· air às-phortadh $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· sgeama v$schema';
  }

  @override
  String get settingsImportReplace => 'Cuir na àite';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Bidh Cuir na àite a’ sguabadh às a h-uile rud an toiseach. Brùth is CUM am putan gu h-ìosal airson $seconds diog gus dearbhadh.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Dàta air a chur na àite: $courses chùrsa(ean), $sessions sheisean(an) air an toirt air ais.';
  }

  @override
  String get settingsImportSubtitle =>
      'Cuir a h-uile dàta na àite bho chùl-taic JSON a chaidh às-phortadh roimhe.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Cum ort a’ cumail… $remaining s';
  }

  @override
  String get settingsNoSample => 'Gun dàta sampall';

  @override
  String get settingsNoSampleSubtitle =>
      'Tha an dàta eisimpleir air a ghlanadh mu thràth.';

  @override
  String get settingsNoTarget => 'Gun targaid suidhichte';

  @override
  String get settingsOverloadError =>
      'Cuir a-steach àireamh 5–100 u/seachdain.';

  @override
  String get settingsOverloadHelper =>
      'Tha seachdainean luchd ri thighinn os cionn seo air an comharrachadh dearg. Tha làn-ùine ionnsachaidh ~35–40 u/seachdain.';

  @override
  String settingsOverloadHours(String value) {
    return '$value u';
  }

  @override
  String get settingsOverloadLabel => 'Uairean gach seachdain (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return 'Tha $value/seachdain air a chomharrachadh dearg';
  }

  @override
  String get settingsOverloadThreshold => 'Stairsneach ro-luchd seachdaineil';

  @override
  String get settingsOverloadUpdated => 'Stairsneach ro-luchd air ùrachadh.';

  @override
  String get settingsPaceTolerance => 'Fulangas air thoiseach / air dheireadh';

  @override
  String get settingsPasteValidBackup =>
      'Cuir a-steach cùl-taic dligheach an toiseach';

  @override
  String get settingsReset => 'Ath-shuidhich';

  @override
  String get settingsResetAll => 'Ath-shuidhich a h-uile dàta';

  @override
  String get settingsResetAllMessage =>
      'Sguabaidh seo às gu buan A H-UILE cùrsa, seisean is suidheachadh. Cha ghabh seo a thilleadh. Às-phortaich cùl-taic an toiseach ma dh’fheumas tu.';

  @override
  String get settingsResetAllSubtitle =>
      'Sguab às a h-uile cùrsa, seisean is suidheachadh.';

  @override
  String get settingsResetAllTitle => 'An ath-shuidhich thu a h-uile dàta?';

  @override
  String get settingsResetSettings => 'Ath-shuidhich na suidheachaidhean';

  @override
  String get settingsResetSettingsDone =>
      'Chaidh na suidheachaidhean ath-shuidheachadh gu na bun-roghainnean.';

  @override
  String get settingsResetSettingsMessage =>
      'Ag ath-nuadhachadh uairean-gach-ECTS (30), targaid làitheil (gun dad), ciad latha-seachdain (Diluain), ùrlar (siostam), fulangas (5 latha), ro-luchd (35 u/seachdain), meud (cofhurtail), dath (sglèat). Tha cùrsaichean is seiseanan air an gleidheadh.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Thoir air ais na bun-roghainnean: 30 u/ECTS, gun targaid, Diluain, ùrlar siostaim, fulangas 5-latha, ro-luchd 35 u/seachdain, meud cofhurtail, dath sglèat.';

  @override
  String get settingsResetSettingsTitle =>
      'An ath-shuidhich thu na suidheachaidhean?';

  @override
  String get settingsSampleData => 'Dàta sampall';

  @override
  String settingsSampleDataError(String error) {
    return 'Mearachd: $error';
  }

  @override
  String get settingsStudySettings => 'Suidheachaidhean ionnsachaidh';

  @override
  String get settingsThemeDark => 'Dorcha';

  @override
  String get settingsThemeLight => 'Soilleir';

  @override
  String get settingsThemeSystem => 'Bun-roghainn an t-siostaim';

  @override
  String get settingsThemeTitle => 'Ùrlar';

  @override
  String get settingsThemeUpdated => 'Ùrlar air ùrachadh.';

  @override
  String settingsToleranceDays(String value) {
    return '$value latha';
  }

  @override
  String get settingsToleranceError => 'Cuir a-steach àireamh 0–30 latha.';

  @override
  String get settingsToleranceHelper =>
      'Feumaidh air thoiseach còrr +N latha, air dheireadh −N latha. 5 = seasmhach, 0 = mothachail.';

  @override
  String get settingsToleranceLabel => 'Làithean obrach (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance de dh’obair';
  }

  @override
  String get settingsToleranceUpdated => 'Fulangas air ùrachadh.';

  @override
  String get settingsWeekdayFriday => 'Dihaoine';

  @override
  String get settingsWeekdayMonday => 'Diluain';

  @override
  String get settingsWeekdaySaturday => 'Disathairne';

  @override
  String get settingsWeekdaySunday => 'Didòmhnaich';

  @override
  String get settingsWeekdayThursday => 'Diardaoin';

  @override
  String get settingsWeekdayTuesday => 'Dimàirt';

  @override
  String get settingsWeekdayWednesday => 'Diciadain';

  @override
  String get sortDeadline => 'Ceann-latha';

  @override
  String get sortName => 'Ainm';

  @override
  String get sortProgress => 'Adhartas';

  @override
  String get sortStatus => 'Inbhe';

  @override
  String get startupTitle => 'Cha b’ urrainn dha ECTS Tracker tòiseachadh';

  @override
  String get statsActiveDays => 'Làithean gnìomhach';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}l gnìomhach';
  }

  @override
  String get statsAddDeadlines =>
      'Cuir cinn-latha ris gus an luchd a ro-innse.';

  @override
  String get statsComingLoad => 'Luchd ri thighinn';

  @override
  String get statsConsistency => 'Cunbhalachd';

  @override
  String get statsConsistencyHint =>
      'Làithean ionnsachaidh anns na 30 latha mu dheireadh. Bidh ceumannan beaga gach latha a’ buannachadh air cramadh.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% de na 30 latha mu dheireadh';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Cùrsa $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Rinn / latha (14l)';

  @override
  String get statsEmpty => 'Gun sheiseanan fhathast';

  @override
  String get statsGap => 'Beàrn';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value u';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}u';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours u';
  }

  @override
  String get statsLast30Days => 'Na 30 latha mu dheireadh';

  @override
  String get statsLast7Days => 'Na 7 latha mu dheireadh';

  @override
  String get statsNeedPerDay => 'Feum / latha';

  @override
  String get statsNext8Weeks => 'Na h-ath 8 seachdainean';

  @override
  String get statsOfLast30DaysVolume => 'de mheud nan 30 latha mu dheireadh';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Tha seachdainean ro-luchd >${threshold}u air an comharrachadh dearg — gluais ceann-latha no gearr farsaingeachd.';
  }

  @override
  String get statsOverview => 'Sealladh farsaing';

  @override
  String get statsPaceCovers =>
      'Tha astar a dh’fhalbh a’ còmhdach na tha a dhìth. Cum an t-sreath.';

  @override
  String statsPaceShort(String gap) {
    return 'Tha astar a dh’fhalbh $gap u/latha gann — cuir bloc ris no trim an fharsaingeachd.';
  }

  @override
  String get statsPastVsNeeded => 'A dh’fhalbh vs a dhìth';

  @override
  String statsPeakPerWeek(String peak) {
    return 'prìomh ${peak}u/sth';
  }

  @override
  String get statsPerCourse => 'Gach cùrsa';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done u / $required u · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Seiseanan';

  @override
  String statsSuggestedOrder(String order) {
    return 'Òrdugh molaichte: $order (an ceann-latha as tràithe an toiseach)';
  }

  @override
  String get statsTotal => 'Iomlan';

  @override
  String get statsTotalVolume => 'meud iomlan';

  @override
  String get statusAhead => 'Air thoiseach';

  @override
  String get statusBehind => 'Air dheireadh';

  @override
  String get statusCompleted => 'Deiseil';

  @override
  String get statusOnTrack => 'Air an t-slighe';

  @override
  String get statusOverdue => 'Fadalach';

  @override
  String get studyLogDeleteBody =>
      'An sguab thu às an seisean ionnsachaidh seo? Cha ghabh seo a thilleadh.';

  @override
  String get studyLogDeleteTitle => 'An sguab thu às an seisean?';

  @override
  String get studyLogEmptyHint =>
      'Log seisean gus sùil a chumail air an ùine ionnsachaidh agad.';

  @override
  String get studyLogEmptyTitle => 'Gun seiseanan ionnsachaidh fhathast';

  @override
  String get studyLogFabLabel => 'Log seisean';

  @override
  String get studyLogFabTooltip => 'Log seisean';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours u';
  }

  @override
  String get studyLogRemoveSampleTooltip =>
      'Thoir air falbh an seisean sampall';

  @override
  String get studyLogThisWeek => 'An t-seachdain seo';

  @override
  String get studyLogToday => 'An-diugh';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Cùrsa $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'Feumaidh ECTS a bhith nas motha na neoni';

  @override
  String get validationCourseEctsRequired => 'Cuir a-steach creideasan ECTS';

  @override
  String get validationCourseNameRequired => 'Tha ainm a dhìth';

  @override
  String get validationCourseNameTooLong => 'Tha an t-ainm ro fhada';

  @override
  String get validationSessionCourseRequired => 'Tagh cùrsa';

  @override
  String get validationSessionDurationRequired => 'Cuir a-steach faid';

  @override
  String get widgetNoProgress => 'Gun adhartas fhathast';

  @override
  String get settingsLanguage => 'Cànan';

  @override
  String get settingsLiquidGlass => 'Glainne leaghte';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Cairtean is bàraichean glainne reòdte. Glèidhidh Dheth an sealladh cruaidh clasaigeach.';

  @override
  String get settingsLiquidGlassOn => 'Air';

  @override
  String get settingsLiquidGlassOff => 'Dheth';

  @override
  String get settingsLiquidGlassUpdated => 'Glainne leaghte air ùrachadh.';

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
}
