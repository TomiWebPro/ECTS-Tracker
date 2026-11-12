// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbo-Croatian (`sh`).
class AppLocalizationsSh extends AppLocalizations {
  AppLocalizationsSh([String locale = 'sh']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Otkaži';

  @override
  String get commonClose => 'Zatvori';

  @override
  String get commonDelete => 'Obriši';

  @override
  String get commonEdit => 'Uredi';

  @override
  String get commonError => 'Greška';

  @override
  String get commonNone => 'Ništa';

  @override
  String get commonSave => 'Sačuvaj';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Potrebni sati (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Ukloni rok';

  @override
  String get courseFormClearStartTooltip => 'Ukloni datum početka';

  @override
  String get courseFormColorLabel => 'Boja';

  @override
  String get courseFormDateNotSet => 'Nije postavljeno';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Rok: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS bodovi';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Naziv';

  @override
  String get courseFormNotesLabel => 'Bilješke (opcionalno)';

  @override
  String get courseFormSaving => 'Čuvanje…';

  @override
  String courseFormStartButton(String date) {
    return 'Početak: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Isključeno: nema pritiska do $date; isključeno iz današnjeg tempa.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Uključeno: vrijeme se dijeli do sada i računa u današnji tempo.';

  @override
  String get courseFormStartEarlyTitle => 'Počni sada uprkos budućem početku';

  @override
  String get courseFormTitleAdd => 'Dodaj predmet';

  @override
  String get courseFormTitleEdit => 'Uredi predmet';

  @override
  String get coursesAddTooltip => 'Dodaj predmet';

  @override
  String coursesDeleteBody(String name) {
    return 'Obrisati «$name» i sve njegove sesije učenja? Ovo se ne može poništiti.';
  }

  @override
  String get coursesDeleteTitle => 'Obrisati predmet?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Dodirni «Novi predmet» da napraviš svoj prvi predmet.';

  @override
  String get coursesEmptyTitle => 'Još nema predmeta';

  @override
  String get coursesFilterAll => 'Svi statusi';

  @override
  String get coursesFilterEmpty => 'Nijedan predmet ne odgovara ovom filteru';

  @override
  String get coursesNewCourse => 'Novi predmet';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily h/dan potrebno';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/day needed';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily h/dan • $weekly h/sedmično potrebno';
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
    return '$done / $required h • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Ukloni primjer predmeta';

  @override
  String coursesShownCount(String count) {
    return '$count prikazano';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sortiranje: $label';
  }

  @override
  String get dashboardAllDone => 'Sve gotovo';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h upisano (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count predmet(a)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count predmet(a) · $upcoming budućih nije u današnjem tempu';
  }

  @override
  String get dashboardCoursesTitle => 'Predmeti';

  @override
  String dashboardDeadline(String date) {
    return 'Rok $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Rok $date (još $days dana)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Rok $date (još 1 dan)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Rok $date (prekoračen)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Rok $date (danas)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Danas na redu — $hours h upisano';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Svaki predmet je završen — vidi karticu Predmeti za cijeli spisak.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Dodaj predmet da počneš pratiti ECTS napredak.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Kasniš = radiš $achieved/d, treba $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Kasniš = radiš $achieved/d, treba $need/d · rani početak';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Kasniš: nema konačnog tempa koji stiže današnji rok sa satima koji ostaju';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Na pravom putu: još nema tempa — upiši prvu sesiju za potvrdu';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Počinje za $days d · računato od $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Počinje za $days d · računato od $date · rani početak uključen';
  }

  @override
  String get dashboardFreshStart => 'NOVI POČETAK';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · još $hours h';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/d';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/d';
  }

  @override
  String get dashboardLogSessionAction => 'Upiši sesiju učenja';

  @override
  String get dashboardLogSessionTooltip => 'Upiši sesiju učenja';

  @override
  String get dashboardNewBadge => 'NOVO';

  @override
  String get dashboardNoCourses => 'Još nema predmeta';

  @override
  String get dashboardNoDeadline => 'Nema roka';

  @override
  String get dashboardNoDeadlines => 'Nema zakazanih rokova';

  @override
  String get dashboardNoPaceDue => 'Danas ništa nije na redu';

  @override
  String get dashboardNothingDue => 'Ništa nije na redu';

  @override
  String get dashboardNothingToTrack => 'Još nema šta da se prati';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Danas na redu — još $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Treba $daily h/dan do kraja';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Need $daily min/day to finish';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Treba $daily h/dan · $weekly h/sedmično do kraja';
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
    return 'Treba $hours h/dan od $date · nije u današnjem tempu';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Need $minutes min/day from $date · not in Today’s pace';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Nema roka — još $hours h · nema dnevnog pritiska';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Počinje $date · $hours h za uraditi';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · nerealno';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Dodaj predmet da počneš pratiti';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return 'još $days dana prostora';
  }

  @override
  String get dashboardStartNotSet => 'Nije postavljeno';

  @override
  String dashboardStartsIn(String days) {
    return 'Počinje za $days d';
  }

  @override
  String get dashboardStartsSoon => 'Počinje uskoro';

  @override
  String get dashboardTipEmpty =>
      'Dodaj svoj prvi predmet — dnevni tempo i napredak će se pojaviti ovdje.';

  @override
  String get dashboardTipFirst =>
      'Prvih 25 minuta vrijedi najviše — izaberi predmet kojem je rok najbliži.';

  @override
  String get dashboardTodayBare => 'DANAS';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'DANAS $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'DANAŠNJI TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h danas';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Budući počeci — danas nema pritiska, isključeno iz današnjeg tempa.';

  @override
  String get dashboardUpcomingTitle => 'Dolazi';

  @override
  String get devToolsActivate => 'Aktiviraj';

  @override
  String get devToolsActivateMessage =>
      'Ovo otključava skrivene alate za stres-test (generisane podatke). Samo za razvoj.';

  @override
  String get devToolsActivateTitle => 'Aktivirati dev način?';

  @override
  String get devToolsActivated => 'Dev način aktiviran.';

  @override
  String get devToolsClearPumped => 'Obriši generisane podatke';

  @override
  String get devToolsClearPumpedMessage =>
      'Briše generisane STRESS predmete i njihove sesije. Tvoji podaci ostaju.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Obriši generisane STRESS predmete i sesije.';

  @override
  String get devToolsClearPumpedTitle => 'Obrisati generisane podatke?';

  @override
  String devToolsCleared(String count) {
    return 'Obrisano $count generisanih predmeta.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Druga potvrda: ovo će napuniti predmete, liste, grafikone i proračune tempa i može trajati nekoliko sekundi. Napuniti sada?';

  @override
  String get devToolsConfirmPumpTitle => 'Potvrdi stres-test';

  @override
  String get devToolsContinue => 'Nastavi';

  @override
  String get devToolsExit => 'Izađi iz dev načina';

  @override
  String get devToolsExitSubtitle => 'Sakrij dev alate na ovom uređaju.';

  @override
  String get devToolsPumpData => 'Napuni podatke';

  @override
  String get devToolsPumpMessage =>
      'Ovo ubacuje realističan generisani semestar (oko 10 predmeta, oko 800 sesija u zadnjih 12 sedmica). Postojeći podaci ostaju. Nastaviti?';

  @override
  String get devToolsPumpSubtitle =>
      'Ubaci generisani semestar (oko 10 predmeta, oko 800 sesija, 12 sedmica). Postojeći podaci ostaju.';

  @override
  String get devToolsPumpTile => 'Napuni test podatke';

  @override
  String get devToolsPumpTitle => 'Napuni test podatke?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Napunjeno $courses predmeta, $sessions sesija.';
  }

  @override
  String get devToolsPumping => 'Punjenje test podataka…';

  @override
  String get devToolsRemoveAll => 'Ukloni sve podatke';

  @override
  String get devToolsRemoveAllMessage =>
      'Dev prečica: ovo trajno briše SVE predmete, sesije i postavke. Ovo se ne može poništiti.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Dev prečica: obriši SVE predmete, sesije i postavke.';

  @override
  String get devToolsRemoveAllTitle => 'Ukloniti sve podatke?';

  @override
  String get navCourses => 'Predmeti';

  @override
  String get navDashboard => 'Komandna tabla';

  @override
  String get navSettings => 'Postavke';

  @override
  String get navStatistics => 'Statistika';

  @override
  String get navStudyLog => 'Dnevnik učenja';

  @override
  String get sampleBadge => 'Primjer';

  @override
  String get sessionFormCourseLabel => 'Predmet';

  @override
  String sessionFormDateButton(String date) {
    return 'Datum: $date';
  }

  @override
  String get sessionFormDurationError => 'Trajanje mora biti veće od nule.';

  @override
  String get sessionFormHoursLabel => 'Sati';

  @override
  String get sessionFormLogAction => 'Upiši sesiju';

  @override
  String get sessionFormMinutesLabel => 'Minute';

  @override
  String get sessionFormNoCourseError => 'Izaberi predmet.';

  @override
  String get sessionFormNoCoursesHint =>
      'Prvo dodaj predmet da bi upisao sesiju.';

  @override
  String get sessionFormNotesLabel => 'Bilješke (opcionalno)';

  @override
  String get sessionFormSaving => 'Čuvanje…';

  @override
  String get sessionFormTitleAdd => 'Upiši sesiju učenja';

  @override
  String get sessionFormTitleEdit => 'Uredi sesiju učenja';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Ukupno: $hours h';
  }

