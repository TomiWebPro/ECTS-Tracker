// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Icelandic (`is`).
class AppLocalizationsIs extends AppLocalizations {
  AppLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Hætta við';

  @override
  String get commonClose => 'Loka';

  @override
  String get commonDelete => 'Eyða';

  @override
  String get commonEdit => 'Breyta';

  @override
  String get commonError => 'Villa';

  @override
  String get commonNone => 'Ekkert';

  @override
  String get commonSave => 'Vista';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Nauðsynlegir klukkutímar (sjálfvirkt): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Hreinsa skiladag';

  @override
  String get courseFormClearStartTooltip => 'Hreinsa upphafsdag';

  @override
  String get courseFormColorLabel => 'Litur';

  @override
  String get courseFormDateNotSet => 'Ekki stillt';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Skil: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS-einingar';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value klst/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Heiti';

  @override
  String get courseFormNotesLabel => 'Glósur (valfrjálst)';

  @override
  String get courseFormSaving => 'Vista…';

  @override
  String courseFormStartButton(String date) {
    return 'Upphaf: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Slökkt: engin pressa fyrr en $date; undanskilið frá hraða dagsins.';
  }

  @override
  String get courseFormStartEarlyOn => 'Kveikt: tímanum er skipt fram til nú og hann telst með hraða dagsins.';

  @override
  String get courseFormStartEarlyTitle => 'Byrja nú þrátt fyrir síðari upphafsdag';

  @override
  String get courseFormTitleAdd => 'Bæta við áfanga';

  @override
  String get courseFormTitleEdit => 'Breyta áfanga';

  @override
  String get coursesAddTooltip => 'Bæta við áfanga';

  @override
  String coursesDeleteBody(String name) {
    return 'Eyða „$name“ og öllum námslotum þess? Þetta er óafturkræft.';
  }

  @override
  String get coursesDeleteTitle => 'Eyða áfanga?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Smelltu á „Nýr áfangi“ til að búa til fyrsta áfangann.';

  @override
  String get coursesEmptyTitle => 'Engir áfangar ennþá';

  @override
  String get coursesFilterAll => 'Allar stöður';

  @override
  String get coursesFilterEmpty => 'Enginn áfangi passar við síuna';

