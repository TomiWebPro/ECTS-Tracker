// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonError => 'Erreur';

  @override
  String get commonNone => 'Aucun';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Heures requises (auto) : $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Effacer l’échéance';

  @override
  String get courseFormClearStartTooltip => 'Effacer la date de début';

  @override
  String get courseFormColorLabel => 'Couleur';

  @override
  String get courseFormDateNotSet => 'Non définie';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Échéance : $date';
  }

  @override
  String get courseFormEctsLabel => 'Crédits ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nom';

  @override
  String get courseFormNotesLabel => 'Notes (facultatif)';

  @override
  String get courseFormSaving => 'Enregistrement…';

  @override
  String courseFormStartButton(String date) {
    return 'Début : $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Désactivé : aucune pression jusqu’au $date ; exclu du rythme du jour.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Activé : le temps est réparti jusqu’à maintenant et compte pour le rythme du jour.';

  @override
  String get courseFormStartEarlyTitle => 'Commencer malgré un début futur';

  @override
  String get courseFormTitleAdd => 'Ajouter un cours';

  @override
  String get courseFormTitleEdit => 'Modifier le cours';

  @override
  String get coursesAddTooltip => 'Ajouter un cours';

  @override
  String coursesDeleteBody(String name) {
    return 'Supprimer « $name » et toutes ses sessions d’étude ? Cette action est irréversible.';
  }

  @override
  String get coursesDeleteTitle => 'Supprimer le cours ?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Touchez « Nouveau cours » pour créer votre premier cours.';

  @override
  String get coursesEmptyTitle => 'Aucun cours pour l’instant';

  @override
  String get coursesFilterAll => 'Tous les statuts';

  @override
  String get coursesFilterEmpty => 'Aucun cours ne correspond à ce filtre';

  @override
  String get coursesNewCourse => 'Nouveau cours';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily h/jour nécessaires';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily h/jour • $weekly h/semaine nécessaires';
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
  String get coursesRemoveSampleTooltip => 'Supprimer le cours d’exemple';

  @override
  String coursesShownCount(String count) {
    return '$count affichés';
  }

  @override
  String coursesSortOption(String label) {
    return 'Tri : $label';
  }

  @override
  String get dashboardAllDone => 'Tout est terminé';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h enregistrées (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count cours';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count cours · $upcoming à venir exclus du rythme du jour';
  }

  @override
  String get dashboardCoursesTitle => 'Cours';

  @override
  String dashboardDeadline(String date) {
    return 'Échéance $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Échéance $date (plus que $days jours)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Échéance $date (plus qu’un jour)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Échéance $date (en retard)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Échéance $date (aujourd’hui)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Dû aujourd’hui — $hours h enregistrées';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Tous les cours sont terminés — voir l’onglet Cours pour la liste complète.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Ajoutez un cours pour suivre votre progression ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'En retard = $achieved/j réalisés, $need/j requis';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'En retard = $achieved/j réalisés, $need/j requis · début anticipé';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'En retard : aucun rythme fini ne permet de tenir une échéance aujourd’hui avec des heures restantes';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'En bonne voie : pas encore de rythme — enregistrez la première session pour confirmer';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Commence dans $days j · compté à partir du $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Commence dans $days j · compté à partir du $date · début anticipé activé';
  }

  @override
  String get dashboardFreshStart => 'NOUVEAU DÉPART';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct % · $hours h restantes';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/jour';
  }

  @override
  String get dashboardLogSessionAction => 'Enregistrer une session d’étude';

  @override
  String get dashboardLogSessionTooltip => 'Enregistrer une session d’étude';

  @override
  String get dashboardNewBadge => 'NOUVEAU';

  @override
  String get dashboardNoCourses => 'Aucun cours pour l’instant';

  @override
  String get dashboardNoDeadline => 'Aucune échéance';

  @override
  String get dashboardNoDeadlines => 'Aucune échéance planifiée';

  @override
  String get dashboardNoPaceDue => 'Aucun rythme dû aujourd’hui';

  @override
  String get dashboardNothingDue => 'Rien à faire';

  @override
  String get dashboardNothingToTrack => 'Rien à suivre pour l’instant';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Dû aujourd’hui — reste $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Il faut $daily h/jour pour terminer';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Il faut $daily h/jour · $weekly h/semaine pour terminer';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Il faut $hours h/jour à partir du $date · exclu du rythme du jour';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Aucune échéance — $hours h restantes · aucune pression quotidienne';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Commence le $date · $hours h à faire';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · irréaliste';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMME';

  @override
  String get dashboardProgramEmptyHint => 'Ajoutez un cours pour commencer';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMME $pct %';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days jours de marge';
  }

  @override
  String get dashboardStartNotSet => 'Non définie';

  @override
  String dashboardStartsIn(String days) {
    return 'Commence dans $days j';
  }

  @override
  String get dashboardStartsSoon => 'Commence bientôt';

  @override
  String get dashboardTipEmpty =>
      'Ajoutez votre premier cours — votre rythme quotidien et votre progression apparaîtront ici.';

  @override
  String get dashboardTipFirst =>
      'Les 25 premières minutes comptent le plus — choisissez le cours à l’échéance la plus proche.';

  @override
  String get dashboardTodayBare => 'AUJOURD’HUI';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'AUJOURD’HUI $pct %';
  }

  @override
  String get dashboardTodayPaceLabel => 'RYTHME DU JOUR';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h aujourd’hui';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Débuts futurs — aucune pression aujourd’hui, exclus du rythme du jour.';

  @override
  String get dashboardUpcomingTitle => 'À venir';

  @override
  String get devToolsActivate => 'Activer';

  @override
  String get devToolsActivateMessage =>
      'Cela déverrouille des outils de test cachés (génération de données). Réservé au développement.';

  @override
  String get devToolsActivateTitle => 'Activer le mode dev ?';

  @override
  String get devToolsActivated => 'Mode dev activé.';

  @override
  String get devToolsClearPumped => 'Effacer les données générées';

  @override
  String get devToolsClearPumpedMessage =>
      'Supprime les cours STRESS générés et leurs sessions. Vos propres données sont conservées.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Supprimer les cours et sessions STRESS générés.';

  @override
  String get devToolsClearPumpedTitle => 'Effacer les données générées ?';

  @override
  String devToolsCleared(String count) {
    return '$count cours généré(s) effacé(s).';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Seconde confirmation : cela va gonfler cours, listes, graphiques et calculs de rythme, et peut prendre quelques secondes. Générer maintenant ?';

  @override
  String get devToolsConfirmPumpTitle => 'Confirmer le test de charge';

  @override
  String get devToolsContinue => 'Continuer';

  @override
  String get devToolsExit => 'Quitter le mode dev';

  @override
  String get devToolsExitSubtitle => 'Masquer les outils dev sur cet appareil.';

  @override
  String get devToolsPumpData => 'Générer des données';

  @override
  String get devToolsPumpMessage =>
      'Cela insère un semestre généré réaliste (~10 cours, ~800 sessions sur les 12 dernières semaines). Vos données existantes sont conservées. Continuer ?';

  @override
  String get devToolsPumpSubtitle =>
      'Insérer un semestre généré (~10 cours, ~800 sessions, 12 semaines). Données existantes conservées.';

  @override
  String get devToolsPumpTile => 'Générer des données de test';

  @override
  String get devToolsPumpTitle => 'Générer des données de test ?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses cours, $sessions sessions généré(e)s.';
  }

  @override
  String get devToolsPumping => 'Génération des données de test…';

  @override
  String get devToolsRemoveAll => 'Tout supprimer';

  @override
  String get devToolsRemoveAllMessage =>
      'Raccourci dev : cela supprime définitivement TOUS les cours, sessions et réglages. Cette action est irréversible.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Raccourci dev : supprimer TOUS les cours, sessions et réglages.';

  @override
  String get devToolsRemoveAllTitle => 'Tout supprimer ?';

  @override
  String get navCourses => 'Cours';

  @override
  String get navDashboard => 'Tableau de bord';

  @override
  String get navSettings => 'Réglages';

  @override
  String get navStatistics => 'Statistiques';

  @override
  String get navStudyLog => 'Journal d’étude';

  @override
  String get sampleBadge => 'Exemple';

  @override
  String get sessionFormCourseLabel => 'Cours';

  @override
  String sessionFormDateButton(String date) {
    return 'Date : $date';
  }

  @override
  String get sessionFormDurationError =>
      'La durée doit être supérieure à zéro.';

  @override
  String get sessionFormHoursLabel => 'Heures';

  @override
  String get sessionFormLogAction => 'Enregistrer la session';

  @override
  String get sessionFormMinutesLabel => 'Minutes';

  @override
  String get sessionFormNoCourseError => 'Sélectionnez un cours.';

  @override
  String get sessionFormNoCoursesHint =>
      'Ajoutez d’abord un cours pour enregistrer une session.';

  @override
  String get sessionFormNotesLabel => 'Notes (facultatif)';

  @override
  String get sessionFormSaving => 'Enregistrement…';

  @override
  String get sessionFormTitleAdd => 'Enregistrer une session d’étude';

  @override
  String get sessionFormTitleEdit => 'Modifier la session d’étude';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total : $hours h';
  }

  @override
  String get settingsAccent => 'Couleur du thème';

  @override
  String get settingsAccentBerry => 'Baie';

  @override
  String get settingsAccentClay => 'Terre cuite';

  @override
  String get settingsAccentForest => 'Forêt';

  @override
  String get settingsAccentSlate => 'Ardoise';

  @override
  String get settingsAccentTeal => 'Sarcelle';

  @override
  String get settingsAccentUpdated => 'Couleur du thème mise à jour.';

  @override
  String get settingsAllDataDeleted => 'Toutes les données ont été supprimées.';

  @override
  String get settingsAppearance => 'Apparence (sombre / clair)';

  @override
  String get settingsCheckingSample => 'Vérification des données d’exemple…';

  @override
  String get settingsClear => 'Effacer';

  @override
  String get settingsClearSample => 'Effacer les données d’exemple';

  @override
  String get settingsClearSampleMessage =>
      'Cela supprime les cours et sessions d’exemple. Les cours ou sessions que vous avez ajoutés ne sont pas supprimés.';

  @override
  String get settingsClearSampleSubtitle =>
      'Supprimer les cours et sessions d’exemple fournis. Vos propres données sont conservées.';

  @override
  String get settingsClearSampleTitle => 'Effacer les données d’exemple ?';

  @override
  String get settingsCopy => 'Copier';

  @override
  String get settingsDailyError =>
      'Saisissez 0 ou un nombre positif de minutes.';

  @override
  String get settingsDailyLabel => 'Minutes par jour (0 = aucun objectif)';

  @override
  String get settingsDailyTarget => 'Objectif d’étude quotidien';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/jour';
  }

  @override
  String get settingsDailyUpdated => 'Objectif quotidien mis à jour.';

  @override
  String get settingsData => 'Données';

  @override
  String get settingsDeleteEverything => 'Tout supprimer';

  @override
  String get settingsDevMode => 'Mode dev';

  @override
  String get settingsDisplay => 'Affichage';

  @override
  String get settingsDisplayComfortable => 'Confortable';

  @override
  String get settingsDisplayCompact => 'Compact';

  @override
  String get settingsDisplayLarge => 'Grand';

  @override
  String get settingsDisplaySize => 'Taille du texte et des éléments';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent %)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Taille d’affichage mise à jour.';

  @override
  String get settingsExport => 'Exporter les données';

  @override
  String get settingsExportCopied => 'Export copié dans le presse-papiers.';

  @override
  String get settingsExportSubtitle =>
      'Copier tous les cours, sessions et réglages en JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses cours · $sessions session(s) · $kb Ko';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (tronqué — la sauvegarde complète fait $kb Ko, utilisez Copier pour tout)';
  }

  @override
  String get settingsFirstWeekday => 'Premier jour de la semaine';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Premier jour de la semaine mis à jour.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (maintenir $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Maintenir pour tout remplacer';

  @override
  String get settingsHoursError => 'Saisissez un nombre supérieur à zéro.';

  @override
  String get settingsHoursHelper =>
      'Par défaut 30. Toute modification recalcule les exigences ; les relevés sont conservés.';

  @override
  String get settingsHoursLabel => 'Heures par crédit ECTS';

  @override
  String get settingsHoursPerEcts => 'Heures par ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Heures par ECTS mises à jour.';

  @override
  String get settingsImport => 'Importer des données';

  @override
  String get settingsImportAppend => 'Ajouter';

  @override
  String get settingsImportAppendAction => 'Importer (ajouter)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Données ajoutées : $courses cours, $sessions session(s) ajouté(e)s.';
  }

  @override
  String get settingsImportInfo =>
      'L’ajout ajoute la sauvegarde à vos données actuelles (réglages conservés). Remplacer efface d’abord TOUS les cours, sessions et réglages.';

  @override
  String get settingsImportLabel => 'Coller le JSON exporté';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses cours · $sessions session(s)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · exporté le $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · schéma v$schema';
  }

  @override
  String get settingsImportReplace => 'Remplacer';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Remplacer supprime d’abord tout. Maintenez le bouton ci-dessous pendant $seconds secondes pour confirmer.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Données remplacées : $courses cours, $sessions session(s) restauré(e)s.';
  }

  @override
  String get settingsImportSubtitle =>
      'Remplacer toutes les données à partir d’une sauvegarde JSON exportée.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Continuez à maintenir… $remaining s';
  }

  @override
  String get settingsNoSample => 'Aucune donnée d’exemple';

  @override
  String get settingsNoSampleSubtitle =>
      'Les données d’exemple fournies ont déjà été effacées.';

  @override
  String get settingsNoTarget => 'Aucun objectif défini';

  @override
  String get settingsOverloadError =>
      'Saisissez un nombre de 5 à 100 h/semaine.';

  @override
  String get settingsOverloadHelper =>
      'Les semaines à venir au-dessus de ce seuil sont signalées en rouge. Des études à temps plein représentent ~35–40 h/semaine.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Heures par semaine (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/semaine signalé en rouge';
  }

  @override
  String get settingsOverloadThreshold => 'Seuil de surcharge hebdomadaire';

  @override
  String get settingsOverloadUpdated => 'Seuil de surcharge mis à jour.';

  @override
  String get settingsPaceTolerance => 'Tolérance d’avance / de retard';

  @override
  String get settingsPasteValidBackup => 'Collez d’abord une sauvegarde valide';

  @override
  String get settingsReset => 'Réinitialiser';

  @override
  String get settingsResetAll => 'Réinitialiser toutes les données';

  @override
  String get settingsResetAllMessage =>
      'Cela supprime définitivement TOUS les cours, sessions et réglages. Cette action est irréversible. Exportez d’abord une sauvegarde si besoin.';

  @override
  String get settingsResetAllSubtitle =>
      'Supprimer tous les cours, sessions et réglages.';

  @override
  String get settingsResetAllTitle => 'Réinitialiser toutes les données ?';

  @override
  String get settingsResetSettings => 'Réinitialiser les réglages';

  @override
  String get settingsResetSettingsDone => 'Réglages réinitialisés par défaut.';

  @override
  String get settingsResetSettingsMessage =>
      'Restaure heures-par-ECTS (30), objectif quotidien (aucun), premier jour (lundi), thème (système), tolérance (5 jours), surcharge (35 h/semaine), taille (confortable), couleur (ardoise). Cours et sessions conservés.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Restaurer les valeurs par défaut : 30 h/ECTS, aucun objectif, lundi, thème système, tolérance 5 jours, surcharge 35 h/semaine, taille confortable, couleur ardoise.';

  @override
  String get settingsResetSettingsTitle => 'Réinitialiser les réglages ?';

  @override
  String get settingsSampleData => 'Données d’exemple';

  @override
  String settingsSampleDataError(String error) {
    return 'Erreur : $error';
  }

  @override
  String get settingsStudySettings => 'Réglages d’étude';

  @override
  String get settingsThemeDark => 'Sombre';

  @override
  String get settingsThemeLight => 'Clair';

  @override
  String get settingsThemeSystem => 'Système par défaut';

  @override
  String get settingsThemeTitle => 'Thème';

  @override
  String get settingsThemeUpdated => 'Thème mis à jour.';

  @override
  String settingsToleranceDays(String value) {
    return '$value jours';
  }

  @override
  String get settingsToleranceError => 'Saisissez un nombre de 0 à 30 jours.';

  @override
  String get settingsToleranceHelper =>
      'L’avance nécessite +N jours de surplus, le retard −N jours. 5 = stable, 0 = sensible.';

  @override
  String get settingsToleranceLabel => 'Jours de travail (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance de travail';
  }

  @override
  String get settingsToleranceUpdated => 'Tolérance mise à jour.';

  @override
  String get settingsWeekdayFriday => 'Vendredi';

  @override
  String get settingsWeekdayMonday => 'Lundi';

  @override
  String get settingsWeekdaySaturday => 'Samedi';

  @override
  String get settingsWeekdaySunday => 'Dimanche';

  @override
  String get settingsWeekdayThursday => 'Jeudi';

  @override
  String get settingsWeekdayTuesday => 'Mardi';

  @override
  String get settingsWeekdayWednesday => 'Mercredi';

  @override
  String get sortDeadline => 'Échéance';

  @override
  String get sortName => 'Nom';

  @override
  String get sortProgress => 'Progression';

  @override
  String get sortStatus => 'Statut';

  @override
  String get startupTitle => 'Impossible de démarrer ECTS Tracker';

  @override
  String get statsActiveDays => 'Jours actifs';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days j actifs';
  }

  @override
  String get statsAddDeadlines =>
      'Ajoutez des échéances pour prévoir la charge.';

  @override
  String get statsComingLoad => 'Charge à venir';

  @override
  String get statsConsistency => 'Régularité';

  @override
  String get statsConsistencyHint =>
      'Jours d’étude sur les 30 derniers jours. Mieux vaut un peu chaque jour que le bachotage.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent % des 30 derniers jours';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Cours $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Réalisé / jour (14 j)';

  @override
  String get statsEmpty => 'Aucune session pour l’instant';

  @override
  String get statsGap => 'Écart';

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
  String get statsLast30Days => '30 derniers jours';

  @override
  String get statsLast7Days => '7 derniers jours';

  @override
  String get statsNeedPerDay => 'Requis / jour';

  @override
  String get statsNext8Weeks => '8 prochaines semaines';

  @override
  String get statsOfLast30DaysVolume => 'du volume des 30 derniers jours';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Semaines en surcharge >$threshold h signalées en rouge — déplacez une échéance ou réduisez le périmètre.';
  }

  @override
  String get statsOverview => 'Aperçu';

  @override
  String get statsPaceCovers =>
      'Le rythme passé couvre le nécessaire. Gardez l’élan.';

  @override
  String statsPaceShort(String gap) {
    return 'Le rythme passé est $gap h/jour trop court — ajoutez un créneau ou réduisez le périmètre.';
  }

  @override
  String get statsPastVsNeeded => 'Passé vs requis';

  @override
  String statsPeakPerWeek(String peak) {
    return 'pic $peak h/sem.';
  }

  @override
  String get statsPerCourse => 'Par cours';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent %';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent %';
  }

  @override
  String get statsSessions => 'Sessions';

  @override
  String statsSuggestedOrder(String order) {
    return 'Ordre suggéré : $order (échéance la plus proche d’abord)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'volume total';

  @override
  String get statusAhead => 'En avance';

  @override
  String get statusBehind => 'En retard';

  @override
  String get statusCompleted => 'Terminé';

  @override
  String get statusOnTrack => 'En bonne voie';

  @override
  String get statusOverdue => 'Dépassé';

  @override
  String get studyLogDeleteBody =>
      'Supprimer cette session d’étude ? Cette action est irréversible.';

  @override
  String get studyLogDeleteTitle => 'Supprimer la session ?';

  @override
  String get studyLogEmptyHint =>
      'Enregistrez une session pour suivre votre temps d’étude.';

  @override
  String get studyLogEmptyTitle => 'Aucune session d’étude pour l’instant';

  @override
  String get studyLogFabLabel => 'Enregistrer une session';

  @override
  String get studyLogFabTooltip => 'Enregistrer une session';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Supprimer la session d’exemple';

  @override
  String get studyLogThisWeek => 'Cette semaine';

  @override
  String get studyLogToday => 'Aujourd’hui';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Cours $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'Les ECTS doivent être supérieurs à zéro';

  @override
  String get validationCourseEctsRequired => 'Saisissez les crédits ECTS';

  @override
  String get validationCourseNameRequired => 'Le nom est requis';

  @override
  String get validationCourseNameTooLong => 'Le nom est trop long';

  @override
  String get validationSessionCourseRequired => 'Sélectionnez un cours';

  @override
  String get validationSessionDurationRequired => 'Saisissez une durée';

  @override
  String get widgetNoProgress => 'Aucune progression pour l’instant';

  @override
  String get settingsLanguage => 'Langue';

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
