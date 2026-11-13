// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Utzi';

  @override
  String get commonClose => 'Itxi';

  @override
  String get commonDelete => 'Ezabatu';

  @override
  String get commonEdit => 'Editatu';

  @override
  String get commonError => 'Errorea';

  @override
  String get commonNone => 'Bat ere ez';

  @override
  String get commonSave => 'Gorde';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Beharrezko orduak (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Garbitu epemuga';

  @override
  String get courseFormClearStartTooltip => 'Garbitu hasiera-data';

  @override
  String get courseFormColorLabel => 'Kolorea';

  @override
  String get courseFormDateNotSet => 'Zehaztu gabe';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Epemuga: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS kredituak';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Izena';

  @override
  String get courseFormNotesLabel => 'Oharrak (aukerakoa)';

  @override
  String get courseFormSaving => 'Gordetzen…';

  @override
  String courseFormStartButton(String date) {
    return 'Hasiera: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Desaktibatuta: presiorik ez $date arte; kanpo gaurko erritmotik.';
  }

  @override
  String get courseFormStartEarlyOn => 'Aktibatuta: denbora orain arte banatzen da eta gaurko erritmorako balio du.';

  @override
  String get courseFormStartEarlyTitle => 'Hasi orain, etorkizuneko hasiera izan arren';

  @override
  String get courseFormTitleAdd => 'Gehitu ikasgaia';

  @override
  String get courseFormTitleEdit => 'Editatu ikasgaia';

  @override
  String get coursesAddTooltip => 'Gehitu ikasgaia';

  @override
  String coursesDeleteBody(String name) {
    return 'Ezabatu «$name» eta haren ikasketa-saio guztiak? Ekintza hau ezin da desegin.';
  }

  @override
  String get coursesDeleteTitle => 'Ezabatu ikasgaia?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Sakatu «Ikasgai berria» lehen ikasgaia sortzeko.';

  @override
  String get coursesEmptyTitle => 'Ez dago ikasgairik oraindik';

  @override
  String get coursesFilterAll => 'Egoera guztiak';

  @override
  String get coursesFilterEmpty => 'Ikasgai batek ere ez du iragazki hau betetzen';

  @override
  String get coursesNewCourse => 'Ikasgai berria';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily h/egun behar dira';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/egun behar dira';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily h/egun • $weekly h/aste behar dira';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/egun • $weekly min/aste behar dira';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/egun • $weekly h/aste behar dira';
  }

  @override
  String coursesProgressWithStatus(String done, String required, String status) {
    return '$done / $required h • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Kendu lagin-ikasgaia';

  @override
  String coursesShownCount(String count) {
    return '$count erakusten';
  }

  @override
  String coursesSortOption(String label) {
    return 'Ordenatu: $label';
  }

  @override
  String get dashboardAllDone => 'Guztia eginda';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h erregistratu (extra)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count ikasgai';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count ikasgai · $upcoming datozenak ez gaurko erritmoan';
  }

  @override
  String get dashboardCoursesTitle => 'Ikasgaiak';

  @override
  String dashboardDeadline(String date) {
    return 'Epemuga $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Epemuga $date ($days egun falta)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Epemuga $date (egun 1 falta)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Epemuga $date (igarota)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Epemuga $date (gaur)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Gaur mugaeguna — $hours h erregistratu';
  }

  @override
  String get dashboardEmptyHintAllDone => 'Ikasgai guztiak osatuta daude — ikusi zerrenda osoa Ikasgaiak fitxan.';

  @override
  String get dashboardEmptyHintNoCourses => 'Gehitu ikasgai bat ECTS aurrerapena jarraitzeko.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Atzeratuta = $achieved/egun egiten, $need/egun behar';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Atzeratuta = $achieved/egun egiten, $need/egun behar · hasiera aurreratua';
  }

  @override
  String get dashboardExplainerBehindNoPace => 'Atzeratuta: erritmo finitu batek ere ez du gaurko epemuga betetzen orduak falta badira';

  @override
  String get dashboardExplainerOnTrackNoPace => 'Ondo zoaz: erritmorik gabe oraindik — erregistratu lehen saioa berresteko';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days egun barru hasten da · $date-tik zenbatuta';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days egun barru hasten da · $date-tik zenbatuta · hasiera aurreratua aktibatuta';
  }

  @override
  String get dashboardFreshStart => 'HASIERA BERRIA';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · ${hours}h falta';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/egun';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/egun';
  }

  @override
  String get dashboardLogSessionAction => 'Erregistratu ikasketa-saioa';

  @override
  String get dashboardLogSessionTooltip => 'Erregistratu ikasketa-saioa';

  @override
  String get dashboardNewBadge => 'BERRIA';

  @override
  String get dashboardNoCourses => 'Ez dago ikasgairik oraindik';

  @override
  String get dashboardNoDeadline => 'Epemugarik gabe';

  @override
  String get dashboardNoDeadlines => 'Ez dago epemugarik programatuta';

  @override
  String get dashboardNoPaceDue => 'Gaur ez dago erritmorik';

  @override
  String get dashboardNothingDue => 'Ezer ez zor';

  @override
  String get dashboardNothingToTrack => 'Ezer ez jarraitzeko oraindik';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Gaur mugaeguna — ${hours}h falta';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return '$daily h/egun behar dira amaitzeko';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return '$daily min/egun behar dira amaitzeko';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return '$daily h/egun · $weekly h/aste behar dira amaitzeko';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return '$daily min/egun · $weekly min/aste behar dira amaitzeko';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/egun · $weekly h/aste behar dira amaitzeko';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$hours h/egun behar dira $date-tik · ez gaurko erritmoan';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return '$minutes min/egun behar dira $date-tik · ez gaurko erritmoan';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Epemugarik gabe — ${hours}h falta · eguneko presiorik gabe';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date-an hasten da · ${hours}h egiteke';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · ez-errealista';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMA';

  @override
  String get dashboardProgramEmptyHint => 'Gehitu ikasgai bat jarraipena hasteko';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMA $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days eguneko tartea';
  }

  @override
  String get dashboardStartNotSet => 'Zehaztu gabe';

  @override
  String dashboardStartsIn(String days) {
    return '$days egun barru hasten da';
  }

  @override
  String get dashboardStartsSoon => 'Laster hasten da';

  @override
  String get dashboardTipEmpty => 'Gehitu lehen ikasgaia — eguneko erritmoa eta aurrerapena hemen agertuko dira.';

  @override
  String get dashboardTipFirst => 'Lehen 25 minutek balio dute gehien — aukeratu mugaegun hurbilena duen ikasgaia.';

  @override
  String get dashboardTodayBare => 'GAUR';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'GAUR $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'GAURKO ERRITMOA';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h gaur';
  }

  @override
  String get dashboardUpcomingSubtitle => 'Etorkizuneko hasierak — presiorik ez gaur, kanpo gaurko erritmotik.';

  @override
  String get dashboardUpcomingTitle => 'Datozenak';

  @override
  String get devToolsActivate => 'Aktibatu';

  @override
  String get devToolsActivateMessage => 'Honek ezkutuko estres-proba tresnak desblokeatzen ditu (datuak sortzen ditu). Garapenerako bakarrik.';

  @override
  String get devToolsActivateTitle => 'Aktibatu garapen-modua?';

  @override
  String get devToolsActivated => 'Garapen-modua aktibatuta.';

  @override
  String get devToolsClearPumped => 'Garbitu sortutako datuak';

  @override
  String get devToolsClearPumpedMessage => 'Sortutako STRESS ikasgaiak eta haien saioak ezabatzen ditu. Zure datuak gordetzen dira.';

  @override
  String get devToolsClearPumpedSubtitle => 'Ezabatu sortutako STRESS ikasgaiak eta saioak.';

  @override
  String get devToolsClearPumpedTitle => 'Garbitu sortutako datuak?';

  @override
  String devToolsCleared(String count) {
    return 'Sortutako $count ikasgai garbitu dira.';
  }

  @override
  String get devToolsConfirmPumpMessage => 'Bigarren berrespena: honek ikasgaiak, zerrendak, grafikoak eta erritmo-kalkuluak puztuko ditu, eta segundo batzuk iraun dezake. Sortu orain?';

  @override
  String get devToolsConfirmPumpTitle => 'Berretsi estres-sorkuntza';

  @override
  String get devToolsContinue => 'Jarraitu';

  @override
  String get devToolsExit => 'Irten garapen-modutik';

  @override
  String get devToolsExitSubtitle => 'Ezkutatu garapen-tresnak gailu honetan.';

  @override
  String get devToolsPumpData => 'Sortu datuak';

  @override
  String get devToolsPumpMessage => 'Honek ikasturte errealista bat sortzen du (~10 ikasgai, ~800 saio azken 12 asteetan). Zure datuak gordetzen dira. Jarraitu?';

  @override
  String get devToolsPumpSubtitle => 'Sartu sortutako ikasturte bat (~10 ikasgai, ~800 saio, 12 aste). Datuak gordetzen dira.';

  @override
  String get devToolsPumpTile => 'Sortu proba-datuak';

  @override
  String get devToolsPumpTitle => 'Sortu proba-datuak?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses ikasgai, $sessions saio sortu dira.';
  }

  @override
  String get devToolsPumping => 'Proba-datuak sortzen…';

  @override
  String get devToolsRemoveAll => 'Ezabatu datu guztiak';

  @override
  String get devToolsRemoveAllMessage => 'Garapen-lasterbidea: ikasgai, saio eta ezarpen GUZTIAK betiko ezabatzen ditu. Ezin da desegin.';

  @override
  String get devToolsRemoveAllSubtitle => 'Garapen-lasterbidea: ezabatu ikasgai, saio eta ezarpen GUZTIAK.';

  @override
  String get devToolsRemoveAllTitle => 'Ezabatu datu guztiak?';

  @override
  String get navCourses => 'Ikasgaiak';

  @override
  String get navDashboard => 'Panela';

  @override
  String get navSettings => 'Ezarpenak';

  @override
  String get navStatistics => 'Estatistikak';

  @override
  String get navStudyLog => 'Ikasketa-erregistroa';

  @override
  String get sampleBadge => 'Lagina';

  @override
  String get sessionFormCourseLabel => 'Ikasgaia';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError => 'Iraupena zero baino handiagoa izan behar da.';

  @override
  String get sessionFormHoursLabel => 'Orduak';

  @override
  String get sessionFormLogAction => 'Erregistratu saioa';

  @override
  String get sessionFormMinutesLabel => 'Minutuak';

  @override
  String get sessionFormModeManual => 'Manual';

  @override
  String get sessionFormModeTimer => 'Timer';

  @override
  String get sessionFormNoCourseError => 'Aukeratu ikasgai bat.';

  @override
  String get sessionFormNoCoursesHint => 'Gehitu ikasgai bat lehenik saio bat erregistratzeko.';

  @override
  String get sessionFormNotesLabel => 'Oharrak (aukerakoa)';

  @override
  String get sessionFormSaving => 'Gordetzen…';

  @override
  String get sessionFormTitleAdd => 'Erregistratu ikasketa-saioa';

  @override
  String get sessionFormTitleEdit => 'Editatu ikasketa-saioa';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Guztira: $hours h';
  }

  @override
  String get settingsAccent => 'Gai-kolorea';

  @override
  String get settingsAccentBerry => 'Baia';

  @override
  String get settingsAccentClay => 'Buztina';

  @override
  String get settingsAccentForest => 'Basoa';

  @override
  String get settingsAccentSlate => 'Arbela';

  @override
  String get settingsAccentTeal => 'Berde-urdina';

  @override
  String get settingsAccentUpdated => 'Gai-kolorea eguneratu da.';

  @override
  String get settingsAllDataDeleted => 'Datu guztiak ezabatu dira.';

  @override
  String get settingsAppearance => 'Itxura (iluna / argia)';

  @override
  String get settingsCheckingSample => 'Lagin-datuak egiaztatzen…';

  @override
  String get settingsClear => 'Garbitu';

  @override
  String get settingsClearSample => 'Garbitu lagin-datuak';

  @override
  String get settingsClearSampleMessage => 'Honek adibide-ikasgaiak eta saioak kentzen ditu. Zuk gehitutako ikasgaiak edo saioak ez dira kentzen.';

  @override
  String get settingsClearSampleSubtitle => 'Kendu adibide-ikasgaiak eta saioak. Zure datuak gordetzen dira.';

  @override
  String get settingsClearSampleTitle => 'Garbitu lagin-datuak?';

  @override
  String get settingsCopy => 'Kopiatu';

  @override
  String get settingsDailyError => 'Sartu 0 edo minutu-kopuru positibo bat.';

  @override
  String get settingsDailyLabel => 'Minutuak egunean (0 = helbururik gabe)';

  @override
  String get settingsDailyTarget => 'Eguneko ikasketa-helburua';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/egun';
  }

  @override
  String get settingsDailyUpdated => 'Eguneko helburua eguneratu da.';

  @override
  String get settingsData => 'Datuak';

  @override
  String get settingsDeleteEverything => 'Ezabatu guztia';

  @override
  String get settingsDevMode => 'Garapen-modua';

  @override
  String get settingsDisplay => 'Pantaila';

  @override
  String get settingsDisplayComfortable => 'Erosoa';

  @override
  String get settingsDisplayCompact => 'Trinkoa';

  @override
  String get settingsDisplayLarge => 'Handia';

  @override
  String get settingsDisplaySize => 'Testu eta elementuen tamaina';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Pantaila-tamaina eguneratu da.';

  @override
  String get settingsExport => 'Esportatu datuak';

  @override
  String get settingsExportCopied => 'Esportazioa arbelean kopiatu da.';

  @override
  String get settingsExportSubtitle => 'Kopiatu ikasgai, saio eta ezarpen guztiak JSON gisa.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses ikasgai · $sessions saio · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (moztuta — babeskopia osoa $kb KB da, erabili Kopiatu guztirako)';
  }

  @override
  String get settingsFirstWeekday => 'Asteko lehen eguna';

  @override
  String get settingsFirstWeekdayUpdated => 'Asteko lehen eguna eguneratu da.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (${seconds}s eutsi)';
  }

  @override
  String get settingsHoldToReplace => 'Eutsi guztia ordezteko';

  @override
  String get settingsHoursError => 'Sartu zero baino handiagoa den zenbaki bat.';

  @override
  String get settingsHoursHelper => 'Lehenetsia 30. Aldatzeak eskakizunak birkalkulatzen ditu; erregistroak gordetzen dira.';

  @override
  String get settingsHoursLabel => 'Orduak ECTS kreditu bakoitzeko';

  @override
  String get settingsHoursPerEcts => 'Orduak ECTS bakoitzeko';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'ECTS bakoitzeko orduak eguneratu dira.';

  @override
  String get settingsImport => 'Inportatu datuak';

  @override
  String get settingsImportAppend => 'Gehitu';

  @override
  String get settingsImportAppendAction => 'Inportatu (gehituta)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Datuak gehitu dira: $courses ikasgai, $sessions saio gehitu dira.';
  }

  @override
  String get settingsImportInfo => 'Gehitzeak babeskopia uneko datuekin batera gehitzen du (ezarpenak gordetzen dira). Ordezteak ikasgai, saio eta ezarpen GUZTIAK ezabatzen ditu LEHENIK.';

  @override
  String get settingsImportLabel => 'Itsatsi esportatutako JSONa';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses ikasgai · $sessions saio';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· esportatuta $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· eskema v$schema';
  }

  @override
  String get settingsImportReplace => 'Ordeztu';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Ordezteak dena ezabatzen du lehenik. EUTSI beheko botoiari $seconds segundoz berresteko.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Datuak ordeztu dira: $courses ikasgai, $sessions saio berreskuratu dira.';
  }

  @override
  String get settingsImportSubtitle => 'Ordeztu datu guztiak aurrez esportatutako JSON babeskopia batetik.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Eutsi… $remaining s';
  }

  @override
  String get settingsNoSample => 'Ez dago lagin-daturik';

  @override
  String get settingsNoSampleSubtitle => 'Adibide-datuak dagoeneko garbitu dira.';

  @override
  String get settingsNoTarget => 'Ez dago helbururik';

  @override
  String get settingsOverloadError => 'Sartu 5–100 h/aste arteko zenbaki bat.';

  @override
  String get settingsOverloadHelper => 'Gainetik dauden datozen karga-asteak gorriz markatzen dira. Denbora osoko ikasketa ~35–40 h/aste da.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Orduak astean (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/aste gorriz markatzen da';
  }

  @override
  String get settingsOverloadThreshold => 'Asteko gainkarga-atalasea';

  @override
  String get settingsOverloadUpdated => 'Gainkarga-atalasea eguneratu da.';

  @override
  String get settingsPaceTolerance => 'Aurrerapen/atzerapen tolerantzia';

  @override
  String get settingsPasteValidBackup => 'Itsatsi baliozko babeskopia bat lehenik';

  @override
  String get settingsReset => 'Berrezarri';

  @override
  String get settingsResetAll => 'Berrezarri datu guztiak';

  @override
  String get settingsResetAllMessage => 'Honek ikasgai, saio eta ezarpen GUZTIAK betiko ezabatzen ditu. Ezin da desegin. Esportatu babeskopia bat lehenik behar izanez gero.';

  @override
  String get settingsResetAllSubtitle => 'Ezabatu ikasgai, saio eta ezarpen guztiak.';

  @override
  String get settingsResetAllTitle => 'Berrezarri datu guztiak?';

  @override
  String get settingsResetSettings => 'Berrezarri ezarpenak';

  @override
  String get settingsResetSettingsDone => 'Ezarpenak lehenetsietara berrezarri dira.';

  @override
  String get settingsResetSettingsMessage => 'Berrezartzen du orduak/ECTS (30), eguneko helburua (bat ere ez), asteko lehen eguna (astelehena), gaia (sistema), tolerantzia (5 egun), gainkarga (35 h/aste), tamaina (erosoa), kolorea (arbela). Ikasgaiak eta saioak gordetzen dira.';

  @override
  String get settingsResetSettingsSubtitle => 'Berrezarri balioak: 30 h/ECTS, helbururik gabe, astelehena, sistemaren gaia, 5 eguneko tolerantzia, 35 h/asteko gainkarga, tamaina erosoa, kolore arbela.';

  @override
  String get settingsResetSettingsTitle => 'Berrezarri ezarpenak?';

  @override
  String get settingsSampleData => 'Lagin-datuak';

  @override
  String settingsSampleDataError(String error) {
    return 'Errorea: $error';
  }

  @override
  String get settingsStudySettings => 'Ikasketa-ezarpenak';

  @override
  String get settingsThemeDark => 'Iluna';

  @override
  String get settingsThemeLight => 'Argia';

  @override
  String get settingsThemeSystem => 'Sistemaren lehenetsia';

  @override
  String get settingsThemeTitle => 'Gaia';

  @override
  String get settingsThemeUpdated => 'Gaia eguneratu da.';

  @override
  String settingsToleranceDays(String value) {
    return '$value egun';
  }

  @override
  String get settingsToleranceError => 'Sartu 0–30 egun arteko zenbaki bat.';

  @override
  String get settingsToleranceHelper => 'Aurrerapenak +N eguneko soberakina behar du, atzerapenak −N egun. 5 = egonkorra, 0 = sentikorra.';

  @override
  String get settingsToleranceLabel => 'Lan-egunak (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance lan';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerantzia eguneratu da.';

  @override
  String get settingsWeekdayFriday => 'Ostirala';

  @override
  String get settingsWeekdayMonday => 'Astelehena';

  @override
  String get settingsWeekdaySaturday => 'Larunbata';

  @override
  String get settingsWeekdaySunday => 'Igandea';

  @override
  String get settingsWeekdayThursday => 'Osteguna';

  @override
  String get settingsWeekdayTuesday => 'Asteartea';

  @override
  String get settingsWeekdayWednesday => 'Asteazkena';

  @override
  String get sortDeadline => 'Epemuga';

  @override
  String get sortName => 'Izena';

  @override
  String get sortProgress => 'Aurrerapena';

  @override
  String get sortStatus => 'Egoera';

  @override
  String get startupTitle => 'Ezin izan da ECTS Tracker abiarazi';

  @override
  String get statsActiveDays => 'Egun aktiboak';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}e aktibo';
  }

  @override
  String get statsAddDeadlines => 'Gehitu epemugak karga aurreikusteko.';

  @override
  String get statsComingLoad => 'Datozen karga';

  @override
  String get statsConsistency => 'Koherentzia';

  @override
  String get statsConsistencyHint => 'Azken 30 egunetako ikasketa-egunak. Urrats txikiak egunero, pilatzea baino hobe.';

  @override
  String statsConsistencyScore(String percent) {
    return 'Azken 30 egunen $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return '$id ikasgaia';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Eginda / egun (14e)';

  @override
  String get statsEmpty => 'Ez dago saiorik oraindik';

  @override
  String get statsGap => 'Aldea';

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
  String get statsLast30Days => 'Azken 30 egunak';

  @override
  String get statsLast7Days => 'Azken 7 egunak';

  @override
  String get statsNeedPerDay => 'Behar / egun';

  @override
  String get statsNext8Weeks => 'Datozen 8 asteak';

  @override
  String get statsOfLast30DaysVolume => 'azken 30 egunetako bolumenaren';

  @override
  String statsOverloadWarning(String threshold) {
    return '>${threshold}h-ko gainkarga-asteak gorriz markatzen dira — mugitu epemuga bat edo murriztu esparrua.';
  }

  @override
  String get statsOverview => 'Laburpena';

  @override
  String get statsPaceCovers => 'Iraganeko erritmoak behar dena estaltzen du. Eutsi boladari.';

  @override
  String statsPaceShort(String gap) {
    return 'Iraganeko erritmoa $gap h/egun motz geratzen da — gehitu bloke bat edo murriztu esparrua.';
  }

  @override
  String get statsPastVsNeeded => 'Iragana eta beharra';

  @override
  String statsPeakPerWeek(String peak) {
    return 'gailurra ${peak}h/aste';
  }

  @override
  String get statsPerCourse => 'Ikasgai bakoitzeko';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Saioak';

  @override
  String statsSuggestedOrder(String order) {
    return 'Gomendatutako ordena: $order (epemuga hurbilena lehenik)';
  }

  @override
  String get statsTotal => 'Guztira';

  @override
  String get statsTotalVolume => 'bolumen osoa';

  @override
  String get statusAhead => 'Aurreratuta';

  @override
  String get statusBehind => 'Atzeratuta';

  @override
  String get statusCompleted => 'Osatuta';

  @override
  String get statusOnTrack => 'Ondo bidean';

  @override
  String get statusOverdue => 'Igarota';

  @override
  String get studyLogDeleteBody => 'Ezabatu ikasketa-saio hau? Ezin da desegin.';

  @override
  String get studyLogDeleteTitle => 'Ezabatu saioa?';

  @override
  String get studyLogEmptyHint => 'Erregistratu saio bat ikasketa-denbora jarraitzeko.';

  @override
  String get studyLogEmptyTitle => 'Ez dago ikasketa-saiorik oraindik';

  @override
  String get studyLogFabLabel => 'Erregistratu saioa';

  @override
  String get studyLogFabTooltip => 'Erregistratu saioa';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Kendu lagin-saioa';

  @override
  String get studyLogThisWeek => 'Aste honetan';

  @override
  String get studyLogToday => 'Gaur';

  @override
  String studyLogUnknownCourse(String id) {
    return '$id ikasgaia';
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
  String studyTimerNotifPaused(String elapsed) {
    return 'Paused · $elapsed';
  }

  @override
  String get studyTimerNotifRunning => 'Tap to open the timer';

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
  String get validationCourseEctsPositive => 'ECTSak zero baino handiagoak izan behar dira';

  @override
  String get validationCourseEctsRequired => 'Sartu ECTS kredituak';

  @override
  String get validationCourseNameRequired => 'Izena beharrezkoa da';

  @override
  String get validationCourseNameTooLong => 'Izena luzeegia da';

  @override
  String get validationSessionCourseRequired => 'Aukeratu ikasgai bat';

  @override
  String get validationSessionDurationRequired => 'Sartu iraupen bat';

  @override
  String get widgetNoProgress => 'Aurrerapenik ez oraindik';

  @override
  String get settingsLanguage => 'Hizkuntza';

  @override
  String get settingsLiquidGlass => 'Beira likidoa';

  @override
  String get settingsLiquidGlassSubtitle => 'Beira izoztuzko txartelak eta barrak. Desaktibatuta itxura klasiko trinkoa mantentzen da.';

  @override
  String get settingsLiquidGlassOn => 'Aktibatuta';

  @override
  String get settingsLiquidGlassOff => 'Desaktibatuta';

  @override
  String get settingsLiquidGlassUpdated => 'Beira likidoa eguneratu da.';

  @override
  String get devToolsReminderPreview => 'Gogorarazpenen aurrebista';

  @override
  String get devToolsReminderPreviewSubtitle => 'Ikusi zer jakinaraziko litzatekeen orain. Proba-jario segurua Windowsen.';

  @override
  String get reminderPreviewTitle => 'Gogorarazpenen aurrebista';

  @override
  String get reminderPreviewNow => 'Aurrebista-ordua';

  @override
  String get reminderPreviewReset => 'Orain';

  @override
  String get reminderPreviewEmpty => 'Dena lasai — ez litzateke ezer jakinaraziko une honetan.';

  @override
  String get reminderPreviewCustom => 'Ordutegi pertsonalizatuak (demo)';

  @override
  String get reminderPreviewNoFire => 'Ez da ezer gertatuko.';

  @override
  String get reminderKindDaily => 'Egunerokoa';

  @override
  String get reminderKindBehind => 'Atzeratuta';

  @override
  String get reminderKindDeadline => 'Epemuga';

  @override
  String get reminderKindOverdue => 'Igarota';

  @override
  String get reminderKindStreak => 'Bolada';

  @override
  String get reminderKindCustom => 'Pertsonalizatua';

  @override
  String get settingsReminders => 'Ikasketa-gogorarazpenak';

  @override
  String get settingsRemindersOff => 'Desaktibatuta — aktibatu eguneroko abisua jasotzeko.';

  @override
  String get settingsReminderTime => 'Gogorarazpen-ordua';

  @override
  String get settingsReminderDenied => 'Jakinarazpenak blokeatuta daude — gaitu itzazu sistemaren ezarpenetan.';

  @override
  String notifDurationHours(String value) {
    return '$value h';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value min';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Gauean: $duration Ondo bidean jarraitzeko';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course: $duration falta gaur';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count gehiago)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Erregistratu saio bat gaurkoa garbitzeko.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course Atzeratuta izatera igaro da';
  }

  @override
  String notifBehindBodyPace(String left, String days, String pace, String catchUp) {
    return '$left falta, $days egun geratzen dira — hemendik aurrera $pace/egun. Erregistratu $catchUp Ondo bidean itzultzeko.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left falta, $days egun geratzen dira — hemendik aurrera $pace/egun. Soilik $left osoa amaitzeak garbitzen du hau — hasi gaur gauean.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left zabalik dago oraindik eta epemuga iritsi da. Orain erregistratzen duzun guztiak balio du.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course bihar muga da eta $left zabalik dago oraindik';
  }

  @override
  String get notifDeadlineTomorrowBody => 'Gaur erregistratzen duzun guztiak bikoitz balio du.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ $course azterketa $days egun barru — $left falta';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Hori $pace/egun da. Zatitu: eguneko 2 saiok maratoi bat garaitzen dute.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Orain erregistratzen duzun ordu bakoitzak balio du.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course epemuga igaro du $left zabalik duela';
  }

  @override
  String get notifOverdueBody => 'Mugitu epemuga edo amaitu orduak — bitartean ikasgaiak arreta behar du.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days eguneko bolada — $week aste honetan';
  }

  @override
  String get notifStreakBody => 'Ikasgai guztiak Ondo bidean edo Aurreratuta. Bolada bikaina.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Ikasketa-egiaztapena: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Eguneratzeko ordua: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left zabalik · $pace/egun garaiz amaitzeko. Erregistratu saio bat aurrerapena eguneratzeko.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left zabalik dago oraindik — orain erregistratzen duzun guztiak balio du.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Hurrengoa: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1e';

  @override
  String get reminderPreviewFwdDay => '+1e';

  @override
  String get reminderPreviewFake => '(faltsua)';

  @override
  String get reminderPreviewDemoLabel => 'Demo egiaztapena';
}
