// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Anulează';

  @override
  String get commonClose => 'Închide';

  @override
  String get commonDelete => 'Șterge';

  @override
  String get commonEdit => 'Editează';

  @override
  String get commonError => 'Eroare';

  @override
  String get commonNone => 'Niciunul';

  @override
  String get commonSave => 'Salvează';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Ore necesare (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Șterge termenul limită';

  @override
  String get courseFormClearStartTooltip => 'Șterge data de început';

  @override
  String get courseFormColorLabel => 'Culoare';

  @override
  String get courseFormDateNotSet => 'Nesetat';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Termen limită: $date';
  }

  @override
  String get courseFormEctsLabel => 'Credite ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nume';

  @override
  String get courseFormNotesLabel => 'Notițe (opțional)';

  @override
  String get courseFormSaving => 'Se salvează…';

  @override
  String courseFormStartButton(String date) {
    return 'Început: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Dezactivat: fără presiune până la $date; exclus din ritmul de azi.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Activat: timpul este împărțit până azi și contează pentru ritmul de azi.';

  @override
  String get courseFormStartEarlyTitle =>
      'Începe acum, deși startul e în viitor';

  @override
  String get courseFormTitleAdd => 'Adaugă curs';

  @override
  String get courseFormTitleEdit => 'Editează cursul';

  @override
  String get coursesAddTooltip => 'Adaugă curs';

  @override
  String coursesDeleteBody(String name) {
    return 'Ștergi „$name” și toate sesiunile de studiu? Această acțiune nu poate fi anulată.';
  }

  @override
  String get coursesDeleteTitle => 'Ștergi cursul?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Apasă „Curs nou” pentru a crea primul curs.';

  @override
  String get coursesEmptyTitle => 'Niciun curs deocamdată';

  @override
  String get coursesFilterAll => 'Toate stările';

  @override
  String get coursesFilterEmpty => 'Niciun curs nu corespunde acestui filtru';

  @override
  String get coursesNewCourse => 'Curs nou';

  @override
  String coursesPaceNeeded(String daily) {
    return 'necesar $daily h/zi';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return 'necesar $daily min/zi';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'necesar $daily h/zi • $weekly h/săpt.';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return 'necesar $daily min/zi • $weekly min/săpt.';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return 'necesar $daily min/zi • $weekly h/săpt.';
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
  String get coursesRemoveSampleTooltip => 'Elimină cursul exemplu';

  @override
  String coursesShownCount(String count) {
    return 'afișate: $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sortare: $label';
  }

  @override
  String get dashboardAllDone => 'Totul gata';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h înregistrate (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count curs(uri)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count curs(uri) · $upcoming viitoare în afara ritmului de azi';
  }

  @override
  String get dashboardCoursesTitle => 'Cursuri';

  @override
  String dashboardDeadline(String date) {
    return 'Termen $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Termen $date (au mai rămas $days zile)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Termen $date (a mai rămas 1 zi)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Termen $date (depășit)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Termen $date (azi)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'De făcut azi — $hours h înregistrate';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Fiecare curs este finalizat — vezi lista completă în fila Cursuri.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Adaugă un curs pentru a începe urmărirea progresului ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'În urmă = faci $achieved/zi, necesar $need/zi';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'În urmă = faci $achieved/zi, necesar $need/zi · start devreme';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'În urmă: niciun ritm finit nu ajunge la un termen de azi cu ore rămase';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'În grafic: încă niciun ritm — înregistrează prima sesiune pentru confirmare';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Începe în $days z · calculat din $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Începe în $days z · calculat din $date · start devreme activ';
  }

  @override
  String get dashboardFreshStart => 'START PROASPĂT';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · au mai rămas $hours h';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/zi';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/zi';
  }

  @override
  String get dashboardLogSessionAction => 'Înregistrează sesiune de studiu';

  @override
  String get dashboardLogSessionTooltip => 'Înregistrează sesiune de studiu';

  @override
  String get dashboardNewBadge => 'NOU';

  @override
  String get dashboardNoCourses => 'Niciun curs deocamdată';

  @override
  String get dashboardNoDeadline => 'Fără termen';

  @override
  String get dashboardNoDeadlines => 'Niciun termen programat';

  @override
  String get dashboardNoPaceDue => 'Nimic de făcut azi';

  @override
  String get dashboardNothingDue => 'Nimic de făcut';

  @override
  String get dashboardNothingToTrack => 'Nimic de urmărit deocamdată';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'De făcut azi — au mai rămas $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Necesar $daily h/zi pentru finalizare';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Necesar $daily min/zi pentru finalizare';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Necesar $daily h/zi · $weekly h/săpt. pentru finalizare';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Necesar $daily min/zi · $weekly min/săpt. pentru finalizare';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Necesar $daily min/zi · $weekly h/săpt. pentru finalizare';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Necesar $hours h/zi din $date · în afara ritmului de azi';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Necesar $minutes min/zi din $date · în afara ritmului de azi';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Fără termen — au mai rămas $hours h · fără presiune zilnică';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Începe $date · de făcut $hours h';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · nerealist';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint =>
      'Adaugă un curs pentru a începe urmărirea';

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
    return '$days zile de rezervă';
  }

  @override
  String get dashboardStartNotSet => 'Nesetat';

  @override
  String dashboardStartsIn(String days) {
    return 'Începe în $days z';
  }

  @override
  String get dashboardStartsSoon => 'Începe în curând';

  @override
  String get dashboardTipEmpty =>
      'Adaugă primul curs — ritmul zilnic și progresul vor apărea aici.';

  @override
  String get dashboardTipFirst =>
      'Primele 25 de minute contează cel mai mult — alege cursul cu termenul cel mai apropiat.';

  @override
  String get dashboardTodayBare => 'AZI';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'AZI $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'RITMUL DE AZI';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h azi';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Starturi viitoare — azi fără presiune, excluse din ritmul de azi.';

  @override
  String get dashboardUpcomingTitle => 'În curând';

  @override
  String get devToolsActivate => 'Activează';

  @override
  String get devToolsActivateMessage =>
      'Deblochează instrumentele ascunse de test de stres (generează date). Doar pentru dezvoltare.';

  @override
  String get devToolsActivateTitle => 'Activezi modul dev?';

  @override
  String get devToolsActivated => 'Modul dev a fost activat.';

  @override
  String get devToolsClearPumped => 'Șterge datele generate';

  @override
  String get devToolsClearPumpedMessage =>
      'Șterge cursurile STRESS generate și sesiunile lor. Datele tale sunt păstrate.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Șterge cursurile și sesiunile STRESS generate.';

  @override
  String get devToolsClearPumpedTitle => 'Ștergi datele generate?';

  @override
  String devToolsCleared(String count) {
    return 'Am șters $count curs(uri) generat(e).';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'A doua confirmare: va umfla cursurile, listele, graficele și calculele de ritm și poate dura câteva secunde. Generezi?';

  @override
  String get devToolsConfirmPumpTitle => 'Confirmă generarea de stres';

  @override
  String get devToolsContinue => 'Continuă';

  @override
  String get devToolsExit => 'Ieși din modul dev';

  @override
  String get devToolsExitSubtitle =>
      'Ascunde instrumentele dev pe acest dispozitiv.';

  @override
  String get devToolsPumpData => 'Generează date';

  @override
  String get devToolsPumpMessage =>
      'Inserează un semestru generat realist (~10 cursuri, ~800 sesiuni din ultimele 12 săptămâni). Datele existente sunt păstrate. Continui?';

  @override
  String get devToolsPumpSubtitle =>
      'Inserează un semestru generat (~10 cursuri, ~800 sesiuni, 12 săptămâni). Datele existente sunt păstrate.';

  @override
  String get devToolsPumpTile => 'Generează date de test';

  @override
  String get devToolsPumpTitle => 'Generezi date de test?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Am generat $courses cursuri, $sessions sesiuni.';
  }

  @override
  String get devToolsPumping => 'Se generează date de test…';

  @override
  String get devToolsRemoveAll => 'Elimină toate datele';

  @override
  String get devToolsRemoveAllMessage =>
      'Scurtătură dev: șterge definitiv TOATE cursurile, sesiunile și setările. Nu poate fi anulat.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Scurtătură dev: șterge TOATE cursurile, sesiunile și setările.';

  @override
  String get devToolsRemoveAllTitle => 'Elimini toate datele?';

  @override
  String get navCourses => 'Cursuri';

  @override
  String get navDashboard => 'Panou';

  @override
  String get navSettings => 'Setări';

  @override
  String get navStatistics => 'Statistici';

  @override
  String get navStudyLog => 'Jurnal de studiu';

  @override
  String get sampleBadge => 'Exemplu';

  @override
  String get sessionFormCourseLabel => 'Curs';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Durata trebuie să fie mai mare decât zero.';

  @override
  String get sessionFormHoursLabel => 'Ore';

  @override
  String get sessionFormLogAction => 'Înregistrează sesiunea';

  @override
  String get sessionFormMinutesLabel => 'Minute';

  @override
  String get sessionFormNoCourseError => 'Selectează un curs.';

  @override
  String get sessionFormNoCoursesHint =>
      'Adaugă mai întâi un curs pentru a înregistra o sesiune.';

  @override
  String get sessionFormNotesLabel => 'Notițe (opțional)';

  @override
  String get sessionFormSaving => 'Se salvează…';

  @override
  String get sessionFormTitleAdd => 'Înregistrează sesiune de studiu';

  @override
  String get sessionFormTitleEdit => 'Editează sesiunea de studiu';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total: $hours h';
  }

  @override
  String get settingsAccent => 'Culoare temă';

  @override
  String get settingsAccentBerry => 'Fructe de pădure';

  @override
  String get settingsAccentClay => 'Argilă';

  @override
  String get settingsAccentForest => 'Pădure';

  @override
  String get settingsAccentSlate => 'Ardezie';

  @override
  String get settingsAccentTeal => 'Turcoaz';

  @override
  String get settingsAccentUpdated => 'Culoarea temei a fost actualizată.';

  @override
  String get settingsAllDataDeleted => 'Toate datele au fost șterse.';

  @override
  String get settingsAppearance => 'Aspect (întunecat / luminos)';

  @override
  String get settingsCheckingSample => 'Se verifică datele exemplu…';

  @override
  String get settingsClear => 'Șterge';

  @override
  String get settingsClearSample => 'Șterge datele exemplu';

  @override
  String get settingsClearSampleMessage =>
      'Elimină cursurile și sesiunile exemplu. Cursurile sau sesiunile adăugate de tine nu sunt eliminate.';

  @override
  String get settingsClearSampleSubtitle =>
      'Elimină cursurile și sesiunile exemplu generate. Datele tale sunt păstrate.';

  @override
  String get settingsClearSampleTitle => 'Ștergi datele exemplu?';

  @override
  String get settingsCopy => 'Copiază';

  @override
  String get settingsDailyError => 'Introdu 0 sau un număr pozitiv de minute.';

  @override
  String get settingsDailyLabel => 'Minute pe zi (0 = fără obiectiv)';

  @override
  String get settingsDailyTarget => 'Obiectiv zilnic de studiu';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/zi';
  }

  @override
  String get settingsDailyUpdated => 'Obiectivul zilnic a fost actualizat.';

  @override
  String get settingsData => 'Date';

  @override
  String get settingsDeleteEverything => 'Șterge tot';

  @override
  String get settingsDevMode => 'Mod dev';

  @override
  String get settingsDisplay => 'Afișare';

  @override
  String get settingsDisplayComfortable => 'Confortabil';

  @override
  String get settingsDisplayCompact => 'Compact';

  @override
  String get settingsDisplayLarge => 'Mare';

  @override
  String get settingsDisplaySize => 'Dimensiune text și elemente';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated =>
      'Dimensiunea afișării a fost actualizată.';

  @override
  String get settingsExport => 'Exportă datele';

  @override
  String get settingsExportCopied => 'Exportul a fost copiat în clipboard.';

  @override
  String get settingsExportSubtitle =>
      'Copiază toate cursurile, sesiunile și setările ca JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses curs(uri) · $sessions sesiuni · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (trunchiat — copia completă are $kb KB, folosește Copiază pentru tot)';
  }

  @override
  String get settingsFirstWeekday => 'Prima zi a săptămânii';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Prima zi a săptămânii a fost actualizată.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (ține $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Ține apăsat pentru a înlocui tot';

  @override
  String get settingsHoursError => 'Introdu un număr mai mare decât zero.';

  @override
  String get settingsHoursHelper =>
      'Implicit 30. Modificarea recalculează cerințele; înregistrările sunt păstrate.';

  @override
  String get settingsHoursLabel => 'Ore per credit ECTS';

  @override
  String get settingsHoursPerEcts => 'Ore per ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Orele per ECTS au fost actualizate.';

  @override
  String get settingsImport => 'Importă date';

  @override
  String get settingsImportAppend => 'Adaugă';

  @override
  String get settingsImportAppendAction => 'Importă (adaugă)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Date adăugate: $courses curs(uri), $sessions sesiuni adăugate.';
  }

  @override
  String get settingsImportInfo =>
      'Adăugarea alătură copia la datele actuale (setările sunt păstrate). Înlocuirea șterge mai întâi TOATE cursurile, sesiunile și setările.';

  @override
  String get settingsImportLabel => 'Lipește JSON-ul exportat';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses curs(uri) · $sessions sesiuni';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · exportat $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · schemă v$schema';
  }

  @override
  String get settingsImportReplace => 'Înlocuiește';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Înlocuirea șterge mai întâi totul. Apasă și ȚINE APĂSAT butonul de mai jos timp de $seconds secunde pentru confirmare.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Date înlocuite: $courses curs(uri), $sessions sesiuni restaurate.';
  }

  @override
  String get settingsImportSubtitle =>
      'Înlocuiește toate datele dintr-o copie JSON exportată anterior.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Ține în continuare… $remaining s';
  }

  @override
  String get settingsNoSample => 'Fără date exemplu';

  @override
  String get settingsNoSampleSubtitle =>
      'Datele exemplu generate au fost deja șterse.';

  @override
  String get settingsNoTarget => 'Niciun obiectiv setat';

  @override
  String get settingsOverloadError => 'Introdu un număr 5–100 h/săpt.';

  @override
  String get settingsOverloadHelper =>
      'Săptămânile cu încărcare peste prag sunt marcate roșu. Studiul la zi este ~35–40 h/săpt.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Ore pe săptămână (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/săpt. marchează roșu';
  }

  @override
  String get settingsOverloadThreshold => 'Prag săptămânal de suprasolicitare';

  @override
  String get settingsOverloadUpdated =>
      'Pragul de suprasolicitare a fost actualizat.';

  @override
  String get settingsPaceTolerance => 'Toleranță înainte / în urmă';

  @override
  String get settingsPasteValidBackup => 'Lipește mai întâi o copie validă';

  @override
  String get settingsReset => 'Resetează';

  @override
  String get settingsResetAll => 'Resetează toate datele';

  @override
  String get settingsResetAllMessage =>
      'Șterge definitiv TOATE cursurile, sesiunile și setările. Nu poate fi anulat. Exportă mai întâi o copie dacă e nevoie.';

  @override
  String get settingsResetAllSubtitle =>
      'Șterge toate cursurile, sesiunile și setările.';

  @override
  String get settingsResetAllTitle => 'Resetezi toate datele?';

  @override
  String get settingsResetSettings => 'Resetează setările';

  @override
  String get settingsResetSettingsDone =>
      'Setările au fost resetate la implicite.';

  @override
  String get settingsResetSettingsMessage =>
      'Restabilește ore-per-ECTS (30), obiectiv zilnic (nimic), prima zi (luni), temă (sistem), toleranță (5 zile), suprasolicitare (35 h/săpt.), dimensiune (confortabil), culoare (ardezie). Cursurile și sesiunile sunt păstrate.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Restabilește implicite: 30 h/ECTS, fără obiectiv, luni, temă sistem, toleranță 5 zile, suprasolicitare 35 h/săpt., dimensiune confortabilă, culoare ardezie.';

  @override
  String get settingsResetSettingsTitle => 'Resetezi setările?';

  @override
  String get settingsSampleData => 'Date exemplu';

  @override
  String settingsSampleDataError(String error) {
    return 'Eroare: $error';
  }

  @override
  String get settingsStudySettings => 'Setări de studiu';

  @override
  String get settingsThemeDark => 'Întunecată';

  @override
  String get settingsThemeLight => 'Luminoasă';

  @override
  String get settingsThemeSystem => 'Sistem implicit';

  @override
  String get settingsThemeTitle => 'Temă';

  @override
  String get settingsThemeUpdated => 'Tema a fost actualizată.';

  @override
  String settingsToleranceDays(String value) {
    return '$value zile';
  }

  @override
  String get settingsToleranceError => 'Introdu un număr 0–30 zile.';

  @override
  String get settingsToleranceHelper =>
      'Înainte necesită +N zile surplus, în urmă −N zile. 5 = stabil, 0 = sensibil.';

  @override
  String get settingsToleranceLabel => 'Zile de lucru (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance de lucru';
  }

  @override
  String get settingsToleranceUpdated => 'Toleranța a fost actualizată.';

  @override
  String get settingsWeekdayFriday => 'Vineri';

  @override
  String get settingsWeekdayMonday => 'Luni';

  @override
  String get settingsWeekdaySaturday => 'Sâmbătă';

  @override
  String get settingsWeekdaySunday => 'Duminică';

  @override
  String get settingsWeekdayThursday => 'Joi';

  @override
  String get settingsWeekdayTuesday => 'Marți';

  @override
  String get settingsWeekdayWednesday => 'Miercuri';

  @override
  String get sortDeadline => 'Termen';

  @override
  String get sortName => 'Nume';

  @override
  String get sortProgress => 'Progres';

  @override
  String get sortStatus => 'Stare';

  @override
  String get startupTitle => 'Nu s-a putut porni ECTS Tracker';

  @override
  String get statsActiveDays => 'Zile active';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days z active';
  }

  @override
  String get statsAddDeadlines =>
      'Adaugă termene pentru a prognoza încărcarea.';

  @override
  String get statsComingLoad => 'Încărcare viitoare';

  @override
  String get statsConsistency => 'Consecvență';

  @override
  String get statsConsistencyHint =>
      'Zile de studiu în ultimele 30 de zile. Pașii mici zilnici bat toceala.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% din ultimele 30 de zile';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Cursul $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Făcut / zi (14 z)';

  @override
  String get statsEmpty => 'Nicio sesiune deocamdată';

  @override
  String get statsGap => 'Diferență';

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
  String get statsLast30Days => 'Ultimele 30 de zile';

  @override
  String get statsLast7Days => 'Ultimele 7 zile';

  @override
  String get statsNeedPerDay => 'Necesar / zi';

  @override
  String get statsNext8Weeks => 'Următoarele 8 săptămâni';

  @override
  String get statsOfLast30DaysVolume => 'din volumul ultimelor 30 de zile';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Săptămânile cu suprasolicitare >$threshold h sunt marcate roșu — mută un termen sau redu volumul.';
  }

  @override
  String get statsOverview => 'Prezentare';

  @override
  String get statsPaceCovers => 'Ritmul trecut acoperă necesarul. Ține ritmul.';

  @override
  String statsPaceShort(String gap) {
    return 'Ritmul trecut este cu $gap h/zi prea mic — adaugă un bloc sau redu volumul.';
  }

  @override
  String get statsPastVsNeeded => 'Trecut vs necesar';

  @override
  String statsPeakPerWeek(String peak) {
    return 'vârf $peak h/săpt.';
  }

  @override
  String get statsPerCourse => 'Per curs';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sesiuni';

  @override
  String statsSuggestedOrder(String order) {
    return 'Ordine sugerată: $order (mai întâi termenul cel mai apropiat)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'volum total';

  @override
  String get statusAhead => 'Înainte';

  @override
  String get statusBehind => 'În urmă';

  @override
  String get statusCompleted => 'Finalizat';

  @override
  String get statusOnTrack => 'În grafic';

  @override
  String get statusOverdue => 'Depășit';

  @override
  String get studyLogDeleteBody =>
      'Ștergi această sesiune de studiu? Nu poate fi anulat.';

  @override
  String get studyLogDeleteTitle => 'Ștergi sesiunea?';

  @override
  String get studyLogEmptyHint =>
      'Înregistrează o sesiune pentru a-ți urmări timpul de studiu.';

  @override
  String get studyLogEmptyTitle => 'Nicio sesiune de studiu deocamdată';

  @override
  String get studyLogFabLabel => 'Înregistrează sesiune';

  @override
  String get studyLogFabTooltip => 'Înregistrează sesiune';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Elimină sesiunea exemplu';

  @override
  String get studyLogThisWeek => 'Săptămâna aceasta';

  @override
  String get studyLogToday => 'Azi';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Cursul $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'ECTS trebuie să fie mai mare decât zero';

  @override
  String get validationCourseEctsRequired => 'Introdu creditele ECTS';

  @override
  String get validationCourseNameRequired => 'Numele este obligatoriu';

  @override
  String get validationCourseNameTooLong => 'Numele este prea lung';

  @override
  String get validationSessionCourseRequired => 'Selectează un curs';

  @override
  String get validationSessionDurationRequired => 'Introdu o durată';

  @override
  String get widgetNoProgress => 'Niciun progres deocamdată';

  @override
  String get settingsLanguage => 'Limbă';

  @override
  String get settingsLiquidGlass => 'Sticlă lichidă';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Carduri și bare din sticlă mată. Oprit păstrează aspectul clasic solid.';

  @override
  String get settingsLiquidGlassOn => 'Activat';

  @override
  String get settingsLiquidGlassOff => 'Dezactivat';

  @override
  String get settingsLiquidGlassUpdated => 'Sticla lichidă a fost actualizată.';

  @override
  String get devToolsReminderPreview => 'Previzualizare mementouri';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Vezi ce ar notifica chiar acum. Feed de test sigur pentru Windows.';

  @override
  String get reminderPreviewTitle => 'Previzualizare mementouri';

  @override
  String get reminderPreviewNow => 'Ora previzualizării';

  @override
  String get reminderPreviewReset => 'Acum';

  @override
  String get reminderPreviewEmpty =>
      'Totul liniștit — nimic nu ar notifica în acest moment.';

  @override
  String get reminderPreviewCustom => 'Programări personalizate (demo)';

  @override
  String get reminderPreviewNoFire => 'Nicio activare viitoare.';

  @override
  String get reminderKindDaily => 'Zilnic';

  @override
  String get reminderKindBehind => 'În urmă';

  @override
  String get reminderKindDeadline => 'Termen';

  @override
  String get reminderKindOverdue => 'Depășit';

  @override
  String get reminderKindStreak => 'Serie';

  @override
  String get reminderKindCustom => 'Personalizat';

  @override
  String get settingsReminders => 'Mementouri de studiu';

  @override
  String get settingsRemindersOff =>
      'Dezactivat — activează pentru un memento zilnic.';

  @override
  String get settingsReminderTime => 'Ora mementoului';

  @override
  String get settingsReminderDenied =>
      'Notificările sunt blocate — activează-le din setările de sistem.';
}
