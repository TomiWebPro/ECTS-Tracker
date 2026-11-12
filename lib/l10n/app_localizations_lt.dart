// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Atšaukti';

  @override
  String get commonClose => 'Uždaryti';

  @override
  String get commonDelete => 'Ištrinti';

  @override
  String get commonEdit => 'Redaguoti';

  @override
  String get commonError => 'Klaida';

  @override
  String get commonNone => 'Nėra';

  @override
  String get commonSave => 'Išsaugoti';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Reikiamos valandos (automatiškai): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Išvalyti terminą';

  @override
  String get courseFormClearStartTooltip => 'Išvalyti pradžios datą';

  @override
  String get courseFormColorLabel => 'Spalva';

  @override
  String get courseFormDateNotSet => 'Nenustatyta';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Terminas: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS kreditai';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value v./ECTS';
  }

  @override
  String get courseFormNameLabel => 'Pavadinimas';

  @override
  String get courseFormNotesLabel => 'Pastabos (neprivaloma)';

  @override
  String get courseFormSaving => 'Išsaugoma…';

  @override
  String courseFormStartButton(String date) {
    return 'Pradžia: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Išjungta: jokio krūvio iki $date; neįtraukta į šiandienos tempą.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Įjungta: laikas paskirstomas iki šiol ir įskaičiuojamas į šiandienos tempą.';

  @override
  String get courseFormStartEarlyTitle =>
      'Pradėti dabar, nepaisant būsimos pradžios';

  @override
  String get courseFormTitleAdd => 'Pridėti kursą';

  @override
  String get courseFormTitleEdit => 'Redaguoti kursą';

  @override
  String get coursesAddTooltip => 'Pridėti kursą';

  @override
  String coursesDeleteBody(String name) {
    return 'Ištrinti „$name“ ir visas jo mokymosi sesijas? To anuliuoti negalima.';
  }

  @override
  String get coursesDeleteTitle => 'Ištrinti kursą?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Palieskite „Naujas kursas“, kad sukurtumėte pirmąjį kursą.';

  @override
  String get coursesEmptyTitle => 'Kursų dar nėra';

  @override
  String get coursesFilterAll => 'Visos būsenos';

  @override
  String get coursesFilterEmpty => 'Joks kursas neatitinka šio filtro';

  @override
  String get coursesNewCourse => 'Naujas kursas';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Reikia $daily v./d.';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/day needed';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Reikia $daily v./d. • $weekly v./sav.';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/day • $weekly min/week needed';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/day • $weekly h/week needed';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required v. • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Pašalinti pavyzdinį kursą';

  @override
  String coursesShownCount(String count) {
    return 'Rodoma: $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Rikiuoti: $label';
  }

  @override
  String get dashboardAllDone => 'Viskas atlikta';

  @override
  String dashboardBonusLogged(String hours) {
    return 'Užfiksuota $hours v. (bonusas)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kurs.';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kurs. · $upcoming būsimi neįtraukti į šiandienos tempą';
  }

  @override
  String get dashboardCoursesTitle => 'Kursai';

  @override
  String dashboardDeadline(String date) {
    return 'Terminas: $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Terminas $date (liko $days d.)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Terminas $date (liko 1 diena)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Terminas $date (pradelstas)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Terminas $date (šiandien)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Šiandien reikia — užfiksuota $hours v.';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Visi kursai baigti — visą sąrašą žr. skirtuke Kursai.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Pridėkite kursą, kad pradėtumėte sekti ECTS pažangą.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Atsilieka = daroma $achieved/d., reikia $need/d.';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Atsilieka = daroma $achieved/d., reikia $need/d. · ankstyva pradžia';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Atsilieka: joks baigtinis tempas nepasiekia šiandienos termino su likusiomis valandomis';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Gera kryptis: tempo dar nėra — užfiksuokite pirmą sesiją, kad patvirtintumėte';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Prasideda po $days d. · skaičiuojama nuo $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Prasideda po $days d. · skaičiuojama nuo $date · ankstyva pradžia įjungta';
  }

  @override
  String get dashboardFreshStart => 'NAUJA PRADŽIA';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · liko $hours v.';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required v.';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours v./d.';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/d';
  }

  @override
  String get dashboardLogSessionAction => 'Fiksuoti mokymosi sesiją';

  @override
  String get dashboardLogSessionTooltip => 'Fiksuoti mokymosi sesiją';

  @override
  String get dashboardNewBadge => 'NAUJA';

  @override
  String get dashboardNoCourses => 'Kursų dar nėra';

  @override
  String get dashboardNoDeadline => 'Be termino';

  @override
  String get dashboardNoDeadlines => 'Terminų nenumatyta';

  @override
  String get dashboardNoPaceDue => 'Šiandien tempo nėra';

  @override
  String get dashboardNothingDue => 'Nieko nereikia';

  @override
  String get dashboardNothingToTrack => 'Dar nėra ką sekti';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Šiandien reikia — liko $hours v.';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Norint baigti, reikia $daily v./d.';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Need $daily min/day to finish';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Norint baigti, reikia $daily v./d. · $weekly v./sav.';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Need $daily min/day · $weekly min/week to finish';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Need $daily min/day · $weekly h/week to finish';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Reikia $hours v./d. nuo $date · ne šiandienos tempe';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Need $minutes min/day from $date · not in Today’s pace';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Be termino — liko $hours v. · be kasdienio krūvio';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Prasideda $date · liko $hours v.';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · nerealu';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMA';

  @override
  String get dashboardProgramEmptyHint =>
      'Pridėkite kursą, kad pradėtumėte sekti';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required v.';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMA $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return 'Liko $days dienų atsargos';
  }

  @override
  String get dashboardStartNotSet => 'Nenustatyta';

  @override
  String dashboardStartsIn(String days) {
    return 'Prasideda po $days d.';
  }

  @override
  String get dashboardStartsSoon => 'Prasideda netrukus';

  @override
  String get dashboardTipEmpty =>
      'Pridėkite pirmąjį kursą — jūsų dienos tempas ir pažanga atsiras čia.';

  @override
  String get dashboardTipFirst =>
      'Pirmosios 25 min. svarbiausios — rinkitės kursą su artimiausiu terminu.';

  @override
  String get dashboardTodayBare => 'ŠIANDIEN';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace v.';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'ŠIANDIEN $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'ŠIANDIENOS TEMPAS';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Šiandien $logged / $pace v.';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Būsima pradžia — šiandien krūvio nėra, neįtraukta į šiandienos tempą.';

  @override
  String get dashboardUpcomingTitle => 'Būsimi';

  @override
  String get devToolsActivate => 'Suaktyvinti';

  @override
  String get devToolsActivateMessage =>
      'Tai atrakina paslėptus apkrovos testavimo įrankius (generuotų duomenų įterpimą). Tik kūrimui.';

  @override
  String get devToolsActivateTitle => 'Suaktyvinti kūrėjo režimą?';

  @override
  String get devToolsActivated => 'Kūrėjo režimas suaktyvintas.';

  @override
  String get devToolsClearPumped => 'Išvalyti sugeneruotus duomenis';

  @override
  String get devToolsClearPumpedMessage =>
      'Ištrina sugeneruotus STRESS kursus ir jų sesijas. Jūsų duomenys išsaugomi.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Ištrinti sugeneruotus STRESS kursus ir sesijas.';

  @override
  String get devToolsClearPumpedTitle => 'Išvalyti sugeneruotus duomenis?';

  @override
  String devToolsCleared(String count) {
    return 'Išvalyta $count sugeneruotų kursų.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Antras patvirtinimas: tai padidins kursus, sąrašus, diagramas ir tempo skaičiavimus ir gali užtrukti kelias sekundes. Įterpti dabar?';

  @override
  String get devToolsConfirmPumpTitle => 'Patvirtinti apkrovos įterpimą';

  @override
  String get devToolsContinue => 'Tęsti';

  @override
  String get devToolsExit => 'Išeiti iš kūrėjo režimo';

  @override
  String get devToolsExitSubtitle => 'Slėpti kūrėjo įrankius šiame įrenginyje.';

  @override
  String get devToolsPumpData => 'Įterpti duomenis';

  @override
  String get devToolsPumpMessage =>
      'Tai įterpia realistišką sugeneruotą semestrą (~10 kursų, ~800 sesijų per pastarąsias 12 savaičių). Esami duomenys išsaugomi. Tęsti?';

  @override
  String get devToolsPumpSubtitle =>
      'Įterpti sugeneruotą semestrą (~10 kursų, ~800 sesijų, 12 sav.). Esami duomenys išsaugomi.';

  @override
  String get devToolsPumpTile => 'Įterpti bandomuosius duomenis';

  @override
  String get devToolsPumpTitle => 'Įterpti bandomuosius duomenis?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Įterpta $courses kursų, $sessions sesijų.';
  }

  @override
  String get devToolsPumping => 'Įterpiami bandomieji duomenys…';

  @override
  String get devToolsRemoveAll => 'Pašalinti visus duomenis';

  @override
  String get devToolsRemoveAllMessage =>
      'Kūrėjo nuoroda: visam laikui ištrina VISUS kursus, sesijas ir nustatymus. To anuliuoti negalima.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Kūrėjo nuoroda: ištrinti VISUS kursus, sesijas ir nustatymus.';

  @override
  String get devToolsRemoveAllTitle => 'Pašalinti visus duomenis?';

  @override
  String get navCourses => 'Kursai';

  @override
  String get navDashboard => 'Skydelis';

  @override
  String get navSettings => 'Nustatymai';

  @override
  String get navStatistics => 'Statistika';

  @override
  String get navStudyLog => 'Mokymosi žurnalas';

  @override
  String get sampleBadge => 'Pavyzdys';

  @override
  String get sessionFormCourseLabel => 'Kursas';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError => 'Trukmė turi būti didesnė už nulį.';

  @override
  String get sessionFormHoursLabel => 'Valandos';

  @override
  String get sessionFormLogAction => 'Fiksuoti sesiją';

  @override
  String get sessionFormMinutesLabel => 'Minutės';

  @override
  String get sessionFormNoCourseError => 'Pasirinkite kursą.';

  @override
  String get sessionFormNoCoursesHint =>
      'Pirmiausia pridėkite kursą, kad fiksuotumėte sesiją.';

  @override
  String get sessionFormNotesLabel => 'Pastabos (neprivaloma)';

  @override
  String get sessionFormSaving => 'Išsaugoma…';

  @override
  String get sessionFormTitleAdd => 'Fiksuoti mokymosi sesiją';

  @override
  String get sessionFormTitleEdit => 'Redaguoti mokymosi sesiją';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Iš viso: $hours v.';
  }

  @override
  String get settingsAccent => 'Temos spalva';

  @override
  String get settingsAccentBerry => 'Uoga';

  @override
  String get settingsAccentClay => 'Molis';

  @override
  String get settingsAccentForest => 'Miškas';

  @override
  String get settingsAccentSlate => 'Šiferis';

  @override
  String get settingsAccentTeal => 'Žalsvai mėlyna';

  @override
  String get settingsAccentUpdated => 'Temos spalva atnaujinta.';

  @override
  String get settingsAllDataDeleted => 'Visi duomenys ištrinti.';

  @override
  String get settingsAppearance => 'Išvaizda (tamsi / šviesi)';

  @override
  String get settingsCheckingSample => 'Tikrinami pavyzdiniai duomenys…';

  @override
  String get settingsClear => 'Išvalyti';

  @override
  String get settingsClearSample => 'Išvalyti pavyzdinius duomenis';

  @override
  String get settingsClearSampleMessage =>
      'Tai pašalina pavyzdinius kursus ir sesijas. Kursai ar sesijos, kuriuos pridėjote patys, nepašalinami.';

  @override
  String get settingsClearSampleSubtitle =>
      'Pašalinti įkeltus pavyzdinius kursus ir sesijas. Jūsų duomenys išsaugomi.';

  @override
  String get settingsClearSampleTitle => 'Išvalyti pavyzdinius duomenis?';

  @override
  String get settingsCopy => 'Kopijuoti';

  @override
  String get settingsDailyError => 'Įveskite 0 arba teigiamą minučių skaičių.';

  @override
  String get settingsDailyLabel => 'Minutės per dieną (0 = be tikslo)';

  @override
  String get settingsDailyTarget => 'Kasdienis mokymosi tikslas';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min./d.';
  }

  @override
  String get settingsDailyUpdated => 'Kasdienis tikslas atnaujintas.';

  @override
  String get settingsData => 'Duomenys';

  @override
  String get settingsDeleteEverything => 'Ištrinti viską';

  @override
  String get settingsDevMode => 'Kūrėjo režimas';

  @override
  String get settingsDisplay => 'Rodymas';

  @override
  String get settingsDisplayComfortable => 'Patogus';

  @override
  String get settingsDisplayCompact => 'Kompaktiškas';

  @override
  String get settingsDisplayLarge => 'Didelis';

  @override
  String get settingsDisplaySize => 'Teksto ir elementų dydis';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Rodymo dydis atnaujintas.';

  @override
  String get settingsExport => 'Eksportuoti duomenis';

  @override
  String get settingsExportCopied => 'Eksportas nukopijuotas į iškarpinę.';

  @override
  String get settingsExportSubtitle =>
      'Kopijuoti visus kursus, sesijas ir nustatymus kaip JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kurs. · $sessions ses. · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (sutrumpinta — visa atsarginė kopija yra $kb KB, viskam naudokite Kopijuoti)';
  }

  @override
  String get settingsFirstWeekday => 'Pirma savaitės diena';

  @override
  String get settingsFirstWeekdayUpdated => 'Pirma savaitės diena atnaujinta.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s laikymas)';
  }

  @override
  String get settingsHoldToReplace => 'Laikykite, kad pakeistumėte viską';

  @override
  String get settingsHoursError => 'Įveskite skaičių, didesnį už nulį.';

  @override
  String get settingsHoursHelper =>
      'Numatyta 30. Pakeitus perskaičiuojami reikalavimai; įrašai išsaugomi.';

  @override
  String get settingsHoursLabel => 'Valandos vienam ECTS kreditui';

  @override
  String get settingsHoursPerEcts => 'Valandos vienam ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value v.';
  }

  @override
  String get settingsHoursUpdated => 'Valandos vienam ECTS atnaujintos.';

  @override
  String get settingsImport => 'Importuoti duomenis';

  @override
  String get settingsImportAppend => 'Pridėti';

  @override
  String get settingsImportAppendAction => 'Importuoti (pridėti)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Duomenys pridėti: pridėta $courses kursų, $sessions sesijų.';
  }

  @override
  String get settingsImportInfo =>
      'Pridėjimas prideda atsarginę kopiją šalia esamų duomenų (nustatymai išsaugomi). Pakeitimas pirmiausia ištrina VISUS kursus, sesijas ir nustatymus.';

  @override
  String get settingsImportLabel => 'Įklijuoti eksportuotą JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kurs. · $sessions ses.';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · eksportuota $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · schema v$schema';
  }

  @override
  String get settingsImportReplace => 'Pakeisti';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Pakeitimas pirmiausia viską ištrina. Paspauskite ir LAIKYKITE toliau esantį mygtuką $seconds sek., kad patvirtintumėte.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Duomenys pakeisti: atkurta $courses kursų, $sessions sesijų.';
  }

  @override
  String get settingsImportSubtitle =>
      'Pakeisti visus duomenis iš anksčiau eksportuotos JSON atsarginės kopijos.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Laikykite toliau… $remaining s';
  }

  @override
  String get settingsNoSample => 'Pavyzdinių duomenų nėra';

  @override
  String get settingsNoSampleSubtitle =>
      'Įkelti pavyzdiniai duomenys jau išvalyti.';

  @override
  String get settingsNoTarget => 'Tikslas nenustatytas';

  @override
  String get settingsOverloadError => 'Įveskite skaičių 5–100 v./sav.';

  @override
  String get settingsOverloadHelper =>
      'Būsimų krūvio savaičių, viršijančių tai, žymėjimas raudonai. Nuolatinės studijos yra ~35–40 v./sav.';

  @override
  String settingsOverloadHours(String value) {
    return '$value v.';
  }

  @override
  String get settingsOverloadLabel => 'Valandos per savaitę (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/sav. žymi raudonai';
  }

  @override
  String get settingsOverloadThreshold => 'Savaitės perkrovos slenkstis';

  @override
  String get settingsOverloadUpdated => 'Perkrovos slenkstis atnaujintas.';

  @override
  String get settingsPaceTolerance =>
      'Pirmaujančio / atsiliekančio tolerancija';

  @override
  String get settingsPasteValidBackup =>
      'Pirmiausia įklijuokite galiojančią atsarginę kopiją';

  @override
  String get settingsReset => 'Atstatyti';

  @override
  String get settingsResetAll => 'Atstatyti visus duomenis';

  @override
  String get settingsResetAllMessage =>
      'Tai visam laikui ištrina VISUS kursus, sesijas ir nustatymus. To anuliuoti negalima. Prireikus pirmiausia eksportuokite atsarginę kopiją.';

  @override
  String get settingsResetAllSubtitle =>
      'Ištrinti visus kursus, sesijas ir nustatymus.';

  @override
  String get settingsResetAllTitle => 'Atstatyti visus duomenis?';

  @override
  String get settingsResetSettings => 'Atstatyti nustatymus';

  @override
  String get settingsResetSettingsDone =>
      'Nustatymai atstatyti į numatytuosius.';

  @override
  String get settingsResetSettingsMessage =>
      'Atkuria valandas vienam ECTS (30), kasdienį tikslą (jokio), pirmą savaitės dieną (pirmadienis), temą (sistema), toleranciją (5 dienos), perkrovą (35 v./sav.), dydį (patogus), spalvą (šiferis). Kursai ir sesijos išsaugomi.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Atkurti numatytuosius: 30 v./ECTS, be tikslo, pirmadienis, sistemos tema, 5 dienų tolerancija, 35 v./sav. perkrova, patogus dydis, šiferis spalva.';

  @override
  String get settingsResetSettingsTitle => 'Atstatyti nustatymus?';

  @override
  String get settingsSampleData => 'Pavyzdiniai duomenys';

  @override
  String settingsSampleDataError(String error) {
    return 'Klaida: $error';
  }

  @override
  String get settingsStudySettings => 'Mokymosi nustatymai';

  @override
  String get settingsThemeDark => 'Tamsi';

  @override
  String get settingsThemeLight => 'Šviesi';

  @override
  String get settingsThemeSystem => 'Sistemos numatytoji';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema atnaujinta.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dienos';
  }

  @override
  String get settingsToleranceError => 'Įveskite skaičių 0–30 dienų.';

  @override
  String get settingsToleranceHelper =>
      'Pirmaujant reikia +N dienų atsargos, atsiliekant −N dienos. 5 = stabilu, 0 = jautru.';

  @override
  String get settingsToleranceLabel => 'Darbo dienos (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance darbo';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerancija atnaujinta.';

  @override
  String get settingsWeekdayFriday => 'Penktadienis';

  @override
  String get settingsWeekdayMonday => 'Pirmadienis';

  @override
  String get settingsWeekdaySaturday => 'Šeštadienis';

  @override
  String get settingsWeekdaySunday => 'Sekmadienis';

  @override
  String get settingsWeekdayThursday => 'Ketvirtadienis';

  @override
  String get settingsWeekdayTuesday => 'Antradienis';

  @override
  String get settingsWeekdayWednesday => 'Trečiadienis';

  @override
  String get sortDeadline => 'Terminas';

  @override
  String get sortName => 'Pavadinimas';

  @override
  String get sortProgress => 'Pažanga';

  @override
  String get sortStatus => 'Būsena';

  @override
  String get startupTitle => 'Nepavyko paleisti ECTS Tracker';

  @override
  String get statsActiveDays => 'Aktyvios dienos';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d. aktyvu';
  }

  @override
  String get statsAddDeadlines =>
      'Pridėkite terminus, kad prognozuotumėte krūvį.';

  @override
  String get statsComingLoad => 'Būsimas krūvis';

  @override
  String get statsConsistency => 'Nuoseklumas';

  @override
  String get statsConsistencyHint =>
      'Mokymosi dienos per pastarąsias 30 dienų. Maži žingsniai kasdien nugali kalimą.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% pastarųjų 30 dienų';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Kursas $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'K$id';
  }

  @override
  String get statsDidPerDay => 'Padaryta / d. (14 d.)';

  @override
  String get statsEmpty => 'Sesijų dar nėra';

  @override
  String get statsGap => 'Skirtumas';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value v.';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours v.';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours v.';
  }

  @override
  String get statsLast30Days => 'Pastarosios 30 dienų';

  @override
  String get statsLast7Days => 'Pastarosios 7 dienos';

  @override
  String get statsNeedPerDay => 'Reikia / d.';

  @override
  String get statsNext8Weeks => 'Kitos 8 savaitės';

  @override
  String get statsOfLast30DaysVolume => 'nuo pastarųjų 30 dienų apimties';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Perkrovos savaitės >$threshold v. pažymėtos raudonai — perkelkite terminą arba mažinkite apimtį.';
  }

  @override
  String get statsOverview => 'Apžvalga';

  @override
  String get statsPaceCovers =>
      'Ankstesnis tempas dengia reikiamą. Laikykitės ritmo.';

  @override
  String statsPaceShort(String gap) {
    return 'Ankstesnis tempas per mažas $gap v./d. — pridėkite bloką arba mažinkite apimtį.';
  }

  @override
  String get statsPastVsNeeded => 'Ankstesnis ir reikiamas';

  @override
  String statsPeakPerWeek(String peak) {
    return 'pikas $peak v./sav.';
  }

  @override
  String get statsPerCourse => 'Pagal kursus';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done v. / $required v. · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sesijos';

  @override
  String statsSuggestedOrder(String order) {
    return 'Siūloma tvarka: $order (pirmiausia artimiausias terminas)';
  }

  @override
  String get statsTotal => 'Iš viso';

  @override
  String get statsTotalVolume => 'bendra apimtis';

  @override
  String get statusAhead => 'Pirmauja';

  @override
  String get statusBehind => 'Atsilieka';

  @override
  String get statusCompleted => 'Baigtas';

  @override
  String get statusOnTrack => 'Gera kryptis';

  @override
  String get statusOverdue => 'Pradelstas';

  @override
  String get studyLogDeleteBody =>
      'Ištrinti šią mokymosi sesiją? To anuliuoti negalima.';

  @override
  String get studyLogDeleteTitle => 'Ištrinti sesiją?';

  @override
  String get studyLogEmptyHint =>
      'Fiksuokite sesiją, kad sektumėte mokymosi laiką.';

  @override
  String get studyLogEmptyTitle => 'Mokymosi sesijų dar nėra';

  @override
  String get studyLogFabLabel => 'Fiksuoti sesiją';

  @override
  String get studyLogFabTooltip => 'Fiksuoti sesiją';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours v.';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Pašalinti pavyzdinę sesiją';

  @override
  String get studyLogThisWeek => 'Šią savaitę';

  @override
  String get studyLogToday => 'Šiandien';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Kursas $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS turi būti didesnis už nulį';

  @override
  String get validationCourseEctsRequired => 'Įveskite ECTS kreditus';

  @override
  String get validationCourseNameRequired => 'Pavadinimas privalomas';

  @override
  String get validationCourseNameTooLong => 'Pavadinimas per ilgas';

  @override
  String get validationSessionCourseRequired => 'Pasirinkite kursą';

  @override
  String get validationSessionDurationRequired => 'Įveskite trukmę';

  @override
  String get widgetNoProgress => 'Pažangos dar nėra';

  @override
  String get settingsLanguage => 'Kalba';

  @override
  String get settingsLiquidGlass => 'Skystas stiklas';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Matinio stiklo kortelės ir juostos. Išjungta palieka klasikinį vientisą vaizdą.';

  @override
  String get settingsLiquidGlassOn => 'Įjungta';

  @override
  String get settingsLiquidGlassOff => 'Išjungta';

  @override
  String get settingsLiquidGlassUpdated => 'Skystas stiklas atnaujintas.';

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
  String get reminderKindDaily => 'Daily';

  @override
  String get reminderKindBehind => 'Behind';

  @override
  String get reminderKindDeadline => 'Deadline';

  @override
  String get reminderKindOverdue => 'Overdue';

  @override
  String get reminderKindStreak => 'Streak';

  @override
  String get reminderKindCustom => 'Custom';

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
