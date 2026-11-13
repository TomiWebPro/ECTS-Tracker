// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Faroese (`fo`).
class AppLocalizationsFo extends AppLocalizations {
  AppLocalizationsFo([String locale = 'fo']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Avlýs';

  @override
  String get commonClose => 'Lat aftur';

  @override
  String get commonDelete => 'Strika';

  @override
  String get commonEdit => 'Broyt';

  @override
  String get commonError => 'Villa';

  @override
  String get commonNone => 'Einki';

  @override
  String get commonSave => 'Goym';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Kravdir tímar (sjálvvirkið): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Strika freist';

  @override
  String get courseFormClearStartTooltip => 'Strika byrjanardato';

  @override
  String get courseFormColorLabel => 'Litur';

  @override
  String get courseFormDateNotSet => 'Ikki ásett';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Freist: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS-stig';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value t/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Navn';

  @override
  String get courseFormNotesLabel => 'Notur (valfrítt)';

  @override
  String get courseFormSaving => 'Goymir…';

  @override
  String courseFormStartButton(String date) {
    return 'Byrjan: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Sløkt: einki trýst til $date; undantikið tempo dagsins.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Kveikt: tíðin verður býtt til nú og telur við í tempo dagsins.';

  @override
  String get courseFormStartEarlyTitle => 'Byrja nú hóast komandi byrjan';

  @override
  String get courseFormTitleAdd => 'Legg skeið afturat';

  @override
  String get courseFormTitleEdit => 'Broyt skeið';

  @override
  String get coursesAddTooltip => 'Legg skeið afturat';

  @override
  String coursesDeleteBody(String name) {
    return 'Strika \"$name\" og allar lestrarløtur? Hetta kann ikki angrast.';
  }

  @override
  String get coursesDeleteTitle => 'Strika skeið?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Trýst á \"Nýtt skeið\" fyri at stovna títt fyrsta skeið.';

  @override
  String get coursesEmptyTitle => 'Onki skeið enn';

  @override
  String get coursesFilterAll => 'Allar støður';

  @override
  String get coursesFilterEmpty => 'Onki skeið samsvarar hesum sili';

  @override
  String get coursesNewCourse => 'Nýtt skeið';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily t/dag krevst';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/dag krevst';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily t/dag • $weekly t/viku krevst';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/dag • $weekly min/viku krevst';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/dag • $weekly t/viku krevst';
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
  String get coursesRemoveSampleTooltip => 'Strika royndarskeið';

  @override
  String coursesShownCount(String count) {
    return '$count víst';
  }

  @override
  String coursesSortOption(String label) {
    return 'Raða: $label';
  }

  @override
  String get dashboardAllDone => 'Alt liðugt';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours t skrásett (eyka)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count skeið';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count skeið · $upcoming komandi ikki í tempo dagsins';
  }

  @override
  String get dashboardCoursesTitle => 'Skeið';

  @override
  String dashboardDeadline(String date) {
    return 'Freist $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Freist $date ($days dagar eftir)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Freist $date (1 dagur eftir)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Freist $date (yvirgongd)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Freist $date (í dag)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Skal gerast í dag — $hours t skrásett';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Øll skeið eru liðug — síggj øll listan undir Skeið.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Legg eitt skeið afturat fyri at byrja at fylgja ECTS-framgongd tína.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Aftaná = ger $achieved/d, krevur $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Aftaná = ger $achieved/d, krevur $need/d · tíðlig byrjan';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Aftaná: einki endaligt tempo røkkur freist í dag við tímum eftir';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Á veg: einki tempo enn — skráset fyrstu løtu fyri at vátta';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Byrjar um $days d · roknað frá $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Byrjar um $days d · roknað frá $date · tíðlig byrjan kveikt';
  }

  @override
  String get dashboardFreshStart => 'NÝGGJ BYRJAN';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · ${hours}t eftir';
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
  String get dashboardLogSessionAction => 'Skráset lestrarløtu';

  @override
  String get dashboardLogSessionTooltip => 'Skráset lestrarløtu';

  @override
  String get dashboardNewBadge => 'NÝTT';

  @override
  String get dashboardNoCourses => 'Onki skeið enn';

  @override
  String get dashboardNoDeadline => 'Ongin freist';

  @override
  String get dashboardNoDeadlines => 'Ongar freistir ætlaðar';

  @override
  String get dashboardNoPaceDue => 'Einki tempo skal gerast í dag';

  @override
  String get dashboardNothingDue => 'Einki skal gerast';

  @override
  String get dashboardNothingToTrack => 'Einki at fylgja enn';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Skal gerast í dag — ${hours}t eftir';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Krevur $daily t/dag fyri at verða liðug';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Krevur $daily min/dag fyri at verða liðug';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Krevur $daily t/dag · $weekly t/viku fyri at verða liðug';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Krevur $daily min/dag · $weekly min/viku fyri at verða liðug';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Krevur $daily min/dag · $weekly t/viku fyri at verða liðug';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Krevur $hours t/dag frá $date · ikki í tempo dagsins';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Krevur $minutes min/dag frá $date · ikki í tempo dagsins';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Ongin freist — ${hours}t eftir · einki dagligt trýst';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Byrjar $date · ${hours}t at gera';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · órealistiskt';
  }

