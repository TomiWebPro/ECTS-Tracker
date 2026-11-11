// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonClose => 'Schließen';

  @override
  String get commonDelete => 'Löschen';

  @override
  String get commonEdit => 'Bearbeiten';

  @override
  String get commonError => 'Fehler';

  @override
  String get commonNone => 'Keine';

  @override
  String get commonSave => 'Speichern';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Erforderliche Stunden (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Frist löschen';

  @override
  String get courseFormClearStartTooltip => 'Startdatum löschen';

  @override
  String get courseFormColorLabel => 'Farbe';

  @override
  String get courseFormDateNotSet => 'Nicht festgelegt';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Frist: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS-Punkte';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Name';

  @override
  String get courseFormNotesLabel => 'Notizen (optional)';

  @override
  String get courseFormSaving => 'Wird gespeichert…';

  @override
  String courseFormStartButton(String date) {
    return 'Beginn: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Aus: kein Druck bis $date; vom heutigen Tempo ausgeschlossen.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'An: Zeit wird bis jetzt aufgeteilt und zählt zum heutigen Tempo.';

  @override
  String get courseFormStartEarlyTitle =>
      'Trotz künftigem Start jetzt beginnen';

  @override
  String get courseFormTitleAdd => 'Kurs hinzufügen';

  @override
  String get courseFormTitleEdit => 'Kurs bearbeiten';

  @override
  String get coursesAddTooltip => 'Kurs hinzufügen';

  @override
  String coursesDeleteBody(String name) {
    return '„$name“ und alle Lernsitzungen löschen? Dies kann nicht rückgängig gemacht werden.';
  }

  @override
  String get coursesDeleteTitle => 'Kurs löschen?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Tippe auf „Neuer Kurs“, um deinen ersten Kurs zu erstellen.';

  @override
  String get coursesEmptyTitle => 'Noch keine Kurse';

  @override
  String get coursesFilterAll => 'Alle Status';

  @override
  String get coursesFilterEmpty => 'Kein Kurs passt zu diesem Filter';

  @override
  String get coursesNewCourse => 'Neuer Kurs';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily h/Tag erforderlich';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily h/Tag • $weekly h/Woche erforderlich';
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
  String get coursesRemoveSampleTooltip => 'Beispielkurs entfernen';

  @override
  String coursesShownCount(String count) {
    return '$count angezeigt';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sortieren: $label';
  }

  @override
  String get dashboardAllDone => 'Alles erledigt';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h protokolliert (Bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count Kurs(e)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count Kurs(e) · $upcoming künftig nicht im heutigen Tempo';
  }

  @override
  String get dashboardCoursesTitle => 'Kurse';

  @override
  String dashboardDeadline(String date) {
    return 'Frist $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Frist $date (noch $days Tage)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Frist $date (noch 1 Tag)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Frist $date (überfällig)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Frist $date (heute)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Heute fällig — $hours h protokolliert';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Jeder Kurs ist abgeschlossen — die vollständige Liste findest du im Reiter „Kurse“.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Füge einen Kurs hinzu, um deinen ECTS-Fortschritt zu verfolgen.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Rückstand = $achieved/Tag geschafft, $need/Tag nötig';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Rückstand = $achieved/Tag geschafft, $need/Tag nötig · früher Start';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Rückstand: kein endliches Tempo erreicht eine heutige Frist mit offenen Stunden';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Auf Kurs: noch kein Tempo — protokolliere die erste Sitzung zur Bestätigung';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Beginnt in $days T · gezählt ab $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Beginnt in $days T · gezählt ab $date · früher Start an';
  }

  @override
  String get dashboardFreshStart => 'NEUSTART';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct % · $hours h übrig';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/Tag';
  }

  @override
  String get dashboardLogSessionAction => 'Lernsitzung protokollieren';

  @override
  String get dashboardLogSessionTooltip => 'Lernsitzung protokollieren';

  @override
  String get dashboardNewBadge => 'NEU';

  @override
  String get dashboardNoCourses => 'Noch keine Kurse';

  @override
  String get dashboardNoDeadline => 'Keine Frist';

  @override
  String get dashboardNoDeadlines => 'Keine Fristen geplant';

  @override
  String get dashboardNoPaceDue => 'Heute kein Tempo fällig';

  @override
  String get dashboardNothingDue => 'Nichts fällig';

  @override
  String get dashboardNothingToTrack => 'Noch nichts zu verfolgen';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Heute fällig — noch $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Brauche $daily h/Tag bis zum Abschluss';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Brauche $daily h/Tag · $weekly h/Woche bis zum Abschluss';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Brauche $hours h/Tag ab $date · nicht im heutigen Tempo';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Keine Frist — $hours h übrig · kein Tagesdruck';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Beginnt $date · $hours h zu tun';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · unrealistisch';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMM';

  @override
  String get dashboardProgramEmptyHint =>
      'Füge einen Kurs hinzu, um zu starten';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMM $pct %';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days Tage Vorlauf';
  }

  @override
  String get dashboardStartNotSet => 'Nicht festgelegt';

  @override
  String dashboardStartsIn(String days) {
    return 'Beginnt in $days T';
  }

  @override
  String get dashboardStartsSoon => 'Beginnt bald';

  @override
  String get dashboardTipEmpty =>
      'Füge deinen ersten Kurs hinzu — dein Tagestempo und Fortschritt erscheinen hier.';

  @override
  String get dashboardTipFirst =>
      'Die ersten 25 Minuten zählen am meisten — wähle den Kurs mit der nächsten Frist.';

  @override
  String get dashboardTodayBare => 'HEUTE';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'HEUTE $pct %';
  }

  @override
  String get dashboardTodayPaceLabel => 'HEUTIGES TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h heute';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Künftige Starts — heute kein Druck, vom heutigen Tempo ausgeschlossen.';

  @override
  String get dashboardUpcomingTitle => 'Anstehend';

  @override
  String get devToolsActivate => 'Aktivieren';

  @override
  String get devToolsActivateMessage =>
      'Damit werden versteckte Stresstest-Tools entsperrt (generierte Daten einspielen). Nur zur Entwicklung.';

  @override
  String get devToolsActivateTitle => 'Dev-Modus aktivieren?';

  @override
  String get devToolsActivated => 'Dev-Modus aktiviert.';

  @override
  String get devToolsClearPumped => 'Eingespielte Daten löschen';

  @override
  String get devToolsClearPumpedMessage =>
      'Löscht die generierten STRESS-Kurse und ihre Sitzungen. Deine eigenen Daten bleiben erhalten.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Generierte STRESS-Kurse und Sitzungen löschen.';

  @override
  String get devToolsClearPumpedTitle => 'Eingespielte Daten löschen?';

  @override
  String devToolsCleared(String count) {
    return '$count eingespielte Kurs(e) gelöscht.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Zweite Bestätigung: Dies bläht Kurse, Listen, Diagramme und Tempoberechnungen auf und kann einige Sekunden dauern. Jetzt einspielen?';

  @override
  String get devToolsConfirmPumpTitle => 'Stresstest bestätigen';

  @override
  String get devToolsContinue => 'Fortfahren';

  @override
  String get devToolsExit => 'Dev-Modus beenden';

  @override
  String get devToolsExitSubtitle => 'Dev-Tools auf diesem Gerät ausblenden.';

  @override
  String get devToolsPumpData => 'Daten einspielen';

  @override
  String get devToolsPumpMessage =>
      'Dies fügt ein realistisches generiertes Semester ein (~10 Kurse, ~800 Sitzungen aus den letzten 12 Wochen). Deine bestehenden Daten bleiben erhalten. Fortfahren?';

  @override
  String get devToolsPumpSubtitle =>
      'Generiertes Semester einspielen (~10 Kurse, ~800 Sitzungen, 12 Wochen). Bestehende Daten bleiben erhalten.';

  @override
  String get devToolsPumpTile => 'Testdaten einspielen';

  @override
  String get devToolsPumpTitle => 'Testdaten einspielen?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses Kurse, $sessions Sitzungen eingespielt.';
  }

  @override
  String get devToolsPumping => 'Testdaten werden eingespielt…';

  @override
  String get devToolsRemoveAll => 'Alle Daten entfernen';

  @override
  String get devToolsRemoveAllMessage =>
      'Dev-Abkürzung: Dies löscht ALLE Kurse, Sitzungen und Einstellungen endgültig. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Dev-Abkürzung: ALLE Kurse, Sitzungen und Einstellungen löschen.';

  @override
  String get devToolsRemoveAllTitle => 'Alle Daten entfernen?';

  @override
  String get navCourses => 'Kurse';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get navStatistics => 'Statistiken';

  @override
  String get navStudyLog => 'Lernprotokoll';

  @override
  String get sampleBadge => 'Beispiel';

  @override
  String get sessionFormCourseLabel => 'Kurs';

  @override
  String sessionFormDateButton(String date) {
    return 'Datum: $date';
  }

  @override
  String get sessionFormDurationError => 'Die Dauer muss größer als null sein.';

  @override
  String get sessionFormHoursLabel => 'Stunden';

  @override
  String get sessionFormLogAction => 'Sitzung protokollieren';

  @override
  String get sessionFormMinutesLabel => 'Minuten';

  @override
  String get sessionFormNoCourseError => 'Wähle einen Kurs.';

  @override
  String get sessionFormNoCoursesHint =>
      'Füge zuerst einen Kurs hinzu, um eine Sitzung zu protokollieren.';

  @override
  String get sessionFormNotesLabel => 'Notizen (optional)';

  @override
  String get sessionFormSaving => 'Wird gespeichert…';

  @override
  String get sessionFormTitleAdd => 'Lernsitzung protokollieren';

  @override
  String get sessionFormTitleEdit => 'Lernsitzung bearbeiten';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Gesamt: $hours h';
  }

  @override
  String get settingsAccent => 'Designfarbe';

  @override
  String get settingsAccentBerry => 'Beere';

  @override
  String get settingsAccentClay => 'Ton';

  @override
  String get settingsAccentForest => 'Wald';

  @override
  String get settingsAccentSlate => 'Schiefer';

  @override
  String get settingsAccentTeal => 'Petrol';

  @override
  String get settingsAccentUpdated => 'Designfarbe aktualisiert.';

  @override
  String get settingsAllDataDeleted => 'Alle Daten gelöscht.';

  @override
  String get settingsAppearance => 'Darstellung (dunkel / hell)';

  @override
  String get settingsCheckingSample => 'Beispieldaten werden geprüft…';

  @override
  String get settingsClear => 'Löschen';

  @override
  String get settingsClearSample => 'Beispieldaten löschen';

  @override
  String get settingsClearSampleMessage =>
      'Dies entfernt die Beispielkurse und -sitzungen. Eigene Kurse oder Sitzungen werden nicht entfernt.';

  @override
  String get settingsClearSampleSubtitle =>
      'Mitgelieferte Beispielkurse und -sitzungen entfernen. Eigene Daten bleiben erhalten.';

  @override
  String get settingsClearSampleTitle => 'Beispieldaten löschen?';

  @override
  String get settingsCopy => 'Kopieren';

  @override
  String get settingsDailyError => 'Gib 0 oder eine positive Minutenzahl ein.';

  @override
  String get settingsDailyLabel => 'Minuten pro Tag (0 = kein Ziel)';

  @override
  String get settingsDailyTarget => 'Tägliches Lernziel';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes Min./Tag';
  }

  @override
  String get settingsDailyUpdated => 'Tagesziel aktualisiert.';

  @override
  String get settingsData => 'Daten';

  @override
  String get settingsDeleteEverything => 'Alles löschen';

  @override
  String get settingsDevMode => 'Dev-Modus';

  @override
  String get settingsDisplay => 'Anzeige';

  @override
  String get settingsDisplayComfortable => 'Komfortabel';

  @override
  String get settingsDisplayCompact => 'Kompakt';

  @override
  String get settingsDisplayLarge => 'Groß';

  @override
  String get settingsDisplaySize => 'Text- & Elementgröße';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent %)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Anzeigegröße aktualisiert.';

  @override
  String get settingsExport => 'Daten exportieren';

  @override
  String get settingsExportCopied => 'Export in Zwischenablage kopiert.';

  @override
  String get settingsExportSubtitle =>
      'Alle Kurse, Sitzungen und Einstellungen als JSON kopieren.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses Kurs(e) · $sessions Sitzung(en) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (gekürzt — vollständiges Backup ist $kb KB, nutze Kopieren für alles)';
  }

  @override
  String get settingsFirstWeekday => 'Erster Wochentag';

  @override
  String get settingsFirstWeekdayUpdated => 'Erster Wochentag aktualisiert.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s halten)';
  }

  @override
  String get settingsHoldToReplace => 'Halten, um alles zu ersetzen';

  @override
  String get settingsHoursError => 'Gib eine Zahl größer als null ein.';

  @override
  String get settingsHoursHelper =>
      'Standard 30. Änderung berechnet Anforderungen neu; Protokolle bleiben erhalten.';

  @override
  String get settingsHoursLabel => 'Stunden pro ECTS-Punkt';

  @override
  String get settingsHoursPerEcts => 'Stunden pro ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Stunden pro ECTS aktualisiert.';

  @override
  String get settingsImport => 'Daten importieren';

  @override
  String get settingsImportAppend => 'Hinzufügen';

  @override
  String get settingsImportAppendAction => 'Importieren (hinzufügen)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Daten hinzugefügt: $courses Kurs(e), $sessions Sitzung(en) hinzugefügt.';
  }

  @override
  String get settingsImportInfo =>
      'Hinzufügen ergänzt das Backup zu deinen aktuellen Daten (Einstellungen bleiben). Ersetzen löscht zuerst ALLE Kurse, Sitzungen und Einstellungen.';

  @override
  String get settingsImportLabel => 'Exportiertes JSON einfügen';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses Kurs(e) · $sessions Sitzung(en)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · exportiert $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · Schema v$schema';
  }

  @override
  String get settingsImportReplace => 'Ersetzen';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Ersetzen löscht zuerst alles. Halte die Schaltfläche unten $seconds Sekunden gedrückt, um zu bestätigen.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Daten ersetzt: $courses Kurs(e), $sessions Sitzung(en) wiederhergestellt.';
  }

  @override
  String get settingsImportSubtitle =>
      'Alle Daten aus einem zuvor exportierten JSON-Backup ersetzen.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Weiter halten… noch $remaining s';
  }

  @override
  String get settingsNoSample => 'Keine Beispieldaten';

  @override
  String get settingsNoSampleSubtitle =>
      'Mitgelieferte Beispieldaten wurden bereits gelöscht.';

  @override
  String get settingsNoTarget => 'Kein Ziel festgelegt';

  @override
  String get settingsOverloadError => 'Gib eine Zahl 5–100 h/Woche ein.';

  @override
  String get settingsOverloadHelper =>
      'Wochen mit kommender Last darüber werden rot markiert. Vollzeitstudium entspricht ~35–40 h/Woche.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Stunden pro Woche (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/Woche wird rot markiert';
  }

  @override
  String get settingsOverloadThreshold => 'Wöchentliche Überlastungsgrenze';

  @override
  String get settingsOverloadUpdated => 'Überlastungsgrenze aktualisiert.';

  @override
  String get settingsPaceTolerance => 'Vor-/Rückstand-Toleranz';

  @override
  String get settingsPasteValidBackup => 'Füge zuerst ein gültiges Backup ein';

  @override
  String get settingsReset => 'Zurücksetzen';

  @override
  String get settingsResetAll => 'Alle Daten zurücksetzen';

  @override
  String get settingsResetAllMessage =>
      'Dies löscht ALLE Kurse, Sitzungen und Einstellungen endgültig. Dies kann nicht rückgängig gemacht werden. Exportiere bei Bedarf zuerst ein Backup.';

  @override
  String get settingsResetAllSubtitle =>
      'Alle Kurse, Sitzungen und Einstellungen löschen.';

  @override
  String get settingsResetAllTitle => 'Alle Daten zurücksetzen?';

  @override
  String get settingsResetSettings => 'Einstellungen zurücksetzen';

  @override
  String get settingsResetSettingsDone =>
      'Einstellungen auf Standard zurückgesetzt.';

  @override
  String get settingsResetSettingsMessage =>
      'Stellt Stunden-pro-ECTS (30), Tagesziel (keins), ersten Wochentag (Montag), Design (System), Toleranz (5 Tage), Überlastung (35 h/Woche), Größe (komfortabel), Farbe (Schiefer) wieder her. Kurse und Sitzungen bleiben erhalten.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Standards wiederherstellen: 30 h/ECTS, kein Ziel, Montag, Systemdesign, 5-Tage-Toleranz, 35 h/Woche Überlastung, komfortable Größe, Schiefer.';

  @override
  String get settingsResetSettingsTitle => 'Einstellungen zurücksetzen?';

  @override
  String get settingsSampleData => 'Beispieldaten';

  @override
  String settingsSampleDataError(String error) {
    return 'Fehler: $error';
  }

  @override
  String get settingsStudySettings => 'Lerneinstellungen';

  @override
  String get settingsThemeDark => 'Dunkel';

  @override
  String get settingsThemeLight => 'Hell';

  @override
  String get settingsThemeSystem => 'Systemstandard';

  @override
  String get settingsThemeTitle => 'Design';

  @override
  String get settingsThemeUpdated => 'Design aktualisiert.';

  @override
  String settingsToleranceDays(String value) {
    return '$value Tage';
  }

  @override
  String get settingsToleranceError => 'Gib eine Zahl 0–30 Tage ein.';

  @override
  String get settingsToleranceHelper =>
      'Vorsprung braucht +N Tage Überschuss, Rückstand −N Tage. 5 = stabil, 0 = empfindlich.';

  @override
  String get settingsToleranceLabel => 'Arbeitstage (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance Arbeit';
  }

  @override
  String get settingsToleranceUpdated => 'Toleranz aktualisiert.';

  @override
  String get settingsWeekdayFriday => 'Freitag';

  @override
  String get settingsWeekdayMonday => 'Montag';

  @override
  String get settingsWeekdaySaturday => 'Samstag';

  @override
  String get settingsWeekdaySunday => 'Sonntag';

  @override
  String get settingsWeekdayThursday => 'Donnerstag';

  @override
  String get settingsWeekdayTuesday => 'Dienstag';

  @override
  String get settingsWeekdayWednesday => 'Mittwoch';

  @override
  String get sortDeadline => 'Frist';

  @override
  String get sortName => 'Name';

  @override
  String get sortProgress => 'Fortschritt';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'ECTS Tracker konnte nicht gestartet werden';

  @override
  String get statsActiveDays => 'Aktive Tage';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days T aktiv';
  }

  @override
  String get statsAddDeadlines =>
      'Füge Fristen hinzu, um die Last vorherzusagen.';

  @override
  String get statsComingLoad => 'Kommende Last';

  @override
  String get statsConsistency => 'Konstanz';

  @override
  String get statsConsistencyHint =>
      'Lerntage in den letzten 30 Tagen. Kleine Schritte jeden Tag schlagen Pauken.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent % der letzten 30 Tage';
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
  String get statsDidPerDay => 'Geschafft / Tag (14 T)';

  @override
  String get statsEmpty => 'Noch keine Sitzungen';

  @override
  String get statsGap => 'Lücke';

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
  String get statsLast30Days => 'Letzte 30 Tage';

  @override
  String get statsLast7Days => 'Letzte 7 Tage';

  @override
  String get statsNeedPerDay => 'Brauche / Tag';

  @override
  String get statsNext8Weeks => 'Nächste 8 Wochen';

  @override
  String get statsOfLast30DaysVolume => 'des Volumens der letzten 30 Tage';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Überlastungswochen >$threshold h rot markiert — verschiebe eine Frist oder kürze den Umfang.';
  }

  @override
  String get statsOverview => 'Überblick';

  @override
  String get statsPaceCovers =>
      'Vergangenes Tempo deckt das Nötige ab. Bleib dran.';

  @override
  String statsPaceShort(String gap) {
    return 'Vergangenes Tempo ist $gap h/Tag zu kurz — lege einen Block ein oder kürze den Umfang.';
  }

  @override
  String get statsPastVsNeeded => 'Vergangene vs. nötige Leistung';

  @override
  String statsPeakPerWeek(String peak) {
    return 'Spitze $peak h/Wo.';
  }

  @override
  String get statsPerCourse => 'Pro Kurs';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent %';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent %';
  }

  @override
  String get statsSessions => 'Sitzungen';

  @override
  String statsSuggestedOrder(String order) {
    return 'Empfohlene Reihenfolge: $order (früheste Frist zuerst)';
  }

  @override
  String get statsTotal => 'Gesamt';

  @override
  String get statsTotalVolume => 'Gesamtvolumen';

  @override
  String get statusAhead => 'Voraus';

  @override
  String get statusBehind => 'Im Rückstand';

  @override
  String get statusCompleted => 'Abgeschlossen';

  @override
  String get statusOnTrack => 'Auf Kurs';

  @override
  String get statusOverdue => 'Überfällig';

  @override
  String get studyLogDeleteBody =>
      'Diese Lernsitzung löschen? Dies kann nicht rückgängig gemacht werden.';

  @override
  String get studyLogDeleteTitle => 'Sitzung löschen?';

  @override
  String get studyLogEmptyHint =>
      'Protokolliere eine Sitzung, um deine Lernzeit zu verfolgen.';

  @override
  String get studyLogEmptyTitle => 'Noch keine Lernsitzungen';

  @override
  String get studyLogFabLabel => 'Sitzung protokollieren';

  @override
  String get studyLogFabTooltip => 'Sitzung protokollieren';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Beispielsitzung entfernen';

  @override
  String get studyLogThisWeek => 'Diese Woche';

  @override
  String get studyLogToday => 'Heute';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Kurs $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS müssen größer als null sein';

  @override
  String get validationCourseEctsRequired => 'Gib ECTS-Punkte ein';

  @override
  String get validationCourseNameRequired => 'Name ist erforderlich';

  @override
  String get validationCourseNameTooLong => 'Name ist zu lang';

  @override
  String get validationSessionCourseRequired => 'Wähle einen Kurs';

  @override
  String get validationSessionDurationRequired => 'Gib eine Dauer ein';

  @override
  String get widgetNoProgress => 'Noch kein Fortschritt';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsLiquidGlass => 'Flüssigglas';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Karten und Leisten aus Mattglas. Aus behält die klassische deckende Optik.';

  @override
  String get settingsLiquidGlassOn => 'An';

  @override
  String get settingsLiquidGlassOff => 'Aus';

  @override
  String get settingsLiquidGlassUpdated => 'Flüssigglas aktualisiert.';

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
