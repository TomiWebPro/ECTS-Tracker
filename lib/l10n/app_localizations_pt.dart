// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonError => 'Erro';

  @override
  String get commonNone => 'Nenhum';

  @override
  String get commonSave => 'Salvar';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Horas necessárias (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Limpar prazo';

  @override
  String get courseFormClearStartTooltip => 'Limpar data de início';

  @override
  String get courseFormColorLabel => 'Cor';

  @override
  String get courseFormDateNotSet => 'Não definida';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Prazo: $date';
  }

  @override
  String get courseFormEctsLabel => 'Créditos ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nome';

  @override
  String get courseFormNotesLabel => 'Notas (opcional)';

  @override
  String get courseFormSaving => 'Salvando…';

  @override
  String courseFormStartButton(String date) {
    return 'Início: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Desligado: sem pressão até $date; excluído do ritmo de Hoje.';
  }

  @override
  String get courseFormStartEarlyOn => 'Ligado: o tempo é dividido até agora e conta para o ritmo de Hoje.';

  @override
  String get courseFormStartEarlyTitle => 'Começar agora apesar do início futuro';

  @override
  String get courseFormTitleAdd => 'Adicionar disciplina';

  @override
  String get courseFormTitleEdit => 'Editar disciplina';

  @override
  String get coursesAddTooltip => 'Adicionar disciplina';

  @override
  String coursesDeleteBody(String name) {
    return 'Excluir \"$name\" e todas as suas sessões de estudo? Esta ação não pode ser desfeita.';
  }

  @override
  String get coursesDeleteTitle => 'Excluir disciplina?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Toque em “Nova disciplina” para criar sua primeira disciplina.';

  @override
  String get coursesEmptyTitle => 'Nenhuma disciplina ainda';

  @override
  String get coursesFilterAll => 'Todos os status';

  @override
  String get coursesFilterEmpty => 'Nenhuma disciplina corresponde a este filtro';

  @override
  String get coursesNewCourse => 'Nova disciplina';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily h/dia necessárias';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/dia necessárias';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily h/dia • $weekly h/semana necessárias';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/dia • $weekly min/semana necessárias';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/dia • $weekly h/semana necessárias';
  }

  @override
  String coursesProgressWithStatus(String done, String required, String status) {
    return '$done / $required h • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Remover disciplina de exemplo';

  @override
  String coursesShownCount(String count) {
    return '$count exibidas';
  }

  @override
  String coursesSortOption(String label) {
    return 'Ordenar: $label';
  }

  @override
  String get dashboardAllDone => 'Tudo concluído';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h registradas (bônus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count disciplina(s)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count disciplina(s) · $upcoming futuras fora do ritmo de hoje';
  }

  @override
  String get dashboardCoursesTitle => 'Disciplinas';

  @override
  String dashboardDeadline(String date) {
    return 'Prazo $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Prazo $date (faltam $days dias)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Prazo $date (falta 1 dia)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Prazo $date (atrasado)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Prazo $date (hoje)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Para hoje — $hours h registradas';
  }

  @override
  String get dashboardEmptyHintAllDone => 'Todas as disciplinas estão concluídas — veja a aba Disciplinas para a lista completa.';

  @override
  String get dashboardEmptyHintNoCourses => 'Adicione uma disciplina para começar a acompanhar seu progresso de ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Atrasado = fazendo $achieved/d, precisa de $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Atrasado = fazendo $achieved/d, precisa de $need/d · início antecipado';
  }

  @override
  String get dashboardExplainerBehindNoPace => 'Atrasado: nenhum ritmo finito alcança um prazo de hoje com horas restantes';

  @override
  String get dashboardExplainerOnTrackNoPace => 'No ritmo: ainda sem ritmo — registre a primeira sessão para confirmar';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Começa em $days d · contado a partir de $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Começa em $days d · contado a partir de $date · início antecipado ativado';
  }

  @override
  String get dashboardFreshStart => 'NOVO COMEÇO';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · faltam ${hours}h';
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
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/dia';
  }

  @override
  String get dashboardLogSessionAction => 'Registrar sessão de estudo';

  @override
  String get dashboardLogSessionTooltip => 'Registrar sessão de estudo';

  @override
  String get dashboardNewBadge => 'NOVO';

  @override
  String get dashboardNoCourses => 'Nenhuma disciplina ainda';

  @override
  String get dashboardNoDeadline => 'Sem prazo';

  @override
  String get dashboardNoDeadlines => 'Nenhum prazo agendado';

  @override
  String get dashboardNoPaceDue => 'Nenhum ritmo para hoje';

  @override
  String get dashboardNothingDue => 'Nada para hoje';

  @override
  String get dashboardNothingToTrack => 'Nada para acompanhar ainda';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Para hoje — faltam ${hours}h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Precisa de $daily h/dia para concluir';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Precisa de $daily min/dia para concluir';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Precisa de $daily h/dia · $weekly h/semana para concluir';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Precisa de $daily min/dia · $weekly min/semana para concluir';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Precisa de $daily min/dia · $weekly h/semana para concluir';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Precisa de $hours h/dia a partir de $date · fora do ritmo de Hoje';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Precisa de $minutes min/dia a partir de $date · fora do ritmo de Hoje';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Sem prazo — ${hours}h restantes · sem pressão diária';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Começa em $date · ${hours}h a fazer';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · irrealista';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMA';

  @override
  String get dashboardProgramEmptyHint => 'Adicione uma disciplina para começar o acompanhamento';

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
    return '$days dias de margem';
  }

  @override
  String get dashboardStartNotSet => 'Não definido';

  @override
  String dashboardStartsIn(String days) {
    return 'Começa em ${days}d';
  }

  @override
  String get dashboardStartsSoon => 'Começa em breve';

  @override
  String get dashboardTipEmpty => 'Adicione sua primeira disciplina — seu ritmo diário e progresso aparecerão aqui.';

  @override
  String get dashboardTipFirst => 'Os primeiros 25 min contam mais — escolha a disciplina com o prazo mais próximo.';

  @override
  String get dashboardTodayBare => 'HOJE';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'HOJE $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'RITMO DE HOJE';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h hoje';
  }

  @override
  String get dashboardUpcomingSubtitle => 'Inícios futuros — sem pressão hoje, excluídos do ritmo de Hoje.';

  @override
  String get dashboardUpcomingTitle => 'Próximas';

  @override
  String get devToolsActivate => 'Ativar';

  @override
  String get devToolsActivateMessage => 'Isto desbloqueia ferramentas ocultas de teste de estresse (gerar dados). Apenas para desenvolvimento.';

  @override
  String get devToolsActivateTitle => 'Ativar modo dev?';

  @override
  String get devToolsActivated => 'Modo dev ativado.';

  @override
  String get devToolsClearPumped => 'Limpar dados gerados';

  @override
  String get devToolsClearPumpedMessage => 'Exclui as disciplinas STRESS geradas e suas sessões. Seus dados são mantidos.';

  @override
  String get devToolsClearPumpedSubtitle => 'Excluir disciplinas STRESS geradas e sessões.';

  @override
  String get devToolsClearPumpedTitle => 'Limpar dados gerados?';

  @override
  String devToolsCleared(String count) {
    return '$count disciplina(s) gerada(s) removida(s).';
  }

  @override
  String get devToolsConfirmPumpMessage => 'Segunda confirmação: isto vai inflar disciplinas, listas, gráficos e cálculos de ritmo e pode levar alguns segundos. Gerar agora?';

  @override
  String get devToolsConfirmPumpTitle => 'Confirmar geração de estresse';

  @override
  String get devToolsContinue => 'Continuar';

  @override
  String get devToolsExit => 'Sair do modo dev';

  @override
  String get devToolsExitSubtitle => 'Ocultar ferramentas dev neste dispositivo.';

  @override
  String get devToolsPumpData => 'Gerar dados';

  @override
  String get devToolsPumpMessage => 'Isto insere um semestre gerado realista (~10 disciplinas, ~800 sessões nas últimas 12 semanas). Seus dados existentes são mantidos. Continuar?';

  @override
  String get devToolsPumpSubtitle => 'Inserir um semestre gerado (~10 disciplinas, ~800 sessões, 12 semanas). Dados existentes mantidos.';

  @override
  String get devToolsPumpTile => 'Gerar dados de teste';

  @override
  String get devToolsPumpTitle => 'Gerar dados de teste?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Geradas $courses disciplinas, $sessions sessões.';
  }

  @override
  String get devToolsPumping => 'Gerando dados de teste…';

  @override
  String get devToolsRemoveAll => 'Remover todos os dados';

  @override
  String get devToolsRemoveAllMessage => 'Atalho dev: isto exclui permanentemente TODAS as disciplinas, sessões e configurações. Não pode ser desfeito.';

  @override
  String get devToolsRemoveAllSubtitle => 'Atalho dev: excluir TUDO: disciplinas, sessões e configurações.';

  @override
  String get devToolsRemoveAllTitle => 'Remover todos os dados?';

  @override
  String get navCourses => 'Disciplinas';

  @override
  String get navDashboard => 'Painel';

  @override
  String get navSettings => 'Configurações';

  @override
  String get navStatistics => 'Estatísticas';

  @override
  String get navStudyLog => 'Registro de estudos';

  @override
  String get sampleBadge => 'Exemplo';

  @override
  String get sessionFormCourseLabel => 'Disciplina';

  @override
  String sessionFormDateButton(String date) {
    return 'Data: $date';
  }

  @override
  String get sessionFormDurationError => 'A duração deve ser maior que zero.';

  @override
  String get sessionFormHoursLabel => 'Horas';

  @override
  String get sessionFormLogAction => 'Registrar sessão';

  @override
  String get sessionFormMinutesLabel => 'Minutos';

  @override
  String get sessionFormNoCourseError => 'Selecione uma disciplina.';

  @override
  String get sessionFormNoCoursesHint => 'Adicione uma disciplina primeiro para registrar uma sessão.';

  @override
  String get sessionFormNotesLabel => 'Notas (opcional)';

  @override
  String get sessionFormSaving => 'Salvando…';

  @override
  String get sessionFormTitleAdd => 'Registrar sessão de estudo';

  @override
  String get sessionFormTitleEdit => 'Editar sessão de estudo';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total: $hours h';
  }

  @override
  String get settingsAccent => 'Cor do tema';

  @override
  String get settingsAccentBerry => 'Amora';

  @override
  String get settingsAccentClay => 'Argila';

  @override
  String get settingsAccentForest => 'Floresta';

  @override
  String get settingsAccentSlate => 'Ardósia';

  @override
  String get settingsAccentTeal => 'Verde-petróleo';

  @override
  String get settingsAccentUpdated => 'Cor do tema atualizada.';

  @override
  String get settingsAllDataDeleted => 'Todos os dados foram excluídos.';

  @override
  String get settingsAppearance => 'Aparência (escuro / claro)';

  @override
  String get settingsCheckingSample => 'Verificando dados de exemplo…';

  @override
  String get settingsClear => 'Limpar';

  @override
  String get settingsClearSample => 'Limpar dados de exemplo';

  @override
  String get settingsClearSampleMessage => 'Isto remove as disciplinas e sessões de exemplo. Disciplinas ou sessões adicionadas por você não são removidas.';

  @override
  String get settingsClearSampleSubtitle => 'Remover as disciplinas e sessões de exemplo. Seus dados são mantidos.';

  @override
  String get settingsClearSampleTitle => 'Limpar dados de exemplo?';

  @override
  String get settingsCopy => 'Copiar';

  @override
  String get settingsDailyError => 'Digite 0 ou um número positivo de minutos.';

  @override
  String get settingsDailyLabel => 'Minutos por dia (0 = sem meta)';

  @override
  String get settingsDailyTarget => 'Meta diária de estudo';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/dia';
  }

  @override
  String get settingsDailyUpdated => 'Meta diária atualizada.';

  @override
  String get settingsData => 'Dados';

  @override
  String get settingsDeleteEverything => 'Excluir tudo';

  @override
  String get settingsDevMode => 'Modo dev';

  @override
  String get settingsDisplay => 'Exibição';

  @override
  String get settingsDisplayComfortable => 'Confortável';

  @override
  String get settingsDisplayCompact => 'Compacto';

  @override
  String get settingsDisplayLarge => 'Grande';

  @override
  String get settingsDisplaySize => 'Tamanho de texto e elementos';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Tamanho de exibição atualizado.';

  @override
  String get settingsExport => 'Exportar dados';

  @override
  String get settingsExportCopied => 'Exportação copiada para a área de transferência.';

  @override
  String get settingsExportSubtitle => 'Copiar todas as disciplinas, sessões e configurações como JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses disciplina(s) · $sessions sessão(ões) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (truncado — o backup completo tem $kb KB, use Copiar para tudo)';
  }

  @override
  String get settingsFirstWeekday => 'Primeiro dia da semana';

  @override
  String get settingsFirstWeekdayUpdated => 'Primeiro dia da semana atualizado.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (segurar ${seconds}s)';
  }

  @override
  String get settingsHoldToReplace => 'Segure para substituir tudo';

  @override
  String get settingsHoursError => 'Digite um número maior que zero.';

  @override
  String get settingsHoursHelper => 'Padrão 30. Alterar recalcula os requisitos; registros mantidos.';

  @override
  String get settingsHoursLabel => 'Horas por crédito ECTS';

  @override
  String get settingsHoursPerEcts => 'Horas por ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Horas por ECTS atualizadas.';

  @override
  String get settingsImport => 'Importar dados';

  @override
  String get settingsImportAppend => 'Acrescentar';

  @override
  String get settingsImportAppendAction => 'Importar (acrescentar)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Dados acrescentados: $courses disciplina(s), $sessions sessão(ões) adicionadas.';
  }

  @override
  String get settingsImportInfo => 'Acrescentar adiciona o backup junto aos dados atuais (configurações mantidas). Substituir apaga TODAS as disciplinas, sessões e configurações primeiro.';

  @override
  String get settingsImportLabel => 'Cole o JSON exportado';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses disciplina(s) · $sessions sessão(ões)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· exportado em $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· esquema v$schema';
  }

  @override
  String get settingsImportReplace => 'Substituir';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Substituir exclui tudo primeiro. Pressione e SEGURE o botão abaixo por $seconds segundos para confirmar.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Dados substituídos: $courses disciplina(s), $sessions sessão(ões) restauradas.';
  }

  @override
  String get settingsImportSubtitle => 'Substituir todos os dados a partir de um backup JSON exportado.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Continue segurando… $remaining s';
  }

  @override
  String get settingsNoSample => 'Sem dados de exemplo';

  @override
  String get settingsNoSampleSubtitle => 'Os dados de exemplo já foram removidos.';

  @override
  String get settingsNoTarget => 'Nenhuma meta definida';

  @override
  String get settingsOverloadError => 'Digite um número de 5–100 h/semana.';

  @override
  String get settingsOverloadHelper => 'Semanas futuras acima disto são marcadas em vermelho. Estudo em tempo integral é ~35–40 h/semana.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Horas por semana (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/semana marca vermelho';
  }

  @override
  String get settingsOverloadThreshold => 'Limite semanal de sobrecarga';

  @override
  String get settingsOverloadUpdated => 'Limite de sobrecarga atualizado.';

  @override
  String get settingsPaceTolerance => 'Tolerância de adianto / atraso';

  @override
  String get settingsPasteValidBackup => 'Cole um backup válido primeiro';

  @override
  String get settingsReset => 'Redefinir';

  @override
  String get settingsResetAll => 'Redefinir todos os dados';

  @override
  String get settingsResetAllMessage => 'Isto exclui permanentemente TODAS as disciplinas, sessões e configurações. Não pode ser desfeito. Exporte um backup primeiro, se necessário.';

  @override
  String get settingsResetAllSubtitle => 'Excluir todas as disciplinas, sessões e configurações.';

  @override
  String get settingsResetAllTitle => 'Redefinir todos os dados?';

  @override
  String get settingsResetSettings => 'Redefinir configurações';

  @override
  String get settingsResetSettingsDone => 'Configurações redefinidas para os padrões.';

  @override
  String get settingsResetSettingsMessage => 'Restaura horas-por-ECTS (30), meta diária (nenhuma), primeiro dia da semana (segunda-feira), tema (sistema), tolerância (5 dias), sobrecarga (35 h/semana), tamanho (confortável), cor (ardósia).';

  @override
  String get settingsResetSettingsSubtitle => 'Restaurar padrões: 30 h/ECTS, sem meta, segunda-feira, tema do sistema, tolerância de 5 dias, sobrecarga de 35 h/semana, tamanho confortável, cor ardósia.';

  @override
  String get settingsResetSettingsTitle => 'Redefinir configurações?';

  @override
  String get settingsSampleData => 'Dados de exemplo';

  @override
  String settingsSampleDataError(String error) {
    return 'Erro: $error';
  }

  @override
  String get settingsStudySettings => 'Configurações de estudo';

  @override
  String get settingsThemeDark => 'Escuro';

  @override
  String get settingsThemeLight => 'Claro';

  @override
  String get settingsThemeSystem => 'Padrão do sistema';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema atualizado.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dias';
  }

  @override
  String get settingsToleranceError => 'Digite um número de 0–30 dias.';

  @override
  String get settingsToleranceHelper => 'Adiantado precisa de +N dias de folga, atrasado −N dias. 5 = estável, 0 = sensível.';

  @override
  String get settingsToleranceLabel => 'Dias de folga (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance de folga';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerância atualizada.';

  @override
  String get settingsWeekdayFriday => 'Sexta-feira';

  @override
  String get settingsWeekdayMonday => 'Segunda-feira';

  @override
  String get settingsWeekdaySaturday => 'Sábado';

  @override
  String get settingsWeekdaySunday => 'Domingo';

  @override
  String get settingsWeekdayThursday => 'Quinta-feira';

  @override
  String get settingsWeekdayTuesday => 'Terça-feira';

  @override
  String get settingsWeekdayWednesday => 'Quarta-feira';

  @override
  String get sortDeadline => 'Prazo';

  @override
  String get sortName => 'Nome';

  @override
  String get sortProgress => 'Progresso';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'Não foi possível iniciar o ECTS Tracker';

  @override
  String get statsActiveDays => 'Dias ativos';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}d ativos';
  }

  @override
  String get statsAddDeadlines => 'Adicione prazos para prever a carga.';

  @override
  String get statsComingLoad => 'Carga futura';

  @override
  String get statsConsistency => 'Consistência';

  @override
  String get statsConsistencyHint => 'Dias de estudo nos últimos 30 dias. Pequenos passos diários vencem a maratona de véspera.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% dos últimos 30 dias';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Disciplina $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'D$id';
  }

  @override
  String get statsDidPerDay => 'Fez / dia (14d)';

  @override
  String get statsEmpty => 'Nenhuma sessão ainda';

  @override
  String get statsGap => 'Diferença';

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
  String get statsLast30Days => 'Últimos 30 dias';

  @override
  String get statsLast7Days => 'Últimos 7 dias';

  @override
  String get statsNeedPerDay => 'Precisa / dia';

  @override
  String get statsNext8Weeks => 'Próximas 8 semanas';

  @override
  String get statsOfLast30DaysVolume => 'do volume dos últimos 30 dias';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Semanas de sobrecarga >${threshold}h marcadas em vermelho — mova um prazo ou reduza o escopo.';
  }

  @override
  String get statsOverview => 'Visão geral';

  @override
  String get statsPaceCovers => 'O ritmo passado cobre o necessário. Mantenha a sequência.';

  @override
  String statsPaceShort(String gap) {
    return 'O ritmo passado está $gap h/dia abaixo — adicione um bloco ou reduza o escopo.';
  }

  @override
  String get statsPastVsNeeded => 'Passado vs necessário';

  @override
  String statsPeakPerWeek(String peak) {
    return 'pico de ${peak}h/sem';
  }

  @override
  String get statsPerCourse => 'Por disciplina';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sessões';

  @override
  String statsSuggestedOrder(String order) {
    return 'Ordem sugerida: $order (prazo mais próximo primeiro)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'volume total';

  @override
  String get statusAhead => 'Adiantado';

  @override
  String get statusBehind => 'Atrasado';

  @override
  String get statusCompleted => 'Concluído';

  @override
  String get statusOnTrack => 'No ritmo';

  @override
  String get statusOverdue => 'Vencido';

  @override
  String get studyLogDeleteBody => 'Excluir esta sessão de estudo? Não pode ser desfeita.';

  @override
  String get studyLogDeleteTitle => 'Excluir sessão?';

  @override
  String get studyLogEmptyHint => 'Registre uma sessão para acompanhar seu tempo de estudo.';

  @override
  String get studyLogEmptyTitle => 'Nenhuma sessão de estudo ainda';

  @override
  String get studyLogFabLabel => 'Registrar sessão';

  @override
  String get studyLogFabTooltip => 'Registrar sessão';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Remover sessão de exemplo';

  @override
  String get studyLogThisWeek => 'Esta semana';

  @override
  String get studyLogToday => 'Hoje';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Disciplina $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'D$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return 'Timing $course';
  }

  @override
  String get studyTimerAlreadyRunning => 'A timer is already running. Finish or discard it first.';

  @override
  String get studyTimerCourseLabel => 'Course';

  @override
  String get studyTimerDiscard => 'Discard';

  @override
  String get studyTimerDiscardBody => 'Throw away the current timer without logging? This cannot be undone.';

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
  String get validationCourseEctsPositive => 'ECTS deve ser maior que zero';

  @override
  String get validationCourseEctsRequired => 'Digite os créditos ECTS';

  @override
  String get validationCourseNameRequired => 'Nome é obrigatório';

  @override
  String get validationCourseNameTooLong => 'Nome muito longo';

  @override
  String get validationSessionCourseRequired => 'Selecione uma disciplina';

  @override
  String get validationSessionDurationRequired => 'Digite uma duração';

  @override
  String get widgetNoProgress => 'Nenhum progresso ainda';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLiquidGlass => 'Vidro líquido';

  @override
  String get settingsLiquidGlassSubtitle => 'Cartões e barras em vidro fosco. Desligado mantém o aspeto clássico sólido.';

  @override
  String get settingsLiquidGlassOn => 'Ligado';

  @override
  String get settingsLiquidGlassOff => 'Desligado';

  @override
  String get settingsLiquidGlassUpdated => 'Vidro líquido atualizado.';

  @override
  String get devToolsReminderPreview => 'Prévia de lembretes';

  @override
  String get devToolsReminderPreviewSubtitle => 'Veja o que notificaria agora. Feed de teste seguro para Windows.';

  @override
  String get reminderPreviewTitle => 'Prévia de lembretes';

  @override
  String get reminderPreviewNow => 'Hora da prévia';

  @override
  String get reminderPreviewReset => 'Agora';

  @override
  String get reminderPreviewEmpty => 'Tudo quieto — nada notificaria neste momento.';

  @override
  String get reminderPreviewCustom => 'Agendas personalizadas (demo)';

  @override
  String get reminderPreviewNoFire => 'Nenhuma ativação iminente.';

  @override
  String get reminderKindDaily => 'Diário';

  @override
  String get reminderKindBehind => 'Atrasado';

  @override
  String get reminderKindDeadline => 'Prazo';

  @override
  String get reminderKindOverdue => 'Vencido';

  @override
  String get reminderKindStreak => 'Sequência';

  @override
  String get reminderKindCustom => 'Personalizado';

  @override
  String get settingsReminders => 'Lembretes de estudo';

  @override
  String get settingsRemindersOff => 'Desligado — ative para um lembrete diário.';

  @override
  String get settingsReminderTime => 'Hora do lembrete';

  @override
  String get settingsReminderDenied => 'As notificações estão bloqueadas — ative-as nas configurações do sistema.';

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
    return '📚 Hoje à noite: $duration para manter o ritmo';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course: faltam $duration hoje';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count mais)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Registe uma sessão para concluir o dia de hoje.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course passou a Atrasado';
  }

  @override
  String notifBehindBodyPace(String left, String days, String pace, String catchUp) {
    return 'Faltam $left, $days dias restantes — $pace/dia a partir de agora. Registe $catchUp para voltar a No ritmo.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return 'Faltam $left, $days dias restantes — $pace/dia a partir de agora. Só concluir as $left inteiras resolve isto — comece hoje à noite.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return 'Ainda faltam $left e o prazo é hoje. Tudo o que registar agora conta.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course vence amanhã e ainda faltam $left';
  }

  @override
  String get notifDeadlineTomorrowBody => 'Tudo o que registar hoje conta a dobrar.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Exame de $course em $days dias — faltam $left';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'São $pace/dia. Divida: 2 sessões por dia vencem uma maratona.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Cada hora que registar agora conta.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course passou do prazo com $left em aberto';
  }

  @override
  String get notifOverdueBody => 'Adie o prazo ou complete as horas — o curso fica em Precisa de atenção até lá.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 Sequência de $days dias — $week esta semana';
  }

  @override
  String get notifStreakBody => 'Todos os cursos No ritmo ou Adiantado. Bom trabalho.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Check-in de estudo: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Hora de atualizar: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left em aberto · $pace/dia para concluir a tempo. Registe uma sessão para atualizar o progresso.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left ainda em aberto — tudo o que registar agora conta.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Próximo: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1d';

  @override
  String get reminderPreviewFwdDay => '+1d';

  @override
  String get reminderPreviewFake => '(simulado)';

  @override
  String get reminderPreviewDemoLabel => 'Check-in demo';
}
