// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Cancel·la';

  @override
  String get commonClose => 'Tanca';

  @override
  String get commonDelete => 'Suprimeix';

  @override
  String get commonEdit => 'Edita';

  @override
  String get commonError => 'Error';

  @override
  String get commonNone => 'Cap';

  @override
  String get commonSave => 'Desa';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Hores necessàries (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Esborra la data límit';

  @override
  String get courseFormClearStartTooltip => 'Esborra la data d\'inici';

  @override
  String get courseFormColorLabel => 'Color';

  @override
  String get courseFormDateNotSet => 'Sense definir';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Data límit: $date';
  }

  @override
  String get courseFormEctsLabel => 'Crèdits ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nom';

  @override
  String get courseFormNotesLabel => 'Notes (opcional)';

  @override
  String get courseFormSaving => 'Desant…';

  @override
  String courseFormStartButton(String date) {
    return 'Inici: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Desactivat: sense pressió fins al $date; exclòs del ritme d\'avui.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Activat: el temps es reparteix fins ara i compta per al ritme d\'avui.';

  @override
  String get courseFormStartEarlyTitle => 'Comença ara malgrat l\'inici futur';

  @override
  String get courseFormTitleAdd => 'Afegeix assignatura';

  @override
  String get courseFormTitleEdit => 'Edita l\'assignatura';

  @override
  String get coursesAddTooltip => 'Afegeix assignatura';

  @override
  String coursesDeleteBody(String name) {
    return 'Vols suprimir «$name» i totes les seves sessions d\'estudi? Aquesta acció no es pot desfer.';
  }

  @override
  String get coursesDeleteTitle => 'Suprimir l\'assignatura?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Toca «Nova assignatura» per crear la primera assignatura.';

  @override
  String get coursesEmptyTitle => 'Encara no hi ha assignatures';

  @override
  String get coursesFilterAll => 'Tots els estats';

  @override
  String get coursesFilterEmpty =>
      'Cap assignatura coincideix amb aquest filtre';

  @override
  String get coursesNewCourse => 'Nova assignatura';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Calen $daily h/dia';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Calen $daily h/dia • $weekly h/setmana';
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
  String get coursesRemoveSampleTooltip =>
      'Suprimeix l\'assignatura d\'exemple';

  @override
  String coursesShownCount(String count) {
    return '$count mostrades';
  }

  @override
  String coursesSortOption(String label) {
    return 'Ordena: $label';
  }

  @override
  String get dashboardAllDone => 'Tot fet';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h registrades (extra)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count assignatura(es)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count assignatura(es) · $upcoming futures no incloses al ritme d\'avui';
  }

  @override
  String get dashboardCoursesTitle => 'Assignatures';

  @override
  String dashboardDeadline(String date) {
    return 'Data límit $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Data límit $date (falten $days dies)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Data límit $date (falta 1 dia)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Data límit $date (vençuda)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Data límit $date (avui)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Venç avui — $hours h registrades';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Totes les assignatures estan completades — consulta la pestanya Assignatures per veure la llista completa.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Afegeix una assignatura per començar a seguir el progrés ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Endarrerit = fas $achieved/d, en calen $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Endarrerit = fas $achieved/d, en calen $need/d · inici anticipat';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Endarrerit: cap ritme finit no arriba a una data límit d\'avui amb hores pendents';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'En bon camí: encara sense ritme — registra la primera sessió per confirmar-ho';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Comença en $days d · comptat des del $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Comença en $days d · comptat des del $date · inici anticipat activat';
  }

  @override
  String get dashboardFreshStart => 'NOU COMENÇAMENT';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · queden ${hours}h';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/dia';
  }

  @override
  String get dashboardLogSessionAction => 'Registra una sessió d\'estudi';

  @override
  String get dashboardLogSessionTooltip => 'Registra una sessió d\'estudi';

  @override
  String get dashboardNewBadge => 'NOU';

  @override
  String get dashboardNoCourses => 'Encara no hi ha assignatures';

  @override
  String get dashboardNoDeadline => 'Sense data límit';

  @override
  String get dashboardNoDeadlines => 'No hi ha dates límit programades';

  @override
  String get dashboardNoPaceDue => 'Avui no venç cap ritme';

  @override
  String get dashboardNothingDue => 'Res pendent';

  @override
  String get dashboardNothingToTrack => 'Encara res a seguir';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Venç avui — queden ${hours}h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Calen $daily h/dia per acabar';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Calen $daily h/dia · $weekly h/setmana per acabar';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Calen $hours h/dia a partir del $date · no inclòs al ritme d\'avui';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Sense data límit — queden ${hours}h · sense pressió diària';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Comença el $date · ${hours}h per fer';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · poc realista';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMA';

  @override
  String get dashboardProgramEmptyHint =>
      'Afegeix una assignatura per començar el seguiment';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMA $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days dies de marge';
  }

  @override
  String get dashboardStartNotSet => 'Sense definir';

  @override
  String dashboardStartsIn(String days) {
    return 'Comença en ${days}d';
  }

  @override
  String get dashboardStartsSoon => 'Comença aviat';

  @override
  String get dashboardTipEmpty =>
      'Afegeix la primera assignatura — el ritme diari i el progrés apareixeran aquí.';

  @override
  String get dashboardTipFirst =>
      'Els primers 25 min compten més — tria l\'assignatura que venç primer.';

  @override
  String get dashboardTodayBare => 'AVUI';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'AVUI $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'RITME D\'AVUI';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h avui';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Inicis futurs — sense pressió avui, exclosos del ritme d\'avui.';

  @override
  String get dashboardUpcomingTitle => 'Propers';

  @override
  String get devToolsActivate => 'Activa';

  @override
  String get devToolsActivateMessage =>
      'Això desbloqueja eines ocultes de prova d\'estrès (genera dades). Només per a desenvolupament.';

  @override
  String get devToolsActivateTitle => 'Activar el mode de desenvolupament?';

  @override
  String get devToolsActivated => 'Mode de desenvolupament activat.';

  @override
  String get devToolsClearPumped => 'Esborra les dades generades';

  @override
  String get devToolsClearPumpedMessage =>
      'Suprimeix les assignatures STRESS generades i les seves sessions. Les teves dades es conserven.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Suprimeix les assignatures i sessions STRESS generades.';

  @override
  String get devToolsClearPumpedTitle => 'Esborrar les dades generades?';

  @override
  String devToolsCleared(String count) {
    return 'S\'han esborrat $count assignatura(es) generades.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Segona confirmació: això inflarà assignatures, llistes, gràfics i càlculs de ritme, i pot trigar uns segons. Generar ara?';

  @override
  String get devToolsConfirmPumpTitle => 'Confirma la generació d\'estrès';

  @override
  String get devToolsContinue => 'Continua';

  @override
  String get devToolsExit => 'Surt del mode de desenvolupament';

  @override
  String get devToolsExitSubtitle =>
      'Amaga les eines de desenvolupament en aquest dispositiu.';

  @override
  String get devToolsPumpData => 'Genera dades';

  @override
  String get devToolsPumpMessage =>
      'Això insereix un semestre generat realista (~10 assignatures, ~800 sessions de les últimes 12 setmanes). Les dades existents es conserven. Continuar?';

  @override
  String get devToolsPumpSubtitle =>
      'Insereix un semestre generat (~10 assignatures, ~800 sessions, 12 setmanes). Les dades existents es conserven.';

  @override
  String get devToolsPumpTile => 'Genera dades de prova';

  @override
  String get devToolsPumpTitle => 'Generar dades de prova?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Generades $courses assignatures, $sessions sessions.';
  }

  @override
  String get devToolsPumping => 'Generant dades de prova…';

  @override
  String get devToolsRemoveAll => 'Suprimeix totes les dades';

  @override
  String get devToolsRemoveAllMessage =>
      'Drecera de desenvolupament: suprimeix permanentment TOTES les assignatures, sessions i configuració. Aquesta acció no es pot desfer.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Drecera de desenvolupament: suprimeix TOTES les assignatures, sessions i configuració.';

  @override
  String get devToolsRemoveAllTitle => 'Suprimir totes les dades?';

  @override
  String get navCourses => 'Assignatures';

  @override
  String get navDashboard => 'Tauler';

  @override
  String get navSettings => 'Configuració';

  @override
  String get navStatistics => 'Estadístiques';

  @override
  String get navStudyLog => 'Registre d\'estudi';

  @override
  String get sampleBadge => 'Exemple';

  @override
  String get sessionFormCourseLabel => 'Assignatura';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError => 'La durada ha de ser superior a zero.';

  @override
  String get sessionFormHoursLabel => 'Hores';

  @override
  String get sessionFormLogAction => 'Registra la sessió';

  @override
  String get sessionFormMinutesLabel => 'Minuts';

  @override
  String get sessionFormNoCourseError => 'Tria una assignatura.';

  @override
  String get sessionFormNoCoursesHint =>
      'Afegeix primer una assignatura per registrar una sessió.';

  @override
  String get sessionFormNotesLabel => 'Notes (opcional)';

  @override
  String get sessionFormSaving => 'Desant…';

  @override
  String get sessionFormTitleAdd => 'Registra una sessió d\'estudi';

  @override
  String get sessionFormTitleEdit => 'Edita la sessió d\'estudi';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total: $hours h';
  }

  @override
  String get settingsAccent => 'Color del tema';

  @override
  String get settingsAccentBerry => 'Baia';

  @override
  String get settingsAccentClay => 'Argila';

  @override
  String get settingsAccentForest => 'Bosc';

  @override
  String get settingsAccentSlate => 'Pissarra';

  @override
  String get settingsAccentTeal => 'Verd blavós';

  @override
  String get settingsAccentUpdated => 'Color del tema actualitzat.';

  @override
  String get settingsAllDataDeleted => 'Totes les dades suprimides.';

  @override
  String get settingsAppearance => 'Aparença (fosc / clar)';

  @override
  String get settingsCheckingSample => 'Comprovant les dades d\'exemple…';

  @override
  String get settingsClear => 'Esborra';

  @override
  String get settingsClearSample => 'Esborra les dades d\'exemple';

  @override
  String get settingsClearSampleMessage =>
      'Això suprimeix les assignatures i sessions d\'exemple. Les assignatures o sessions que hagis afegit no s\'esborren.';

  @override
  String get settingsClearSampleSubtitle =>
      'Suprimeix les assignatures i sessions d\'exemple. Les teves dades es conserven.';

  @override
  String get settingsClearSampleTitle => 'Esborrar les dades d\'exemple?';

  @override
  String get settingsCopy => 'Copia';

  @override
  String get settingsDailyError =>
      'Introdueix 0 o un nombre positiu de minuts.';

  @override
  String get settingsDailyLabel => 'Minuts per dia (0 = sense objectiu)';

  @override
  String get settingsDailyTarget => 'Objectiu diari d\'estudi';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dia';
  }

  @override
  String get settingsDailyUpdated => 'Objectiu diari actualitzat.';

  @override
  String get settingsData => 'Dades';

  @override
  String get settingsDeleteEverything => 'Suprimeix-ho tot';

  @override
  String get settingsDevMode => 'Mode de desenvolupament';

  @override
  String get settingsDisplay => 'Pantalla';

  @override
  String get settingsDisplayComfortable => 'Confortable';

  @override
  String get settingsDisplayCompact => 'Compacte';

  @override
  String get settingsDisplayLarge => 'Gran';

  @override
  String get settingsDisplaySize => 'Mida del text i dels elements';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Mida de pantalla actualitzada.';

  @override
  String get settingsExport => 'Exporta les dades';

  @override
  String get settingsExportCopied => 'Exportació copiada al porta-retalls.';

  @override
  String get settingsExportSubtitle =>
      'Copia totes les assignatures, sessions i configuració com a JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses assignatura(es) · $sessions sessió(ns) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (truncat — la còpia completa és de $kb KB, fes servir Copia per a tot)';
  }

  @override
  String get settingsFirstWeekday => 'Primer dia de la setmana';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Primer dia de la setmana actualitzat.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (mantén ${seconds}s)';
  }

  @override
  String get settingsHoldToReplace => 'Mantén per substituir-ho tot';

  @override
  String get settingsHoursError => 'Introdueix un nombre superior a zero.';

  @override
  String get settingsHoursHelper =>
      'Per defecte 30. Canviar-ho recalcula els requisits; els registres es conserven.';

  @override
  String get settingsHoursLabel => 'Hores per crèdit ECTS';

  @override
  String get settingsHoursPerEcts => 'Hores per ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Hores per ECTS actualitzades.';

  @override
  String get settingsImport => 'Importa dades';

  @override
  String get settingsImportAppend => 'Afegeix';

  @override
  String get settingsImportAppendAction => 'Importa (afegeix)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Dades afegides: $courses assignatura(es), $sessions sessió(ns) afegides.';
  }

  @override
  String get settingsImportInfo =>
      'Afegeix la còpia de seguretat a les dades actuals (es conserva la configuració). Substitueix esborra PRIMER totes les assignatures, sessions i configuració.';

  @override
  String get settingsImportLabel => 'Enganxa el JSON exportat';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses assignatura(es) · $sessions sessió(ns)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· exportat $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· esquema v$schema';
  }

  @override
  String get settingsImportReplace => 'Substitueix';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Substituir esborra primer tot. Mantén premut el botó següent durant $seconds segons per confirmar.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Dades substituïdes: $courses assignatura(es), $sessions sessió(ns) restaurades.';
  }

  @override
  String get settingsImportSubtitle =>
      'Substitueix totes les dades des d\'una còpia JSON exportada.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Continua prement… $remaining s';
  }

  @override
  String get settingsNoSample => 'Sense dades d\'exemple';

  @override
  String get settingsNoSampleSubtitle =>
      'Les dades d\'exemple ja s\'han esborrat.';

  @override
  String get settingsNoTarget => 'Sense objectiu definit';

  @override
  String get settingsOverloadError =>
      'Introdueix un nombre de 5–100 h/setmana.';

  @override
  String get settingsOverloadHelper =>
      'Les setmanes de càrrega propera per sobre d\'això es marquen en vermell. Estudiar a temps complet és ~35–40 h/setmana.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Hores per setmana (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/setmana es marca en vermell';
  }

  @override
  String get settingsOverloadThreshold => 'Llindar de sobrecàrrega setmanal';

  @override
  String get settingsOverloadUpdated => 'Llindar de sobrecàrrega actualitzat.';

  @override
  String get settingsPaceTolerance => 'Tolerància d\'avanç / retard';

  @override
  String get settingsPasteValidBackup => 'Enganxa primer una còpia vàlida';

  @override
  String get settingsReset => 'Restableix';

  @override
  String get settingsResetAll => 'Restableix totes les dades';

  @override
  String get settingsResetAllMessage =>
      'Això suprimeix permanentment TOTES les assignatures, sessions i configuració. Aquesta acció no es pot desfer. Exporta una còpia de seguretat primer si cal.';

  @override
  String get settingsResetAllSubtitle =>
      'Suprimeix totes les assignatures, sessions i configuració.';

  @override
  String get settingsResetAllTitle => 'Restablir totes les dades?';

  @override
  String get settingsResetSettings => 'Restableix la configuració';

  @override
  String get settingsResetSettingsDone =>
      'Configuració restablerta als valors per defecte.';

  @override
  String get settingsResetSettingsMessage =>
      'Restaura hores per ECTS (30), objectiu diari (cap), primer dia (dilluns), tema (sistema), tolerància (5 dies), sobrecàrrega (35 h/setmana), mida (confortable), color (pissarra). Les assignatures i sessions es conserven.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Restaura valors: 30 h/ECTS, sense objectiu, dilluns, tema del sistema, tolerància de 5 dies, sobrecàrrega de 35 h/setmana, mida confortable, color pissarra.';

  @override
  String get settingsResetSettingsTitle => 'Restablir la configuració?';

  @override
  String get settingsSampleData => 'Dades d\'exemple';

  @override
  String settingsSampleDataError(String error) {
    return 'Error: $error';
  }

  @override
  String get settingsStudySettings => 'Configuració d\'estudi';

  @override
  String get settingsThemeDark => 'Fosc';

  @override
  String get settingsThemeLight => 'Clar';

  @override
  String get settingsThemeSystem => 'Sistema per defecte';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema actualitzat.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dies';
  }

  @override
  String get settingsToleranceError => 'Introdueix un nombre de 0–30 dies.';

  @override
  String get settingsToleranceHelper =>
      'L\'avanç necessita +N dies d\'excedent, el retard −N dies. 5 = estable, 0 = sensible.';

  @override
  String get settingsToleranceLabel => 'Dies de feina (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance de feina';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerància actualitzada.';

  @override
  String get settingsWeekdayFriday => 'Divendres';

  @override
  String get settingsWeekdayMonday => 'Dilluns';

  @override
  String get settingsWeekdaySaturday => 'Dissabte';

  @override
  String get settingsWeekdaySunday => 'Diumenge';

  @override
  String get settingsWeekdayThursday => 'Dijous';

  @override
  String get settingsWeekdayTuesday => 'Dimarts';

  @override
  String get settingsWeekdayWednesday => 'Dimecres';

  @override
  String get sortDeadline => 'Data límit';

  @override
  String get sortName => 'Nom';

  @override
  String get sortProgress => 'Progrés';

  @override
  String get sortStatus => 'Estat';

  @override
  String get startupTitle => 'No s\'ha pogut iniciar ECTS Tracker';

  @override
  String get statsActiveDays => 'Dies actius';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}d actius';
  }

  @override
  String get statsAddDeadlines =>
      'Afegeix dates límit per preveure la càrrega.';

  @override
  String get statsComingLoad => 'Càrrega propera';

  @override
  String get statsConsistency => 'Constància';

  @override
  String get statsConsistencyHint =>
      'Dies d\'estudi dels últims 30 dies. Passes petites cada dia superen les atracades.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% dels últims 30 dies';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Assignatura $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Fet / dia (14d)';

  @override
  String get statsEmpty => 'Encara no hi ha sessions';

  @override
  String get statsGap => 'Bretxa';

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
  String get statsLast30Days => 'Últims 30 dies';

  @override
  String get statsLast7Days => 'Últims 7 dies';

  @override
  String get statsNeedPerDay => 'Necessitat / dia';

  @override
  String get statsNext8Weeks => 'Properes 8 setmanes';

  @override
  String get statsOfLast30DaysVolume => 'del volum dels últims 30 dies';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Les setmanes de sobrecàrrega >${threshold}h es marquen en vermell — mou una data límit o retalla l\'abast.';
  }

  @override
  String get statsOverview => 'Resum';

  @override
  String get statsPaceCovers =>
      'El ritme passat cobreix el necessari. Mantén la ratxa.';

  @override
  String statsPaceShort(String gap) {
    return 'Al ritme passat li falten $gap h/dia — afegeix un bloc o retalla l\'abast.';
  }

  @override
  String get statsPastVsNeeded => 'Passat vs. necessari';

  @override
  String statsPeakPerWeek(String peak) {
    return 'màx ${peak}h/setm';
  }

  @override
  String get statsPerCourse => 'Per assignatura';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sessions';

  @override
  String statsSuggestedOrder(String order) {
    return 'Ordre suggerit: $order (data límit més propera primer)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'volum total';

  @override
  String get statusAhead => 'Avançat';

  @override
  String get statusBehind => 'Endarrerit';

  @override
  String get statusCompleted => 'Completat';

  @override
  String get statusOnTrack => 'En bon camí';

  @override
  String get statusOverdue => 'Vençut';

  @override
  String get studyLogDeleteBody =>
      'Suprimir aquesta sessió d\'estudi? Aquesta acció no es pot desfer.';

  @override
  String get studyLogDeleteTitle => 'Suprimir la sessió?';

  @override
  String get studyLogEmptyHint =>
      'Registra una sessió per seguir el temps d\'estudi.';

  @override
  String get studyLogEmptyTitle => 'Encara no hi ha sessions d\'estudi';

  @override
  String get studyLogFabLabel => 'Registra sessió';

  @override
  String get studyLogFabTooltip => 'Registra sessió';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Suprimeix la sessió d\'exemple';

  @override
  String get studyLogThisWeek => 'Aquesta setmana';

  @override
  String get studyLogToday => 'Avui';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Assignatura $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'Els ECTS han de ser superiors a zero';

  @override
  String get validationCourseEctsRequired => 'Introdueix els crèdits ECTS';

  @override
  String get validationCourseNameRequired => 'El nom és obligatori';

  @override
  String get validationCourseNameTooLong => 'El nom és massa llarg';

  @override
  String get validationSessionCourseRequired => 'Tria una assignatura';

  @override
  String get validationSessionDurationRequired => 'Introdueix una durada';

  @override
  String get widgetNoProgress => 'Encara sense progrés';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLiquidGlass => 'Liquid glass';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Frosted glass cards and bars. Off keeps the classic solid look.';

  @override
  String get settingsLiquidGlassOn => 'On';

  @override
  String get settingsLiquidGlassOff => 'Off';

  @override
  String get settingsLiquidGlassUpdated => 'Liquid glass updated.';
}