  @override
  String get settingsAccent => 'Boja teme';

  @override
  String get settingsAccentBerry => 'Bobičasta';

  @override
  String get settingsAccentClay => 'Glina';

  @override
  String get settingsAccentForest => 'Šuma';

  @override
  String get settingsAccentSlate => 'Škriljac';

  @override
  String get settingsAccentTeal => 'Tirkizna';

  @override
  String get settingsAccentUpdated => 'Boja teme ažurirana.';

  @override
  String get settingsAllDataDeleted => 'Svi podaci obrisani.';

  @override
  String get settingsAppearance => 'Izgled (tamno / svijetlo)';

  @override
  String get settingsCheckingSample => 'Provjera primjera podataka…';

  @override
  String get settingsClear => 'Obriši';

  @override
  String get settingsClearSample => 'Obriši primjere podataka';

  @override
  String get settingsClearSampleMessage =>
      'Ovo uklanja primjere predmeta i sesija. Predmete ili sesije koje si sam dodao ne uklanja.';

  @override
  String get settingsClearSampleSubtitle =>
      'Ukloni ubačene primjere predmeta i sesija. Tvoji podaci ostaju.';

  @override
  String get settingsClearSampleTitle => 'Obrisati primjere podataka?';

  @override
  String get settingsCopy => 'Kopiraj';

