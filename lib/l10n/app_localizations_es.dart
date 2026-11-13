// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonError => 'Error';

  @override
  String get commonNone => 'Ninguno';

  @override
  String get commonSave => 'Guardar';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Horas requeridas (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Borrar fecha límite';

  @override
  String get courseFormClearStartTooltip => 'Borrar fecha de inicio';

  @override
  String get courseFormColorLabel => 'Color';

  @override
  String get courseFormDateNotSet => 'Sin definir';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Fecha límite: $date';
  }

  @override
  String get courseFormEctsLabel => 'Créditos ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nombre';

  @override
  String get courseFormNotesLabel => 'Notas (opcional)';

  @override
  String get courseFormSaving => 'Guardando…';

  @override
  String courseFormStartButton(String date) {
    return 'Inicio: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Desactivado: sin presión hasta el $date; excluido del ritmo de hoy.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Activado: el tiempo se reparte hasta ahora y cuenta para el ritmo de hoy.';

  @override
  String get courseFormStartEarlyTitle =>
      'Empezar ahora aunque el inicio sea futuro';

  @override
  String get courseFormTitleAdd => 'Añadir curso';

  @override
  String get courseFormTitleEdit => 'Editar curso';

  @override
  String get coursesAddTooltip => 'Añadir curso';

  @override
  String coursesDeleteBody(String name) {
    return '¿Eliminar «$name» y todas sus sesiones de estudio? Esta acción no se puede deshacer.';
  }

  @override
  String get coursesDeleteTitle => '¿Eliminar curso?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Toca «Nuevo curso» para crear tu primer curso.';

  @override
  String get coursesEmptyTitle => 'Aún no hay cursos';

  @override
  String get coursesFilterAll => 'Todos los estados';

  @override
  String get coursesFilterEmpty => 'Ningún curso coincide con este filtro';

  @override
  String get coursesNewCourse => 'Nuevo curso';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily h/día necesarias';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/día necesarias';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily h/día • $weekly h/semana necesarias';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/día • $weekly min/semana necesarias';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/día • $weekly h/semana necesarias';
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
  String get coursesRemoveSampleTooltip => 'Eliminar curso de ejemplo';

  @override
  String coursesShownCount(String count) {
    return '$count mostrados';
  }

  @override
  String coursesSortOption(String label) {
    return 'Ordenar: $label';
  }

  @override
  String get dashboardAllDone => 'Todo completado';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h registradas (extra)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count curso(s)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count curso(s) · $upcoming futuros fuera del ritmo de hoy';
  }

  @override
  String get dashboardCoursesTitle => 'Cursos';

  @override
  String dashboardDeadline(String date) {
    return 'Fecha límite $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Fecha límite $date (faltan $days días)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Fecha límite $date (falta 1 día)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Fecha límite $date (vencida)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Fecha límite $date (hoy)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Vence hoy — $hours h registradas';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Todos los cursos están completados; consulta la pestaña Cursos para ver la lista completa.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Añade un curso para empezar a seguir tu progreso ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Atrasado = $achieved/día logrados, $need/día necesarios';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Atrasado = $achieved/día logrados, $need/día necesarios · inicio anticipado';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Atrasado: ningún ritmo finito alcanza una fecha límite de hoy con horas pendientes';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'En camino: aún sin ritmo; registra la primera sesión para confirmar';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Empieza en $days d · contado desde el $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Empieza en $days d · contado desde el $date · inicio anticipado activado';
  }

  @override
  String get dashboardFreshStart => 'NUEVO COMIENZO';

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
    return '$hours h/día';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/día';
  }

  @override
  String get dashboardLogSessionAction => 'Registrar sesión de estudio';

  @override
  String get dashboardLogSessionTooltip => 'Registrar sesión de estudio';

  @override
  String get dashboardNewBadge => 'NUEVO';

  @override
  String get dashboardNoCourses => 'Aún no hay cursos';

  @override
  String get dashboardNoDeadline => 'Sin fecha límite';

  @override
  String get dashboardNoDeadlines => 'Sin fechas límite programadas';

  @override
  String get dashboardNoPaceDue => 'Sin ritmo para hoy';

  @override
  String get dashboardNothingDue => 'Nada pendiente';

  @override
  String get dashboardNothingToTrack => 'Nada que seguir todavía';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Vence hoy — faltan $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Necesitas $daily h/día para terminar';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Necesitas $daily min/día para terminar';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Necesitas $daily h/día · $weekly h/semana para terminar';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Necesitas $daily min/día · $weekly min/semana para terminar';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Necesitas $daily min/día · $weekly h/semana para terminar';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Necesitas $hours h/día desde el $date · fuera del ritmo de hoy';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Necesitas $minutes min/día desde el $date · fuera del ritmo de hoy';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Sin fecha límite — $hours h restantes · sin presión diaria';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Empieza el $date · $hours h por hacer';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · poco realista';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMA';

  @override
  String get dashboardProgramEmptyHint => 'Añade un curso para empezar';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMA $pct %';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days días de margen';
  }

  @override
  String get dashboardStartNotSet => 'Sin definir';

  @override
  String dashboardStartsIn(String days) {
    return 'Empieza en $days d';
  }

  @override
  String get dashboardStartsSoon => 'Empieza pronto';

  @override
  String get dashboardTipEmpty =>
      'Añade tu primer curso: tu ritmo diario y tu progreso aparecerán aquí.';

  @override
  String get dashboardTipFirst =>
      'Los primeros 25 minutos son los que más cuentan: elige el curso con la fecha más próxima.';

  @override
  String get dashboardTodayBare => 'HOY';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'HOY $pct %';
  }

  @override
  String get dashboardTodayPaceLabel => 'RITMO DE HOY';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h hoy';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Inicios futuros: sin presión hoy, excluidos del ritmo de hoy.';

  @override
  String get dashboardUpcomingTitle => 'Próximos';

  @override
  String get devToolsActivate => 'Activar';

  @override
  String get devToolsActivateMessage =>
      'Esto desbloquea herramientas ocultas de pruebas de estrés (generar datos). Solo para desarrollo.';

  @override
  String get devToolsActivateTitle => '¿Activar modo desarrollador?';

  @override
  String get devToolsActivated => 'Modo desarrollador activado.';

  @override
  String get devToolsClearPumped => 'Borrar datos generados';

  @override
  String get devToolsClearPumpedMessage =>
      'Elimina los cursos STRESS generados y sus sesiones. Tus datos se conservan.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Eliminar cursos y sesiones STRESS generados.';

  @override
  String get devToolsClearPumpedTitle => '¿Borrar datos generados?';

  @override
  String devToolsCleared(String count) {
    return '$count curso(s) generado(s) eliminados.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Segunda confirmación: esto inflará cursos, listas, gráficos y cálculos de ritmo, y puede tardar unos segundos. ¿Generar ahora?';

  @override
  String get devToolsConfirmPumpTitle => 'Confirmar prueba de estrés';

  @override
  String get devToolsContinue => 'Continuar';

  @override
  String get devToolsExit => 'Salir del modo desarrollador';

  @override
  String get devToolsExitSubtitle =>
      'Ocultar herramientas de desarrollo en este dispositivo.';

  @override
  String get devToolsPumpData => 'Generar datos';

  @override
  String get devToolsPumpMessage =>
      'Esto inserta un semestre generado realista (~10 cursos, ~800 sesiones de las últimas 12 semanas). Tus datos existentes se conservan. ¿Continuar?';

  @override
  String get devToolsPumpSubtitle =>
      'Insertar un semestre generado (~10 cursos, ~800 sesiones, 12 semanas). Datos existentes conservados.';

  @override
  String get devToolsPumpTile => 'Generar datos de prueba';

  @override
  String get devToolsPumpTitle => '¿Generar datos de prueba?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses cursos, $sessions sesiones generados.';
  }

  @override
  String get devToolsPumping => 'Generando datos de prueba…';

  @override
  String get devToolsRemoveAll => 'Eliminar todos los datos';

  @override
  String get devToolsRemoveAllMessage =>
      'Atajo de desarrollo: esto elimina permanentemente TODOS los cursos, sesiones y ajustes. Esta acción no se puede deshacer.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Atajo de desarrollo: eliminar TODOS los cursos, sesiones y ajustes.';

  @override
  String get devToolsRemoveAllTitle => '¿Eliminar todos los datos?';

  @override
  String get navCourses => 'Cursos';

  @override
  String get navDashboard => 'Panel';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get navStatistics => 'Estadísticas';

  @override
  String get navStudyLog => 'Registro de estudio';

  @override
  String get sampleBadge => 'Ejemplo';

  @override
  String get sessionFormCourseLabel => 'Curso';

  @override
  String sessionFormDateButton(String date) {
    return 'Fecha: $date';
  }

  @override
  String get sessionFormDurationError => 'La duración debe ser mayor que cero.';

  @override
  String get sessionFormHoursLabel => 'Horas';

  @override
  String get sessionFormLogAction => 'Registrar sesión';

  @override
  String get sessionFormMinutesLabel => 'Minutos';

  @override
  String get sessionFormModeManual => 'Manual';

  @override
  String get sessionFormModeTimer => 'Temporizador';

  @override
  String get sessionFormNoCourseError => 'Selecciona un curso.';

  @override
  String get sessionFormNoCoursesHint =>
      'Añade primero un curso para registrar una sesión.';

  @override
  String get sessionFormNotesLabel => 'Notas (opcional)';

  @override
  String get sessionFormSaving => 'Guardando…';

  @override
  String get sessionFormTitleAdd => 'Registrar sesión de estudio';

  @override
  String get sessionFormTitleEdit => 'Editar sesión de estudio';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total: $hours h';
  }

  @override
  String get settingsAccent => 'Color del tema';

  @override
  String get settingsAccentBerry => 'Baya';

  @override
  String get settingsAccentClay => 'Arcilla';

  @override
  String get settingsAccentForest => 'Bosque';

  @override
  String get settingsAccentSlate => 'Pizarra';

  @override
  String get settingsAccentTeal => 'Turquesa';

  @override
  String get settingsAccentUpdated => 'Color del tema actualizado.';

  @override
  String get settingsAllDataDeleted => 'Todos los datos eliminados.';

  @override
  String get settingsAppearance => 'Apariencia (oscuro / claro)';

  @override
  String get settingsCheckingSample => 'Comprobando datos de ejemplo…';

  @override
  String get settingsClear => 'Borrar';

  @override
  String get settingsClearSample => 'Borrar datos de ejemplo';

  @override
  String get settingsClearSampleMessage =>
      'Esto elimina los cursos y sesiones de ejemplo. Los cursos o sesiones que añadiste no se eliminan.';

  @override
  String get settingsClearSampleSubtitle =>
      'Eliminar los cursos y sesiones de ejemplo incluidos. Tus datos se conservan.';

  @override
  String get settingsClearSampleTitle => '¿Borrar datos de ejemplo?';

  @override
  String get settingsCopy => 'Copiar';

  @override
  String get settingsDailyError =>
      'Introduce 0 o un número positivo de minutos.';

  @override
  String get settingsDailyLabel => 'Minutos por día (0 = sin objetivo)';

  @override
  String get settingsDailyTarget => 'Objetivo diario de estudio';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/día';
  }

  @override
  String get settingsDailyUpdated => 'Objetivo diario actualizado.';

  @override
  String get settingsData => 'Datos';

  @override
  String get settingsDeleteEverything => 'Eliminar todo';

  @override
  String get settingsDevMode => 'Modo desarrollador';

  @override
  String get settingsDisplay => 'Pantalla';

  @override
  String get settingsDisplayComfortable => 'Cómodo';

  @override
  String get settingsDisplayCompact => 'Compacto';

  @override
  String get settingsDisplayLarge => 'Grande';

  @override
  String get settingsDisplaySize => 'Tamaño de texto y elementos';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent %)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Tamaño de pantalla actualizado.';

  @override
  String get settingsExport => 'Exportar datos';

  @override
  String get settingsExportCopied => 'Exportación copiada al portapapeles.';

  @override
  String get settingsExportSubtitle =>
      'Copiar todos los cursos, sesiones y ajustes como JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses curso(s) · $sessions sesión(es) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (truncado: la copia completa es de $kb KB; usa Copiar para todo)';
  }

  @override
  String get settingsFirstWeekday => 'Primer día de la semana';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Primer día de la semana actualizado.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (mantén $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Mantén para reemplazar todo';

  @override
  String get settingsHoursError => 'Introduce un número mayor que cero.';

  @override
  String get settingsHoursHelper =>
      'Predeterminado 30. Cambiarlo recalcula los requisitos; los registros se conservan.';

  @override
  String get settingsHoursLabel => 'Horas por crédito ECTS';

  @override
  String get settingsHoursPerEcts => 'Horas por ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Horas por ECTS actualizadas.';

  @override
  String get settingsImport => 'Importar datos';

  @override
  String get settingsImportAppend => 'Añadir';

  @override
  String get settingsImportAppendAction => 'Importar (añadir)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Datos añadidos: $courses curso(s), $sessions sesión(es) añadidos.';
  }

  @override
  String get settingsImportInfo =>
      'Añadir suma la copia a tus datos actuales (se conservan los ajustes). Reemplazar borra primero TODOS los cursos, sesiones y ajustes.';

  @override
  String get settingsImportLabel => 'Pega el JSON exportado';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses curso(s) · $sessions sesión(es)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · exportado el $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · esquema v$schema';
  }

  @override
  String get settingsImportReplace => 'Reemplazar';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Reemplazar elimina todo primero. Mantén pulsado el botón de abajo durante $seconds segundos para confirmar.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Datos reemplazados: $courses curso(s), $sessions sesión(es) restaurados.';
  }

  @override
  String get settingsImportSubtitle =>
      'Reemplazar todos los datos desde una copia JSON exportada.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Sigue manteniendo… $remaining s';
  }

  @override
  String get settingsNoSample => 'Sin datos de ejemplo';

  @override
  String get settingsNoSampleSubtitle =>
      'Los datos de ejemplo incluidos ya se han borrado.';

  @override
  String get settingsNoTarget => 'Sin objetivo definido';

  @override
  String get settingsOverloadError => 'Introduce un número de 5–100 h/semana.';

  @override
  String get settingsOverloadHelper =>
      'Las semanas con carga futura por encima se marcan en rojo. Estudiar a tiempo completo equivale a ~35–40 h/semana.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Horas por semana (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/semana se marca en rojo';
  }

  @override
  String get settingsOverloadThreshold => 'Umbral de sobrecarga semanal';

  @override
  String get settingsOverloadUpdated => 'Umbral de sobrecarga actualizado.';

  @override
  String get settingsPaceTolerance => 'Tolerancia de adelanto/retraso';

  @override
  String get settingsPasteValidBackup => 'Pega primero una copia válida';

  @override
  String get settingsReset => 'Restablecer';

  @override
  String get settingsResetAll => 'Restablecer todos los datos';

  @override
  String get settingsResetAllMessage =>
      'Esto elimina permanentemente TODOS los cursos, sesiones y ajustes. Esta acción no se puede deshacer. Exporta primero una copia si la necesitas.';

  @override
  String get settingsResetAllSubtitle =>
      'Eliminar todos los cursos, sesiones y ajustes.';

  @override
  String get settingsResetAllTitle => '¿Restablecer todos los datos?';

  @override
  String get settingsResetSettings => 'Restablecer ajustes';

  @override
  String get settingsResetSettingsDone =>
      'Ajustes restablecidos a los valores predeterminados.';

  @override
  String get settingsResetSettingsMessage =>
      'Restaura horas-por-ECTS (30), objetivo diario (ninguno), primer día (lunes), tema (sistema), tolerancia (5 días), sobrecarga (35 h/semana), tamaño (cómodo), color (pizarra). Cursos y sesiones conservados.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Restaurar valores predeterminados: 30 h/ECTS, sin objetivo, lunes, tema del sistema, tolerancia de 5 días, sobrecarga de 35 h/semana, tamaño cómodo, color pizarra.';

  @override
  String get settingsResetSettingsTitle => '¿Restablecer ajustes?';

  @override
  String get settingsSampleData => 'Datos de ejemplo';

  @override
  String settingsSampleDataError(String error) {
    return 'Error: $error';
  }

  @override
  String get settingsStudySettings => 'Ajustes de estudio';

  @override
  String get settingsThemeDark => 'Oscuro';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeSystem => 'Predeterminado del sistema';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema actualizado.';

  @override
  String settingsToleranceDays(String value) {
    return '$value días';
  }

  @override
  String get settingsToleranceError => 'Introduce un número de 0–30 días.';

  @override
  String get settingsToleranceHelper =>
      'El adelanto requiere +N días de excedente, el retraso −N días. 5 = estable, 0 = sensible.';

  @override
  String get settingsToleranceLabel => 'Días de trabajo (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance de trabajo';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerancia actualizada.';

  @override
  String get settingsWeekdayFriday => 'Viernes';

  @override
  String get settingsWeekdayMonday => 'Lunes';

  @override
  String get settingsWeekdaySaturday => 'Sábado';

  @override
  String get settingsWeekdaySunday => 'Domingo';

  @override
  String get settingsWeekdayThursday => 'Jueves';

  @override
  String get settingsWeekdayTuesday => 'Martes';

  @override
  String get settingsWeekdayWednesday => 'Miércoles';

  @override
  String get sortDeadline => 'Fecha límite';

  @override
  String get sortName => 'Nombre';

  @override
  String get sortProgress => 'Progreso';

  @override
  String get sortStatus => 'Estado';

  @override
  String get startupTitle => 'No se pudo iniciar ECTS Tracker';

  @override
  String get statsActiveDays => 'Días activos';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d activos';
  }

  @override
  String get statsAddDeadlines => 'Añade fechas límite para prever la carga.';

  @override
  String get statsComingLoad => 'Carga futura';

  @override
  String get statsConsistency => 'Constancia';

  @override
  String get statsConsistencyHint =>
      'Días de estudio en los últimos 30 días. Pequeños pasos cada día superan al atracón.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent % de los últimos 30 días';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Curso $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Hecho / día (14 d)';

  @override
  String get statsEmpty => 'Aún no hay sesiones';

  @override
  String get statsGap => 'Diferencia';

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
  String get statsLast30Days => 'Últimos 30 días';

  @override
  String get statsLast7Days => 'Últimos 7 días';

  @override
  String get statsNeedPerDay => 'Necesario / día';

  @override
  String get statsNext8Weeks => 'Próximas 8 semanas';

  @override
  String get statsOfLast30DaysVolume => 'del volumen de los últimos 30 días';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Semanas sobrecargadas >$threshold h marcadas en rojo: mueve una fecha límite o reduce el alcance.';
  }

  @override
  String get statsOverview => 'Resumen';

  @override
  String get statsPaceCovers =>
      'Tu ritmo pasado cubre lo necesario. Mantén la racha.';

  @override
  String statsPaceShort(String gap) {
    return 'Tu ritmo pasado está $gap h/día por debajo: añade un bloque o reduce el alcance.';
  }

  @override
  String get statsPastVsNeeded => 'Pasado frente a necesario';

  @override
  String statsPeakPerWeek(String peak) {
    return 'pico $peak h/sem.';
  }

  @override
  String get statsPerCourse => 'Por curso';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent %';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent %';
  }

  @override
  String get statsSessions => 'Sesiones';

  @override
  String statsSuggestedOrder(String order) {
    return 'Orden sugerido: $order (fecha más próxima primero)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'volumen total';

  @override
  String get statusAhead => 'Adelantado';

  @override
  String get statusBehind => 'Atrasado';

  @override
  String get statusCompleted => 'Completado';

  @override
  String get statusOnTrack => 'En camino';

  @override
  String get statusOverdue => 'Vencido';

  @override
  String get studyLogDeleteBody =>
      '¿Eliminar esta sesión de estudio? Esta acción no se puede deshacer.';

  @override
  String get studyLogDeleteTitle => '¿Eliminar sesión?';

  @override
  String get studyLogEmptyHint =>
      'Registra una sesión para seguir tu tiempo de estudio.';

  @override
  String get studyLogEmptyTitle => 'Aún no hay sesiones de estudio';

  @override
  String get studyLogFabLabel => 'Registrar sesión';

  @override
  String get studyLogFabTooltip => 'Registrar sesión';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Eliminar sesión de ejemplo';

  @override
  String get studyLogThisWeek => 'Esta semana';

  @override
  String get studyLogToday => 'Hoy';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Curso $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return 'Cronometrando $course';
  }

  @override
  String get studyTimerAlreadyRunning =>
      'Ya hay un temporizador en marcha. Termínalo o descártalo primero.';

  @override
  String get studyTimerCourseLabel => 'Curso';

  @override
  String get studyTimerDiscard => 'Descartar';

  @override
  String get studyTimerDiscardBody =>
      '¿Descartar el temporizador actual sin registrarlo? Esta acción no se puede deshacer.';

  @override
  String get studyTimerDiscardTitle => '¿Descartar temporizador?';

  @override
  String studyTimerFinishLog(String minutes) {
    return 'Terminar & registrar $minutes min';
  }

  @override
  String get studyTimerNoCourseError => 'Selecciona un curso.';

  @override
  String get studyTimerNoCoursesHint =>
      'Añade primero un curso para iniciar un temporizador.';

  @override
  String studyTimerNotifPaused(String elapsed) {
    return 'En pausa · $elapsed';
  }

  @override
  String get studyTimerNotifRunning => 'Toca para abrir el temporizador';

  @override
  String get studyTimerPause => 'Pausar';

  @override
  String get studyTimerResume => 'Reanudar';

  @override
  String get studyTimerStart => 'Iniciar temporizador';

  @override
  String get studyTimerStartTitle => 'Iniciar temporizador de estudio';

  @override
  String get studyTimerTooShort => 'El temporizador aún no ha funcionado.';

  @override
  String get validationCourseEctsPositive =>
      'Los ECTS deben ser mayores que cero';

  @override
  String get validationCourseEctsRequired => 'Introduce los créditos ECTS';

  @override
  String get validationCourseNameRequired => 'El nombre es obligatorio';

  @override
  String get validationCourseNameTooLong => 'El nombre es demasiado largo';

  @override
  String get validationSessionCourseRequired => 'Selecciona un curso';

  @override
  String get validationSessionDurationRequired => 'Introduce una duración';

  @override
  String get widgetNoProgress => 'Sin progreso todavía';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLiquidGlass => 'Vidrio líquido';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Tarjetas y barras de vidrio esmerilado. Desactivado mantiene el aspecto sólido clásico.';

  @override
  String get settingsLiquidGlassOn => 'Activado';

  @override
  String get settingsLiquidGlassOff => 'Desactivado';

  @override
  String get settingsLiquidGlassUpdated => 'Vidrio líquido actualizado.';

  @override
  String get devToolsReminderPreview => 'Vista previa de recordatorios';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Mira lo que notificaría ahora mismo. Fuente de prueba segura para Windows.';

  @override
  String get reminderPreviewTitle => 'Vista previa de recordatorios';

  @override
  String get reminderPreviewNow => 'Hora de vista previa';

  @override
  String get reminderPreviewReset => 'Ahora';

  @override
  String get reminderPreviewEmpty =>
      'Todo tranquilo — nada notificaría en este momento.';

  @override
  String get reminderPreviewCustom => 'Horarios personalizados (demo)';

  @override
  String get reminderPreviewNoFire => 'Sin próximos avisos.';

  @override
  String get reminderKindDaily => 'Diario';

  @override
  String get reminderKindBehind => 'Atrasado';

  @override
  String get reminderKindDeadline => 'Fecha límite';

  @override
  String get reminderKindOverdue => 'Vencido';

  @override
  String get reminderKindStreak => 'Racha';

  @override
  String get reminderKindCustom => 'Personalizado';

  @override
  String get settingsReminders => 'Recordatorios de estudio';

  @override
  String get settingsRemindersOff =>
      'Desactivado — actívalos para un empujón diario.';

  @override
  String get settingsReminderTime => 'Hora del recordatorio';

  @override
  String get settingsReminderDenied =>
      'Las notificaciones están bloqueadas — actívalas en los ajustes del sistema.';

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
    return '📚 Esta noche: $duration para mantener el ritmo';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course: $duration pendientes hoy';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count más)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Registra una sesión para cerrar el día de hoy.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course se ha atrasado';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return 'Quedan $left, faltan $days días — $pace/día desde aquí. Registra $catchUp para volver a ir en camino.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return 'Quedan $left, faltan $days días — $pace/día desde aquí. Solo terminar los $left completos lo arregla — empieza esta noche.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left siguen abiertos y la fecha límite ya está aquí. Todo lo que registres ahora cuenta.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course vence mañana y aún tiene $left abiertos';
  }

  @override
  String get notifDeadlineTomorrowBody =>
      'Todo lo que registres hoy cuenta doble.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Examen de $course en $days días — quedan $left';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Son $pace/día. Divídelo: 2 sesiones al día superan un maratón.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace =>
      'Cada hora que registres ahora cuenta.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course superó la fecha límite con $left abiertos';
  }

  @override
  String get notifOverdueBody =>
      'Mueve la fecha límite o termina las horas — hasta entonces el curso queda en «necesita atención».';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 Racha de $days días — $week esta semana';
  }

  @override
  String get notifStreakBody =>
      'Todos los cursos en camino o adelantados. Buena racha.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Registro de estudio: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Hora de actualizar: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left abiertos · $pace/día para terminar a tiempo. Registra una sesión para actualizar el progreso.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return 'Aún $left abiertos — todo lo que registres ahora cuenta.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Siguiente: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1d';

  @override
  String get reminderPreviewFwdDay => '+1d';

  @override
  String get reminderPreviewFake => '(fake)';

  @override
  String get reminderPreviewDemoLabel => 'Registro demo';
}
