// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Prekliči';

  @override
  String get commonClose => 'Zapri';

  @override
  String get commonDelete => 'Izbriši';

  @override
  String get commonEdit => 'Uredi';

  @override
  String get commonError => 'Napaka';

  @override
  String get commonNone => 'Brez';

  @override
  String get commonSave => 'Shrani';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Potrebne ure (samodejno): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Počisti rok';

  @override
  String get courseFormClearStartTooltip => 'Počisti začetni datum';

  @override
  String get courseFormColorLabel => 'Barva';

  @override
  String get courseFormDateNotSet => 'Ni nastavljeno';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Rok: $date';
  }

  @override
  String get courseFormEctsLabel => 'KT (ECTS)';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Ime';

  @override
  String get courseFormNotesLabel => 'Opombe (neobvezno)';

  @override
  String get courseFormSaving => 'Shranjevanje…';

  @override
  String courseFormStartButton(String date) {
    return 'Začetek: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Izklopljeno: brez pritiska do $date; izvzeto iz današnjega tempa.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Vklopljeno: čas se deli do zdaj in šteje k današnjemu tempu.';

  @override
  String get courseFormStartEarlyTitle =>
      'Začni zdaj kljub prihodnjemu začetku';

  @override
  String get courseFormTitleAdd => 'Dodaj predmet';

  @override
  String get courseFormTitleEdit => 'Uredi predmet';

  @override
  String get coursesAddTooltip => 'Dodaj predmet';

  @override
  String coursesDeleteBody(String name) {
    return 'Izbrisati »$name« in vsa njegova učna srečanja? Tega ni mogoče razveljaviti.';
  }

  @override
  String get coursesDeleteTitle => 'Izbrisati predmet?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Tapni »Nov predmet«, da ustvariš svoj prvi predmet.';

  @override
  String get coursesEmptyTitle => 'Ni predmetov';

  @override
  String get coursesFilterAll => 'Vsi statusi';

  @override
  String get coursesFilterEmpty => 'Noben predmet ne ustreza filtru';

  @override
  String get coursesNewCourse => 'Nov predmet';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily h/dan potrebno';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/dan potrebno';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily h/dan • $weekly h/teden potrebno';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/dan • $weekly min/teden potrebno';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/dan • $weekly h/teden potrebno';
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
  String get coursesRemoveSampleTooltip => 'Odstrani vzorčni predmet';

  @override
  String coursesShownCount(String count) {
    return '$count prikazanih';
  }

  @override
  String coursesSortOption(String label) {
    return 'Razvrsti: $label';
  }

  @override
  String get dashboardAllDone => 'Vse opravljeno';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h zabeleženo (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count predmetov';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count predmetov · $upcoming prihodnjih ni v današnjem tempu';
  }

  @override
  String get dashboardCoursesTitle => 'Predmeti';

  @override
  String dashboardDeadline(String date) {
    return 'Rok $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Rok $date (še $days dni)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Rok $date (še 1 dan)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Rok $date (zamujeno)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Rok $date (danes)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Danes zapade — zabeleženo $hours h';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Vsi predmeti so zaključeni — celoten seznam je v zavihku Predmeti.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Dodaj predmet, da začneš spremljati svoj ECTS-napredek.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Zaostanek = delaš $achieved/dan, potrebuješ $need/dan';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Zaostanek = delaš $achieved/dan, potrebuješ $need/dan · zgodnji začetek';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Zaostanek: noben končen tempo ne doseže današnjega roka s preostalimi urami';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Na dobri poti: tempa še ni — zabeleži prvo srečanje za potrditev';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Začne se čez $days d · šteto od $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Začne se čez $days d · šteto od $date · zgodnji začetek vklopljen';
  }

  @override
  String get dashboardFreshStart => 'NOV ZAČETEK';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct % · še $hours h';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/dan';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/dan';
  }

  @override
  String get dashboardLogSessionAction => 'Zabeleži učno srečanje';

  @override
  String get dashboardLogSessionTooltip => 'Zabeleži učno srečanje';

  @override
  String get dashboardNewBadge => 'NOVO';

  @override
  String get dashboardNoCourses => 'Ni predmetov';

  @override
  String get dashboardNoDeadline => 'Brez roka';

  @override
  String get dashboardNoDeadlines => 'Ni načrtovanih rokov';

  @override
  String get dashboardNoPaceDue => 'Danes ni predvidenega tempa';

  @override
  String get dashboardNothingDue => 'Ni zapadlega';

  @override
  String get dashboardNothingToTrack => 'Ni še ničesar za spremljanje';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Danes zapade — še $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Za dokončanje potrebuješ $daily h/dan';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Za dokončanje potrebuješ $daily min/dan';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Za dokončanje potrebuješ $daily h/dan · $weekly h/teden';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Za dokončanje potrebuješ $daily min/dan · $weekly min/teden';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Za dokončanje potrebuješ $daily min/dan · $weekly h/teden';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Potrebuješ $hours h/dan od $date · ni v današnjem tempu';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Potrebuješ $minutes min/dan od $date · ni v današnjem tempu';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Brez roka — še $hours h · brez dnevnega pritiska';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Začne se $date · še $hours h';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · nerealno';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Dodaj predmet, da začneš spremljati';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct %';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days dni zaloge';
  }

  @override
  String get dashboardStartNotSet => 'Ni nastavljeno';

  @override
  String dashboardStartsIn(String days) {
    return 'Začne se čez $days d';
  }

  @override
  String get dashboardStartsSoon => 'Začne se kmalu';

  @override
  String get dashboardTipEmpty =>
      'Dodaj svoj prvi predmet — tu se bosta prikazala dnevni tempo in napredek.';

  @override
  String get dashboardTipFirst =>
      'Prvih 25 min šteje največ — izberi predmet, ki najprej zapade.';

  @override
  String get dashboardTodayBare => 'DANES';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'DANES $pct %';
  }

  @override
  String get dashboardTodayPaceLabel => 'DANAŠNJI TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h danes';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Prihodnji začetki — danes brez pritiska, izvzeto iz današnjega tempa.';

  @override
  String get dashboardUpcomingTitle => 'Prihajajoče';

  @override
  String get devToolsActivate => 'Aktiviraj';

  @override
  String get devToolsActivateMessage =>
      'S tem odkleneš skrita orodja za obremenitveno testiranje (generiranje podatkov). Samo za razvoj.';

  @override
  String get devToolsActivateTitle => 'Aktivirati razvijalski način?';

  @override
  String get devToolsActivated => 'Razvijalski način aktiviran.';

  @override
  String get devToolsClearPumped => 'Počisti generirane podatke';

  @override
  String get devToolsClearPumpedMessage =>
      'Izbriše generirane STRESS predmete in njihova srečanja. Tvoji podatki se ohranijo.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Izbriši generirane STRESS predmete in srečanja.';

  @override
  String get devToolsClearPumpedTitle => 'Počistiti generirane podatke?';

  @override
  String devToolsCleared(String count) {
    return 'Počiščenih $count generiranih predmetov.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Druga potrditev: to bo napihnilo predmete, sezname, grafikone in izračune tempa ter lahko traja nekaj sekund. Generiram zdaj?';

  @override
  String get devToolsConfirmPumpTitle => 'Potrdi obremenitveno generiranje';

  @override
  String get devToolsContinue => 'Nadaljuj';

  @override
  String get devToolsExit => 'Izhod iz razvijalskega načina';

  @override
  String get devToolsExitSubtitle => 'Skrij razvijalska orodja na tej napravi.';

  @override
  String get devToolsPumpData => 'Generiraj podatke';

  @override
  String get devToolsPumpMessage =>
      'To vstavi realistično generiran semester (~10 predmetov, ~800 srečanj v zadnjih 12 tednih). Obstoječi podatki se ohranijo. Nadaljujem?';

  @override
  String get devToolsPumpSubtitle =>
      'Vstavi generiran semester (~10 predmetov, ~800 srečanj, 12 tednov). Obstoječi podatki se ohranijo.';

  @override
  String get devToolsPumpTile => 'Generiraj testne podatke';

  @override
  String get devToolsPumpTitle => 'Generirati testne podatke?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Generiranih $courses predmetov, $sessions srečanj.';
  }

  @override
  String get devToolsPumping => 'Generiranje testnih podatkov…';

  @override
  String get devToolsRemoveAll => 'Odstrani vse podatke';

  @override
  String get devToolsRemoveAllMessage =>
      'Razvijalska bližnjica: to trajno izbriše VSE predmete, srečanja in nastavitve. Tega ni mogoče razveljaviti.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Razvijalska bližnjica: izbriši VSE predmete, srečanja in nastavitve.';

  @override
  String get devToolsRemoveAllTitle => 'Odstraniti vse podatke?';

  @override
  String get navCourses => 'Predmeti';

  @override
  String get navDashboard => 'Nadzorna plošča';

  @override
  String get navSettings => 'Nastavitve';

  @override
  String get navStatistics => 'Statistika';

  @override
  String get navStudyLog => 'Dnevnik učenja';

  @override
  String get sampleBadge => 'Vzorec';

  @override
  String get sessionFormCourseLabel => 'Predmet';

  @override
  String sessionFormDateButton(String date) {
    return 'Datum: $date';
  }

  @override
  String get sessionFormDurationError => 'Trajanje mora biti večje od nič.';

  @override
  String get sessionFormHoursLabel => 'Ure';

  @override
  String get sessionFormLogAction => 'Zabeleži srečanje';

  @override
  String get sessionFormMinutesLabel => 'Minute';

  @override
  String get sessionFormModeManual => 'Ročno';

  @override
  String get sessionFormModeTimer => 'Časovnik';

  @override
  String get sessionFormNoCourseError => 'Izberi predmet.';

  @override
  String get sessionFormNoCoursesHint =>
      'Najprej dodaj predmet, da lahko zabeležiš srečanje.';

  @override
  String get sessionFormNotesLabel => 'Opombe (neobvezno)';

  @override
  String get sessionFormSaving => 'Shranjevanje…';

  @override
  String get sessionFormTitleAdd => 'Zabeleži učno srečanje';

  @override
  String get sessionFormTitleEdit => 'Uredi učno srečanje';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Skupaj: $hours h';
  }

  @override
  String get settingsAccent => 'Barva teme';

  @override
  String get settingsAccentBerry => 'Jagodna';

  @override
  String get settingsAccentClay => 'Glinena';

  @override
  String get settingsAccentForest => 'Gozdna';

  @override
  String get settingsAccentSlate => 'Skrilavčeva';

  @override
  String get settingsAccentTeal => 'Turkizna';

  @override
  String get settingsAccentUpdated => 'Barva teme posodobljena.';

  @override
  String get settingsAllDataDeleted => 'Vsi podatki izbrisani.';

  @override
  String get settingsAppearance => 'Videz (temen / svetel)';

  @override
  String get settingsCheckingSample => 'Preverjanje vzorčnih podatkov…';

  @override
  String get settingsClear => 'Počisti';

  @override
  String get settingsClearSample => 'Počisti vzorčne podatke';

  @override
  String get settingsClearSampleMessage =>
      'S tem odstraniš primere predmetov in srečanj. Predmetov ali srečanj, ki si jih dodal sam, ne odstrani.';

  @override
  String get settingsClearSampleSubtitle =>
      'Odstrani vnaprej pripravljene primere predmetov in srečanj. Tvoji podatki se ohranijo.';

  @override
  String get settingsClearSampleTitle => 'Počistiti vzorčne podatke?';

  @override
  String get settingsCopy => 'Kopiraj';

  @override
  String get settingsDailyError => 'Vnesi 0 ali pozitivno število minut.';

  @override
  String get settingsDailyLabel => 'Minut na dan (0 = brez cilja)';

  @override
  String get settingsDailyTarget => 'Dnevni učni cilj';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dan';
  }

  @override
  String get settingsDailyUpdated => 'Dnevni cilj posodobljen.';

  @override
  String get settingsData => 'Podatki';

  @override
  String get settingsDeleteEverything => 'Izbriši vse';

  @override
  String get settingsDevMode => 'Razvijalski način';

  @override
  String get settingsDisplay => 'Prikaz';

  @override
  String get settingsDisplayComfortable => 'Udobno';

  @override
  String get settingsDisplayCompact => 'Zgoščeno';

  @override
  String get settingsDisplayLarge => 'Veliko';

  @override
  String get settingsDisplaySize => 'Velikost besedila in elementov';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent %)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Velikost prikaza posodobljena.';

  @override
  String get settingsExport => 'Izvozi podatke';

  @override
  String get settingsExportCopied => 'Izvoz kopiran v odložišče.';

  @override
  String get settingsExportSubtitle =>
      'Kopiraj vse predmete, srečanja in nastavitve kot JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses predmetov · $sessions srečanj · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (skrajšano — celotna varnostna kopija je velika $kb KB, za vse uporabi Kopiraj)';
  }

  @override
  String get settingsFirstWeekday => 'Prvi dan v tednu';

  @override
  String get settingsFirstWeekdayUpdated => 'Prvi dan v tednu posodobljen.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (drži $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Drži za zamenjavo vsega';

  @override
  String get settingsHoursError => 'Vnesi število, večje od nič.';

  @override
  String get settingsHoursHelper =>
      'Privzeto 30. Sprememba preračuna zahteve; zapisi se ohranijo.';

  @override
  String get settingsHoursLabel => 'Ur na KT';

  @override
  String get settingsHoursPerEcts => 'Ur na ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Ure na ECTS posodobljene.';

  @override
  String get settingsImport => 'Uvozi podatke';

  @override
  String get settingsImportAppend => 'Dodaj';

  @override
  String get settingsImportAppendAction => 'Uvozi (dodaj)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Podatki dodani: $courses predmetov, $sessions srečanj dodanih.';
  }

  @override
  String get settingsImportInfo =>
      'Dodajanje doda varnostno kopijo k trenutnim podatkom (nastavitve se ohranijo). Zamenjava najprej izbriše VSE predmete, srečanja in nastavitve.';

  @override
  String get settingsImportLabel => 'Prilepi izvoženi JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses predmetov · $sessions srečanj';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · izvoženo $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · shema v$schema';
  }

  @override
  String get settingsImportReplace => 'Zamenjaj';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Zamenjava najprej izbriše vse. PRITISNI in DRŽI spodnji gumb $seconds sekund za potrditev.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Podatki zamenjani: $courses predmetov, $sessions srečanj obnovljenih.';
  }

  @override
  String get settingsImportSubtitle =>
      'Zamenjaj vse podatke iz predhodno izvožene varnostne kopije JSON.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Drži naprej… še $remaining s';
  }

  @override
  String get settingsNoSample => 'Ni vzorčnih podatkov';

  @override
  String get settingsNoSampleSubtitle =>
      'Vnaprej pripravljeni primeri so bili že počiščeni.';

  @override
  String get settingsNoTarget => 'Cilj ni nastavljen';

  @override
  String get settingsOverloadError => 'Vnesi število 5–100 h/teden.';

  @override
  String get settingsOverloadHelper =>
      'Tedni prihajajoče obremenitve nad tem se označijo rdeče. Redni študij je ~35–40 h/teden.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Ur na teden (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/teden označi rdeče';
  }

  @override
  String get settingsOverloadThreshold => 'Tedenski prag preobremenitve';

  @override
  String get settingsOverloadUpdated => 'Prag preobremenitve posodobljen.';

  @override
  String get settingsPaceTolerance => 'Toleranca prednosti / zaostanka';

  @override
  String get settingsPasteValidBackup =>
      'Najprej prilepi veljavno varnostno kopijo';

  @override
  String get settingsReset => 'Ponastavi';

  @override
  String get settingsResetAll => 'Ponastavi vse podatke';

  @override
  String get settingsResetAllMessage =>
      'S tem trajno izbrišeš VSE predmete, srečanja in nastavitve. Tega ni mogoče razveljaviti. Po potrebi najprej izvozi varnostno kopijo.';

  @override
  String get settingsResetAllSubtitle =>
      'Izbriši vse predmete, srečanja in nastavitve.';

  @override
  String get settingsResetAllTitle => 'Ponastaviti vse podatke?';

  @override
  String get settingsResetSettings => 'Ponastavi nastavitve';

  @override
  String get settingsResetSettingsDone =>
      'Nastavitve ponastavljene na privzete.';

  @override
  String get settingsResetSettingsMessage =>
      'Obnovi ure na ECTS (30), dnevni cilj (brez), prvi dan v tednu (ponedeljek), temo (sistemsko), toleranco (5 dni), preobremenitev (35 h/teden), velikost (udobno), barvo (skrilavčevo). Predmeti in srečanja se ohranijo.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Obnovi privzeto: 30 h/ECTS, brez cilja, ponedeljek, sistemska tema, 5-dnevna toleranca, 35 h/teden preobremenitev, udobna velikost, skrilavčeva barva.';

  @override
  String get settingsResetSettingsTitle => 'Ponastaviti nastavitve?';

  @override
  String get settingsSampleData => 'Vzorčni podatki';

  @override
  String settingsSampleDataError(String error) {
    return 'Napaka: $error';
  }

  @override
  String get settingsStudySettings => 'Nastavitve učenja';

  @override
  String get settingsThemeDark => 'Temna';

  @override
  String get settingsThemeLight => 'Svetla';

  @override
  String get settingsThemeSystem => 'Sistemsko privzeto';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema posodobljena.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dni';
  }

  @override
  String get settingsToleranceError => 'Vnesi število 0–30 dni.';

  @override
  String get settingsToleranceHelper =>
      'Prednost potrebuje +N dni presežka, zaostanek −N dni. 5 = stabilno, 0 = občutljivo.';

  @override
  String get settingsToleranceLabel => 'Dni dela (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance dela';
  }

  @override
  String get settingsToleranceUpdated => 'Toleranca posodobljena.';

  @override
  String get settingsWeekdayFriday => 'Petek';

  @override
  String get settingsWeekdayMonday => 'Ponedeljek';

  @override
  String get settingsWeekdaySaturday => 'Sobota';

  @override
  String get settingsWeekdaySunday => 'Nedelja';

  @override
  String get settingsWeekdayThursday => 'Četrtek';

  @override
  String get settingsWeekdayTuesday => 'Torek';

  @override
  String get settingsWeekdayWednesday => 'Sreda';

  @override
  String get sortDeadline => 'Rok';

  @override
  String get sortName => 'Ime';

  @override
  String get sortProgress => 'Napredek';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'ECTS Trackerja ni bilo mogoče zagnati';

  @override
  String get statsActiveDays => 'Aktivni dnevi';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d aktivno';
  }

  @override
  String get statsAddDeadlines => 'Dodaj roke za napoved obremenitve.';

  @override
  String get statsComingLoad => 'Prihajajoča obremenitev';

  @override
  String get statsConsistency => 'Rednost';

  @override
  String get statsConsistencyHint =>
      'Dnevi učenja v zadnjih 30 dneh. Majhni koraki vsak dan premagajo kampanjsko učenje.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent % zadnjih 30 dni';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Predmet $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'P$id';
  }

  @override
  String get statsDidPerDay => 'Narejeno / dan (14 d)';

  @override
  String get statsEmpty => 'Ni še srečanj';

  @override
  String get statsGap => 'Razlika';

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
  String get statsLast30Days => 'Zadnjih 30 dni';

  @override
  String get statsLast7Days => 'Zadnjih 7 dni';

  @override
  String get statsNeedPerDay => 'Potrebno / dan';

  @override
  String get statsNext8Weeks => 'Naslednjih 8 tednov';

  @override
  String get statsOfLast30DaysVolume => 'obsega zadnjih 30 dni';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Tedni preobremenitve > $threshold h označeni rdeče — premakni rok ali zmanjšaj obseg.';
  }

  @override
  String get statsOverview => 'Pregled';

  @override
  String get statsPaceCovers =>
      'Pretekli tempo pokrije potrebno. Nadaljuj z nizom.';

  @override
  String statsPaceShort(String gap) {
    return 'Pretekli tempo je $gap h/dan prekratek — dodaj blok ali zmanjšaj obseg.';
  }

  @override
  String get statsPastVsNeeded => 'Preteklo proti potrebnemu';

  @override
  String statsPeakPerWeek(String peak) {
    return 'vrh $peak h/ted';
  }

  @override
  String get statsPerCourse => 'Po predmetih';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent %';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent %';
  }

  @override
  String get statsSessions => 'Srečanja';

  @override
  String statsSuggestedOrder(String order) {
    return 'Predlagani vrstni red: $order (najprej najzgodnejši rok)';
  }

  @override
  String get statsTotal => 'Skupaj';

  @override
  String get statsTotalVolume => 'celoten obseg';

  @override
  String get statusAhead => 'V prednosti';

  @override
  String get statusBehind => 'V zaostanku';

  @override
  String get statusCompleted => 'Zaključeno';

  @override
  String get statusOnTrack => 'Na dobri poti';

  @override
  String get statusOverdue => 'Zamujeno';

  @override
  String get studyLogDeleteBody =>
      'Izbrisati to učno srečanje? Tega ni mogoče razveljaviti.';

  @override
  String get studyLogDeleteTitle => 'Izbrisati srečanje?';

  @override
  String get studyLogEmptyHint =>
      'Zabeleži srečanje, da spremljaš svoj učni čas.';

  @override
  String get studyLogEmptyTitle => 'Ni še učnih srečanj';

  @override
  String get studyLogFabLabel => 'Zabeleži srečanje';

  @override
  String get studyLogFabTooltip => 'Zabeleži srečanje';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Odstrani vzorčno srečanje';

  @override
  String get studyLogThisWeek => 'Ta teden';

  @override
  String get studyLogToday => 'Danes';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Predmet $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'P$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return 'Merjenje $course';
  }

  @override
  String get studyTimerAlreadyRunning =>
      'Časovnik že teče. Najprej ga končaj ali zavrzi.';

  @override
  String get studyTimerCourseLabel => 'Predmet';

  @override
  String get studyTimerDiscard => 'Zavrzi';

  @override
  String get studyTimerDiscardBody =>
      'Zavreči trenutni časovnik brez beleženja? Tega ni mogoče razveljaviti.';

  @override
  String get studyTimerDiscardTitle => 'Zavreči časovnik?';

  @override
  String studyTimerFinishLog(String minutes) {
    return 'Končaj & zabeleži $minutes min';
  }

  @override
  String get studyTimerNoCourseError => 'Izberi predmet.';

  @override
  String get studyTimerNoCoursesHint =>
      'Najprej dodaj predmet, da zaženeš časovnik.';

  @override
  String studyTimerNotifPaused(String elapsed) {
    return 'Zaustavljeno · $elapsed';
  }

  @override
  String get studyTimerNotifRunning => 'Tapni za odprtje časovnika';

  @override
  String get studyTimerPause => 'Zaustavi';

  @override
  String get studyTimerResume => 'Nadaljuj';

  @override
  String get studyTimerStart => 'Zaženi časovnik';

  @override
  String get studyTimerStartTitle => 'Zaženi učni časovnik';

  @override
  String get studyTimerTooShort => 'Časovnik še ni tekel.';

  @override
  String get validationCourseEctsPositive => 'ECTS mora biti večji od nič';

  @override
  String get validationCourseEctsRequired => 'Vnesi KT';

  @override
  String get validationCourseNameRequired => 'Ime je obvezno';

  @override
  String get validationCourseNameTooLong => 'Ime je predolgo';

  @override
  String get validationSessionCourseRequired => 'Izberi predmet';

  @override
  String get validationSessionDurationRequired => 'Vnesi trajanje';

  @override
  String get widgetNoProgress => 'Ni še napredka';

  @override
  String get settingsLanguage => 'Jezik';

  @override
  String get settingsLiquidGlass => 'Tekoče steklo';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Kartice in vrstice iz motnega stekla. Izklopljeno ohrani klasičen enobarven videz.';

  @override
  String get settingsLiquidGlassOn => 'Vklopljeno';

  @override
  String get settingsLiquidGlassOff => 'Izklopljeno';

  @override
  String get settingsLiquidGlassUpdated => 'Tekoče steklo posodobljeno.';

  @override
  String get devToolsReminderPreview => 'Predogled opomnikov';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Poglej, kaj bi se obvestilo prav zdaj. Testni vir, varen za Windows.';

  @override
  String get reminderPreviewTitle => 'Predogled opomnikov';

  @override
  String get reminderPreviewNow => 'Čas predogleda';

  @override
  String get reminderPreviewReset => 'Zdaj';

  @override
  String get reminderPreviewEmpty =>
      'Vse tiho — ob tem času se ne bi nič obvestilo.';

  @override
  String get reminderPreviewCustom => 'Razporedi po meri (predstavitev)';

  @override
  String get reminderPreviewNoFire => 'Ni prihajajočih sprožitev.';

  @override
  String get reminderKindDaily => 'Dnevni';

  @override
  String get reminderKindBehind => 'V zaostanku';

  @override
  String get reminderKindDeadline => 'Rok';

  @override
  String get reminderKindOverdue => 'Zamujeno';

  @override
  String get reminderKindStreak => 'Niz';

  @override
  String get reminderKindCustom => 'Po meri';

  @override
  String get settingsReminders => 'Učni opomniki';

  @override
  String get settingsRemindersOff => 'Izklopljeno — vklopi za dnevni opomnik.';

  @override
  String get settingsReminderTime => 'Čas opomnika';

  @override
  String get settingsReminderDenied =>
      'Obvestila so blokirana — omogoči jih v sistemskih nastavitvah.';

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
    return '📚 Nocoj: $duration, da ostaneš na dobri poti';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course danes še $duration';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count več)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Zabeleži srečanje in zaključi današnji dan.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course je zdrsnil v zaostanek';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return 'Še $left, $days dni do konca — od tu $pace/dan. Zabeleži $catchUp in si spet na dobri poti.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return 'Še $left, $days dni do konca — od tu $pace/dan. Pomaga le dokončanje celotnih $left — začni nocoj.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return 'Še $left je odprtih in rok je tu. Karkoli zdaj zabeležiš, šteje.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course je na vrsti jutri in še vedno manjka $left';
  }

  @override
  String get notifDeadlineTomorrowBody =>
      'Karkoli danes zabeležiš, šteje dvojno.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Izpit $course čez $days dni — še $left';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'To je $pace/dan. Razdeli: 2 srečanji na dan premagata en maraton.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace =>
      'Vsaka ura, ki jo zdaj zabeležiš, šteje.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course je zamudil rok, odprtih je še $left';
  }

  @override
  String get notifOverdueBody =>
      'Premakni rok ali dokončaj ure — predmet do takrat potrebuje pozornost.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days-dnevni niz — $week ta teden';
  }

  @override
  String get notifStreakBody =>
      'Vsi predmeti na dobri poti ali v prednosti. Kar tako naprej.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Učni pregled: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Čas za posodobitev: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left odprtih · $pace/dan za pravočasen zaključek. Zabeleži srečanje in posodobi napredek.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return 'Še $left je odprtih — karkoli zdaj zabeležiš, šteje.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Naslednji: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1d';

  @override
  String get reminderPreviewFwdDay => '+1d';

  @override
  String get reminderPreviewFake => '(lažno)';

  @override
  String get reminderPreviewDemoLabel => 'Predstavitveni pregled';

  @override
  String get notifChannelDailyName => 'Daily study nudge';

  @override
  String get notifChannelDailyDesc => 'The evening study plan summary.';

  @override
  String get notifChannelCourseName => 'Course alerts';

  @override
  String get notifChannelCourseDesc =>
      'Deadline countdowns and overdue escalations.';

  @override
  String get notifChannelTimerName => 'Study timer';

  @override
  String get notifChannelTimerDesc =>
      'The running study timer with pause/finish actions.';

  @override
  String get notifActionOpen => 'Open';

  @override
  String errorCourseNameLength(String max) {
    return 'Name must be 1 to $max characters.';
  }

  @override
  String get errorEctsPositive => 'ECTS credits must be greater than zero.';

  @override
  String get errorDeadlineOrder => 'Deadline must be after start date.';

  @override
  String get errorCourseNotFound => 'Course not found.';

  @override
  String get errorDurationPositive => 'Duration must be greater than zero.';

  @override
  String get errorHoursPositive => 'Hours per ECTS must be greater than zero.';

  @override
  String get errorDailyNegative => 'Daily target must not be negative.';

  @override
  String get errorFirstWeekday =>
      'First weekday must be between 1 (Monday) and 7 (Sunday).';

  @override
  String get errorToleranceRange => 'Tolerance must be between 0 and 30 days.';

  @override
  String get errorOverloadRange =>
      'Overload threshold must be between 5 and 100 h/week.';

  @override
  String get errorUnknownLanguage => 'Unknown language code.';

  @override
  String get errorReminderTime => 'Reminder time must be 0-1439 minutes.';

  @override
  String get errorReminderWarn => 'Deadline warning window must be 0-14 days.';

  @override
  String get errorTimerInvalid => 'Invalid timer state.';

  @override
  String get errorTimerNoActive => 'No active timer.';

  @override
  String get errorTimerAlreadyRunning => 'A timer is already running.';
}
