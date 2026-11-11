// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get commonDelete => 'Usuń';

  @override
  String get commonEdit => 'Edytuj';

  @override
  String get commonError => 'Błąd';

  @override
  String get commonNone => 'Brak';

  @override
  String get commonSave => 'Zapisz';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Wymagane godziny (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Wyczyść termin';

  @override
  String get courseFormClearStartTooltip => 'Wyczyść datę rozpoczęcia';

  @override
  String get courseFormColorLabel => 'Kolor';

  @override
  String get courseFormDateNotSet => 'Nie ustawiono';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Termin: $date';
  }

  @override
  String get courseFormEctsLabel => 'Punkty ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nazwa';

  @override
  String get courseFormNotesLabel => 'Notatki (opcjonalnie)';

  @override
  String get courseFormSaving => 'Zapisywanie…';

  @override
  String courseFormStartButton(String date) {
    return 'Start: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Wył.: brak presji do $date; wykluczone z dzisiejszego tempa.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Wł.: czas jest dzielony do dziś i wlicza się do dzisiejszego tempa.';

  @override
  String get courseFormStartEarlyTitle =>
      'Zacznij teraz mimo przyszłego startu';

  @override
  String get courseFormTitleAdd => 'Dodaj kurs';

  @override
  String get courseFormTitleEdit => 'Edytuj kurs';

  @override
  String get coursesAddTooltip => 'Dodaj kurs';

  @override
  String coursesDeleteBody(String name) {
    return 'Usunąć „$name” i wszystkie jego sesje nauki? Tej operacji nie można cofnąć.';
  }

  @override
  String get coursesDeleteTitle => 'Usunąć kurs?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Dotknij „Nowy kurs”, aby utworzyć pierwszy kurs.';

  @override
  String get coursesEmptyTitle => 'Brak kursów';

  @override
  String get coursesFilterAll => 'Wszystkie statusy';

  @override
  String get coursesFilterEmpty => 'Żaden kurs nie pasuje do tego filtra';

  @override
  String get coursesNewCourse => 'Nowy kurs';

  @override
  String coursesPaceNeeded(String daily) {
    return 'potrzebne $daily h/dzień';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'potrzebne $daily h/dzień • $weekly h/tydzień';
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
  String get coursesRemoveSampleTooltip => 'Usuń przykładowy kurs';

  @override
  String coursesShownCount(String count) {
    return 'wyświetlono: $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sortowanie: $label';
  }

  @override
  String get dashboardAllDone => 'Wszystko gotowe';

  @override
  String dashboardBonusLogged(String hours) {
    return 'zapisano $hours h (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kurs(y)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kurs(y) · $upcoming nadchodzących poza dzisiejszym tempem';
  }

  @override
  String get dashboardCoursesTitle => 'Kursy';

  @override
  String dashboardDeadline(String date) {
    return 'Termin $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Termin $date (zostało $days dni)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Termin $date (został 1 dzień)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Termin $date (zaległy)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Termin $date (dziś)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Do zrobienia dziś — zapisano $hours h';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Wszystkie kursy ukończone — pełną listę znajdziesz w zakładce Kursy.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Dodaj kurs, aby zacząć śledzić postępy ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Opóźnienie = robisz $achieved/d, potrzeba $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Opóźnienie = robisz $achieved/d, potrzeba $need/d · wczesny start';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Opóźnienie: brak skończonego tempa, by zdążyć na dzisiejszy termin przy pozostałych godzinach';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Zgodnie z planem: brak tempa — zapisz pierwszą sesję, aby potwierdzić';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Start za $days d · liczone od $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Start za $days d · liczone od $date · wczesny start włączony';
  }

  @override
  String get dashboardFreshStart => 'NOWY START';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · zostało $hours h';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/dzień';
  }

  @override
  String get dashboardLogSessionAction => 'Zapisz sesję nauki';

  @override
  String get dashboardLogSessionTooltip => 'Zapisz sesję nauki';

  @override
  String get dashboardNewBadge => 'NOWE';

  @override
  String get dashboardNoCourses => 'Brak kursów';

  @override
  String get dashboardNoDeadline => 'Brak terminu';

  @override
  String get dashboardNoDeadlines => 'Brak zaplanowanych terminów';

  @override
  String get dashboardNoPaceDue => 'Dziś nic do nadrobienia';

  @override
  String get dashboardNothingDue => 'Nic do zrobienia';

  @override
  String get dashboardNothingToTrack => 'Brak danych do śledzenia';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Do zrobienia dziś — zostało $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Potrzeba $daily h/dzień, aby ukończyć';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Potrzeba $daily h/dzień · $weekly h/tydzień, aby ukończyć';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Potrzeba $hours h/dzień od $date · poza dzisiejszym tempem';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Brak terminu — zostało $hours h · brak dziennej presji';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Start $date · do zrobienia $hours h';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · nierealistyczne';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Dodaj kurs, aby zacząć śledzenie';

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
    return '$days dni zapasu';
  }

  @override
  String get dashboardStartNotSet => 'Nie ustawiono';

  @override
  String dashboardStartsIn(String days) {
    return 'Start za $days d';
  }

  @override
  String get dashboardStartsSoon => 'Zaczyna się wkrótce';

  @override
  String get dashboardTipEmpty =>
      'Dodaj pierwszy kurs — dzienne tempo i postępy pojawią się tutaj.';

  @override
  String get dashboardTipFirst =>
      'Pierwsze 25 minut liczy się najbardziej — wybierz kurs z najbliższym terminem.';

  @override
  String get dashboardTodayBare => 'DZIŚ';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'DZIŚ $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'DZISIEJSZE TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h dziś';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Przyszłe starty — dziś bez presji, wykluczone z dzisiejszego tempa.';

  @override
  String get dashboardUpcomingTitle => 'Nadchodzące';

  @override
  String get devToolsActivate => 'Aktywuj';

  @override
  String get devToolsActivateMessage =>
      'To odblokowuje ukryte narzędzia testów obciążeniowych (generowanie danych). Tylko do rozwoju.';

  @override
  String get devToolsActivateTitle => 'Aktywować tryb dewelopera?';

  @override
  String get devToolsActivated => 'Aktywowano tryb dewelopera.';

  @override
  String get devToolsClearPumped => 'Wyczyść wygenerowane dane';

  @override
  String get devToolsClearPumpedMessage =>
      'Usuwa wygenerowane kursy STRESS i ich sesje. Twoje dane zostają zachowane.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Usuń wygenerowane kursy STRESS i sesje.';

  @override
  String get devToolsClearPumpedTitle => 'Wyczyścić wygenerowane dane?';

  @override
  String devToolsCleared(String count) {
    return 'Wyczyszczono $count wygenerowanych kursów.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Drugie potwierdzenie: to zwiększy liczbę kursów, list, wykresów i obliczeń tempa i może potrwać kilka sekund. Generować?';

  @override
  String get devToolsConfirmPumpTitle => 'Potwierdź generowanie obciążenia';

  @override
  String get devToolsContinue => 'Kontynuuj';

  @override
  String get devToolsExit => 'Wyjdź z trybu dewelopera';

  @override
  String get devToolsExitSubtitle =>
      'Ukryj narzędzia deweloperskie na tym urządzeniu.';

  @override
  String get devToolsPumpData => 'Generuj dane';

  @override
  String get devToolsPumpMessage =>
      'To wstawia realistyczny wygenerowany semestr (~10 kursów, ~800 sesji z ostatnich 12 tygodni). Istniejące dane zostają zachowane. Kontynuować?';

  @override
  String get devToolsPumpSubtitle =>
      'Wstaw wygenerowany semestr (~10 kursów, ~800 sesji, 12 tygodni). Istniejące dane zachowane.';

  @override
  String get devToolsPumpTile => 'Generuj dane testowe';

  @override
  String get devToolsPumpTitle => 'Generować dane testowe?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Wygenerowano $courses kursów, $sessions sesji.';
  }

  @override
  String get devToolsPumping => 'Generowanie danych testowych…';

  @override
  String get devToolsRemoveAll => 'Usuń wszystkie dane';

  @override
  String get devToolsRemoveAllMessage =>
      'Skrót deweloperski: trwale usuwa WSZYSTKIE kursy, sesje i ustawienia. Tej operacji nie można cofnąć.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Skrót deweloperski: usuń WSZYSTKIE kursy, sesje i ustawienia.';

  @override
  String get devToolsRemoveAllTitle => 'Usunąć wszystkie dane?';

  @override
  String get navCourses => 'Kursy';

  @override
  String get navDashboard => 'Panel';

  @override
  String get navSettings => 'Ustawienia';

  @override
  String get navStatistics => 'Statystyki';

  @override
  String get navStudyLog => 'Dziennik nauki';

  @override
  String get sampleBadge => 'Próbka';

  @override
  String get sessionFormCourseLabel => 'Kurs';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Czas trwania musi być większy od zera.';

  @override
  String get sessionFormHoursLabel => 'Godziny';

  @override
  String get sessionFormLogAction => 'Zapisz sesję';

  @override
  String get sessionFormMinutesLabel => 'Minuty';

  @override
  String get sessionFormNoCourseError => 'Wybierz kurs.';

  @override
  String get sessionFormNoCoursesHint =>
      'Najpierw dodaj kurs, aby zapisać sesję.';

  @override
  String get sessionFormNotesLabel => 'Notatki (opcjonalnie)';

  @override
  String get sessionFormSaving => 'Zapisywanie…';

  @override
  String get sessionFormTitleAdd => 'Zapisz sesję nauki';

  @override
  String get sessionFormTitleEdit => 'Edytuj sesję nauki';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Razem: $hours h';
  }

  @override
  String get settingsAccent => 'Kolor motywu';

  @override
  String get settingsAccentBerry => 'Jagodowy';

  @override
  String get settingsAccentClay => 'Gliniany';

  @override
  String get settingsAccentForest => 'Leśny';

  @override
  String get settingsAccentSlate => 'Łupkowy';

  @override
  String get settingsAccentTeal => 'Morski';

  @override
  String get settingsAccentUpdated => 'Zaktualizowano kolor motywu.';

  @override
  String get settingsAllDataDeleted => 'Usunięto wszystkie dane.';

  @override
  String get settingsAppearance => 'Wygląd (ciemny / jasny)';

  @override
  String get settingsCheckingSample => 'Sprawdzanie danych przykładowych…';

  @override
  String get settingsClear => 'Wyczyść';

  @override
  String get settingsClearSample => 'Wyczyść dane przykładowe';

  @override
  String get settingsClearSampleMessage =>
      'Usuwa przykładowe kursy i sesje. Kursy i sesje dodane przez Ciebie nie zostaną usunięte.';

  @override
  String get settingsClearSampleSubtitle =>
      'Usuń przykładowe kursy i sesje. Twoje dane zostają zachowane.';

  @override
  String get settingsClearSampleTitle => 'Wyczyścić dane przykładowe?';

  @override
  String get settingsCopy => 'Kopiuj';

  @override
  String get settingsDailyError => 'Wpisz 0 lub dodatnią liczbę minut.';

  @override
  String get settingsDailyLabel => 'Minut dziennie (0 = brak celu)';

  @override
  String get settingsDailyTarget => 'Dzienny cel nauki';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dzień';
  }

  @override
  String get settingsDailyUpdated => 'Zaktualizowano dzienny cel.';

  @override
  String get settingsData => 'Dane';

  @override
  String get settingsDeleteEverything => 'Usuń wszystko';

  @override
  String get settingsDevMode => 'Tryb dewelopera';

  @override
  String get settingsDisplay => 'Wyświetlanie';

  @override
  String get settingsDisplayComfortable => 'Wygodny';

  @override
  String get settingsDisplayCompact => 'Kompaktowy';

  @override
  String get settingsDisplayLarge => 'Duży';

  @override
  String get settingsDisplaySize => 'Rozmiar tekstu i elementów';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated =>
      'Zaktualizowano rozmiar wyświetlania.';

  @override
  String get settingsExport => 'Eksportuj dane';

  @override
  String get settingsExportCopied => 'Eksport skopiowano do schowka.';

  @override
  String get settingsExportSubtitle =>
      'Skopiuj wszystkie kursy, sesje i ustawienia jako JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kurs(y) · $sessions sesji · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (obcięto — pełna kopia ma $kb KB, użyj Kopiuj, aby pobrać wszystko)';
  }

  @override
  String get settingsFirstWeekday => 'Pierwszy dzień tygodnia';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Zaktualizowano pierwszy dzień tygodnia.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (przytrzymaj $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Przytrzymaj, aby zastąpić wszystko';

  @override
  String get settingsHoursError => 'Wpisz liczbę większą od zera.';

  @override
  String get settingsHoursHelper =>
      'Domyślnie 30. Zmiana przelicza wymagania; zapisy zachowane.';

  @override
  String get settingsHoursLabel => 'Godziny na punkt ECTS';

  @override
  String get settingsHoursPerEcts => 'Godziny na ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Zaktualizowano godziny na ECTS.';

  @override
  String get settingsImport => 'Importuj dane';

  @override
  String get settingsImportAppend => 'Dołącz';

  @override
  String get settingsImportAppendAction => 'Importuj (dołącz)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Dołączono dane: dodano $courses kurs(y), $sessions sesji.';
  }

  @override
  String get settingsImportInfo =>
      'Dołączanie dodaje kopię do bieżących danych (ustawienia zachowane). Zastąpienie najpierw czyści WSZYSTKIE kursy, sesje i ustawienia.';

  @override
  String get settingsImportLabel => 'Wklej wyeksportowany JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kurs(y) · $sessions sesji';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · wyeksportowano $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · schemat v$schema';
  }

  @override
  String get settingsImportReplace => 'Zastąp';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Zastąpienie najpierw usuwa wszystko. Naciśnij i PRZYTRZYMAJ poniższy przycisk przez $seconds sekund, aby potwierdzić.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Zastąpiono dane: przywrócono $courses kurs(y), $sessions sesji.';
  }

  @override
  String get settingsImportSubtitle =>
      'Zastąp wszystkie dane z wcześniej wyeksportowanej kopii JSON.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Trzymaj dalej… $remaining s';
  }

  @override
  String get settingsNoSample => 'Brak danych przykładowych';

  @override
  String get settingsNoSampleSubtitle =>
      'Przykładowe dane zostały już wyczyszczone.';

  @override
  String get settingsNoTarget => 'Nie ustawiono celu';

  @override
  String get settingsOverloadError => 'Wpisz liczbę 5–100 h/tydzień.';

  @override
  String get settingsOverloadHelper =>
      'Tygodnie z większym obciążeniem są oznaczane na czerwono. Studia w pełnym wymiarze to ~35–40 h/tydzień.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Godziny tygodniowo (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/tydzień oznacza na czerwono';
  }

  @override
  String get settingsOverloadThreshold => 'Próg przeciążenia tygodniowego';

  @override
  String get settingsOverloadUpdated => 'Zaktualizowano próg przeciążenia.';

  @override
  String get settingsPaceTolerance => 'Tolerancja wyprzedzenia / opóźnienia';

  @override
  String get settingsPasteValidBackup =>
      'Najpierw wklej poprawną kopię zapasową';

  @override
  String get settingsReset => 'Resetuj';

  @override
  String get settingsResetAll => 'Resetuj wszystkie dane';

  @override
  String get settingsResetAllMessage =>
      'Trwale usuwa WSZYSTKIE kursy, sesje i ustawienia. Tej operacji nie można cofnąć. W razie potrzeby najpierw wyeksportuj kopię.';

  @override
  String get settingsResetAllSubtitle =>
      'Usuń wszystkie kursy, sesje i ustawienia.';

  @override
  String get settingsResetAllTitle => 'Zresetować wszystkie dane?';

  @override
  String get settingsResetSettings => 'Resetuj ustawienia';

  @override
  String get settingsResetSettingsDone => 'Przywrócono ustawienia domyślne.';

  @override
  String get settingsResetSettingsMessage =>
      'Przywraca godziny na ECTS (30), cel dzienny (brak), pierwszy dzień tygodnia (poniedziałek), motyw (systemowy), tolerancję (5 dni), przeciążenie (35 h/tydzień), rozmiar (wygodny), kolor (łupkowy). Kursy i sesje zostają zachowane.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Przywróć domyślne: 30 h/ECTS, brak celu, poniedziałek, motyw systemowy, tolerancja 5 dni, przeciążenie 35 h/tydzień, rozmiar wygodny, kolor łupkowy.';

  @override
  String get settingsResetSettingsTitle => 'Zresetować ustawienia?';

  @override
  String get settingsSampleData => 'Dane przykładowe';

  @override
  String settingsSampleDataError(String error) {
    return 'Błąd: $error';
  }

  @override
  String get settingsStudySettings => 'Ustawienia nauki';

  @override
  String get settingsThemeDark => 'Ciemny';

  @override
  String get settingsThemeLight => 'Jasny';

  @override
  String get settingsThemeSystem => 'Systemowy domyślny';

  @override
  String get settingsThemeTitle => 'Motyw';

  @override
  String get settingsThemeUpdated => 'Zaktualizowano motyw.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dni';
  }

  @override
  String get settingsToleranceError => 'Wpisz liczbę 0–30 dni.';

  @override
  String get settingsToleranceHelper =>
      'Wyprzedzenie wymaga +N dni zapasu, opóźnienie −N dni. 5 = stabilnie, 0 = czule.';

  @override
  String get settingsToleranceLabel => 'Dni pracy (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance pracy';
  }

  @override
  String get settingsToleranceUpdated => 'Zaktualizowano tolerancję.';

  @override
  String get settingsWeekdayFriday => 'Piątek';

  @override
  String get settingsWeekdayMonday => 'Poniedziałek';

  @override
  String get settingsWeekdaySaturday => 'Sobota';

  @override
  String get settingsWeekdaySunday => 'Niedziela';

  @override
  String get settingsWeekdayThursday => 'Czwartek';

  @override
  String get settingsWeekdayTuesday => 'Wtorek';

  @override
  String get settingsWeekdayWednesday => 'Środa';

  @override
  String get sortDeadline => 'Termin';

  @override
  String get sortName => 'Nazwa';

  @override
  String get sortProgress => 'Postęp';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'Nie można uruchomić ECTS Tracker';

  @override
  String get statsActiveDays => 'Dni aktywne';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d aktywności';
  }

  @override
  String get statsAddDeadlines => 'Dodaj terminy, aby prognozować obciążenie.';

  @override
  String get statsComingLoad => 'Nadchodzące obciążenie';

  @override
  String get statsConsistency => 'Systematyczność';

  @override
  String get statsConsistencyHint =>
      'Dni nauki w ostatnich 30 dniach. Małe kroki codziennie pokonują zakuwanie.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% ostatnich 30 dni';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Kurs $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'K$id';
  }

  @override
  String get statsDidPerDay => 'Zrobiono / dzień (14 d)';

  @override
  String get statsEmpty => 'Brak sesji';

  @override
  String get statsGap => 'Różnica';

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
  String get statsLast30Days => 'Ostatnie 30 dni';

  @override
  String get statsLast7Days => 'Ostatnie 7 dni';

  @override
  String get statsNeedPerDay => 'Potrzeba / dzień';

  @override
  String get statsNext8Weeks => 'Następne 8 tygodni';

  @override
  String get statsOfLast30DaysVolume => 'wolumenu z ostatnich 30 dni';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Tygodnie z przeciążeniem >$threshold h oznaczone na czerwono — przesuń termin lub ogranicz zakres.';
  }

  @override
  String get statsOverview => 'Przegląd';

  @override
  String get statsPaceCovers =>
      'Dotychczasowe tempo wystarcza. Utrzymaj passę.';

  @override
  String statsPaceShort(String gap) {
    return 'Dotychczasowe tempo to o $gap h/dzień za mało — dodaj blok lub ogranicz zakres.';
  }

  @override
  String get statsPastVsNeeded => 'Dotychczas vs potrzebne';

  @override
  String statsPeakPerWeek(String peak) {
    return 'szczyt $peak h/tydz.';
  }

  @override
  String get statsPerCourse => 'Na kurs';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sesje';

  @override
  String statsSuggestedOrder(String order) {
    return 'Sugerowana kolejność: $order (najpierw najwcześniejszy termin)';
  }

  @override
  String get statsTotal => 'Razem';

  @override
  String get statsTotalVolume => 'całkowity wolumen';

  @override
  String get statusAhead => 'Do przodu';

  @override
  String get statusBehind => 'Opóźniony';

  @override
  String get statusCompleted => 'Ukończony';

  @override
  String get statusOnTrack => 'Zgodnie z planem';

  @override
  String get statusOverdue => 'Zaległy';

  @override
  String get studyLogDeleteBody =>
      'Usunąć tę sesję nauki? Tej operacji nie można cofnąć.';

  @override
  String get studyLogDeleteTitle => 'Usunąć sesję?';

  @override
  String get studyLogEmptyHint => 'Zapisz sesję, aby śledzić czas nauki.';

  @override
  String get studyLogEmptyTitle => 'Brak sesji nauki';

  @override
  String get studyLogFabLabel => 'Zapisz sesję';

  @override
  String get studyLogFabTooltip => 'Zapisz sesję';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Usuń przykładową sesję';

  @override
  String get studyLogThisWeek => 'Ten tydzień';

  @override
  String get studyLogToday => 'Dziś';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Kurs $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS musi być większe od zera';

  @override
  String get validationCourseEctsRequired => 'Wpisz punkty ECTS';

  @override
  String get validationCourseNameRequired => 'Nazwa jest wymagana';

  @override
  String get validationCourseNameTooLong => 'Nazwa jest za długa';

  @override
  String get validationSessionCourseRequired => 'Wybierz kurs';

  @override
  String get validationSessionDurationRequired => 'Wpisz czas trwania';

  @override
  String get widgetNoProgress => 'Brak postępów';

  @override
  String get settingsLanguage => 'Język';

  @override
  String get settingsLiquidGlass => 'Płynne szkło';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Karty i paski z matowego szkła. Wył. zostawia klasyczny jednolity wygląd.';

  @override
  String get settingsLiquidGlassOn => 'Wł.';

  @override
  String get settingsLiquidGlassOff => 'Wył.';

  @override
  String get settingsLiquidGlassUpdated => 'Zaktualizowano płynne szkło.';

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
