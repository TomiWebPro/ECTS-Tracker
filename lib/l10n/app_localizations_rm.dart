// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romansh (`rm`).
class AppLocalizationsRm extends AppLocalizations {
  AppLocalizationsRm([String locale = 'rm']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Interrumper';

  @override
  String get commonClose => 'Serrar';

  @override
  String get commonDelete => 'Stizzar';

  @override
  String get commonEdit => 'Modifitgar';

  @override
  String get commonError => 'Errur';

  @override
  String get commonNone => 'Nagut';

  @override
  String get commonSave => 'Memorisar';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Uras necessarias (automatic): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Stizzar la scadenza';

  @override
  String get courseFormClearStartTooltip => 'Stizzar la data d\'inizi';

  @override
  String get courseFormColorLabel => 'Colur';

  @override
  String get courseFormDateNotSet => 'Betg tschentà';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Scadenza: $date';
  }

  @override
  String get courseFormEctsLabel => 'Credits ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value u/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Num';

  @override
  String get courseFormNotesLabel => 'Notas (facultativ)';

  @override
  String get courseFormSaving => 'Vegn memorisà…';

  @override
  String courseFormStartButton(String date) {
    return 'Inizi: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Off: nagina pressiun fin $date; exclus dal tempo d\'Hoz.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'On: il temp vegn dividì fin uss e quinta per il tempo d\'Hoz.';

  @override
  String get courseFormStartEarlyTitle => 'Cumenzar ussa malgrà l\'inizi futur';

  @override
  String get courseFormTitleAdd => 'Agiuntar in curs';

  @override
  String get courseFormTitleEdit => 'Modifitgar il curs';

  @override
  String get coursesAddTooltip => 'Agiuntar in curs';

  @override
  String coursesDeleteBody(String name) {
    return 'Stizzar «$name» e tuttas sias sesidas da studi? Quai na po betg vegnir revocà.';
  }

  @override
  String get coursesDeleteTitle => 'Stizzar il curs?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Toca «Nov curs» per crear tes emprim curs.';

  @override
  String get coursesEmptyTitle => 'Anc nagins curs';

  @override
  String get coursesFilterAll => 'Tut ils stadis';

  @override
  String get coursesFilterEmpty => 'Nagins curs correspundan a quest filter';

  @override
  String get coursesNewCourse => 'Nov curs';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily u/di necessarias';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/di necessarias';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily u/di • $weekly u/emna necessarias';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/di • $weekly min/emna necessarias';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/di • $weekly u/emna necessarias';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required u • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Allontanar il curs d\'exempel';

  @override
  String coursesShownCount(String count) {
    return '$count mussads';
  }

  @override
  String coursesSortOption(String label) {
    return 'Zavrar: $label';
  }

  @override
  String get dashboardAllDone => 'Tut fatg';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours u protocolladas (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count curs(s)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count curs(s) · $upcoming futurs betg en il tempo d\'hoz';
  }

  @override
  String get dashboardCoursesTitle => 'Curs';

  @override
  String dashboardDeadline(String date) {
    return 'Scadenza $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Scadenza $date ($days dis restants)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Scadenza $date (1 di restant)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Scadenza $date (scaduta)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Scadenza $date (hoz)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Hoz da far — $hours u protocolladas';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Mintga curs è finì — guarda il tab Curs per la glista cumpleta.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Agiunta in curs per persequitar tes progress ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Enavos = fa $achieved/di, dovra $need/di';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Enavos = fa $achieved/di, dovra $need/di · inizi prematur';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Enavos: nagin tempo finit cuntanscha ina scadenza hoz cun uras restantas';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Sin via: anc nagin tempo — protocolla l\'emprima sesida per confermar';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Cumenza en $days dis · quentà da $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Cumenza en $days dis · quentà da $date · inizi prematur on';
  }

  @override
  String get dashboardFreshStart => 'NOV INIZI';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · ${hours}u restantas';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required u';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours u/di';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/di';
  }

  @override
  String get dashboardLogSessionAction => 'Protocollar sesida da studi';

  @override
  String get dashboardLogSessionTooltip => 'Protocollar sesida da studi';

  @override
  String get dashboardNewBadge => 'NOV';

  @override
  String get dashboardNoCourses => 'Anc nagins curs';

  @override
  String get dashboardNoDeadline => 'Nagina scadenza';

  @override
  String get dashboardNoDeadlines => 'Naginas scadenzas planisadas';