  @override
  String get coursesNewCourse => 'Nýr áfangi';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily klst/dag þarf';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily mín/dag þarf';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily klst/dag • $weekly klst/viku þarf';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily mín/dag • $weekly mín/viku þarf';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily mín/dag • $weekly klst/viku þarf';
  }

  @override
  String coursesProgressWithStatus(String done, String required, String status) {
    return '$done / $required klst • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Fjarlægja sýnidæmi';

  @override
  String coursesShownCount(String count) {
    return '$count sýnd';
  }

  @override
  String coursesSortOption(String label) {
    return 'Röðun: $label';
  }

  @override
  String get dashboardAllDone => 'Allt tilbúið';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours klst skráðar (bónus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count áfangi/ar';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count áfangi/ar · $upcoming væntanlegir ekki í hraða dagsins';
  }

  @override
  String get dashboardCoursesTitle => 'Áfangar';

  @override
  String dashboardDeadline(String date) {
    return 'Skil $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Skil $date ($days dagar eftir)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Skil $date (1 dagur eftir)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Skil $date (of seint)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Skil $date (í dag)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Á döfinni í dag — $hours klst skráðar';
  }

  @override
  String get dashboardEmptyHintAllDone => 'Allir áfangar lokið — sjá flipann Áfangar fyrir fullan lista.';

  @override
  String get dashboardEmptyHintNoCourses => 'Bættu við áfanga til að fylgjast með ECTS-framvindu.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Eftir á = gerir $achieved/dag, þarf $need/dag';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Eftir á = gerir $achieved/dag, þarf $need/dag · snemmbyrjun';
  }

  @override
  String get dashboardExplainerBehindNoPace => 'Eftir á: enginn endanlegur hraði nær skiladegi dagsins með klukkutíma eftir';

  @override
  String get dashboardExplainerOnTrackNoPace => 'Á réttri leið: enginn hraði enn — skráðu fyrstu lotu til að staðfesta';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Byrjar eftir $days daga · talið frá $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Byrjar eftir $days daga · talið frá $date · snemmbyrjun kveikt';
  }

  @override
  String get dashboardFreshStart => 'NÝ BYRJUN';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · ${hours}klst eftir';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required klst';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours klst/dag';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes mín/dag';
  }

  @override
  String get dashboardLogSessionAction => 'Skrá námslotu';

  @override
  String get dashboardLogSessionTooltip => 'Skrá námslotu';

  @override
  String get dashboardNewBadge => 'NÝTT';

  @override
  String get dashboardNoCourses => 'Engir áfangar ennþá';

  @override
  String get dashboardNoDeadline => 'Engin skil';

  @override
  String get dashboardNoDeadlines => 'Engin skil á dagskrá';

  @override
  String get dashboardNoPaceDue => 'Enginn hraði á döfinni í dag';

  @override
  String get dashboardNothingDue => 'Ekkert á döfinni';

  @override
  String get dashboardNothingToTrack => 'Ekkert að fylgjast með ennþá';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Á döfinni í dag — ${hours}klst eftir';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Þarf $daily klst/dag til að klára';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Þarf $daily mín/dag til að klára';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Þarf $daily klst/dag · $weekly klst/viku til að klára';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Þarf $daily mín/dag · $weekly mín/viku til að klára';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Þarf $daily mín/dag · $weekly klst/viku til að klára';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Þarf $hours klst/dag frá $date · ekki í hraða dagsins';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Þarf $minutes mín/dag frá $date · ekki í hraða dagsins';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Engin skil — ${hours}klst eftir · engin dagleg pressa';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Byrjar $date · ${hours}klst að gera';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · óraunhæft';
  }

  @override
  String get dashboardProgramBare => 'NÁM';

  @override
  String get dashboardProgramEmptyHint => 'Bættu við áfanga til að byrja að fylgjast';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required klst';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'NÁM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days daga svigrúm';
  }

  @override
  String get dashboardStartNotSet => 'Ekki stillt';

  @override
  String dashboardStartsIn(String days) {
    return 'Byrjar eftir ${days}d';
  }

  @override
  String get dashboardStartsSoon => 'Byrjar bráðum';

  @override
  String get dashboardTipEmpty => 'Bættu við fyrsta áfanganum — daglegur hraði og framvinda birtast hér.';

  @override
  String get dashboardTipFirst => 'Fyrstu 25 mínúturnar skipta mestu — veldu áfangann sem fyrst er á döfinni.';

  @override
  String get dashboardTodayBare => 'Í DAG';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace klst';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'Í DAG $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'HRAÐI DAGSINS';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace klst í dag';
  }

  @override
  String get dashboardUpcomingSubtitle => 'Síðari upphafsdagar — engin pressa í dag, undanskilið frá hraða dagsins.';

  @override
  String get dashboardUpcomingTitle => 'Væntanlegt';

  @override
  String get devToolsActivate => 'Virkja';

  @override
  String get devToolsActivateMessage => 'Þetta opnar falin álagsprófunartól (býr til gögn). Aðeins til þróunar.';

  @override
  String get devToolsActivateTitle => 'Virkja þróunarham?';

  @override
  String get devToolsActivated => 'Þróunarhamur virkjaður.';

  @override
  String get devToolsClearPumped => 'Hreinsa búin gögn';

  @override
  String get devToolsClearPumpedMessage => 'Eyðir búnum STRESS-áföngum og lotum þeirra. Þín eigin gögn haldast.';

  @override
  String get devToolsClearPumpedSubtitle => 'Eyða búnum STRESS-áföngum og lotum.';

  @override
  String get devToolsClearPumpedTitle => 'Hreinsa búin gögn?';

  @override
  String devToolsCleared(String count) {
    return 'Hreinsaði $count búna áfanga.';
  }

  @override
  String get devToolsConfirmPumpMessage => 'Önnur staðfesting: þetta blæs upp áfanga, lista, gröf og hraðaútreikninga og getur tekið nokkrar sekúndur. Keyra núna?';

  @override
  String get devToolsConfirmPumpTitle => 'Staðfesta álagskeyrslu';

  @override
  String get devToolsContinue => 'Halda áfram';

  @override
  String get devToolsExit => 'Hætta þróunarham';

  @override
  String get devToolsExitSubtitle => 'Fela þróunartól á þessu tæki.';

  @override
  String get devToolsPumpData => 'Keyra gögn';

  @override
  String get devToolsPumpMessage => 'Þetta setur inn raunhæfa búna önn (~10 áfangar, ~800 lotur síðustu 12 vikur). Núverandi gögn haldast. Halda áfram?';

  @override
  String get devToolsPumpSubtitle => 'Setja inn búna önn (~10 áfangar, ~800 lotur, 12 vikur). Núverandi gögn haldast.';

  @override
  String get devToolsPumpTile => 'Keyra prófunargögn';

  @override
  String get devToolsPumpTitle => 'Keyra prófunargögn?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Bjó til $courses áfanga, $sessions lotur.';
  }

  @override
  String get devToolsPumping => 'Bý til prófunargögn…';

  @override
  String get devToolsRemoveAll => 'Fjarlægja öll gögn';

  @override
  String get devToolsRemoveAllMessage => 'Þróunarflýtileið: þetta eyðir VARANLEGA ÖLLUM áföngum, lotum og stillingum. Þetta er óafturkræft.';

  @override
  String get devToolsRemoveAllSubtitle => 'Þróunarflýtileið: eyða ÖLLUM áföngum, lotum og stillingum.';

  @override
  String get devToolsRemoveAllTitle => 'Fjarlægja öll gögn?';

  @override
  String get navCourses => 'Áfangar';

  @override
  String get navDashboard => 'Yfirlit';

  @override
  String get navSettings => 'Stillingar';

  @override
  String get navStatistics => 'Tölfræði';

  @override
  String get navStudyLog => 'Námsdagbók';

  @override
  String get sampleBadge => 'Sýnidæmi';

  @override
  String get sessionFormCourseLabel => 'Áfangi';

  @override
  String sessionFormDateButton(String date) {
    return 'Dagsetning: $date';
  }

  @override
  String get sessionFormDurationError => 'Lengd verður að vera meiri en núll.';

  @override
  String get sessionFormHoursLabel => 'Klukkutímar';

  @override
  String get sessionFormLogAction => 'Skrá lotu';

  @override
  String get sessionFormMinutesLabel => 'Mínútur';

  @override
  String get sessionFormModeManual => 'Manual';

  @override
  String get sessionFormModeTimer => 'Timer';

  @override
  String get sessionFormNoCourseError => 'Veldu áfanga.';

  @override
  String get sessionFormNoCoursesHint => 'Bættu fyrst við áfanga til að skrá lotu.';

  @override
  String get sessionFormNotesLabel => 'Glósur (valfrjálst)';

  @override
  String get sessionFormSaving => 'Vista…';

  @override
  String get sessionFormTitleAdd => 'Skrá námslotu';

  @override
  String get sessionFormTitleEdit => 'Breyta námslotu';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Samtals: $hours klst';
  }

  @override
  String get settingsAccent => 'Þemalitur';

  @override
  String get settingsAccentBerry => 'Ber';

  @override
  String get settingsAccentClay => 'Leir';

  @override
  String get settingsAccentForest => 'Skógur';

  @override
  String get settingsAccentSlate => 'Skífa';

  @override
  String get settingsAccentTeal => 'Blágrænn';

  @override
  String get settingsAccentUpdated => 'Þemalitur uppfærður.';

  @override
  String get settingsAllDataDeleted => 'Öllum gögnum eytt.';

  @override
  String get settingsAppearance => 'Útlit (dökkt / ljóst)';

  @override
  String get settingsCheckingSample => 'Athuga sýnidægögn…';

  @override
  String get settingsClear => 'Hreinsa';

  @override
  String get settingsClearSample => 'Hreinsa sýnidægögn';

  @override
  String get settingsClearSampleMessage => 'Þetta fjarlægir dæmaáfanga og lotur. Áfanga eða lotur sem þú bjóst til sjálfur eru ekki fjarlægðar.';

  @override
  String get settingsClearSampleSubtitle => 'Fjarlægja innbyggða dæmaáfanga og lotur. Þín eigin gögn haldast.';

  @override
  String get settingsClearSampleTitle => 'Hreinsa sýnidægögn?';

  @override
  String get settingsCopy => 'Afrita';

  @override
  String get settingsDailyError => 'Sláðu inn 0 eða jákvæðan fjölda mínútna.';

  @override
  String get settingsDailyLabel => 'Mínútur á dag (0 = ekkert markmið)';

  @override
  String get settingsDailyTarget => 'Daglegt námsmarkmið';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes mín/dag';
  }

  @override
  String get settingsDailyUpdated => 'Daglegt markmið uppfært.';

  @override
  String get settingsData => 'Gögn';

  @override
  String get settingsDeleteEverything => 'Eyða öllu';

  @override
  String get settingsDevMode => 'Þróunarhamur';

  @override
  String get settingsDisplay => 'Skjár';

  @override
  String get settingsDisplayComfortable => 'Þægilegt';

  @override
  String get settingsDisplayCompact => 'Þétt';

  @override
  String get settingsDisplayLarge => 'Stórt';

  @override
  String get settingsDisplaySize => 'Texta- og þáttastærð';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Skjástærð uppfærð.';

  @override
  String get settingsExport => 'Flytja út gögn';

  @override
  String get settingsExportCopied => 'Útflutningur afritaður á klippiborð.';

  @override
  String get settingsExportSubtitle => 'Afrita alla áfanga, lotur og stillingar sem JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses áfangi/ar · $sessions lotur · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (stytt — fullt afrit er $kb KB, notaðu Afrita fyrir allt)';
  }

  @override
  String get settingsFirstWeekday => 'Fyrsti dagur viku';

  @override
  String get settingsFirstWeekdayUpdated => 'Fyrsti dagur viku uppfærður.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (${seconds}s hald)';
  }

  @override
  String get settingsHoldToReplace => 'Haltu til að skipta öllu út';

  @override
  String get settingsHoursError => 'Sláðu inn tölu stærri en núll.';

  @override
  String get settingsHoursHelper => 'Sjálfgefið 30. Breyting endurreiknar kröfur; skráningar haldast.';

  @override
  String get settingsHoursLabel => 'Klukkutímar á ECTS-einingu';

  @override
  String get settingsHoursPerEcts => 'Klukkutímar á ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value klst';
  }

  @override
  String get settingsHoursUpdated => 'Klukkutímar á ECTS uppfærðir.';

  @override
  String get settingsImport => 'Flytja inn gögn';

  @override
  String get settingsImportAppend => 'Bæta við';

  @override
  String get settingsImportAppendAction => 'Flytja inn (bæta við)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Gögnum bætt við: $courses áfangi/ar, $sessions lotur bætt við.';
  }

  @override
  String get settingsImportInfo => 'Viðbót bætir afritinu við núverandi gögn (stillingar haldast). Skipti eyðir ÖLLUM áföngum, lotum og stillingum fyrst.';

  @override
  String get settingsImportLabel => 'Líma útflutt JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses áfangi/ar · $sessions lotur';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· flutt út $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· skema v$schema';
  }

  @override
  String get settingsImportReplace => 'Skipta út';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Skipti eyðir öllu fyrst. Ýttu og HALTU hnappinum hér að neðan í $seconds sekúndur til að staðfesta.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Gögn skipt út: $courses áfangi/ar, $sessions lotur endurheimtar.';
  }

  @override
  String get settingsImportSubtitle => 'Skipta öllum gögnum út frá áður útfluttu JSON-afriti.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Haltu áfram að halda… $remaining s';
  }

  @override
  String get settingsNoSample => 'Engin sýnidægögn';

  @override
  String get settingsNoSampleSubtitle => 'Innbyggð sýnidægögn hafa þegar verið hreinsuð.';

  @override
  String get settingsNoTarget => 'Ekkert markmið stillt';

  @override
  String get settingsOverloadError => 'Sláðu inn tölu 5–100 klst/viku.';

  @override
  String get settingsOverloadHelper => 'Vikur með álag yfir þessu eru merktar rauðar. Fullt nám er ~35–40 klst/viku.';

  @override
  String settingsOverloadHours(String value) {
    return '$value klst';
  }

  @override
  String get settingsOverloadLabel => 'Klukkutímar á viku (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/viku merkt rautt';
  }

  @override
  String get settingsOverloadThreshold => 'Vikulegur ofálagsþröskuldur';

  @override
  String get settingsOverloadUpdated => 'Ofálagsþröskuldur uppfærður.';

  @override
  String get settingsPaceTolerance => 'Fram-/eftirvik';

  @override
  String get settingsPasteValidBackup => 'Líma fyrst gilt afrit';

  @override
  String get settingsReset => 'Endurstilla';

  @override
  String get settingsResetAll => 'Endurstilla öll gögn';

  @override
  String get settingsResetAllMessage => 'Þetta eyðir VARANLEGA ÖLLUM áföngum, lotum og stillingum. Þetta er óafturkræft. Flyttu fyrst út afrit ef þarf.';

  @override
  String get settingsResetAllSubtitle => 'Eyða öllum áföngum, lotum og stillingum.';

  @override
  String get settingsResetAllTitle => 'Endurstilla öll gögn?';

  @override
  String get settingsResetSettings => 'Endurstilla stillingar';

  @override
  String get settingsResetSettingsDone => 'Stillingar endurstilltar á sjálfgefið.';

  @override
  String get settingsResetSettingsMessage => 'Endurheimtir klukkutíma á ECTS (30), daglegt markmið (ekkert), fyrsta virkan dag (mánudag), þema (kerfi), vikmörk (5 dagar), ofálag (35 klst/viku), stærð (þægilegt), lit (skífu). Áfangar og lotur haldast.';

  @override
  String get settingsResetSettingsSubtitle => 'Endurheimta sjálfgefið: 30 klst/ECTS, ekkert markmið, mánudagur, kerfisþema, 5 daga vikmörk, 35 klst/viku ofálag, þægileg stærð, skífa litur.';

  @override
  String get settingsResetSettingsTitle => 'Endurstilla stillingar?';

  @override
  String get settingsSampleData => 'Sýnidægögn';

  @override
  String settingsSampleDataError(String error) {
    return 'Villa: $error';
  }

  @override
  String get settingsStudySettings => 'Námsstillingar';

  @override
  String get settingsThemeDark => 'Dökkt';

  @override
  String get settingsThemeLight => 'Ljóst';

  @override
  String get settingsThemeSystem => 'Kerfissjálfgefið';

  @override
  String get settingsThemeTitle => 'Þema';

  @override
  String get settingsThemeUpdated => 'Þema uppfært.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dagar';
  }

  @override
  String get settingsToleranceError => 'Sláðu inn tölu 0–30 daga.';

  @override
  String get settingsToleranceHelper => 'Fram þarf +N daga umfram, eftir −N daga. 5 = stöðugt, 0 = viðkvæmt.';

  @override
  String get settingsToleranceLabel => 'Dagar vinnu (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance vinnu';
  }

  @override
  String get settingsToleranceUpdated => 'Vikmörk uppfærð.';

  @override
  String get settingsWeekdayFriday => 'Föstudagur';

  @override
  String get settingsWeekdayMonday => 'Mánudagur';

  @override
  String get settingsWeekdaySaturday => 'Laugardagur';

  @override
  String get settingsWeekdaySunday => 'Sunnudagur';

  @override
  String get settingsWeekdayThursday => 'Fimmtudagur';

  @override
  String get settingsWeekdayTuesday => 'Þriðjudagur';

  @override
  String get settingsWeekdayWednesday => 'Miðvikudagur';

  @override
  String get sortDeadline => 'Skil';

  @override
  String get sortName => 'Heiti';

  @override
  String get sortProgress => 'Framvinda';

  @override
  String get sortStatus => 'Staða';

  @override
  String get startupTitle => 'Gat ekki ræst ECTS Tracker';

  @override
  String get statsActiveDays => 'Virkir dagar';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}d virkir';
  }

  @override
  String get statsAddDeadlines => 'Bættu við skiladögum til að spá fyrir um álag.';

  @override
  String get statsComingLoad => 'Væntanlegt álag';

  @override
  String get statsConsistency => 'Samkvæmni';

  @override
  String get statsConsistencyHint => 'Námsdagar síðustu 30 daga. Lítil skref á hverjum degi vinna gegn troðningi.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% af síðustu 30 dögum';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Áfangi $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'Á$id';
  }

  @override
  String get statsDidPerDay => 'Gert / dag (14d)';

  @override
  String get statsEmpty => 'Engar lotur ennþá';

  @override
  String get statsGap => 'Bil';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value klst';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}klst';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours klst';
  }

  @override
  String get statsLast30Days => 'Síðustu 30 dagar';

  @override
  String get statsLast7Days => 'Síðustu 7 dagar';

  @override
  String get statsNeedPerDay => 'Þarf / dag';

  @override
  String get statsNext8Weeks => 'Næstu 8 vikur';

  @override
  String get statsOfLast30DaysVolume => 'af magni síðustu 30 daga';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Ofálagsvikur >${threshold}klst merktar rauðar — færðu skil eða minnkaðu umfang.';
  }

  @override
  String get statsOverview => 'Yfirlit';

  @override
  String get statsPaceCovers => 'Fyrri hraði dugar. Haltu áfram.';

  @override
  String statsPaceShort(String gap) {
    return 'Fyrri hraði er $gap klst/dag of lítill — bættu við kubb eða minnkaðu umfang.';
  }

  @override
  String get statsPastVsNeeded => 'Fyrra samanborið við þörf';

  @override
  String statsPeakPerWeek(String peak) {
    return 'hámark ${peak}klst/viku';
  }

  @override
  String get statsPerCourse => 'Á hvern áfanga';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done klst / $required klst · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Lotur';

  @override
  String statsSuggestedOrder(String order) {
    return 'Tillögð röð: $order (fyrstu skil fyrst)';
  }

  @override
  String get statsTotal => 'Samtals';

  @override
  String get statsTotalVolume => 'heildarmagn';

  @override
  String get statusAhead => 'Á undan';

  @override
  String get statusBehind => 'Eftir á';

  @override
  String get statusCompleted => 'Lokið';

  @override
  String get statusOnTrack => 'Á réttri leið';

  @override
  String get statusOverdue => 'Of seint';

  @override
  String get studyLogDeleteBody => 'Eyða þessari námslotu? Þetta er óafturkræft.';

  @override
  String get studyLogDeleteTitle => 'Eyða lotu?';

  @override
  String get studyLogEmptyHint => 'Skráðu lotu til að fylgjast með námstíma.';

  @override
  String get studyLogEmptyTitle => 'Engar námslotur ennþá';

  @override
  String get studyLogFabLabel => 'Skrá lotu';

  @override
  String get studyLogFabTooltip => 'Skrá lotu';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours klst';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Fjarlægja sýnilotu';

  @override
  String get studyLogThisWeek => 'Þessi vika';

  @override
  String get studyLogToday => 'Í dag';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Áfangi $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'Á$id';
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
  String get validationCourseEctsPositive => 'ECTS verður að vera meira en núll';

  @override
  String get validationCourseEctsRequired => 'Sláðu inn ECTS-einingar';

  @override
  String get validationCourseNameRequired => 'Heiti er skylt';

  @override
  String get validationCourseNameTooLong => 'Heiti er of langt';

  @override
  String get validationSessionCourseRequired => 'Veldu áfanga';

  @override
  String get validationSessionDurationRequired => 'Sláðu inn lengd';

  @override
  String get widgetNoProgress => 'Engin framvinda ennþá';

  @override
  String get settingsLanguage => 'Tungumál';

  @override
  String get settingsLiquidGlass => 'Fljótandi gler';

  @override
  String get settingsLiquidGlassSubtitle => 'Spjöld og stikur úr mattgleri. Slökkt heldur klassíska heila útlitinu.';

  @override
  String get settingsLiquidGlassOn => 'Kveikt';

  @override
  String get settingsLiquidGlassOff => 'Slökkt';

  @override
  String get settingsLiquidGlassUpdated => 'Fljótandi gler uppfært.';

  @override
  String get devToolsReminderPreview => 'Forskoðun áminningar';

  @override
  String get devToolsReminderPreviewSubtitle => 'Sjá hvað myndi tilkynna núna. Öruggur prófunarstraumur fyrir Windows.';

  @override
  String get reminderPreviewTitle => 'Forskoðun áminningar';

  @override
  String get reminderPreviewNow => 'Forskoðunartími';

  @override
  String get reminderPreviewReset => 'Núna';

  @override
  String get reminderPreviewEmpty => 'Allt hljótt — ekkert myndi tilkynna á þessum tíma.';

  @override
  String get reminderPreviewCustom => 'Sérsniðnar áætlanir (sýnidæmi)';

  @override
  String get reminderPreviewNoFire => 'Engin komandi tilkynning.';

  @override
  String get reminderKindDaily => 'Dagleg';

  @override
  String get reminderKindBehind => 'Eftir á';

  @override
  String get reminderKindDeadline => 'Skil';

  @override
  String get reminderKindOverdue => 'Of seint';

  @override
  String get reminderKindStreak => 'Sigurganga';

  @override
  String get reminderKindCustom => 'Sérsniðin';

  @override
  String get settingsReminders => 'Námsáminningar';

  @override
  String get settingsRemindersOff => 'Slökkt — kveiktu á daglegri áminningu.';

  @override
  String get settingsReminderTime => 'Tími áminningar';

  @override
  String get settingsReminderDenied => 'Tilkynningar eru læstar — kveiktu á þeim í kerfisstillingum.';

  @override
  String notifDurationHours(String value) {
    return '$value klst';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value mín';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Í kvöld: $duration til að halda þér á réttri leið';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course $duration eftir í dag';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count fleiri)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Skráðu lotu til að klára daginn.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course: staðan er Eftir á';
  }

  @override
  String notifBehindBodyPace(String left, String days, String pace, String catchUp) {
    return '$left eftir, $days dagar eftir — $pace/dag héðan. Skráðu $catchUp til að komast aftur á rétta leið.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left eftir, $days dagar eftir — $pace/dag héðan. Aðeins að klára allt $left dugar — byrjaðu í kvöld.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left eftir og skil eru í dag. Allt sem þú skráir núna gildir.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course er á skilum á morgun og á ennþá $left eftir';
  }

  @override
  String get notifDeadlineTomorrowBody => 'Allt sem þú skráir í dag gildir tvöfalt.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Prófið í $course er eftir $days daga — $left eftir';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Það er $pace/dag. Skiptu því: 2 lotur á dag vinna eitt maraton.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Sérhver klukkutími sem þú skráir núna gildir.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course fór framhjá skilum með $left eftir';
  }

  @override
  String get notifOverdueBody => 'Færðu skiladaginn eða kláraðu tímana — áfanginn þarfnast athygli þangað til.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days daga sigurganga — $week þessa viku';
  }

  @override
  String get notifStreakBody => 'Allir áfangar á réttri leið eða á undan. Vel gert.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Námsinnritun: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Tími til að uppfæra: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left eftir · $pace/dag til að klára í tíma. Skráðu lotu til að uppfæra framvinduna.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left ennþá eftir — allt sem þú skráir núna gildir.';
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
  String get reminderPreviewFake => '(sýndar)';

  @override
  String get reminderPreviewDemoLabel => 'Kynningarinnritun';
}
