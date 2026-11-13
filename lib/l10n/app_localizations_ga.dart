// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Cealaigh';

  @override
  String get commonClose => 'Dún';

  @override
  String get commonDelete => 'Scrios';

  @override
  String get commonEdit => 'Cuir in eagar';

  @override
  String get commonError => 'Earráid';

  @override
  String get commonNone => 'Dada';

  @override
  String get commonSave => 'Sábháil';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Uaireanta riachtanacha (uathoibríoch): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Glan an spriocdháta';

  @override
  String get courseFormClearStartTooltip => 'Glan an dáta tosaigh';

  @override
  String get courseFormColorLabel => 'Dath';

  @override
  String get courseFormDateNotSet => 'Gan socrú';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Spriocdháta: $date';
  }

  @override
  String get courseFormEctsLabel => 'Creidmheasanna ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value u/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Ainm';

  @override
  String get courseFormNotesLabel => 'Nótaí (roghnach)';

  @override
  String get courseFormSaving => 'Á shábháil…';

  @override
  String courseFormStartButton(String date) {
    return 'Tús: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Múchta: gan brú go dtí $date; fágtha ar lár ó luas an lae inniu.';
  }

  @override
  String get courseFormStartEarlyOn => 'Ar siúl: roinntear an t-am go dtí seo agus áirítear i luas an lae inniu é.';

  @override
  String get courseFormStartEarlyTitle => 'Tosaigh anois in ainneoin tús sa todhchaí';

  @override
  String get courseFormTitleAdd => 'Cúrsa a chur leis';

  @override
  String get courseFormTitleEdit => 'Cúrsa a chur in eagar';

  @override
  String get coursesAddTooltip => 'Cúrsa a chur leis';

  @override
  String coursesDeleteBody(String name) {
    return 'Scrios “$name” agus gach seisiún staidéir dá chuid? Ní féidir é seo a chur ar ceal.';
  }

  @override
  String get coursesDeleteTitle => 'Scrios an cúrsa?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Tapáil “Cúrsa nua” chun do chéad chúrsa a chruthú.';

  @override
  String get coursesEmptyTitle => 'Gan chúrsaí fós';

  @override
  String get coursesFilterAll => 'Gach stádas';

  @override
  String get coursesFilterEmpty => 'Gan chúrsa a oireann don scagaire seo';

  @override
  String get coursesNewCourse => 'Cúrsa nua';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily u/lá ag teastáil';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily nóim/lá ag teastáil';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily u/lá • $weekly u/seachtain ag teastáil';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily nóim/lá • $weekly nóim/seachtain ag teastáil';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily nóim/lá • $weekly u/seachtain ag teastáil';
  }

  @override
  String coursesProgressWithStatus(String done, String required, String status) {
    return '$done / $required u • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Bain an cúrsa samplach';

  @override
  String coursesShownCount(String count) {
    return '$count ar taispeáint';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sórtáil: $label';
  }

  @override
  String get dashboardAllDone => 'Gach rud déanta';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours u logáilte (bónas)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count gcúrsa';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count gcúrsa · $upcoming ag teacht nach bhfuil i luas an lae inniu';
  }

  @override
  String get dashboardCoursesTitle => 'Cúrsaí';

  @override
  String dashboardDeadline(String date) {
    return 'Spriocdháta $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Spriocdháta $date ($days lá fágtha)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Spriocdháta $date (1 lá fágtha)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Spriocdháta $date (thar téarma)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Spriocdháta $date (inniu)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Dlúth inniu — $hours u logáilte';
  }

  @override
  String get dashboardEmptyHintAllDone => 'Tá gach cúrsa críochnaithe — féach an cluaisín Cúrsaí don liosta iomlán.';

  @override
  String get dashboardEmptyHintNoCourses => 'Cuir cúrsa leis chun do dhul chun cinn ECTS a rianú.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Ar gcúl = $achieved/lá á dhéanamh, $need/lá ag teastáil';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Ar gcúl = $achieved/lá á dhéanamh, $need/lá ag teastáil · tús luath';
  }

  @override
  String get dashboardExplainerBehindNoPace => 'Ar gcúl: níl aon luas críochta a bhainfeadh spriocdháta an lae inniu amach leis na huaireanta atá fágtha';

  @override
  String get dashboardExplainerOnTrackNoPace => 'Ar an mbóthar ceart: gan luas fós — logáil an chéad seisiún chun é a dheimhniú';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Tosóidh sé i $days lá · á áireamh ó $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Tosóidh sé i $days lá · á áireamh ó $date · tús luath ar siúl';
  }

  @override
  String get dashboardFreshStart => 'TÚS ÚR';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · $hours u fágtha';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required u';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours u/lá';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes nóim/lá';
  }

  @override
  String get dashboardLogSessionAction => 'Logáil seisiún staidéir';

  @override
  String get dashboardLogSessionTooltip => 'Logáil seisiún staidéir';

  @override
  String get dashboardNewBadge => 'NUA';

  @override
  String get dashboardNoCourses => 'Gan chúrsaí fós';

  @override
  String get dashboardNoDeadline => 'Gan spriocdháta';

  @override
  String get dashboardNoDeadlines => 'Gan spriocdhátaí sceidealaithe';

  @override
  String get dashboardNoPaceDue => 'Gan luas dlite inniu';

  @override
  String get dashboardNothingDue => 'Dada dlite';

  @override
  String get dashboardNothingToTrack => 'Dada le rianú fós';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Dlúth inniu — $hours u fágtha';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return '$daily u/lá ag teastáil chun críochnú';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return '$daily nóim/lá ag teastáil chun críochnú';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return '$daily u/lá · $weekly u/seachtain ag teastáil chun críochnú';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return '$daily nóim/lá · $weekly nóim/seachtain ag teastáil chun críochnú';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return '$daily nóim/lá · $weekly u/seachtain ag teastáil chun críochnú';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$hours u/lá ag teastáil ó $date · ní i luas an lae inniu';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return '$minutes nóim/lá ag teastáil ó $date · ní i luas an lae inniu';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Gan spriocdháta — $hours u fágtha · gan brú laethúil';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Tosóidh $date · $hours u le déanamh';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · míréalaíoch';
  }

  @override
  String get dashboardProgramBare => 'CLÁR';

  @override
  String get dashboardProgramEmptyHint => 'Cuir cúrsa leis chun tús a chur leis an rianú';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required u';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'CLÁR $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days lá rúidbhealaigh';
  }

  @override
  String get dashboardStartNotSet => 'Gan socrú';

  @override
  String dashboardStartsIn(String days) {
    return 'Tosóidh sé i $days lá';
  }

  @override
  String get dashboardStartsSoon => 'Ag tosú go luath';

  @override
  String get dashboardTipEmpty => 'Cuir do chéad chúrsa leis — beidh do luas laethúil agus do dhul chun cinn le feiceáil anseo.';

  @override
  String get dashboardTipFirst => 'Is iad na chéad 25 nóiméad is mó a chomhairítear — roghnaigh an cúrsa is túisce dlite.';

  @override
  String get dashboardTodayBare => 'INNIU';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace u';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'INNIU $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'LUAS AN LAE INNIU';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace u inniu';
  }

  @override
  String get dashboardUpcomingSubtitle => 'Túsanna amach anseo — gan brú inniu, fágtha ar lár ó luas an lae inniu.';

  @override
  String get dashboardUpcomingTitle => 'Ag teacht';

  @override
  String get devToolsActivate => 'Gníomhachtaigh';

  @override
  String get devToolsActivateMessage => 'Osclaíonn sé seo uirlisí folaithe tástála struis (sonraí ginte a phumpáil). D’fhorbairt amháin.';

  @override
  String get devToolsActivateTitle => 'Gníomhachtaigh modh forbartha?';

  @override
  String get devToolsActivated => 'Modh forbartha gníomhachtaithe.';

  @override
  String get devToolsClearPumped => 'Glan sonraí pumpáilte';

  @override
  String get devToolsClearPumpedMessage => 'Scriosann sé na cúrsaí STRESS ginte agus a seisiúin. Coimeádtar do shonraí féin.';

  @override
  String get devToolsClearPumpedSubtitle => 'Scrios cúrsaí agus seisiúin STRESS ginte.';

  @override
  String get devToolsClearPumpedTitle => 'Glan na sonraí pumpáilte?';

  @override
  String devToolsCleared(String count) {
    return 'Glanta $count gcúrsa pumpáilte.';
  }

  @override
  String get devToolsConfirmPumpMessage => 'Dara deimhniú: déanfaidh sé seo cúrsaí, liostaí, cairteacha agus ríomhanna luais a bhorradh, agus d’fhéadfadh sé cúpla soicind a thógáil. Pumpáil anois?';

  @override
  String get devToolsConfirmPumpTitle => 'Deimhnigh an phumpáil struis';

  @override
  String get devToolsContinue => 'Lean ar aghaidh';

  @override
  String get devToolsExit => 'Fág modh forbartha';

  @override
  String get devToolsExitSubtitle => 'Folaigh uirlisí forbartha ar an ngléas seo.';

  @override
  String get devToolsPumpData => 'Pumpáil sonraí';

  @override
  String get devToolsPumpMessage => 'Cuireann sé seo seimeastar ginte réalaíoch isteach (~10 gcúrsa, ~800 seisiún le 12 sheachtain anuas). Coimeádtar do shonraí atá ann cheana. Lean ar aghaidh?';

  @override
  String get devToolsPumpSubtitle => 'Cuir seimeastar ginte isteach (~10 gcúrsa, ~800 seisiún, 12 sheachtain). Coimeádtar sonraí atá ann cheana.';

  @override
  String get devToolsPumpTile => 'Pumpáil sonraí tástála';

  @override
  String get devToolsPumpTitle => 'Pumpáil sonraí tástála?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Pumpáilte $courses gcúrsa, $sessions seisiún.';
  }

  @override
  String get devToolsPumping => 'Ag pumpáil sonraí tástála…';

  @override
  String get devToolsRemoveAll => 'Bain gach sonraí';

  @override
  String get devToolsRemoveAllMessage => 'Aicearra forbartha: scriosann sé GACH cúrsa, seisiún agus socrú go buan. Ní féidir é seo a chur ar ceal.';

  @override
  String get devToolsRemoveAllSubtitle => 'Aicearra forbartha: scrios GACH cúrsa, seisiún agus socrú.';

  @override
  String get devToolsRemoveAllTitle => 'Bain gach sonraí?';

  @override
  String get navCourses => 'Cúrsaí';

  @override
  String get navDashboard => 'Painéal';

  @override
  String get navSettings => 'Socruithe';

  @override
  String get navStatistics => 'Staitisticí';

  @override
  String get navStudyLog => 'Loga Staidéir';

  @override
  String get sampleBadge => 'Samplach';

  @override
  String get sessionFormCourseLabel => 'Cúrsa';

  @override
  String sessionFormDateButton(String date) {
    return 'Dáta: $date';
  }

  @override
  String get sessionFormDurationError => 'Ní mór don fhad a bheith níos mó ná náid.';

  @override
  String get sessionFormHoursLabel => 'Uaireanta';

  @override
  String get sessionFormLogAction => 'Logáil an seisiún';

  @override
  String get sessionFormMinutesLabel => 'Nóiméid';

  @override
  String get sessionFormNoCourseError => 'Roghnaigh cúrsa.';

  @override
  String get sessionFormNoCoursesHint => 'Cuir cúrsa leis ar dtús chun seisiún a logáil.';

  @override
  String get sessionFormNotesLabel => 'Nótaí (roghnach)';

  @override
  String get sessionFormSaving => 'Á shábháil…';

  @override
  String get sessionFormTitleAdd => 'Logáil seisiún staidéir';

  @override
  String get sessionFormTitleEdit => 'Cuir seisiún staidéir in eagar';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Iomlán: $hours u';
  }

  @override
  String get settingsAccent => 'Dath an téama';

  @override
  String get settingsAccentBerry => 'Sméar';

  @override
  String get settingsAccentClay => 'Cré';

  @override
  String get settingsAccentForest => 'Foraois';

  @override
  String get settingsAccentSlate => 'Sláta';

  @override
  String get settingsAccentTeal => 'Glasghorm';

  @override
  String get settingsAccentUpdated => 'Dath an téama nuashonraithe.';

  @override
  String get settingsAllDataDeleted => 'Scriosadh gach sonraí.';

  @override
  String get settingsAppearance => 'Cuma (dorcha / éadrom)';

  @override
  String get settingsCheckingSample => 'Ag seiceáil sonraí samplacha…';

  @override
  String get settingsClear => 'Glan';

  @override
  String get settingsClearSample => 'Glan sonraí samplacha';

  @override
  String get settingsClearSampleMessage => 'Bainfidh sé seo na cúrsaí agus na seisiúin shamplacha. Ní bhaintear cúrsaí ná seisiúin a chuir tú féin leis.';

  @override
  String get settingsClearSampleSubtitle => 'Bain na cúrsaí agus na seisiúin shamplacha. Coimeádtar do shonraí féin.';

  @override
  String get settingsClearSampleTitle => 'Glan sonraí samplacha?';

  @override
  String get settingsCopy => 'Cóipeáil';

  @override
  String get settingsDailyError => 'Iontráil 0 nó líon dearfach nóiméad.';

  @override
  String get settingsDailyLabel => 'Nóiméid in aghaidh an lae (0 = gan sprioc)';

  @override
  String get settingsDailyTarget => 'Sprioc staidéir laethúil';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes nóim/lá';
  }

  @override
  String get settingsDailyUpdated => 'Sprioc laethúil nuashonraithe.';

  @override
  String get settingsData => 'Sonraí';

  @override
  String get settingsDeleteEverything => 'Scrios gach rud';

  @override
  String get settingsDevMode => 'Modh forbartha';

  @override
  String get settingsDisplay => 'Taispeáint';

  @override
  String get settingsDisplayComfortable => 'Compordach';

  @override
  String get settingsDisplayCompact => 'Dlúth';

  @override
  String get settingsDisplayLarge => 'Mór';

  @override
  String get settingsDisplaySize => 'Méid téacs agus eilimintí';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Méid taispeána nuashonraithe.';

  @override
  String get settingsExport => 'Easpórtáil sonraí';

  @override
  String get settingsExportCopied => 'Cóipeáladh an t-easpórtáil go dtí an ghearrthaisce.';

  @override
  String get settingsExportSubtitle => 'Cóipeáil gach cúrsa, seisiún agus socrú mar JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses gcúrsa · $sessions seisiún · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (teascadh — is é $kb KB an cúltaca iomlán, bain úsáid as Cóipeáil don uile rud)';
  }

  @override
  String get settingsFirstWeekday => 'An chéad lá den tseachtain';

  @override
  String get settingsFirstWeekdayUpdated => 'An chéad lá den tseachtain nuashonraithe.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (coinnigh $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Coinnigh chun gach rud a athsholáthar';

  @override
  String get settingsHoursError => 'Iontráil uimhir níos mó ná náid.';

  @override
  String get settingsHoursHelper => 'Réamhshocrú 30. Athríomhann athrú na ceanglais; coimeádtar logaí.';

  @override
  String get settingsHoursLabel => 'Uaireanta in aghaidh an chreidmheasa ECTS';

  @override
  String get settingsHoursPerEcts => 'Uaireanta in aghaidh ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value u';
  }

  @override
  String get settingsHoursUpdated => 'Uaireanta in aghaidh ECTS nuashonraithe.';

  @override
  String get settingsImport => 'Iompórtáil sonraí';

  @override
  String get settingsImportAppend => 'Breisigh';

  @override
  String get settingsImportAppendAction => 'Iompórtáil (breisigh)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Sonraí breisithe: $courses gcúrsa, $sessions seisiún curtha leis.';
  }

  @override
  String get settingsImportInfo => 'Cuireann breisiú an cúltaca le do shonraí reatha (coimeádtar socruithe). Scriosann athsholáthar GACH cúrsa, seisiún agus socrú ar dtús.';

  @override
  String get settingsImportLabel => 'Greamaigh JSON easpórtáilte';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses gcúrsa · $sessions seisiún';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· easpórtáilte $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· scéima v$schema';
  }

  @override
  String get settingsImportReplace => 'Athsholáthar';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Scriosann athsholáthar gach rud ar dtús. Brúigh agus COINNIGH an cnaipe thíos ar feadh $seconds soicind chun deimhniú.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Sonraí athsholáthartha: $courses gcúrsa, $sessions seisiún athchóirithe.';
  }

  @override
  String get settingsImportSubtitle => 'Athsholáthar gach sonraí ó chúltaca JSON a easpórtáladh roimhe seo.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Coinnigh ort… $remaining s';
  }

  @override
  String get settingsNoSample => 'Gan sonraí samplacha';

  @override
  String get settingsNoSampleSubtitle => 'Tá na sonraí samplacha glanta cheana.';

  @override
  String get settingsNoTarget => 'Gan sprioc socraithe';

  @override
  String get settingsOverloadError => 'Iontráil uimhir 5–100 u/seachtain.';

  @override
  String get settingsOverloadHelper => 'Marcáiltear seachtainí ualaigh os cionn seo dearg. Is é staidéar lánaimseartha ~35–40 u/seachtain.';

  @override
  String settingsOverloadHours(String value) {
    return '$value u';
  }

  @override
  String get settingsOverloadLabel => 'Uaireanta in aghaidh na seachtaine (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return 'marcáiltear $value/seachtain dearg';
  }

  @override
  String get settingsOverloadThreshold => 'Tairseach ró-ualaithe sheachtainiúil';

  @override
  String get settingsOverloadUpdated => 'Tairseach ró-ualaithe nuashonraithe.';

  @override
  String get settingsPaceTolerance => 'Lamháltas chun tosaigh / ar gcúl';

  @override
  String get settingsPasteValidBackup => 'Greamaigh cúltaca bailí ar dtús';

  @override
  String get settingsReset => 'Athshocraigh';

  @override
  String get settingsResetAll => 'Athshocraigh gach sonraí';

  @override
  String get settingsResetAllMessage => 'Scriosann sé seo GACH cúrsa, seisiún agus socrú go buan. Ní féidir é seo a chur ar ceal. Easpórtáil cúltaca ar dtús más gá.';

  @override
  String get settingsResetAllSubtitle => 'Scrios gach cúrsa, seisiún agus socrú.';

  @override
  String get settingsResetAllTitle => 'Athshocraigh gach sonraí?';

  @override
  String get settingsResetSettings => 'Athshocraigh socruithe';

  @override
  String get settingsResetSettingsDone => 'Socruithe athshocraithe go réamhshocruithe.';

  @override
  String get settingsResetSettingsMessage => 'Athchóiríonn sé uaireanta in aghaidh ECTS (30), sprioc laethúil (dada), an chéad lá seachtaine (Dé Luain), téama (córas), lamháltas (5 lá), ró-ualach (35 u/seachtain), méid (compordach), dath (sláta). Coimeádtar cúrsaí agus seisiúin.';

  @override
  String get settingsResetSettingsSubtitle => 'Athchóirigh réamhshocruithe: 30 u/ECTS, gan sprioc, Dé Luain, téama córais, lamháltas 5 lá, ró-ualach 35 u/seachtain, méid compordach, dath sláta.';

  @override
  String get settingsResetSettingsTitle => 'Athshocraigh socruithe?';

  @override
  String get settingsSampleData => 'Sonraí samplacha';

  @override
  String settingsSampleDataError(String error) {
    return 'Earráid: $error';
  }

  @override
  String get settingsStudySettings => 'Socruithe staidéir';

  @override
  String get settingsThemeDark => 'Dorcha';

  @override
  String get settingsThemeLight => 'Éadrom';

  @override
  String get settingsThemeSystem => 'Réamhshocrú an chórais';

  @override
  String get settingsThemeTitle => 'Téama';

  @override
  String get settingsThemeUpdated => 'Téama nuashonraithe.';

  @override
  String settingsToleranceDays(String value) {
    return '$value lá';
  }

  @override
  String get settingsToleranceError => 'Iontráil uimhir 0–30 lá.';

  @override
  String get settingsToleranceHelper => 'Teastaíonn barrachas +N lá chun tosaigh, −N lá ar gcúl. Is ionann 5 agus cobhsaí, 0 agus íogair.';

  @override
  String get settingsToleranceLabel => 'Laethanta oibre (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance oibre';
  }

  @override
  String get settingsToleranceUpdated => 'Lamháltas nuashonraithe.';

  @override
  String get settingsWeekdayFriday => 'Dé hAoine';

  @override
  String get settingsWeekdayMonday => 'Dé Luain';

  @override
  String get settingsWeekdaySaturday => 'Dé Sathairn';

  @override
  String get settingsWeekdaySunday => 'Dé Domhnaigh';

  @override
  String get settingsWeekdayThursday => 'Déardaoin';

  @override
  String get settingsWeekdayTuesday => 'Dé Máirt';

  @override
  String get settingsWeekdayWednesday => 'Dé Céadaoin';

  @override
  String get sortDeadline => 'Spriocdháta';

  @override
  String get sortName => 'Ainm';

  @override
  String get sortProgress => 'Dul chun cinn';

  @override
  String get sortStatus => 'Stádas';

  @override
  String get startupTitle => 'Níorbh fhéidir ECTS Tracker a thosú';

  @override
  String get statsActiveDays => 'Laethanta gníomhacha';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days lá gníomhach';
  }

  @override
  String get statsAddDeadlines => 'Cuir spriocdhátaí leis chun an t-ualach a thuar.';

  @override
  String get statsComingLoad => 'Ualach ag teacht';

  @override
  String get statsConsistency => 'Comhsheasmhacht';

  @override
  String get statsConsistencyHint => 'Laethanta staidéir le 30 lá anuas. Is fearr céimeanna beaga gach lá ná cramáil.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% den 30 lá dheireanach';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Cúrsa $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Rinneadh / lá (14 lá)';

  @override
  String get statsEmpty => 'Gan seisiúin fós';

  @override
  String get statsGap => 'Bearna';

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
  String get statsLast30Days => 'An 30 lá dheireanach';

  @override
  String get statsLast7Days => 'An 7 lá dheireanach';

  @override
  String get statsNeedPerDay => 'Ag teastáil / lá';

  @override
  String get statsNext8Weeks => 'An 8 seachtaine amach romhainn';

  @override
  String get statsOfLast30DaysVolume => 'de mhéid 30 lá dheireanach';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Marcáiltear seachtainí ró-ualaithe >$threshold u dearg — bog spriocdháta nó gearr an scóip.';
  }

  @override
  String get statsOverview => 'Forbhreathnú';

  @override
  String get statsPaceCovers => 'Clúdaíonn luas an ama atá thart an méid atá ag teastáil. Coinnigh an stríoc.';

  @override
  String statsPaceShort(String gap) {
    return 'Tá luas an ama atá thart $gap u/lá gearr — cuir bloc leis nó bearr an scóip.';
  }

  @override
  String get statsPastVsNeeded => 'An t-am atá thart vs. an méid ag teastáil';

  @override
  String statsPeakPerWeek(String peak) {
    return 'buaic $peak u/sht';
  }

  @override
  String get statsPerCourse => 'In aghaidh an chúrsa';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done u / $required u · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Seisiúin';

  @override
  String statsSuggestedOrder(String order) {
    return 'Ord molta: $order (an spriocdháta is túisce ar dtús)';
  }

  @override
  String get statsTotal => 'Iomlán';

  @override
  String get statsTotalVolume => 'méid iomlán';

  @override
  String get statusAhead => 'Chun tosaigh';

  @override
  String get statusBehind => 'Ar gcúl';

  @override
  String get statusCompleted => 'Críochnaithe';

  @override
  String get statusOnTrack => 'Ar an mbóthar ceart';

  @override
  String get statusOverdue => 'Thar téarma';

  @override
  String get studyLogDeleteBody => 'Scrios an seisiún staidéir seo? Ní féidir é seo a chur ar ceal.';

  @override
  String get studyLogDeleteTitle => 'Scrios an seisiún?';

  @override
  String get studyLogEmptyHint => 'Logáil seisiún chun d’am staidéir a rianú.';

  @override
  String get studyLogEmptyTitle => 'Gan seisiúin staidéir fós';

  @override
  String get studyLogFabLabel => 'Logáil seisiún';

  @override
  String get studyLogFabTooltip => 'Logáil seisiún';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours u';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Bain an seisiún samplach';

  @override
  String get studyLogThisWeek => 'An tseachtain seo';

  @override
  String get studyLogToday => 'Inniu';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Cúrsa $id';
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
  String get validationCourseEctsPositive => 'Ní mór ECTS a bheith níos mó ná náid';

  @override
  String get validationCourseEctsRequired => 'Iontráil creidmheasanna ECTS';

  @override
  String get validationCourseNameRequired => 'Tá ainm ag teastáil';

  @override
  String get validationCourseNameTooLong => 'Tá an t-ainm rófhada';

  @override
  String get validationSessionCourseRequired => 'Roghnaigh cúrsa';

  @override
  String get validationSessionDurationRequired => 'Iontráil fad';

  @override
  String get widgetNoProgress => 'Gan dul chun cinn fós';

  @override
  String get settingsLanguage => 'Teanga';

  @override
  String get settingsLiquidGlass => 'Gloine leachtach';

  @override
  String get settingsLiquidGlassSubtitle => 'Cártaí agus barraí gloine sioctha. Coinníonn Múchta an seandhealramh daingean.';

  @override
  String get settingsLiquidGlassOn => 'Ar siúl';

  @override
  String get settingsLiquidGlassOff => 'Múchta';

  @override
  String get settingsLiquidGlassUpdated => 'Gloine leachtach nuashonraithe.';

  @override
  String get devToolsReminderPreview => 'Réamhamharc meabhrúcháin';

  @override
  String get devToolsReminderPreviewSubtitle => 'Féach cad a sheolfadh anois. Fotha tástála atá sábháilte ar Windows.';

  @override
  String get reminderPreviewTitle => 'Réamhamharc meabhrúcháin';

  @override
  String get reminderPreviewNow => 'Am an réamhamhairc';

  @override
  String get reminderPreviewReset => 'Anois';

  @override
  String get reminderPreviewEmpty => 'Gach rud ciúin — ní sheolfadh faic ag an am seo.';

  @override
  String get reminderPreviewCustom => 'Sceidil shaincheaptha (taispeántas)';

  @override
  String get reminderPreviewNoFire => 'Níl aon ghníomhachtú le teacht.';

  @override
  String get reminderKindDaily => 'Laethúil';

  @override
  String get reminderKindBehind => 'Ar gcúl';

  @override
  String get reminderKindDeadline => 'Spriocdháta';

  @override
  String get reminderKindOverdue => 'Thar téarma';

  @override
  String get reminderKindStreak => 'Sraith';

  @override
  String get reminderKindCustom => 'Saincheaptha';

  @override
  String get settingsReminders => 'Meabhrúcháin staidéir';

  @override
  String get settingsRemindersOff => 'Múchta — cuir ar siúl é le haghaidh meabhrúchán laethúil.';

  @override
  String get settingsReminderTime => 'Am meabhrúcháin';

  @override
  String get settingsReminderDenied => 'Tá fógraí bactha — cumasaigh iad i socruithe an chórais.';

  @override
  String notifDurationHours(String value) {
    return '$value u';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value nóim';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Anocht: $duration chun fanacht ar an mbóthar ceart';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course: $duration fágtha inniu';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count eile)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Logáil seisiún chun an lá inniu a ghlanadh.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 Tá $course tite Ar gcúl';
  }

  @override
  String notifBehindBodyPace(String left, String days, String pace, String catchUp) {
    return '$left fágtha, $days lá le dul — $pace/lá as seo amach. Logáil $catchUp le filleadh Ar an mbóthar ceart.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left fágtha, $days lá le dul — $pace/lá as seo amach. Ní ghlanann ach an $left iomlán é seo — tosaigh anocht.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return 'Tá $left fós ar oscailt agus tá an spriocdháta anseo. Comhairítear gach a logálann tú anois.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 Tá $course dlite amárach agus tá $left fós ar oscailt';
  }

  @override
  String get notifDeadlineTomorrowBody => 'Comhairítear faoi dhó gach a logálann tú inniu.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Scrúdú $course i $days lá — $left fágtha';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Sin $pace/lá. Roinn é: sáraíonn 2 sheisiún sa lá maratón amháin.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Comhairítear gach uair a logálann tú anois.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ Tá spriocdháta $course caite le $left ar oscailt';
  }

  @override
  String get notifOverdueBody => 'Bog an spriocdháta nó críochnaigh na huaireanta — fanann an cúrsa ag teastáil aird go dtí sin.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 Sraith $days lá — $week an tseachtain seo';
  }

  @override
  String get notifStreakBody => 'Tá gach cúrsa Ar an mbóthar ceart nó Chun tosaigh. Sraith bhreá.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Seiceáil staidéir: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Am le nuashonrú: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left ar oscailt · $pace/lá chun críochnú in am. Logáil seisiún chun an dul chun cinn a nuashonrú.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return 'Tá $left fós ar oscailt — comhairítear gach a logálann tú anois.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Ar Aghaidh: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1l';

  @override
  String get reminderPreviewFwdDay => '+1l';

  @override
  String get reminderPreviewFake => '(bréige)';

  @override
  String get reminderPreviewDemoLabel => 'Seiceáil taispeána';
}