  @override
  String get dashboardNoPaceDue => 'Hoz nagin tempo da duvair';

  @override
  String get dashboardNothingDue => 'Nagut da duvair';

  @override
  String get dashboardNothingToTrack => 'Anc nagut da persequitar';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Hoz da far — ${hours}u restantas';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Dovra $daily u/di per finir';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Dovra $daily min/di per finir';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Dovra $daily u/di · $weekly u/emna per finir';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Dovra $daily min/di · $weekly min/emna per finir';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Dovra $daily min/di · $weekly u/emna per finir';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Dovra $hours u/di da $date · betg en il tempo d\'Hoz';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Dovra $minutes min/di da $date · betg en il tempo d\'Hoz';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Nagina scadenza — ${hours}u restantas · nagina pressiun quotidiana';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Cumenza $date · ${hours}u da far';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · nunrealistic';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Agiunta in curs per cumenzar';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required u';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days dis reserva';
  }

  @override
  String get dashboardStartNotSet => 'Betg tschentà';

  @override
  String dashboardStartsIn(String days) {
    return 'Cumenza en ${days}dis';
  }

  @override
  String get dashboardStartsSoon => 'Cumenza prest';

  @override
  String get dashboardTipEmpty =>
      'Agiunta tes emprim curs — tes tempo quotidian ed il progress cumparan qua.';

  @override
  String get dashboardTipFirst =>
      'Las emprimas 25 minutas quintan il pli — tscherna il curs cun l\'emprima scadenza.';

  @override
  String get dashboardTodayBare => 'HOZ';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace u';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'HOZ $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'TEMPO D\'HOZ';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace u hoz';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Inizis futurs — nagina pressiun hoz, exclus dal tempo d\'Hoz.';

  @override
  String get dashboardUpcomingTitle => 'Futur';

  @override
  String get devToolsActivate => 'Activar';

  @override
  String get devToolsActivateMessage =>
      'Quai debloca instuments zuppads per tests da stress (datas generadas). Sulettamain per il svilup.';

  @override
  String get devToolsActivateTitle => 'Activar il modus da svilup?';

  @override
  String get devToolsActivated => 'Modus da svilup activà.';

  @override
  String get devToolsClearPumped => 'Stizzar las datas pompadas';

  @override
  String get devToolsClearPumpedMessage =>
      'Stizza ils curs STRESS generads e lur sesidas. Tias atgnas datas vegnan mantegndas.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Stizzar ils curs e las sesidas STRESS generads.';

  @override
  String get devToolsClearPumpedTitle => 'Stizzar las datas pompadas?';

  @override
  String devToolsCleared(String count) {
    return 'Stizzà $count curs(s) pompads.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Segunda conferma: quai vegn ad enflar curs, glistas, diagramms e calculaziuns dal tempo, e po durar in pèr secundas. Pompar ussa?';

  @override
  String get devToolsConfirmPumpTitle => 'Confermar la pompa da stress';

  @override
  String get devToolsContinue => 'Cuntinuar';

  @override
  String get devToolsExit => 'Sortir dal modus da svilup';

  @override
  String get devToolsExitSubtitle =>
      'Zuppentar ils instuments da svilup sin quest apparat.';

  @override
  String get devToolsPumpData => 'Pompar datas';

  @override
  String get devToolsPumpMessage =>
      'Quai inserescha in semestrer generà realistic (~10 curs, ~800 sesidas sur las ultimas 12 emnas). Tias datas vegnan mantegndas. Cuntinuar?';

  @override
  String get devToolsPumpSubtitle =>
      'Inserir in semestrer generà (~10 curs, ~800 sesidas, 12 emnas). Datas mantegndas.';

  @override
  String get devToolsPumpTile => 'Pompar datas da test';

  @override
  String get devToolsPumpTitle => 'Pompar datas da test?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Pompà $courses curs, $sessions sesidas.';
  }

  @override
  String get devToolsPumping => 'Vegn a pompar datas da test…';

  @override
  String get devToolsRemoveAll => 'Allontanar tuttas datas';

  @override
  String get devToolsRemoveAllMessage =>
      'Scursanida da svilup: quai stizza definitivamain TUTS curs, sesidas e configuraziuns. Quai na po betg vegnir revocà.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Scursanida da svilup: stizzar TUTS curs, sesidas e configuraziuns.';

  @override
  String get devToolsRemoveAllTitle => 'Allontanar tuttas datas?';

  @override
  String get navCourses => 'Curs';

  @override
  String get navDashboard => 'Survista';

  @override
  String get navSettings => 'Configuraziuns';

  @override
  String get navStatistics => 'Statistica';

  @override
  String get navStudyLog => 'Diari da studi';

  @override
  String get sampleBadge => 'Exempel';

  @override
  String get sessionFormCourseLabel => 'Curs';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError =>
      'La durada sto esser pli gronda che nulla.';

  @override
  String get sessionFormHoursLabel => 'Uras';

  @override
  String get sessionFormLogAction => 'Protocollar sesida';

  @override
  String get sessionFormMinutesLabel => 'Minutas';

  @override
  String get sessionFormModeManual => 'Manual';

  @override
  String get sessionFormModeTimer => 'Timer';

  @override
  String get sessionFormNoCourseError => 'Tscherna in curs.';

  @override
  String get sessionFormNoCoursesHint =>
      'Agiunta l\'emprim in curs per protocollar ina sesida.';

  @override
  String get sessionFormNotesLabel => 'Notas (facultativ)';

  @override
  String get sessionFormSaving => 'Vegn memorisà…';

  @override
  String get sessionFormTitleAdd => 'Protocollar sesida da studi';

  @override
  String get sessionFormTitleEdit => 'Modifitgar la sesida da studi';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total: $hours u';
  }

  @override
  String get settingsAccent => 'Colur d\'accent';

  @override
  String get settingsAccentBerry => 'Bera';

  @override
  String get settingsAccentClay => 'Arschiglia';

  @override
  String get settingsAccentForest => 'Guaud';

  @override
  String get settingsAccentSlate => 'Schista';

  @override
  String get settingsAccentTeal => 'Verd petrol';

  @override
  String get settingsAccentUpdated => 'Colur d\'accent actualisada.';

  @override
  String get settingsAllDataDeleted => 'Tuttas datas stizzadas.';

  @override
  String get settingsAppearance => 'Cumparsa (stgir / cler)';

  @override
  String get settingsCheckingSample => 'Controllescha datas d\'exempel…';

  @override
  String get settingsClear => 'Stizzar';

  @override
  String get settingsClearSample => 'Stizzar datas d\'exempel';

  @override
  String get settingsClearSampleMessage =>
      'Quai allontanescha ils curs e las sesidas d\'exempel. Curs u sesidas che ti has agiuntà sez na vegnan betg allontanads.';

  @override
  String get settingsClearSampleSubtitle =>
      'Allontanar ils curs e las sesidas d\'exempel. Tias atgnas datas vegnan mantegndas.';

  @override
  String get settingsClearSampleTitle => 'Stizzar datas d\'exempel?';

  @override
  String get settingsCopy => 'Copiar';

  @override
  String get settingsDailyError =>
      'Endatescha 0 u in dumber positiv da minutas.';

  @override
  String get settingsDailyLabel => 'Minutas per di (0 = nagina finamira)';

  @override
  String get settingsDailyTarget => 'Finamira da studi quotidiana';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/di';
  }

  @override
  String get settingsDailyUpdated => 'Finamira quotidiana actualisada.';

  @override
  String get settingsData => 'Datas';

  @override
  String get settingsDeleteEverything => 'Stizzar tut';

  @override
  String get settingsDevMode => 'Modus da svilup';

  @override
  String get settingsDisplay => 'Visualisaziun';

  @override
  String get settingsDisplayComfortable => 'Cumadaivel';

  @override
  String get settingsDisplayCompact => 'Compact';

  @override
  String get settingsDisplayLarge => 'Grond';

  @override
  String get settingsDisplaySize => 'Grondezza da text & elements';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated =>
      'Grondezza da visualisaziun actualisada.';

  @override
  String get settingsExport => 'Exportar datas';

  @override
  String get settingsExportCopied => 'Export copià en la memoria.';

  @override
  String get settingsExportSubtitle =>
      'Copiar tuts curs, sesidas e configuraziuns sco JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses curs(s) · $sessions sesida(s) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (scursanì — il backup cumplet è $kb KB, duvra Copiar per tut)';
  }

  @override
  String get settingsFirstWeekday => 'Emprim di da l\'emna';

  @override
  String get settingsFirstWeekdayUpdated => 'Emprim di da l\'emna actualisà.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (tegnair ${seconds}s)';
  }

  @override
  String get settingsHoldToReplace => 'Tegnair per remplazzar tut';

  @override
  String get settingsHoursError => 'Endatescha in dumber pli grond che nulla.';

  @override
  String get settingsHoursHelper =>
      'Standard 30. Midar recalculescha las pretensiuns; protocollaziuns vegnan mantegndas.';

  @override
  String get settingsHoursLabel => 'Uras per credit ECTS';

  @override
  String get settingsHoursPerEcts => 'Uras per ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value u';
  }

  @override
  String get settingsHoursUpdated => 'Uras per ECTS actualisadas.';

  @override
  String get settingsImport => 'Importar datas';

  @override
  String get settingsImportAppend => 'Agiuntar';

  @override
  String get settingsImportAppendAction => 'Importar (agiuntar)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Datas agiuntadas: $courses curs(s), $sessions sesida(s) agiuntads.';
  }

  @override
  String get settingsImportInfo =>
      'Agiuntar metta il backup sper tias datas actualas (configuraziuns mantegndas). Remplazzar stizza l\'emprim TUTS curs, sesidas e configuraziuns.';

  @override
  String get settingsImportLabel => 'Enfiantar il JSON exportà';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses curs(s) · $sessions sesida(s)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· exportà $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· schema v$schema';
  }

  @override
  String get settingsImportReplace => 'Remplazzar';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Remplazzar stizza l\'emprim tut. Smatta e TEGNA il buttun qua sut per $seconds secundas per confermar.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Datas remplazzadas: $courses curs(s), $sessions sesida(s) restaurads.';
  }

  @override
  String get settingsImportSubtitle =>
      'Remplazzar tuttas datas cun in backup JSON exportà pli baud.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Cuntinuescha a tegnair… $remaining s';
  }

  @override
  String get settingsNoSample => 'Naginas datas d\'exempel';

  @override
  String get settingsNoSampleSubtitle =>
      'Las datas d\'exempel èn gia stizzadas.';

  @override
  String get settingsNoTarget => 'Nagina finamira tschentada';

  @override
  String get settingsOverloadError => 'Endatescha in dumber 5–100 u/emna.';

  @override
  String get settingsOverloadHelper =>
      'Emnas cun chargia futura sur quai vegnan marcadas cotschen. Studi a temp cumplet è ~35–40 u/emna.';

  @override
  String settingsOverloadHours(String value) {
    return '$value u';
  }

  @override
  String get settingsOverloadLabel => 'Uras per emna (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/emna vegnan marcadas cotschen';
  }

  @override
  String get settingsOverloadThreshold => 'Svellina da surchargia emnala';

  @override
  String get settingsOverloadUpdated => 'Svellina da surchargia actualisada.';

  @override
  String get settingsPaceTolerance => 'Toleranza enavant / enavos';

  @override
  String get settingsPasteValidBackup => 'Enfiantar l\'emprim in backup valid';

  @override
  String get settingsReset => 'Reinizialisar';

  @override
  String get settingsResetAll => 'Reinizialisar tuttas datas';

  @override
  String get settingsResetAllMessage =>
      'Quai stizza definitivamain TUTS curs, sesidas e configuraziuns. Quai na po betg vegnir revocà. Exportescha l\'emprim in backup sche necessari.';

  @override
  String get settingsResetAllSubtitle =>
      'Stizzar tuts curs, sesidas e configuraziuns.';

  @override
  String get settingsResetAllTitle => 'Reinizialisar tuttas datas?';

  @override
  String get settingsResetSettings => 'Reinizialisar configuraziuns';

  @override
  String get settingsResetSettingsDone =>
      'Configuraziuns reinizialisadas als standards.';

  @override
  String get settingsResetSettingsMessage =>
      'Restaurescha uras-per-ECTS (30), finamira quotidiana (nagut), emprim di d\'emna (glindesdi), visad (system), toleranza (5 dis), surchargia (35 u/emna), grondezza (cumadaivla), colur (schista). Curs e sesidas vegnan mantegnds.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Restaurar ils standards: 30 u/ECTS, nagina finamira, glindesdi, visad da system, toleranza da 5 dis, surchargia 35 u/emna, grondezza cumadaivla, colur schista.';

  @override
  String get settingsResetSettingsTitle => 'Reinizialisar configuraziuns?';

  @override
  String get settingsSampleData => 'Datas d\'exempel';

  @override
  String settingsSampleDataError(String error) {
    return 'Errur: $error';
  }

  @override
  String get settingsStudySettings => 'Configuraziuns da studi';

  @override
  String get settingsThemeDark => 'Stgir';

  @override
  String get settingsThemeLight => 'Cler';

  @override
  String get settingsThemeSystem => 'Standard dal sistem';

  @override
  String get settingsThemeTitle => 'Visad';

  @override
  String get settingsThemeUpdated => 'Visad actualisà.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dis';
  }

  @override
  String get settingsToleranceError => 'Endatescha in dumber 0–30 dis.';

  @override
  String get settingsToleranceHelper =>
      'Enavant dovra +N dis surplus, enavos −N dis. 5 = stabil, 0 = sensibel.';

  @override
  String get settingsToleranceLabel => 'Dis da lavur (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance da lavur';
  }

  @override
  String get settingsToleranceUpdated => 'Toleranza actualisada.';

  @override
  String get settingsWeekdayFriday => 'Venderdi';

  @override
  String get settingsWeekdayMonday => 'Glindesdi';

  @override
  String get settingsWeekdaySaturday => 'Sonda';

  @override
  String get settingsWeekdaySunday => 'Dumengia';

  @override
  String get settingsWeekdayThursday => 'Gievgia';

  @override
  String get settingsWeekdayTuesday => 'Mardi';

  @override
  String get settingsWeekdayWednesday => 'Mesemna';

  @override
  String get sortDeadline => 'Scadenza';

  @override
  String get sortName => 'Num';

  @override
  String get sortProgress => 'Progress';

  @override
  String get sortStatus => 'Stadi';

  @override
  String get startupTitle => 'ECTS Tracker na pudeva betg vegnir avià';

  @override
  String get statsActiveDays => 'Dis activs';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}d activs';
  }

  @override
  String get statsAddDeadlines =>
      'Agiunta scadenzas per pronosticar la chargia.';

  @override
  String get statsComingLoad => 'Chargia futura';

  @override
  String get statsConsistency => 'Constanza';

  @override
  String get statsConsistencyHint =>
      'Dis da studi en ils ultims 30 dis. Pitschens pass mintga di batan il cramming.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% dals ultims 30 dis';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Curs $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Fatg / di (14d)';

  @override
  String get statsEmpty => 'Anc naginas sesidas';

  @override
  String get statsGap => 'Differenza';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value u';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}u';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours u';
  }

  @override
  String get statsLast30Days => 'Ultims 30 dis';

  @override
  String get statsLast7Days => 'Ultims 7 dis';

  @override
  String get statsNeedPerDay => 'Dovrà / di';

  @override
  String get statsNext8Weeks => 'Proximas 8 emnas';

  @override
  String get statsOfLast30DaysVolume => 'dal volum dals ultims 30 dis';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Emnas da surchargia >${threshold}u marcadas cotschen — sposta ina scadenza u reducescha l\'extensiun.';
  }

  @override
  String get statsOverview => 'Survista';

  @override
  String get statsPaceCovers =>
      'Il tempo passà cuvra quai ch\'è necessari. Resta vidlunder.';

  @override
  String statsPaceShort(String gap) {
    return 'Il tempo passà è $gap u/di memia bass — agiunta in bloc u reducescha l\'extensiun.';
  }

  @override
  String get statsPastVsNeeded => 'Passà vs necessari';

  @override
  String statsPeakPerWeek(String peak) {
    return 'piz ${peak}u/emna';
  }

  @override
  String get statsPerCourse => 'Per curs';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done u / $required u · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sesidas';

  @override
  String statsSuggestedOrder(String order) {
    return 'Uorden proponì: $order (l\'emprima scadenza l\'emprim)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'volum total';

  @override
  String get statusAhead => 'Enavant';

  @override
  String get statusBehind => 'Enavos';

  @override
  String get statusCompleted => 'Finì';

  @override
  String get statusOnTrack => 'Sin via';

  @override
  String get statusOverdue => 'Scadì';

  @override
  String get studyLogDeleteBody =>
      'Stizzar questa sesida da studi? Quai na po betg vegnir revocà.';

  @override
  String get studyLogDeleteTitle => 'Stizzar la sesida?';

  @override
  String get studyLogEmptyHint =>
      'Protocolla ina sesida per persequitar tes temp da studi.';

  @override
  String get studyLogEmptyTitle => 'Anc naginas sesidas da studi';

  @override
  String get studyLogFabLabel => 'Protocollar sesida';

  @override
  String get studyLogFabTooltip => 'Protocollar sesida';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours u';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Allontanar la sesida d\'exempel';

  @override
  String get studyLogThisWeek => 'Questa emna';

  @override
  String get studyLogToday => 'Hoz';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Curs $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return 'Timing $course';
  }

  @override
  String get studyTimerAlreadyRunning =>
      'A timer is already running. Finish or discard it first.';

  @override
  String get studyTimerCourseLabel => 'Course';

  @override
  String get studyTimerDiscard => 'Discard';

  @override
  String get studyTimerDiscardBody =>
      'Throw away the current timer without logging? This cannot be undone.';

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
  String get validationCourseEctsPositive =>
      'ECTS sto esser pli grond che nulla';

  @override
  String get validationCourseEctsRequired => 'Endatescha credits ECTS';

  @override
  String get validationCourseNameRequired => 'Il num è necessari';

  @override
  String get validationCourseNameTooLong => 'Il num è memia lung';

  @override
  String get validationSessionCourseRequired => 'Tscherna in curs';

  @override
  String get validationSessionDurationRequired => 'Endatescha ina durada';

  @override
  String get widgetNoProgress => 'Anc nagin progress';

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get settingsLiquidGlass => 'Veder liquid';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Cartas e travs en veder smeriglià. Off mantegna la cumparsa classica solida.';

  @override
  String get settingsLiquidGlassOn => 'On';

  @override
  String get settingsLiquidGlassOff => 'Off';

  @override
  String get settingsLiquidGlassUpdated => 'Veder liquid actualisà.';

  @override
  String get devToolsReminderPreview => 'Anteprima dals regurds';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Guarda tge che notifitgass ussa. Feed da test segir per Windows.';

  @override
  String get reminderPreviewTitle => 'Anteprima dals regurds';

  @override
  String get reminderPreviewNow => 'Temp da l\'anteprima';

  @override
  String get reminderPreviewReset => 'Ussa';

  @override
  String get reminderPreviewEmpty =>
      'Tut quiet — nagina notifica a quest temp.';

  @override
  String get reminderPreviewCustom => 'Plans persunalisads (demo)';

  @override
  String get reminderPreviewNoFire => 'Nagina activaziun imminenta.';

  @override
  String get reminderKindDaily => 'Quotidian';

  @override
  String get reminderKindBehind => 'Enavos';

  @override
  String get reminderKindDeadline => 'Scadenza';

  @override
  String get reminderKindOverdue => 'Scadì';

  @override
  String get reminderKindStreak => 'Serie';

  @override
  String get reminderKindCustom => 'Persunalisà';

  @override
  String get settingsReminders => 'Regurds da studi';

  @override
  String get settingsRemindersOff => 'Off — activar per in regurd quotidian.';

  @override
  String get settingsReminderTime => 'Ura dal regurd';

  @override
  String get settingsReminderDenied =>
      'Las notificas èn bloccadas — activar en las configuraziuns dal sistem.';

  @override
  String notifDurationHours(String value) {
    return '$value u';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value min';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Hoz saira: $duration per restar Sin via';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course anc $duration oz';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count dapli)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Protocolla ina sesida per serrar oz.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course è crudà Enavos';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return 'Anc $left, anc $days dis — $pace/di da qua. Protocolla $catchUp per turnar Sin via.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return 'Anc $left, anc $days dis — $pace/di da qua. Sule finir tut las $left schlia quai — cumenza hoz saira.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return 'Anc avert $left e la scadenza è qua. Mintga ch\'ins protocollescha uossa vala.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course ha scadenza damaun ed ha anc avert $left';
  }

  @override
  String get notifDeadlineTomorrowBody =>
      'Mintga ch\'ins protocollescha oz vala dubel.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Examen da $course en $days dis — anc $left';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Quai è $pace/di. Parta: 2 sesidas al di batan ina maratona.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace =>
      'Mintga ura ch\'ins protocollescha uossa vala.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course ha surpassà la scadenza cun $left avert';
  }

  @override
  String get notifOverdueBody =>
      'Spusta la scadenza u finì las uras — il curs resta en Dovra attenziun fin là.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 Serie da $days dis — $week questa emna';
  }

  @override
  String get notifStreakBody => 'Tut ils curs Sin via u Enavant. Bel progred.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Check-in da studi: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Temp d\'actualisar: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left avert · $pace/di per finir a temp. Protocolla ina sesida per actualisar il progress.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return 'Anc avert $left — mintga ch\'ins protocollescha uossa vala.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Prossem: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1d';

  @override
  String get reminderPreviewFwdDay => '+1d';

  @override
  String get reminderPreviewFake => '(fals)';

  @override
  String get reminderPreviewDemoLabel => 'Check-in demo';
}
