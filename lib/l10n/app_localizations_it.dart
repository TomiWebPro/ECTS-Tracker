// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonEdit => 'Modifica';

  @override
  String get commonError => 'Errore';

  @override
  String get commonNone => 'Nessuno';

  @override
  String get commonSave => 'Salva';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Ore richieste (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Cancella la scadenza';

  @override
  String get courseFormClearStartTooltip => 'Cancella la data di inizio';

  @override
  String get courseFormColorLabel => 'Colore';

  @override
  String get courseFormDateNotSet => 'Non impostata';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Scadenza: $date';
  }

  @override
  String get courseFormEctsLabel => 'Crediti ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value o/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nome';

  @override
  String get courseFormNotesLabel => 'Note (facoltative)';

  @override
  String get courseFormSaving => 'Salvataggio…';

  @override
  String courseFormStartButton(String date) {
    return 'Inizio: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Off: nessuna pressione fino al $date; escluso dal ritmo di oggi.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'On: il tempo è suddiviso fino a ora e conta nel ritmo di oggi.';

  @override
  String get courseFormStartEarlyTitle =>
      'Inizia ora nonostante l’inizio futuro';

  @override
  String get courseFormTitleAdd => 'Aggiungi corso';

  @override
  String get courseFormTitleEdit => 'Modifica corso';

  @override
  String get coursesAddTooltip => 'Aggiungi corso';

  @override
  String coursesDeleteBody(String name) {
    return 'Eliminare “$name” e tutte le sue sessioni di studio? L’azione non può essere annullata.';
  }

  @override
  String get coursesDeleteTitle => 'Eliminare il corso?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Tocca “Nuovo corso” per creare il tuo primo corso.';

  @override
  String get coursesEmptyTitle => 'Nessun corso';

  @override
  String get coursesFilterAll => 'Tutti gli stati';

  @override
  String get coursesFilterEmpty => 'Nessun corso corrisponde a questo filtro';

  @override
  String get coursesNewCourse => 'Nuovo corso';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily o/giorno necessarie';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/giorno necessari';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily o/giorno • $weekly o/sett. necessarie';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/giorno • $weekly min/sett. necessari';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/giorno • $weekly o/sett. necessari';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required o • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Rimuovi il corso di esempio';

  @override
  String coursesShownCount(String count) {
    return '$count mostrati';
  }

  @override
  String coursesSortOption(String label) {
    return 'Ordina: $label';
  }

  @override
  String get dashboardAllDone => 'Tutto fatto';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours o registrate (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count corsi';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count corsi · $upcoming futuri non nel ritmo di oggi';
  }

  @override
  String get dashboardCoursesTitle => 'Corsi';

  @override
  String dashboardDeadline(String date) {
    return 'Scadenza $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Scadenza $date ($days giorni rimasti)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Scadenza $date (1 giorno rimasto)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Scadenza $date (scaduta)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Scadenza $date (oggi)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'In scadenza oggi — $hours o registrate';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Tutti i corsi sono completati — vedi la scheda Corsi per l’elenco completo.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Aggiungi un corso per iniziare a monitorare i tuoi progressi ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Indietro = $achieved/g fatti, $need/g necessari';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Indietro = $achieved/g fatti, $need/g necessari · inizio anticipato';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Indietro: nessun ritmo finito può raggiungere una scadenza odierna con le ore rimaste';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'In linea: ancora nessun ritmo — registra la prima sessione per confermare';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Inizia tra $days g · conteggiato dal $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Inizia tra $days g · conteggiato dal $date · inizio anticipato attivo';
  }

  @override
  String get dashboardFreshStart => 'NUOVO INIZIO';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · $hours o rimaste';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required o';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours o/g';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/g';
  }

  @override
  String get dashboardLogSessionAction => 'Registra sessione di studio';

  @override
  String get dashboardLogSessionTooltip => 'Registra sessione di studio';

  @override
  String get dashboardNewBadge => 'NUOVO';

  @override
  String get dashboardNoCourses => 'Nessun corso';

  @override
  String get dashboardNoDeadline => 'Nessuna scadenza';

  @override
  String get dashboardNoDeadlines => 'Nessuna scadenza programmata';

  @override
  String get dashboardNoPaceDue => 'Nessun ritmo in scadenza oggi';

  @override
  String get dashboardNothingDue => 'Niente in scadenza';

  @override
  String get dashboardNothingToTrack => 'Niente da monitorare';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'In scadenza oggi — $hours o rimaste';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Servono $daily o/giorno per finire';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Servono $daily min/giorno per finire';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Servono $daily o/giorno · $weekly o/sett. per finire';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Servono $daily min/giorno · $weekly min/sett. per finire';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Servono $daily min/giorno · $weekly o/sett. per finire';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Servono $hours o/giorno dal $date · non nel ritmo di oggi';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Servono $minutes min/giorno dal $date · non nel ritmo di oggi';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Nessuna scadenza — $hours o rimaste · nessuna pressione quotidiana';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Inizia il $date · $hours o da fare';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · irrealistico';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMMA';

  @override
  String get dashboardProgramEmptyHint =>
      'Aggiungi un corso per iniziare il monitoraggio';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required o';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMMA $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days giorni di margine';
  }

  @override
  String get dashboardStartNotSet => 'Non impostata';

  @override
  String dashboardStartsIn(String days) {
    return 'Inizia tra $days g';
  }

  @override
  String get dashboardStartsSoon => 'Inizia presto';

  @override
  String get dashboardTipEmpty =>
      'Aggiungi il tuo primo corso — il ritmo quotidiano e i progressi appariranno qui.';

  @override
  String get dashboardTipFirst =>
      'I primi 25 minuti contano di più — scegli il corso con la scadenza più vicina.';

  @override
  String get dashboardTodayBare => 'OGGI';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace o';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'OGGI $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'RITMO DI OGGI';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace o oggi';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Inizi futuri — nessuna pressione oggi, esclusi dal ritmo di oggi.';

  @override
  String get dashboardUpcomingTitle => 'In arrivo';

  @override
  String get devToolsActivate => 'Attiva';

  @override
  String get devToolsActivateMessage =>
      'Sblocca gli strumenti nascosti di stress test (caricamento dati generati). Solo per sviluppo.';

  @override
  String get devToolsActivateTitle => 'Attivare la modalità sviluppatore?';

  @override
  String get devToolsActivated => 'Modalità sviluppatore attivata.';

  @override
  String get devToolsClearPumped => 'Cancella dati generati';

  @override
  String get devToolsClearPumpedMessage =>
      'Elimina i corsi STRESS generati e le loro sessioni. I tuoi dati vengono conservati.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Elimina corsi e sessioni STRESS generati.';

  @override
  String get devToolsClearPumpedTitle => 'Cancellare i dati generati?';

  @override
  String devToolsCleared(String count) {
    return 'Cancellati $count corsi generati.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Seconda conferma: gonfierà corsi, elenchi, grafici e calcoli del ritmo e potrebbe richiedere alcuni secondi. Caricare ora?';

  @override
  String get devToolsConfirmPumpTitle => 'Conferma stress test';

  @override
  String get devToolsContinue => 'Continua';

  @override
  String get devToolsExit => 'Esci dalla modalità sviluppatore';

  @override
  String get devToolsExitSubtitle =>
      'Nascondi gli strumenti sviluppatore su questo dispositivo.';

  @override
  String get devToolsPumpData => 'Carica dati';

  @override
  String get devToolsPumpMessage =>
      'Inserisce un semestre generato realistico (~10 corsi, ~800 sessioni nelle ultime 12 settimane). I tuoi dati esistenti vengono conservati. Continuare?';

  @override
  String get devToolsPumpSubtitle =>
      'Inserisci un semestre generato (~10 corsi, ~800 sessioni, 12 settimane). Dati esistenti conservati.';

  @override
  String get devToolsPumpTile => 'Carica dati di test';

  @override
  String get devToolsPumpTitle => 'Caricare i dati di test?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Caricati $courses corsi, $sessions sessioni.';
  }

  @override
  String get devToolsPumping => 'Caricamento dati di test…';

  @override
  String get devToolsRemoveAll => 'Rimuovi tutti i dati';

  @override
  String get devToolsRemoveAllMessage =>
      'Scorciatoia dev: elimina definitivamente TUTTI i corsi, le sessioni e le impostazioni. L’azione non può essere annullata.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Scorciatoia dev: elimina TUTTI i corsi, le sessioni e le impostazioni.';

  @override
  String get devToolsRemoveAllTitle => 'Rimuovere tutti i dati?';

  @override
  String get navCourses => 'Corsi';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get navStatistics => 'Statistiche';

  @override
  String get navStudyLog => 'Registro studio';

  @override
  String get sampleBadge => 'Esempio';

  @override
  String get sessionFormCourseLabel => 'Corso';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError =>
      'La durata deve essere maggiore di zero.';

  @override
  String get sessionFormHoursLabel => 'Ore';

  @override
  String get sessionFormLogAction => 'Registra sessione';

  @override
  String get sessionFormMinutesLabel => 'Minuti';

  @override
  String get sessionFormModeManual => 'Manuale';

  @override
  String get sessionFormModeTimer => 'Timer';

  @override
  String get sessionFormNoCourseError => 'Seleziona un corso.';

  @override
  String get sessionFormNoCoursesHint =>
      'Aggiungi prima un corso per registrare una sessione.';

  @override
  String get sessionFormNotesLabel => 'Note (facoltative)';

  @override
  String get sessionFormSaving => 'Salvataggio…';

  @override
  String get sessionFormTitleAdd => 'Registra sessione di studio';

  @override
  String get sessionFormTitleEdit => 'Modifica sessione di studio';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Totale: $hours o';
  }

  @override
  String get settingsAccent => 'Colore tema';

  @override
  String get settingsAccentBerry => 'Bacca';

  @override
  String get settingsAccentClay => 'Argilla';

  @override
  String get settingsAccentForest => 'Foresta';

  @override
  String get settingsAccentSlate => 'Ardesia';

  @override
  String get settingsAccentTeal => 'Verde acqua';

  @override
  String get settingsAccentUpdated => 'Colore tema aggiornato.';

  @override
  String get settingsAllDataDeleted => 'Tutti i dati eliminati.';

  @override
  String get settingsAppearance => 'Aspetto (scuro / chiaro)';

  @override
  String get settingsCheckingSample => 'Controllo dati di esempio…';

  @override
  String get settingsClear => 'Cancella';

  @override
  String get settingsClearSample => 'Cancella dati di esempio';

  @override
  String get settingsClearSampleMessage =>
      'Rimuove i corsi e le sessioni di esempio. I corsi o le sessioni aggiunti da te non vengono rimossi.';

  @override
  String get settingsClearSampleSubtitle =>
      'Rimuovi i corsi e le sessioni di esempio. I tuoi dati vengono conservati.';

  @override
  String get settingsClearSampleTitle => 'Cancellare i dati di esempio?';

  @override
  String get settingsCopy => 'Copia';

  @override
  String get settingsDailyError =>
      'Inserisci 0 o un numero positivo di minuti.';

  @override
  String get settingsDailyLabel => 'Minuti al giorno (0 = nessun obiettivo)';

  @override
  String get settingsDailyTarget => 'Obiettivo di studio giornaliero';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/giorno';
  }

  @override
  String get settingsDailyUpdated => 'Obiettivo giornaliero aggiornato.';

  @override
  String get settingsData => 'Dati';

  @override
  String get settingsDeleteEverything => 'Elimina tutto';

  @override
  String get settingsDevMode => 'Modalità sviluppatore';

  @override
  String get settingsDisplay => 'Schermo';

  @override
  String get settingsDisplayComfortable => 'Confortevole';

  @override
  String get settingsDisplayCompact => 'Compatta';

  @override
  String get settingsDisplayLarge => 'Grande';

  @override
  String get settingsDisplaySize => 'Dimensione testo ed elementi';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Dimensione schermo aggiornata.';

  @override
  String get settingsExport => 'Esporta dati';

  @override
  String get settingsExportCopied => 'Export copiato negli appunti.';

  @override
  String get settingsExportSubtitle =>
      'Copia tutti i corsi, le sessioni e le impostazioni come JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses corsi · $sessions sessioni · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (troncato — il backup completo è di $kb KB, usa Copia per tutto)';
  }

  @override
  String get settingsFirstWeekday => 'Primo giorno della settimana';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Primo giorno della settimana aggiornato.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (tieni premuto $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Tieni premuto per sostituire tutto';

  @override
  String get settingsHoursError => 'Inserisci un numero maggiore di zero.';

  @override
  String get settingsHoursHelper =>
      'Predefinito 30. La modifica ricalcola i requisiti; i registri vengono conservati.';

  @override
  String get settingsHoursLabel => 'Ore per credito ECTS';

  @override
  String get settingsHoursPerEcts => 'Ore per ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value o';
  }

  @override
  String get settingsHoursUpdated => 'Ore per ECTS aggiornate.';

  @override
  String get settingsImport => 'Importa dati';

  @override
  String get settingsImportAppend => 'Aggiungi';

  @override
  String get settingsImportAppendAction => 'Importa (aggiungi)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Dati aggiunti: $courses corsi, $sessions sessioni aggiunte.';
  }

  @override
  String get settingsImportInfo =>
      'L’aggiunta affianca il backup ai dati attuali (impostazioni conservate). La sostituzione cancella prima TUTTI i corsi, le sessioni e le impostazioni.';

  @override
  String get settingsImportLabel => 'Incolla il JSON esportato';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses corsi · $sessions sessioni';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· esportato il $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· schema v$schema';
  }

  @override
  String get settingsImportReplace => 'Sostituisci';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'La sostituzione elimina prima tutto. Premi e TIENI PREMUTO il pulsante qui sotto per $seconds secondi per confermare.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Dati sostituiti: $courses corsi, $sessions sessioni ripristinate.';
  }

  @override
  String get settingsImportSubtitle =>
      'Sostituisci tutti i dati da un backup JSON esportato in precedenza.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Continua a tenere premuto… $remaining s';
  }

  @override
  String get settingsNoSample => 'Nessun dato di esempio';

  @override
  String get settingsNoSampleSubtitle =>
      'I dati di esempio sono già stati cancellati.';

  @override
  String get settingsNoTarget => 'Nessun obiettivo impostato';

  @override
  String get settingsOverloadError => 'Inserisci un numero da 5 a 100 o/sett.';

  @override
  String get settingsOverloadHelper =>
      'Le settimane di carico oltre questo valore sono evidenziate in rosso. Lo studio a tempo pieno è ~35–40 o/sett.';

  @override
  String settingsOverloadHours(String value) {
    return '$value o';
  }

  @override
  String get settingsOverloadLabel => 'Ore a settimana (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/sett. evidenziate in rosso';
  }

  @override
  String get settingsOverloadThreshold => 'Soglia settimanale di sovraccarico';

  @override
  String get settingsOverloadUpdated => 'Soglia di sovraccarico aggiornata.';

  @override
  String get settingsPaceTolerance => 'Tolleranza avanti / indietro';

  @override
  String get settingsPasteValidBackup => 'Incolla prima un backup valido';

  @override
  String get settingsReset => 'Reimposta';

  @override
  String get settingsResetAll => 'Reimposta tutti i dati';

  @override
  String get settingsResetAllMessage =>
      'Elimina definitivamente TUTTI i corsi, le sessioni e le impostazioni. L’azione non può essere annullata. Se necessario, esporta prima un backup.';

  @override
  String get settingsResetAllSubtitle =>
      'Elimina tutti i corsi, le sessioni e le impostazioni.';

  @override
  String get settingsResetAllTitle => 'Reimpostare tutti i dati?';

  @override
  String get settingsResetSettings => 'Reimposta impostazioni';

  @override
  String get settingsResetSettingsDone =>
      'Impostazioni reimpostate ai valori predefiniti.';

  @override
  String get settingsResetSettingsMessage =>
      'Ripristina ore-per-ECTS (30), obiettivo giornaliero (nessuno), primo giorno (lunedì), tema (sistema), tolleranza (5 giorni), sovraccarico (35 o/sett.), dimensione (confortevole), colore (ardesia). Corsi e sessioni conservati.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Ripristina predefiniti: 30 o/ECTS, nessun obiettivo, lunedì, tema sistema, tolleranza 5 giorni, sovraccarico 35 o/sett., dimensione confortevole, colore ardesia.';

  @override
  String get settingsResetSettingsTitle => 'Reimpostare le impostazioni?';

  @override
  String get settingsSampleData => 'Dati di esempio';

  @override
  String settingsSampleDataError(String error) {
    return 'Errore: $error';
  }

  @override
  String get settingsStudySettings => 'Impostazioni di studio';

  @override
  String get settingsThemeDark => 'Scuro';

  @override
  String get settingsThemeLight => 'Chiaro';

  @override
  String get settingsThemeSystem => 'Predefinito di sistema';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema aggiornato.';

  @override
  String settingsToleranceDays(String value) {
    return '$value giorni';
  }

  @override
  String get settingsToleranceError => 'Inserisci un numero da 0 a 30 giorni.';

  @override
  String get settingsToleranceHelper =>
      'Avanti richiede +N giorni di surplus, indietro −N giorni. 5 = stabile, 0 = sensibile.';

  @override
  String get settingsToleranceLabel => 'Giorni di lavoro (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance di lavoro';
  }

  @override
  String get settingsToleranceUpdated => 'Tolleranza aggiornata.';

  @override
  String get settingsWeekdayFriday => 'Venerdì';

  @override
  String get settingsWeekdayMonday => 'Lunedì';

  @override
  String get settingsWeekdaySaturday => 'Sabato';

  @override
  String get settingsWeekdaySunday => 'Domenica';

  @override
  String get settingsWeekdayThursday => 'Giovedì';

  @override
  String get settingsWeekdayTuesday => 'Martedì';

  @override
  String get settingsWeekdayWednesday => 'Mercoledì';

  @override
  String get sortDeadline => 'Scadenza';

  @override
  String get sortName => 'Nome';

  @override
  String get sortProgress => 'Progresso';

  @override
  String get sortStatus => 'Stato';

  @override
  String get startupTitle => 'Impossibile avviare ECTS Tracker';

  @override
  String get statsActiveDays => 'Giorni attivi';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days g attivi';
  }

  @override
  String get statsAddDeadlines => 'Aggiungi scadenze per prevedere il carico.';

  @override
  String get statsComingLoad => 'Carico in arrivo';

  @override
  String get statsConsistency => 'Costanza';

  @override
  String get statsConsistencyHint =>
      'Giorni di studio negli ultimi 30 giorni. Meglio piccoli passi ogni giorno che sgobbare tutto insieme.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% degli ultimi 30 giorni';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Corso $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Fatto / giorno (14 g)';

  @override
  String get statsEmpty => 'Nessuna sessione';

  @override
  String get statsGap => 'Divario';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value o';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}o';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours o';
  }

  @override
  String get statsLast30Days => 'Ultimi 30 giorni';

  @override
  String get statsLast7Days => 'Ultimi 7 giorni';

  @override
  String get statsNeedPerDay => 'Necessario / giorno';

  @override
  String get statsNext8Weeks => 'Prossime 8 settimane';

  @override
  String get statsOfLast30DaysVolume => 'del volume degli ultimi 30 giorni';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Settimane in sovraccarico >$threshold o evidenziate in rosso — sposta una scadenza o riduci l’ambito.';
  }

  @override
  String get statsOverview => 'Panoramica';

  @override
  String get statsPaceCovers =>
      'Il ritmo passato copre il necessario. Mantieni la serie.';

  @override
  String statsPaceShort(String gap) {
    return 'Il ritmo passato è $gap o/giorno sotto — aggiungi un blocco o riduci l’ambito.';
  }

  @override
  String get statsPastVsNeeded => 'Passato vs. necessario';

  @override
  String statsPeakPerWeek(String peak) {
    return 'picco $peak o/sett.';
  }

  @override
  String get statsPerCourse => 'Per corso';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done o / $required o · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sessioni';

  @override
  String statsSuggestedOrder(String order) {
    return 'Ordine suggerito: $order (prima la scadenza più vicina)';
  }

  @override
  String get statsTotal => 'Totale';

  @override
  String get statsTotalVolume => 'volume totale';

  @override
  String get statusAhead => 'Avanti';

  @override
  String get statusBehind => 'Indietro';

  @override
  String get statusCompleted => 'Completato';

  @override
  String get statusOnTrack => 'In linea';

  @override
  String get statusOverdue => 'Scaduto';

  @override
  String get studyLogDeleteBody =>
      'Eliminare questa sessione di studio? L’azione non può essere annullata.';

  @override
  String get studyLogDeleteTitle => 'Eliminare la sessione?';

  @override
  String get studyLogEmptyHint =>
      'Registra una sessione per monitorare il tempo di studio.';

  @override
  String get studyLogEmptyTitle => 'Nessuna sessione di studio';

  @override
  String get studyLogFabLabel => 'Registra sessione';

  @override
  String get studyLogFabTooltip => 'Registra sessione';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours o';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Rimuovi la sessione di esempio';

  @override
  String get studyLogThisWeek => 'Questa settimana';

  @override
  String get studyLogToday => 'Oggi';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Corso $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return 'Cronometraggio $course';
  }

  @override
  String get studyTimerAlreadyRunning =>
      'Un timer è già in esecuzione. Concludilo o scartalo prima.';

  @override
  String get studyTimerCourseLabel => 'Corso';

  @override
  String get studyTimerDiscard => 'Scarta';

  @override
  String get studyTimerDiscardBody =>
      'Scartare il timer attuale senza registrare? L\'azione non può essere annullata.';

  @override
  String get studyTimerDiscardTitle => 'Scartare il timer?';

  @override
  String studyTimerFinishLog(String minutes) {
    return 'Concludi & registra $minutes min';
  }

  @override
  String get studyTimerNoCourseError => 'Seleziona un corso.';

  @override
  String get studyTimerNoCoursesHint =>
      'Aggiungi prima un corso per avviare un timer.';

  @override
  String studyTimerNotifPaused(String elapsed) {
    return 'In pausa · $elapsed';
  }

  @override
  String get studyTimerNotifRunning => 'Tocca per aprire il timer';

  @override
  String get studyTimerPause => 'Pausa';

  @override
  String get studyTimerResume => 'Riprendi';

  @override
  String get studyTimerStart => 'Avvia timer';

  @override
  String get studyTimerStartTitle => 'Avvia timer di studio';

  @override
  String get studyTimerTooShort => 'Il timer non è ancora partito.';

  @override
  String get validationCourseEctsPositive =>
      'Gli ECTS devono essere maggiori di zero';

  @override
  String get validationCourseEctsRequired => 'Inserisci i crediti ECTS';

  @override
  String get validationCourseNameRequired => 'Il nome è obbligatorio';

  @override
  String get validationCourseNameTooLong => 'Il nome è troppo lungo';

  @override
  String get validationSessionCourseRequired => 'Seleziona un corso';

  @override
  String get validationSessionDurationRequired => 'Inserisci una durata';

  @override
  String get widgetNoProgress => 'Nessun progresso';

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get settingsLiquidGlass => 'Vetro liquido';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Schede e barre in vetro satinato. Con Off mantieni il classico aspetto solido.';

  @override
  String get settingsLiquidGlassOn => 'On';

  @override
  String get settingsLiquidGlassOff => 'Off';

  @override
  String get settingsLiquidGlassUpdated => 'Vetro liquido aggiornato.';

  @override
  String get devToolsReminderPreview => 'Anteprima promemoria';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Vedi cosa si notificherebbe ora. Feed di prova sicuro per Windows.';

  @override
  String get reminderPreviewTitle => 'Anteprima promemoria';

  @override
  String get reminderPreviewNow => 'Ora anteprima';

  @override
  String get reminderPreviewReset => 'Adesso';

  @override
  String get reminderPreviewEmpty =>
      'Tutto tranquillo — nessuna notifica a quest’ora.';

  @override
  String get reminderPreviewCustom => 'Pianificazioni personalizzate (demo)';

  @override
  String get reminderPreviewNoFire => 'Nessuna attivazione imminente.';

  @override
  String get reminderKindDaily => 'Giornaliero';

  @override
  String get reminderKindBehind => 'Indietro';

  @override
  String get reminderKindDeadline => 'Scadenza';

  @override
  String get reminderKindOverdue => 'Scaduto';

  @override
  String get reminderKindStreak => 'Serie';

  @override
  String get reminderKindCustom => 'Personalizzato';

  @override
  String get settingsReminders => 'Promemoria di studio';

  @override
  String get settingsRemindersOff =>
      'Spento — attiva per un promemoria giornaliero.';

  @override
  String get settingsReminderTime => 'Ora del promemoria';

  @override
  String get settingsReminderDenied =>
      'Le notifiche sono bloccate — abilitale nelle impostazioni di sistema.';

  @override
  String notifDurationHours(String value) {
    return '$value o';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value min';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Stasera: $duration per restare in linea';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course $duration rimasti oggi';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count altri)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Registra una sessione per chiudere la giornata.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course: stato Indietro';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return '$left rimasti, ancora $days giorni — $pace/giorno da qui. Registra $catchUp per tornare in linea.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left rimasti, ancora $days giorni — $pace/giorno da qui. Solo finire tutto il $left risolve la situazione — comincia stasera.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left ancora aperti e la scadenza è oggi. Tutto ciò che registri ora conta.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course scade domani e ha ancora $left aperti';
  }

  @override
  String get notifDeadlineTomorrowBody =>
      'Tutto ciò che registri oggi vale doppio.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Esame di $course tra $days giorni — $left rimasti';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Sono $pace/giorno. Dividili: 2 sessioni al giorno battono una maratona.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Ogni ora che registri ora conta.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course ha superato la scadenza con $left aperti';
  }

  @override
  String get notifOverdueBody =>
      'Sposta la scadenza o finisci le ore — il corso resta in Richiede attenzione fino ad allora.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 Serie di $days giorni — $week questa settimana';
  }

  @override
  String get notifStreakBody =>
      'Tutti i corsi in linea o avanti. Ottimo lavoro.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Check-in di studio: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 È ora di aggiornare: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left aperti · $pace/giorno per finire in tempo. Registra una sessione per aggiornare i progressi.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left ancora aperti — tutto ciò che registri ora conta.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Prossimo: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1g';

  @override
  String get reminderPreviewFwdDay => '+1g';

  @override
  String get reminderPreviewFake => '(finto)';

  @override
  String get reminderPreviewDemoLabel => 'Check-in demo';
}