  @override
  String get settingsDailyError => 'Unesi 0 ili pozitivan broj minuta.';

  @override
  String get settingsDailyLabel => 'Minuta dnevno (0 = bez cilja)';

  @override
  String get settingsDailyTarget => 'Dnevni cilj učenja';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dan';
  }

  @override
  String get settingsDailyUpdated => 'Dnevni cilj ažuriran.';

  @override
  String get settingsData => 'Podaci';

  @override
  String get settingsDeleteEverything => 'Obriši sve';

  @override
  String get settingsDevMode => 'Dev način';

  @override
  String get settingsDisplay => 'Prikaz';

  @override
  String get settingsDisplayComfortable => 'Udobno';

  @override
  String get settingsDisplayCompact => 'Zbijeno';

  @override
  String get settingsDisplayLarge => 'Veliko';

  @override
  String get settingsDisplaySize => 'Veličina teksta i elemenata';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Veličina prikaza ažurirana.';

  @override
  String get settingsExport => 'Izvezi podatke';

  @override
  String get settingsExportCopied => 'Izvoz kopiran u clipboard.';

  @override
  String get settingsExportSubtitle =>
      'Kopiraj sve predmete, sesije i postavke kao JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses predmet(a) · $sessions sesija · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (skraćeno — puna rezervna kopija je $kb KB, koristi Kopiraj za sve)';
  }

  @override
  String get settingsFirstWeekday => 'Prvi dan sedmice';

  @override
  String get settingsFirstWeekdayUpdated => 'Prvi dan sedmice ažuriran.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s drži)';
  }

  @override
  String get settingsHoldToReplace => 'Drži da zamijeniš sve';

  @override
  String get settingsHoursError => 'Unesi broj veći od nule.';

  @override
  String get settingsHoursHelper =>
      'Standardno 30. Promjena preračunava zahtjeve; evidencija ostaje.';

  @override
  String get settingsHoursLabel => 'Sati po ECTS bodu';

  @override
  String get settingsHoursPerEcts => 'Sati po ECTS-u';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Sati po ECTS-u ažurirani.';

  @override
  String get settingsImport => 'Uvezi podatke';

  @override
  String get settingsImportAppend => 'Dodaj';

  @override
  String get settingsImportAppendAction => 'Uvezi (dodaj)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Podaci dodani: $courses predmet(a), $sessions sesija dodano.';
  }

  @override
  String get settingsImportInfo =>
      'Dodavanje dodaje rezervnu kopiju uz trenutne podatke (postavke ostaju). Zamjena prvo briše SVE predmete, sesije i postavke.';

  @override
  String get settingsImportLabel => 'Zalijepi izvezeni JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses predmet(a) · $sessions sesija';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · izvezeno $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · šema v$schema';
  }

  @override
  String get settingsImportReplace => 'Zamijeni';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Zamjena prvo sve briše. Pritisni i DRŽI dugme ispod $seconds sekundi za potvrdu.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Podaci zamijenjeni: $courses predmet(a), $sessions sesija vraćeno.';
  }

  @override
  String get settingsImportSubtitle =>
      'Zamijeni sve podatke iz ranije izvezene JSON rezervne kopije.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Samo drži… još $remaining s';
  }

  @override
  String get settingsNoSample => 'Nema primjera podataka';

  @override
  String get settingsNoSampleSubtitle =>
      'Ubačeni primjeri podataka su već obrisani.';

  @override
  String get settingsNoTarget => 'Nema postavljenog cilja';

  @override
  String get settingsOverloadError => 'Unesi broj 5–100 h/sedmično.';

  @override
  String get settingsOverloadHelper =>
      'Nadolazeće sedmice iznad ovoga označene su crveno. Redovan studij je oko 35–40 h/sedmično.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Sati sedmično (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/sedm. označeno crveno';
  }

  @override
  String get settingsOverloadThreshold => 'Sedmični prag preopterećenja';

  @override
  String get settingsOverloadUpdated => 'Prag preopterećenja ažuriran.';

  @override
  String get settingsPaceTolerance => 'Tolerancija ispred / iza';

  @override
  String get settingsPasteValidBackup => 'Prvo zalijepi važeću rezervnu kopiju';

  @override
  String get settingsReset => 'Resetuj';

  @override
  String get settingsResetAll => 'Resetuj sve podatke';

  @override
  String get settingsResetAllMessage =>
      'Ovo trajno briše SVE predmete, sesije i postavke. Ovo se ne može poništiti. Ako treba, prvo izvezi rezervnu kopiju.';

  @override
  String get settingsResetAllSubtitle =>
      'Obriši sve predmete, sesije i postavke.';

  @override
  String get settingsResetAllTitle => 'Resetovati sve podatke?';

  @override
  String get settingsResetSettings => 'Resetuj postavke';

  @override
  String get settingsResetSettingsDone => 'Postavke vraćene na standardne.';

  @override
  String get settingsResetSettingsMessage =>
      'Vraća sate po ECTS-u (30), dnevni cilj (ništa), prvi dan (ponedjeljak), temu (sistem), toleranciju (5 dana), preopterećenje (35 h/sedm.), veličinu (udobno), boju (škriljac). Predmeti i sesije ostaju.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Vrati standardno: 30 h/ECTS, bez cilja, ponedjeljak, tema sistema, tolerancija 5 dana, preopterećenje 35 h/sedm., udobna veličina, škriljac boja.';

  @override
  String get settingsResetSettingsTitle => 'Resetovati postavke?';

  @override
  String get settingsSampleData => 'Primjeri podataka';

  @override
  String settingsSampleDataError(String error) {
    return 'Greška: $error';
  }

  @override
  String get settingsStudySettings => 'Postavke učenja';

  @override
  String get settingsThemeDark => 'Tamna';

  @override
  String get settingsThemeLight => 'Svijetla';

  @override
  String get settingsThemeSystem => 'Sistemska';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema ažurirana.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dana';
  }

  @override
  String get settingsToleranceError => 'Unesi broj 0–30 dana.';

  @override
  String get settingsToleranceHelper =>
      'Ispred treba +N dana viška, iza −N dana. 5 = stabilno, 0 = osjetljivo.';

  @override
  String get settingsToleranceLabel => 'Dana rada (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance rada';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerancija ažurirana.';

  @override
  String get settingsWeekdayFriday => 'Petak';

  @override
  String get settingsWeekdayMonday => 'Ponedjeljak';

  @override
  String get settingsWeekdaySaturday => 'Subota';

  @override
  String get settingsWeekdaySunday => 'Nedjelja';

  @override
  String get settingsWeekdayThursday => 'Četvrtak';

  @override
  String get settingsWeekdayTuesday => 'Utorak';

  @override
  String get settingsWeekdayWednesday => 'Srijeda';

  @override
  String get sortDeadline => 'Rok';

  @override
  String get sortName => 'Naziv';

  @override
  String get sortProgress => 'Napredak';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'Ne mogu pokrenuti ECTS Tracker';

  @override
  String get statsActiveDays => 'Aktivni dani';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d aktivno';
  }

  @override
  String get statsAddDeadlines => 'Dodaj rokove da predvidiš opterećenje.';

  @override
  String get statsComingLoad => 'Dolazeće opterećenje';

  @override
  String get statsConsistency => 'Dosljednost';

  @override
  String get statsConsistencyHint =>
      'Dani učenja u zadnjih 30 dana. Mali koraci svaki dan pobjeđuju kampanjsko učenje.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% od zadnjih 30 dana';
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
  String get statsDidPerDay => 'Urađeno / dan (14 d)';

  @override
  String get statsEmpty => 'Još nema sesija';

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
  String get statsLast30Days => 'Zadnjih 30 dana';

  @override
  String get statsLast7Days => 'Zadnjih 7 dana';

  @override
  String get statsNeedPerDay => 'Treba / dan';

  @override
  String get statsNext8Weeks => 'Sljedećih 8 sedmica';

  @override
  String get statsOfLast30DaysVolume => 'od obima zadnjih 30 dana';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Sedmice preopterećenja >$threshold h označene crveno — pomjeri rok ili smanji obim.';
  }

  @override
  String get statsOverview => 'Pregled';

  @override
  String get statsPaceCovers =>
      'Dosadašnji tempo pokriva ono što treba. Nastavi niz.';

  @override
  String statsPaceShort(String gap) {
    return 'Dosadašnji tempo je $gap h/dan prekratak — dodaj blok ili smanji obim.';
  }

  @override
  String get statsPastVsNeeded => 'Dosadašnje naspram potrebnog';

  @override
  String statsPeakPerWeek(String peak) {
    return 'vrh $peak h/sedm.';
  }

  @override
  String get statsPerCourse => 'Po predmetu';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sesije';

  @override
  String statsSuggestedOrder(String order) {
    return 'Predloženi red: $order (najbliži rok prvo)';
  }

  @override
  String get statsTotal => 'Ukupno';

  @override
  String get statsTotalVolume => 'ukupni obim';

  @override
  String get statusAhead => 'Ispred';

  @override
  String get statusBehind => 'Kasni';

  @override
  String get statusCompleted => 'Završeno';

  @override
  String get statusOnTrack => 'Na pravom putu';

  @override
  String get statusOverdue => 'Prekoračeno';

  @override
  String get studyLogDeleteBody =>
      'Obrisati ovu sesiju učenja? Ovo se ne može poništiti.';

  @override
  String get studyLogDeleteTitle => 'Obrisati sesiju?';

  @override
  String get studyLogEmptyHint => 'Upiši sesiju da pratiš vrijeme učenja.';

  @override
  String get studyLogEmptyTitle => 'Još nema sesija učenja';

  @override
  String get studyLogFabLabel => 'Upiši sesiju';

  @override
  String get studyLogFabTooltip => 'Upiši sesiju';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Ukloni primjer sesije';

  @override
  String get studyLogThisWeek => 'Ove sedmice';

  @override
  String get studyLogToday => 'Danas';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Predmet $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'P$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS mora biti veći od nule';

  @override
  String get validationCourseEctsRequired => 'Unesi ECTS bodove';

  @override
  String get validationCourseNameRequired => 'Naziv je obavezan';

  @override
  String get validationCourseNameTooLong => 'Naziv je predugačak';

  @override
  String get validationSessionCourseRequired => 'Izaberi predmet';

  @override
  String get validationSessionDurationRequired => 'Unesi trajanje';

  @override
  String get widgetNoProgress => 'Još nema napretka';

  @override
  String get settingsLanguage => 'Jezik';

  @override
  String get settingsLiquidGlass => 'Tečno staklo';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Kartice i trake od mat stakla. Isključeno zadržava klasični puni izgled.';

  @override
  String get settingsLiquidGlassOn => 'Uključeno';

  @override
  String get settingsLiquidGlassOff => 'Isključeno';

  @override
  String get settingsLiquidGlassUpdated => 'Tečno staklo ažurirano.';

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
