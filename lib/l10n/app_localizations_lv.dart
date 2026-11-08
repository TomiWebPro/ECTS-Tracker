// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Atcelt';

  @override
  String get commonClose => 'Aizvērt';

  @override
  String get commonDelete => 'Dzēst';

  @override
  String get commonEdit => 'Rediģēt';

  @override
  String get commonError => 'Kļūda';

  @override
  String get commonNone => 'Nekas';

  @override
  String get commonSave => 'Saglabāt';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Nepieciešamās stundas (automātiski): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Notīrīt termiņu';

  @override
  String get courseFormClearStartTooltip => 'Notīrīt sākuma datumu';

  @override
  String get courseFormColorLabel => 'Krāsa';

  @override
  String get courseFormDateNotSet => 'Nav iestatīts';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Termiņš: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS kredītpunkti';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nosaukums';

  @override
  String get courseFormNotesLabel => 'Piezīmes (neobligāti)';

  @override
  String get courseFormSaving => 'Saglabā…';

  @override
  String courseFormStartButton(String date) {
    return 'Sākums: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Izslēgts: bez slodzes līdz $date; izslēgts no šodienas tempa.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Ieslēgts: laiks tiek sadalīts līdz šim brīdim un ieskaitīts šodienas tempā.';

  @override
  String get courseFormStartEarlyTitle =>
      'Sākt tagad, neskatoties uz nākotnes sākumu';

  @override
  String get courseFormTitleAdd => 'Pievienot kursu';

  @override
  String get courseFormTitleEdit => 'Rediģēt kursu';

  @override
  String get coursesAddTooltip => 'Pievienot kursu';

  @override
  String coursesDeleteBody(String name) {
    return 'Dzēst “$name” un visas tā mācību sesijas? Šo nevar atsaukt.';
  }

  @override
  String get coursesDeleteTitle => 'Dzēst kursu?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Pieskarieties “Jauns kurss”, lai izveidotu savu pirmo kursu.';

  @override
  String get coursesEmptyTitle => 'Vēl nav kursu';

  @override
  String get coursesFilterAll => 'Visi statusi';

  @override
  String get coursesFilterEmpty => 'Neviens kurss neatbilst šim filtram';

  @override
  String get coursesNewCourse => 'Jauns kurss';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Nepieciešams $daily h/dienā';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Nepieciešams $daily h/dienā • $weekly h/nedēļā';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required h • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Noņemt parauga kursu';

  @override
  String coursesShownCount(String count) {
    return 'Rādīti: $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Kārtot: $label';
  }

  @override
  String get dashboardAllDone => 'Viss paveikts';

  @override
  String dashboardBonusLogged(String hours) {
    return 'Reģistrētas $hours h (bonuss)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kurss(i)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kurss(i) · $upcoming gaidāmie nav šodienas tempā';
  }

  @override
  String get dashboardCoursesTitle => 'Kursi';

  @override
  String dashboardDeadline(String date) {
    return 'Termiņš: $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Termiņš $date (atlikušas $days dienas)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Termiņš $date (atlikusi 1 diena)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Termiņš $date (nokavēts)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Termiņš $date (šodien)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Šodien jāpaveic — reģistrētas $hours h';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Visi kursi ir pabeigti — pilnu sarakstu skatiet cilnē Kursi.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Pievienojiet kursu, lai sāktu izsekot savu ECTS progresu.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Atpaliek = paveikts $achieved/d, vajag $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Atpaliek = paveikts $achieved/d, vajag $need/d · agrīns sākums';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Atpaliek: neviens galīgs temps nesasniedz šodienas termiņu ar atlikušajām stundām';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Labā ritmā: tempa vēl nav — reģistrējiet pirmo sesiju, lai apstiprinātu';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Sākas pēc $days d. · skaitīts no $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Sākas pēc $days d. · skaitīts no $date · agrīns sākums ieslēgts';
  }

  @override
  String get dashboardFreshStart => 'JAUNS SĀKUMS';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · atlikušas $hours h';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/dienā';
  }

  @override
  String get dashboardLogSessionAction => 'Reģistrēt mācību sesiju';

  @override
  String get dashboardLogSessionTooltip => 'Reģistrēt mācību sesiju';

  @override
  String get dashboardNewBadge => 'JAUNS';

  @override
  String get dashboardNoCourses => 'Vēl nav kursu';

  @override
  String get dashboardNoDeadline => 'Nav termiņa';

  @override
  String get dashboardNoDeadlines => 'Nav ieplānotu termiņu';

  @override
  String get dashboardNoPaceDue => 'Šodien nav tempa';

  @override
  String get dashboardNothingDue => 'Nekas nav jāpaveic';

  @override
  String get dashboardNothingToTrack => 'Vēl nav ko izsekot';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Šodien jāpaveic — atlikušas $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Lai pabeigtu, vajag $daily h/dienā';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Lai pabeigtu, vajag $daily h/dienā · $weekly h/nedēļā';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Vajag $hours h/dienā no $date · nav šodienas tempā';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Nav termiņa — atlikušas $hours h · bez ikdienas slodzes';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Sākas $date · jāpaveic $hours h';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · nereāli';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMMA';

  @override
  String get dashboardProgramEmptyHint =>
      'Pievienojiet kursu, lai sāktu izsekot';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMMA $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return 'Atlikušas $days dienu rezerves';
  }

  @override
  String get dashboardStartNotSet => 'Nav iestatīts';

  @override
  String dashboardStartsIn(String days) {
    return 'Sākas pēc $days d.';
  }

  @override
  String get dashboardStartsSoon => 'Sākas drīz';

  @override
  String get dashboardTipEmpty =>
      'Pievienojiet savu pirmo kursu — jūsu ikdienas temps un progress parādīsies šeit.';

  @override
  String get dashboardTipFirst =>
      'Pirmās 25 minūtes ir vissvarīgākās — izvēlieties kursu ar tuvāko termiņu.';

  @override
  String get dashboardTodayBare => 'ŠODIEN';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'ŠODIEN $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'ŠODIENAS TEMPS';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Šodien $logged / $pace h';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Nākotnes sākumi — šodien bez slodzes, izslēgti no šodienas tempa.';

  @override
  String get dashboardUpcomingTitle => 'Gaidāmie';

  @override
  String get devToolsActivate => 'Aktivizēt';

  @override
  String get devToolsActivateMessage =>
      'Tas atbloķē slēptos stresa testa rīkus (ģenerētu datu ievietošanu). Tikai izstrādei.';

  @override
  String get devToolsActivateTitle => 'Aktivizēt izstrādātāja režīmu?';

  @override
  String get devToolsActivated => 'Izstrādātāja režīms aktivizēts.';

  @override
  String get devToolsClearPumped => 'Notīrīt ģenerētos datus';

  @override
  String get devToolsClearPumpedMessage =>
      'Dzēš ģenerētos STRESS kursus un to sesijas. Jūsu dati tiek saglabāti.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Dzēst ģenerētos STRESS kursus un sesijas.';

  @override
  String get devToolsClearPumpedTitle => 'Notīrīt ģenerētos datus?';

  @override
  String devToolsCleared(String count) {
    return 'Notīrīti $count ģenerētie kursi.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Otrais apstiprinājums: tas palielinās kursus, sarakstus, diagrammas un tempa aprēķinus, un var aizņemt dažas sekundes. Ievietot tagad?';

  @override
  String get devToolsConfirmPumpTitle => 'Apstiprināt stresa datu ievietošanu';

  @override
  String get devToolsContinue => 'Turpināt';

  @override
  String get devToolsExit => 'Iziet no izstrādātāja režīma';

  @override
  String get devToolsExitSubtitle => 'Paslēpt izstrādātāja rīkus šajā ierīcē.';

  @override
  String get devToolsPumpData => 'Ievietot datus';

  @override
  String get devToolsPumpMessage =>
      'Tas ievieto reālistisku ģenerētu semestri (~10 kursi, ~800 sesijas pēdējo 12 nedēļu laikā). Jūsu esošie dati tiek saglabāti. Turpināt?';

  @override
  String get devToolsPumpSubtitle =>
      'Ievietot ģenerētu semestri (~10 kursi, ~800 sesijas, 12 nedēļas). Esošie dati saglabāti.';

  @override
  String get devToolsPumpTile => 'Ievietot testa datus';

  @override
  String get devToolsPumpTitle => 'Ievietot testa datus?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Ievietoti $courses kursi, $sessions sesijas.';
  }

  @override
  String get devToolsPumping => 'Ievieto testa datus…';

  @override
  String get devToolsRemoveAll => 'Noņemt visus datus';

  @override
  String get devToolsRemoveAllMessage =>
      'Izstrādātāja saīsne: tas neatgriezeniski dzēš VISUS kursus, sesijas un iestatījumus. Šo nevar atsaukt.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Izstrādātāja saīsne: dzēst VISUS kursus, sesijas un iestatījumus.';

  @override
  String get devToolsRemoveAllTitle => 'Noņemt visus datus?';

  @override
  String get navCourses => 'Kursi';

  @override
  String get navDashboard => 'Pārskats';

  @override
  String get navSettings => 'Iestatījumi';

  @override
  String get navStatistics => 'Statistika';

  @override
  String get navStudyLog => 'Mācību žurnāls';

  @override
  String get sampleBadge => 'Paraugs';

  @override
  String get sessionFormCourseLabel => 'Kurss';

  @override
  String sessionFormDateButton(String date) {
    return 'Datums: $date';
  }

  @override
  String get sessionFormDurationError => 'Ilgumam jābūt lielākam par nulli.';

  @override
  String get sessionFormHoursLabel => 'Stundas';

  @override
  String get sessionFormLogAction => 'Reģistrēt sesiju';

  @override
  String get sessionFormMinutesLabel => 'Minūtes';

  @override
  String get sessionFormNoCourseError => 'Izvēlieties kursu.';

  @override
  String get sessionFormNoCoursesHint =>
      'Vispirms pievienojiet kursu, lai reģistrētu sesiju.';

  @override
  String get sessionFormNotesLabel => 'Piezīmes (neobligāti)';

  @override
  String get sessionFormSaving => 'Saglabā…';

  @override
  String get sessionFormTitleAdd => 'Reģistrēt mācību sesiju';

  @override
  String get sessionFormTitleEdit => 'Rediģēt mācību sesiju';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Kopā: $hours h';
  }

  @override
  String get settingsAccent => 'Motīva krāsa';

  @override
  String get settingsAccentBerry => 'Oga';

  @override
  String get settingsAccentClay => 'Māls';

  @override
  String get settingsAccentForest => 'Mežs';

  @override
  String get settingsAccentSlate => 'Šīferis';

  @override
  String get settingsAccentTeal => 'Zilganzaļa';

  @override
  String get settingsAccentUpdated => 'Motīva krāsa atjaunināta.';

  @override
  String get settingsAllDataDeleted => 'Visi dati dzēsti.';

  @override
  String get settingsAppearance => 'Izskats (tumšs / gaišs)';

  @override
  String get settingsCheckingSample => 'Pārbauda parauga datus…';

  @override
  String get settingsClear => 'Notīrīt';

  @override
  String get settingsClearSample => 'Notīrīt parauga datus';

  @override
  String get settingsClearSampleMessage =>
      'Tas noņem parauga kursus un sesijas. Kursi vai sesijas, ko pievienojāt pats, netiek noņemtas.';

  @override
  String get settingsClearSampleSubtitle =>
      'Noņemt iepriekš ielādētos parauga kursus un sesijas. Jūsu dati tiek saglabāti.';

  @override
  String get settingsClearSampleTitle => 'Notīrīt parauga datus?';

  @override
  String get settingsCopy => 'Kopēt';

  @override
  String get settingsDailyError => 'Ievadiet 0 vai pozitīvu minūšu skaitu.';

  @override
  String get settingsDailyLabel => 'Minūtes dienā (0 = bez mērķa)';

  @override
  String get settingsDailyTarget => 'Ikdienas mācību mērķis';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dienā';
  }

  @override
  String get settingsDailyUpdated => 'Ikdienas mērķis atjaunināts.';

  @override
  String get settingsData => 'Dati';

  @override
  String get settingsDeleteEverything => 'Dzēst visu';

  @override
  String get settingsDevMode => 'Izstrādātāja režīms';

  @override
  String get settingsDisplay => 'Attēlojums';

  @override
  String get settingsDisplayComfortable => 'Ērts';

  @override
  String get settingsDisplayCompact => 'Kompakts';

  @override
  String get settingsDisplayLarge => 'Liels';

  @override
  String get settingsDisplaySize => 'Teksta un elementu izmērs';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Attēlojuma izmērs atjaunināts.';

  @override
  String get settingsExport => 'Eksportēt datus';

  @override
  String get settingsExportCopied => 'Eksports nokopēts starpliktuvē.';

  @override
  String get settingsExportSubtitle =>
      'Kopēt visus kursus, sesijas un iestatījumus kā JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kurss(i) · $sessions sesija(s) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (saīsināts — pilna dublējumkopija ir $kb KB, pilnīgai kopijai izmantojiet Kopēt)';
  }

  @override
  String get settingsFirstWeekday => 'Nedēļas pirmā diena';

  @override
  String get settingsFirstWeekdayUpdated => 'Nedēļas pirmā diena atjaunināta.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s turēšana)';
  }

  @override
  String get settingsHoldToReplace => 'Turiet, lai aizstātu visu';

  @override
  String get settingsHoursError => 'Ievadiet skaitli, kas lielāks par nulli.';

  @override
  String get settingsHoursHelper =>
      'Noklusējums 30. Mainīšana pārrēķina prasības; žurnāli saglabāti.';

  @override
  String get settingsHoursLabel => 'Stundas uz ECTS kredītpunktu';

  @override
  String get settingsHoursPerEcts => 'Stundas uz ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Stundas uz ECTS atjauninātas.';

  @override
  String get settingsImport => 'Importēt datus';

  @override
  String get settingsImportAppend => 'Pievienot';

  @override
  String get settingsImportAppendAction => 'Importēt (pievienot)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Dati pievienoti: pievienoti $courses kurss(i), $sessions sesija(s).';
  }

  @override
  String get settingsImportInfo =>
      'Pievienošana pievieno dublējumu līdzās pašreizējiem datiem (iestatījumi saglabāti). Aizstāšana vispirms izdzēš VISUS kursus, sesijas un iestatījumus.';

  @override
  String get settingsImportLabel => 'Ielīmēt eksportēto JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kurss(i) · $sessions sesija(s)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · eksportēts $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · shēma v$schema';
  }

  @override
  String get settingsImportReplace => 'Aizstāt';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Aizstāšana vispirms izdzēš visu. Nospiediet un TURIET zemāk esošo pogu $seconds sekundes, lai apstiprinātu.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Dati aizstāti: atjaunoti $courses kurss(i), $sessions sesija(s).';
  }

  @override
  String get settingsImportSubtitle =>
      'Aizstāt visus datus no iepriekš eksportētas JSON dublējumkopijas.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Turpiniet turēt… $remaining s';
  }

  @override
  String get settingsNoSample => 'Nav parauga datu';

  @override
  String get settingsNoSampleSubtitle =>
      'Ielādētie parauga dati jau ir notīrīti.';

  @override
  String get settingsNoTarget => 'Mērķis nav iestatīts';

  @override
  String get settingsOverloadError => 'Ievadiet skaitli 5–100 h/nedēļā.';

  @override
  String get settingsOverloadHelper =>
      'Nākotnes slodzes nedēļas virs šī tiek atzīmētas sarkanā krāsā. Pilna laika studijas ir ~35–40 h/nedēļā.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Stundas nedēļā (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/nedēļā atzīmē sarkanā krāsā';
  }

  @override
  String get settingsOverloadThreshold => 'Nedēļas pārslodzes slieksnis';

  @override
  String get settingsOverloadUpdated => 'Pārslodzes slieksnis atjaunināts.';

  @override
  String get settingsPaceTolerance => 'Priekšā / atpaliek pielaide';

  @override
  String get settingsPasteValidBackup => 'Vispirms ielīmējiet derīgu dublējumu';

  @override
  String get settingsReset => 'Atiestatīt';

  @override
  String get settingsResetAll => 'Atiestatīt visus datus';

  @override
  String get settingsResetAllMessage =>
      'Tas neatgriezeniski izdzēš VISUS kursus, sesijas un iestatījumus. Šo nevar atsaukt. Vispirms eksportējiet dublējumu, ja nepieciešams.';

  @override
  String get settingsResetAllSubtitle =>
      'Dzēst visus kursus, sesijas un iestatījumus.';

  @override
  String get settingsResetAllTitle => 'Atiestatīt visus datus?';

  @override
  String get settingsResetSettings => 'Atiestatīt iestatījumus';

  @override
  String get settingsResetSettingsDone =>
      'Iestatījumi atiestatīti uz noklusējumu.';

  @override
  String get settingsResetSettingsMessage =>
      'Atjauno stundas uz ECTS (30), ikdienas mērķi (nekādu), nedēļas pirmo dienu (pirmdiena), motīvu (sistēma), pielaidi (5 dienas), pārslodzi (35 h/nedēļā), izmēru (ērts), krāsu (šīferis). Kursi un sesijas tiek saglabāti.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Atjaunot noklusējumu: 30 h/ECTS, bez mērķa, pirmdiena, sistēmas motīvs, 5 dienu pielaide, 35 h/nedēļā pārslodze, ērts izmērs, šīferis krāsa.';

  @override
  String get settingsResetSettingsTitle => 'Atiestatīt iestatījumus?';

  @override
  String get settingsSampleData => 'Parauga dati';

  @override
  String settingsSampleDataError(String error) {
    return 'Kļūda: $error';
  }

  @override
  String get settingsStudySettings => 'Mācību iestatījumi';

  @override
  String get settingsThemeDark => 'Tumšs';

  @override
  String get settingsThemeLight => 'Gaišs';

  @override
  String get settingsThemeSystem => 'Sistēmas noklusējums';

  @override
  String get settingsThemeTitle => 'Motīvs';

  @override
  String get settingsThemeUpdated => 'Motīvs atjaunināts.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dienas';
  }

  @override
  String get settingsToleranceError => 'Ievadiet skaitli 0–30 dienas.';

  @override
  String get settingsToleranceHelper =>
      'Priekšā vajag +N dienu rezervi, atpaliek −N dienas. 5 = stabili, 0 = jutīgi.';

  @override
  String get settingsToleranceLabel => 'Darba dienas (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance darba';
  }

  @override
  String get settingsToleranceUpdated => 'Pielaide atjaunināta.';

  @override
  String get settingsWeekdayFriday => 'Piektdiena';

  @override
  String get settingsWeekdayMonday => 'Pirmdiena';

  @override
  String get settingsWeekdaySaturday => 'Sestdiena';

  @override
  String get settingsWeekdaySunday => 'Svētdiena';

  @override
  String get settingsWeekdayThursday => 'Ceturtdiena';

  @override
  String get settingsWeekdayTuesday => 'Otrdiena';

  @override
  String get settingsWeekdayWednesday => 'Trešdiena';

  @override
  String get sortDeadline => 'Termiņš';

  @override
  String get sortName => 'Nosaukums';

  @override
  String get sortProgress => 'Progress';

  @override
  String get sortStatus => 'Statuss';

  @override
  String get startupTitle => 'Neizdevās palaist ECTS Tracker';

  @override
  String get statsActiveDays => 'Aktīvās dienas';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d. aktīvs';
  }

  @override
  String get statsAddDeadlines =>
      'Pievienojiet termiņus, lai prognozētu slodzi.';

  @override
  String get statsComingLoad => 'Gaidāmā slodze';

  @override
  String get statsConsistency => 'Konsekvence';

  @override
  String get statsConsistencyHint =>
      'Mācību dienas pēdējo 30 dienu laikā. Nelieli soļi katru dienu pārspēj kalšanu.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% no pēdējām 30 dienām';
  }

  @override
  String statsCourseFallback(int id) {
    return '$id. kurss';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'K$id';
  }

  @override
  String get statsDidPerDay => 'Paveikts / dienā (14 d.)';

  @override
  String get statsEmpty => 'Vēl nav sesiju';

  @override
  String get statsGap => 'Starpība';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value h';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours h';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get statsLast30Days => 'Pēdējās 30 dienas';

  @override
  String get statsLast7Days => 'Pēdējās 7 dienas';

  @override
  String get statsNeedPerDay => 'Vajag / dienā';

  @override
  String get statsNext8Weeks => 'Nākamās 8 nedēļas';

  @override
  String get statsOfLast30DaysVolume => 'no pēdējo 30 dienu apjoma';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Pārslodzes nedēļas >$threshold h atzīmētas sarkanā krāsā — pārceliet termiņu vai samaziniet apjomu.';
  }

  @override
  String get statsOverview => 'Pārskats';

  @override
  String get statsPaceCovers =>
      'Iepriekšējais temps sedz nepieciešamo. Turpiniet sēriju.';

  @override
  String statsPaceShort(String gap) {
    return 'Iepriekšējais temps ir par $gap h/dienā par mazu — pievienojiet bloku vai samaziniet apjomu.';
  }

  @override
  String get statsPastVsNeeded => 'Iepriekš pret vajadzīgo';

  @override
  String statsPeakPerWeek(String peak) {
    return 'maks. $peak h/ned.';
  }

  @override
  String get statsPerCourse => 'Pa kursiem';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sesijas';

  @override
  String statsSuggestedOrder(String order) {
    return 'Ieteicamā secība: $order (vispirms tuvākais termiņš)';
  }

  @override
  String get statsTotal => 'Kopā';

  @override
  String get statsTotalVolume => 'kopējais apjoms';

  @override
  String get statusAhead => 'Priekšā';

  @override
  String get statusBehind => 'Atpaliek';

  @override
  String get statusCompleted => 'Pabeigts';

  @override
  String get statusOnTrack => 'Labā ritmā';

  @override
  String get statusOverdue => 'Nokavēts';

  @override
  String get studyLogDeleteBody => 'Dzēst šo mācību sesiju? Šo nevar atsaukt.';

  @override
  String get studyLogDeleteTitle => 'Dzēst sesiju?';

  @override
  String get studyLogEmptyHint =>
      'Reģistrējiet sesiju, lai izsekotu savu mācību laiku.';

  @override
  String get studyLogEmptyTitle => 'Vēl nav mācību sesiju';

  @override
  String get studyLogFabLabel => 'Reģistrēt sesiju';

  @override
  String get studyLogFabTooltip => 'Reģistrēt sesiju';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Noņemt parauga sesiju';

  @override
  String get studyLogThisWeek => 'Šonedēļ';

  @override
  String get studyLogToday => 'Šodien';

  @override
  String studyLogUnknownCourse(String id) {
    return '$id. kurss';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS jābūt lielākam par nulli';

  @override
  String get validationCourseEctsRequired => 'Ievadiet ECTS kredītpunktus';

  @override
  String get validationCourseNameRequired => 'Nosaukums ir obligāts';

  @override
  String get validationCourseNameTooLong => 'Nosaukums ir pārāk garš';

  @override
  String get validationSessionCourseRequired => 'Izvēlieties kursu';

  @override
  String get validationSessionDurationRequired => 'Ievadiet ilgumu';

  @override
  String get widgetNoProgress => 'Progresa vēl nav';

  @override
  String get settingsLanguage => 'Valoda';
}