  @override
  String get dashboardProgramBare => 'SKRÁ';

  @override
  String get dashboardProgramEmptyHint =>
      'Legg eitt skeið afturat fyri at byrja at fylgja';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required t';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'SKRÁ $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days dagar eftir';
  }

  @override
  String get dashboardStartNotSet => 'Ikki ásett';

  @override
  String dashboardStartsIn(String days) {
    return 'Byrjar um ${days}d';
  }

  @override
  String get dashboardStartsSoon => 'Byrjar skjótt';

  @override
  String get dashboardTipEmpty =>
      'Legg títt fyrsta skeið afturat — dagligt tempo og framgongd koma fram her.';

  @override
  String get dashboardTipFirst =>
      'Fyrstu 25 minuttini telja mest — vel skeiðið sum hevur fyrstu freist.';

  @override
  String get dashboardTodayBare => 'Í DAG';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace t';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'Í DAG $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'TEMPO DAGSINS';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace t í dag';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Komandi byrjanir — einki trýst í dag, undantikið tempo dagsins.';

  @override
  String get dashboardUpcomingTitle => 'Komandi';

  @override
  String get devToolsActivate => 'Kveik';

  @override
  String get devToolsActivateMessage =>
      'Hetta letur upp fjalda trýstroyndar-amboð (skapar royndargögn). Bert til menning.';

  @override
  String get devToolsActivateTitle => 'Kveikja menningarham?';

  @override
  String get devToolsActivated => 'Menningarháttur kveiktur.';

  @override
  String get devToolsClearPumped => 'Strika innpumpað gögn';

  @override
  String get devToolsClearPumpedMessage =>
      'Strikar tey skaptu STRESS-skeiðini og løturnar. Tína egnu gögn verða varðveitt.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Strika skapt STRESS-skeið og løtur.';

  @override
  String get devToolsClearPumpedTitle => 'Strika innpumpað gögn?';

  @override
  String devToolsCleared(String count) {
    return 'Strikaði $count innpumpað skeið.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Onnur váttan: hetta blæsir upp skeið, listar, talvur og tempoútrokningar og kann taka nakrar sekund. Pumpa nú?';

  @override
  String get devToolsConfirmPumpTitle => 'Vátta trýstroynd';

  @override
  String get devToolsContinue => 'Halt fram';

  @override
  String get devToolsExit => 'Far úr menningarham';

  @override
  String get devToolsExitSubtitle => 'Fjal menningar-amboð á hesum tól.';

  @override
  String get devToolsPumpData => 'Pumpa gögn';

  @override
  String get devToolsPumpMessage =>
      'Hetta leggur inn eitt skapiligt lestrarhálvár (~10 skeið, ~800 løtur seinastu 12 vikurnar). Tíni verandi gögn verða varðveitt. Halda fram?';

  @override
  String get devToolsPumpSubtitle =>
      'Legg inn skapiligt hálvár (~10 skeið, ~800 løtur, 12 vikur). Verandi gögn varðveitt.';

  @override
  String get devToolsPumpTile => 'Pumpa royndargögn';

  @override
  String get devToolsPumpTitle => 'Pumpa royndargögn?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Pumpaði $courses skeið, $sessions løtur.';
  }

  @override
  String get devToolsPumping => 'Pumpar royndargögn…';

  @override
  String get devToolsRemoveAll => 'Strika øll gögn';

  @override
  String get devToolsRemoveAllMessage =>
      'Menningarsnarvegur: hetta strikar varandi ØLL skeið, løtur og innstillingar. Hetta kann ikki angrast.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Menningarsnarvegur: strika ØLL skeið, løtur og innstillingar.';

  @override
  String get devToolsRemoveAllTitle => 'Strika øll gögn?';

  @override
  String get navCourses => 'Skeið';

  @override
  String get navDashboard => 'Yvirlit';

  @override
  String get navSettings => 'Innstillingar';

  @override
  String get navStatistics => 'Hagtøl';

  @override
  String get navStudyLog => 'Lestrarbók';

  @override
  String get sampleBadge => 'Roynd';

  @override
  String get sessionFormCourseLabel => 'Skeið';

  @override
  String sessionFormDateButton(String date) {
    return 'Dato: $date';
  }

  @override
  String get sessionFormDurationError => 'Tíðarlongd má vera størri enn null.';

  @override
  String get sessionFormHoursLabel => 'Tímar';

  @override
  String get sessionFormLogAction => 'Skráset løtu';

  @override
  String get sessionFormMinutesLabel => 'Minuttir';

  @override
  String get sessionFormNoCourseError => 'Vel eitt skeið.';

  @override
  String get sessionFormNoCoursesHint =>
      'Legg fyrst eitt skeið afturat fyri at skráseta eina løtu.';

  @override
  String get sessionFormNotesLabel => 'Notur (valfrítt)';

  @override
  String get sessionFormSaving => 'Goymir…';

  @override
  String get sessionFormTitleAdd => 'Skráset lestrarløtu';

  @override
  String get sessionFormTitleEdit => 'Broyt lestrarløtu';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Íalt: $hours t';
  }

  @override
  String get settingsAccent => 'Evnislitur';

  @override
  String get settingsAccentBerry => 'Ber';

  @override
  String get settingsAccentClay => 'Leir';

  @override
  String get settingsAccentForest => 'Skógur';

  @override
  String get settingsAccentSlate => 'Skifer';

  @override
  String get settingsAccentTeal => 'Blágrønt';

  @override
  String get settingsAccentUpdated => 'Evnislitur dagførdur.';

  @override
  String get settingsAllDataDeleted => 'Øll gögn strikað.';

  @override
  String get settingsAppearance => 'Útsjónd (myrkt / ljóst)';

  @override
  String get settingsCheckingSample => 'Kanni royndargögn…';

  @override
  String get settingsClear => 'Strika';

  @override
  String get settingsClearSample => 'Strika royndargögn';

  @override
  String get settingsClearSampleMessage =>
      'Hetta strikar dømisskeiðini og løturnar. Skeið ella løtur, sum tú sjálvur hevur lagt afturat, verða ikki strikað.';

  @override
  String get settingsClearSampleSubtitle =>
      'Strika tey íbornu dømisskeiðini og løturnar. Tíni egnu gögn verða varðveitt.';

  @override
  String get settingsClearSampleTitle => 'Strika royndargögn?';

  @override
  String get settingsCopy => 'Avrita';

  @override
  String get settingsDailyError =>
      'Skriva 0 ella eitt positivt tal av minuttum.';

  @override
  String get settingsDailyLabel => 'Minuttir um dagin (0 = einki mál)';

  @override
  String get settingsDailyTarget => 'Dagligt lestramál';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dag';
  }

  @override
  String get settingsDailyUpdated => 'Dagligt mál dagført.';

  @override
  String get settingsData => 'Gögn';

  @override
  String get settingsDeleteEverything => 'Strika alt';

  @override
  String get settingsDevMode => 'Menningarháttur';

  @override
  String get settingsDisplay => 'Sýning';

  @override
  String get settingsDisplayComfortable => 'Hugnaligt';

  @override
  String get settingsDisplayCompact => 'Tætt';

  @override
  String get settingsDisplayLarge => 'Stórt';

  @override
  String get settingsDisplaySize => 'Tekst- og elementstødd';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Sýningarstødd dagførd.';

  @override
  String get settingsExport => 'Útflyt gögn';

  @override
  String get settingsExportCopied => 'Útflutningur avritaður til klemmuborð.';

  @override
  String get settingsExportSubtitle =>
      'Avrita øll skeið, løtur og innstillingar sum JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses skeið · $sessions løtur · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (stytt — fullur trygdaravrit er $kb KB, brúka Avrita fyri alt)';
  }

  @override
  String get settingsFirstWeekday => 'Fyrsti vikudagur';

  @override
  String get settingsFirstWeekdayUpdated => 'Fyrsti vikudagur dagførdur.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (${seconds}s hald)';
  }

  @override
  String get settingsHoldToReplace => 'Hald inni fyri at skifta út alt';

  @override
  String get settingsHoursError => 'Skriva eitt tal størri enn null.';

  @override
  String get settingsHoursHelper =>
      'Vanliga 30. Broyting endurrokna krav; skrásetingar varðveittar.';

  @override
  String get settingsHoursLabel => 'Tímar pr. ECTS-stig';

  @override
  String get settingsHoursPerEcts => 'Tímar pr. ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value t';
  }

  @override
  String get settingsHoursUpdated => 'Tímar pr. ECTS dagført.';

  @override
  String get settingsImport => 'Innflyt gögn';

  @override
  String get settingsImportAppend => 'Legg afturat';

  @override
  String get settingsImportAppendAction => 'Innflyt (legg afturat)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Gögn løgd afturat: $courses skeið, $sessions løtur løgd afturat.';
  }

  @override
  String get settingsImportInfo =>
      'Legg afturat leggur trygdaravritið afturat tínum verandi gögnum (innstillingar varðveittar). Skift út strikar fyrst ØLL skeið, løtur og innstillingar.';

  @override
  String get settingsImportLabel => 'Líma útflutt JSON inn';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses skeið · $sessions løtur';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · útflutt $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · skema v$schema';
  }

  @override
  String get settingsImportReplace => 'Skift út';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Skift út strikar alt fyrst. Halt TRÝST á knøttin niðanfyri í $seconds sekund fyri at vátta.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Gögn skift út: $courses skeið, $sessions løtur endurstovnað.';
  }

  @override
  String get settingsImportSubtitle =>
      'Skift øll gögn út við eitt áður útflutt JSON-trygdaravrit.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Halt fram at halda… $remaining s';
  }

  @override
  String get settingsNoSample => 'Ongi royndargögn';

  @override
  String get settingsNoSampleSubtitle =>
      'Tey íbornu dømisgögnini eru longu strikað.';

  @override
  String get settingsNoTarget => 'Einki mál ásett';

  @override
  String get settingsOverloadError => 'Skriva eitt tal 5–100 t/viku.';

  @override
  String get settingsOverloadHelper =>
      'Komandi vikur yvir hesum verða merktar reyðar. Fulltíðarlestur er ~35–40 t/viku.';

  @override
  String settingsOverloadHours(String value) {
    return '$value t';
  }

  @override
  String get settingsOverloadLabel => 'Tímar um viku (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/viku merkir reytt';
  }

  @override
  String get settingsOverloadThreshold => 'Yvirlastumark um viku';

  @override
  String get settingsOverloadUpdated => 'Yvirlastumark dagført.';

  @override
  String get settingsPaceTolerance => 'Undan-/aftaná-tol';

  @override
  String get settingsPasteValidBackup =>
      'Líma fyrst inn eitt gildugt trygdaravrit';

  @override
  String get settingsReset => 'Nullstilla';

  @override
  String get settingsResetAll => 'Nullstilla øll gögn';

  @override
  String get settingsResetAllMessage =>
      'Hetta strikar varandi ØLL skeið, løtur og innstillingar. Hetta kann ikki angrast. Útflyt fyrst eitt trygdaravrit um neyðugt.';

  @override
  String get settingsResetAllSubtitle =>
      'Strika øll skeið, løtur og innstillingar.';

  @override
  String get settingsResetAllTitle => 'Nullstilla øll gögn?';

  @override
  String get settingsResetSettings => 'Nullstilla innstillingar';

  @override
  String get settingsResetSettingsDone =>
      'Innstillingar nullstillaðar til standard.';

  @override
  String get settingsResetSettingsMessage =>
      'Endurstovnar tímar-pr-ECTS (30), dagligt mál (einki), fyrsta vikudag (mánadag), evni (skipan), tol (5 dagar), yvirlast (35 t/viku), stødd (hugnaligt), lit (skifer). Skeið og løtur verða varðveitt.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Endurstovna standard: 30 t/ECTS, einki mál, mánadagur, skipanarevni, 5-daga tol, 35 t/viku yvirlast, hugnalig stødd, skifer litur.';

  @override
  String get settingsResetSettingsTitle => 'Nullstilla innstillingar?';

  @override
  String get settingsSampleData => 'Royndargögn';

  @override
  String settingsSampleDataError(String error) {
    return 'Villa: $error';
  }

  @override
  String get settingsStudySettings => 'Lestrarinnstillingar';

  @override
  String get settingsThemeDark => 'Myrkt';

  @override
  String get settingsThemeLight => 'Ljóst';

  @override
  String get settingsThemeSystem => 'Skipanarstandard';

  @override
  String get settingsThemeTitle => 'Evni';

  @override
  String get settingsThemeUpdated => 'Evni dagført.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dagar';
  }

  @override
  String get settingsToleranceError => 'Skriva eitt tal 0–30 dagar.';

  @override
  String get settingsToleranceHelper =>
      'Undan krevur +N daga avskot, aftaná −N dagar. 5 = støðugt, 0 = viðkvæmt.';

  @override
  String get settingsToleranceLabel => 'Dagar av arbeiði (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance av arbeiði';
  }

  @override
  String get settingsToleranceUpdated => 'Tol dagført.';

  @override
  String get settingsWeekdayFriday => 'Fríggjadagur';

  @override
  String get settingsWeekdayMonday => 'Mánadagur';

  @override
  String get settingsWeekdaySaturday => 'Leygardagur';

  @override
  String get settingsWeekdaySunday => 'Sunnudagur';

  @override
  String get settingsWeekdayThursday => 'Hósdagur';

  @override
  String get settingsWeekdayTuesday => 'Týsdagur';

  @override
  String get settingsWeekdayWednesday => 'Mikudagur';

  @override
  String get sortDeadline => 'Freist';

  @override
  String get sortName => 'Navn';

  @override
  String get sortProgress => 'Framgongd';

  @override
  String get sortStatus => 'Støða';

  @override
  String get startupTitle => 'Kundi ikki byrja ECTS Tracker';

  @override
  String get statsActiveDays => 'Virknir dagar';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}d virkin';
  }

  @override
  String get statsAddDeadlines =>
      'Legg freistir afturat fyri at spáa um byrðu.';

  @override
  String get statsComingLoad => 'Komandi byrða';

  @override
  String get statsConsistency => 'Støðufesti';

  @override
  String get statsConsistencyHint =>
      'Lestrardagar seinastu 30 dagarnar. Smá stig hvønn dag vinna á at kroppa.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% av seinastu 30 døgum';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Skeið $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'S$id';
  }

  @override
  String get statsDidPerDay => 'Gjørt / dag (14d)';

  @override
  String get statsEmpty => 'Ongar løtur enn';

  @override
  String get statsGap => 'Glopp';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value t';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}t';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours t';
  }

  @override
  String get statsLast30Days => 'Seinastu 30 dagar';

  @override
  String get statsLast7Days => 'Seinastu 7 dagar';

  @override
  String get statsNeedPerDay => 'Krevur / dag';

  @override
  String get statsNext8Weeks => 'Næstu 8 vikurnar';

  @override
  String get statsOfLast30DaysVolume => 'av nøgd seinastu 30 dagarnar';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Yvirlastuvikur >${threshold}t merktar reyðar — flýt eina freist ella sker umfangið.';
  }

  @override
  String get statsOverview => 'Yvirlit';

  @override
  String get statsPaceCovers =>
      'Undanfarna tempo røkkur tað sum krevst. Halt dampin.';

  @override
  String statsPaceShort(String gap) {
    return 'Undanfarna tempo er $gap t/dag ov lítið — legg ein blokk afturat ella sker umfangið.';
  }

  @override
  String get statsPastVsNeeded => 'Undanfarið móti kravi';

  @override
  String statsPeakPerWeek(String peak) {
    return 'hámark ${peak}t/viku';
  }

  @override
  String get statsPerCourse => 'Pr. skeið';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done t / $required t · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Løtur';

  @override
  String statsSuggestedOrder(String order) {
    return 'Mælt raðfylgja: $order (fyrsta freist fyrst)';
  }

  @override
  String get statsTotal => 'Íalt';

  @override
  String get statsTotalVolume => 'samlað nøgd';

  @override
  String get statusAhead => 'Undan';

  @override
  String get statusBehind => 'Aftaná';

  @override
  String get statusCompleted => 'Liðugt';

  @override
  String get statusOnTrack => 'Á veg';

  @override
  String get statusOverdue => 'Yvirgongd';

  @override
  String get studyLogDeleteBody =>
      'Strika hesa lestrarløtuna? Hetta kann ikki angrast.';

  @override
  String get studyLogDeleteTitle => 'Strika løtu?';

  @override
  String get studyLogEmptyHint => 'Skráset eina løtu fyri at fylgja tíð tíni.';

  @override
  String get studyLogEmptyTitle => 'Ongar lestrarløtur enn';

  @override
  String get studyLogFabLabel => 'Skráset løtu';

  @override
  String get studyLogFabTooltip => 'Skráset løtu';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours t';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Strika royndarløtu';

  @override
  String get studyLogThisWeek => 'Hesa vikuna';

  @override
  String get studyLogToday => 'Í dag';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Skeið $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'S$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS má vera størri enn null';

  @override
  String get validationCourseEctsRequired => 'Skriva ECTS-stig';

  @override
  String get validationCourseNameRequired => 'Navn er kravt';

  @override
  String get validationCourseNameTooLong => 'Navnið er ov langt';

  @override
  String get validationSessionCourseRequired => 'Vel eitt skeið';

  @override
  String get validationSessionDurationRequired => 'Skriva eina tíðarlongd';

  @override
  String get widgetNoProgress => 'Ongin framgongd enn';

  @override
  String get settingsLanguage => 'Mál';

  @override
  String get settingsLiquidGlass => 'Flótglas';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Frostglas-kort og strikur. Sløkt varðveitir tað klassiska einfalda útsjóndina.';

  @override
  String get settingsLiquidGlassOn => 'Kveikt';

  @override
  String get settingsLiquidGlassOff => 'Sløkt';

  @override
  String get settingsLiquidGlassUpdated => 'Flótglas dagført.';

  @override
  String get devToolsReminderPreview => 'Áminningarforhondskoðan';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Sígg, hvat hevði boðað frá beint nú. Windows-trygg royndarveiting.';

  @override
  String get reminderPreviewTitle => 'Áminningarforhondskoðan';

  @override
  String get reminderPreviewNow => 'Forhondskoðanartíð';

  @override
  String get reminderPreviewReset => 'Nú';

  @override
  String get reminderPreviewEmpty =>
      'Alt friðaligt — einki hevði boðað frá á hesum tíðarpunkti.';

  @override
  String get reminderPreviewCustom => 'Sergjørdar ætlanir (demo)';

  @override
  String get reminderPreviewNoFire => 'Einki kemur fram.';

  @override
  String get reminderKindDaily => 'Dagligt';

  @override
  String get reminderKindBehind => 'Aftaná';

  @override
  String get reminderKindDeadline => 'Freist';

  @override
  String get reminderKindOverdue => 'Yvirgongd';

  @override
  String get reminderKindStreak => 'Røð';

  @override
  String get reminderKindCustom => 'Sergjørt';

  @override
  String get settingsReminders => 'Lestraráminningar';

  @override
  String get settingsRemindersOff =>
      'Sløkt — tend fyri at fáa dagliga áminning.';

  @override
  String get settingsReminderTime => 'Áminningartíð';

  @override
  String get settingsReminderDenied =>
      'Tilkynningar eru forðaðar — loyvið teimum í skipanarinnstillingunum.';

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
    return '📚 Í kvøld: $duration fyri at halda Á veg';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course: $duration eftir í dag';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count aftrat)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Skráset eina løtu fyri at klára dagin.';
  }

  @override
  String notifBehindTitle(String course) {
    return '⚠️ $course er dottið Aftaná';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return '$left eftir, $days dagar eftir — $pace/dag herfrá. Skráset $catchUp fyri at verða Á veg aftur.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left eftir, $days dagar eftir — $pace/dag herfrá. Bert fulla $left liðugt tekur hetta burt — byrja í kvøld.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left er enn opið og freistin er her. Alt tú skrásetar nú telur.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course skal gerast í morgin og $left er enn opið';
  }

  @override
  String get notifDeadlineTomorrowBody =>
      'Alt tú skrásetar í dag telur tvífalt.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ $course próvtøka um $days dagar — $left eftir';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Tað er $pace/dag. Být tað sundur: 2 løtur um dagin vinna einum maraton.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Hvør tími tú skrásetar nú telur.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course hevur gloymt freistina við $left opið';
  }

  @override
  String get notifOverdueBody =>
      'Flyt freistina ella ger tímanar liðugt — skeiðið krevur ans, til tað er gjørt.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days-daga røð — $week hesa viku';
  }

  @override
  String get notifStreakBody => 'Øll skeiðini eru Á veg ella Undan. Væl gjørt.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Lestrarhugni: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Tíð at dagføra: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left opið · $pace/dag fyri at verða liðug í tíð. Skráset eina løtu fyri at dagføra framgongdina.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left er enn opið — alt tú skrásetar nú telur.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Næst: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1d';

  @override
  String get reminderPreviewFwdDay => '+1d';

  @override
  String get reminderPreviewFake => '(falskt)';

  @override
  String get reminderPreviewDemoLabel => 'Demo-hugni';
}
