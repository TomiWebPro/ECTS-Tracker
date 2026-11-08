// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonEdit => 'Изменить';

  @override
  String get commonError => 'Ошибка';

  @override
  String get commonNone => 'Нет';

  @override
  String get commonSave => 'Сохранить';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Нужно часов (авто): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Убрать дедлайн';

  @override
  String get courseFormClearStartTooltip => 'Убрать дату начала';

  @override
  String get courseFormColorLabel => 'Цвет';

  @override
  String get courseFormDateNotSet => 'Не задано';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Дедлайн: $date';
  }

  @override
  String get courseFormEctsLabel => 'Кредиты ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value ч/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Название';

  @override
  String get courseFormNotesLabel => 'Заметки (необязательно)';

  @override
  String get courseFormSaving => 'Сохранение…';

  @override
  String courseFormStartButton(String date) {
    return 'Начало: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Выкл.: без нагрузки до $date; исключено из сегодняшнего темпа.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Вкл.: время делится до текущего момента и учитывается в сегодняшнем темпе.';

  @override
  String get courseFormStartEarlyTitle =>
      'Начать сейчас, несмотря на будущее начало';

  @override
  String get courseFormTitleAdd => 'Добавить предмет';

  @override
  String get courseFormTitleEdit => 'Редактировать предмет';

  @override
  String get coursesAddTooltip => 'Добавить предмет';

  @override
  String coursesDeleteBody(String name) {
    return 'Удалить «$name» и все его учебные сессии? Это действие нельзя отменить.';
  }

  @override
  String get coursesDeleteTitle => 'Удалить предмет?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Нажмите «Новый предмет», чтобы создать первый предмет.';

  @override
  String get coursesEmptyTitle => 'Пока нет предметов';

  @override
  String get coursesFilterAll => 'Все статусы';

  @override
  String get coursesFilterEmpty => 'Нет предметов по этому фильтру';

  @override
  String get coursesNewCourse => 'Новый предмет';

  @override
  String coursesPaceNeeded(String daily) {
    return 'нужно $daily ч/день';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'нужно $daily ч/день • $weekly ч/нед';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required ч • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Удалить пример предмета';

  @override
  String coursesShownCount(String count) {
    return 'показано: $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Сортировка: $label';
  }

  @override
  String get dashboardAllDone => 'Всё готово';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours ч записано (бонус)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count предм.';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count предм. · $upcoming будущих вне сегодняшнего темпа';
  }

  @override
  String get dashboardCoursesTitle => 'Предметы';

  @override
  String dashboardDeadline(String date) {
    return 'Дедлайн $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Дедлайн $date (осталось $days дн.)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Дедлайн $date (остался 1 день)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Дедлайн $date (просрочен)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Дедлайн $date (сегодня)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'На сегодня — записано $hours ч';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Все предметы завершены — полный список на вкладке «Предметы».';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Добавьте предмет, чтобы отслеживать прогресс ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Отставание = делаете $achieved/д, нужно $need/д';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Отставание = делаете $achieved/д, нужно $need/д · ранний старт';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Отставание: никакой конечный темп не закроет дедлайн сегодня при оставшихся часах';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'В графике: темпа пока нет — запишите первую сессию для подтверждения';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Начнётся через $days дн. · отсчёт от $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Начнётся через $days дн. · отсчёт от $date · ранний старт включён';
  }

  @override
  String get dashboardFreshStart => 'НОВЫЙ СТАРТ';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · осталось $hours ч';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required ч';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours ч/д';
  }

  @override
  String get dashboardLogSessionAction => 'Записать учебную сессию';

  @override
  String get dashboardLogSessionTooltip => 'Записать учебную сессию';

  @override
  String get dashboardNewBadge => 'НОВОЕ';

  @override
  String get dashboardNoCourses => 'Пока нет предметов';

  @override
  String get dashboardNoDeadline => 'Без дедлайна';

  @override
  String get dashboardNoDeadlines => 'Дедлайны не запланированы';

  @override
  String get dashboardNoPaceDue => 'На сегодня темпа нет';

  @override
  String get dashboardNothingDue => 'Ничего не нужно';

  @override
  String get dashboardNothingToTrack => 'Пока нечего отслеживать';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'На сегодня — осталось $hours ч';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Нужно $daily ч/день, чтобы успеть';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Нужно $daily ч/день · $weekly ч/нед, чтобы успеть';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Нужно $hours ч/день с $date · вне сегодняшнего темпа';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Без дедлайна — осталось $hours ч · без дневной нагрузки';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Начало $date · предстоит $hours ч';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · нереально';
  }

  @override
  String get dashboardProgramBare => 'ПРОГРАММА';

  @override
  String get dashboardProgramEmptyHint =>
      'Добавьте предмет, чтобы начать отслеживание';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required ч';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'ПРОГРАММА $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return 'запаса: $days дн.';
  }

  @override
  String get dashboardStartNotSet => 'Не задано';

  @override
  String dashboardStartsIn(String days) {
    return 'Через $days дн.';
  }

  @override
  String get dashboardStartsSoon => 'Скоро начнётся';

  @override
  String get dashboardTipEmpty =>
      'Добавьте первый предмет — дневной темп и прогресс появятся здесь.';

  @override
  String get dashboardTipFirst =>
      'Первые 25 минут важнее всего — выберите предмет с ближайшим дедлайном.';

  @override
  String get dashboardTodayBare => 'СЕГОДНЯ';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace ч';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'СЕГОДНЯ $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'СЕГОДНЯШНИЙ ТЕМП';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace ч сегодня';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Будущие старты — сегодня без нагрузки, исключены из сегодняшнего темпа.';

  @override
  String get dashboardUpcomingTitle => 'Будущие';

  @override
  String get devToolsActivate => 'Активировать';

  @override
  String get devToolsActivateMessage =>
      'Открывает скрытые инструменты стресс-тестирования (генерация данных). Только для разработки.';

  @override
  String get devToolsActivateTitle => 'Активировать режим разработчика?';

  @override
  String get devToolsActivated => 'Режим разработчика активирован.';

  @override
  String get devToolsClearPumped => 'Очистить сгенерированные данные';

  @override
  String get devToolsClearPumpedMessage =>
      'Удаляет сгенерированные предметы STRESS и их сессии. Ваши данные сохранятся.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Удалить сгенерированные предметы STRESS и сессии.';

  @override
  String get devToolsClearPumpedTitle => 'Очистить сгенерированные данные?';

  @override
  String devToolsCleared(String count) {
    return 'Очищено сгенерированных предметов: $count.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Второе подтверждение: это увеличит предметы, списки, графики и расчёты темпа и может занять несколько секунд. Сгенерировать?';

  @override
  String get devToolsConfirmPumpTitle => 'Подтвердите стресс-генерацию';

  @override
  String get devToolsContinue => 'Продолжить';

  @override
  String get devToolsExit => 'Выйти из режима разработчика';

  @override
  String get devToolsExitSubtitle =>
      'Скрыть инструменты разработчика на этом устройстве.';

  @override
  String get devToolsPumpData => 'Сгенерировать данные';

  @override
  String get devToolsPumpMessage =>
      'Добавит реалистичный сгенерированный семестр (~10 предметов, ~800 сессий за последние 12 недель). Существующие данные сохранятся. Продолжить?';

  @override
  String get devToolsPumpSubtitle =>
      'Добавить сгенерированный семестр (~10 предметов, ~800 сессий, 12 недель). Существующие данные сохранятся.';

  @override
  String get devToolsPumpTile => 'Сгенерировать тестовые данные';

  @override
  String get devToolsPumpTitle => 'Сгенерировать тестовые данные?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Сгенерировано: предметов — $courses, сессий — $sessions.';
  }

  @override
  String get devToolsPumping => 'Генерация тестовых данных…';

  @override
  String get devToolsRemoveAll => 'Удалить все данные';

  @override
  String get devToolsRemoveAllMessage =>
      'Ярлык разработчика: навсегда удаляет ВСЕ предметы, сессии и настройки. Это нельзя отменить.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Ярлык разработчика: удалить ВСЕ предметы, сессии и настройки.';

  @override
  String get devToolsRemoveAllTitle => 'Удалить все данные?';

  @override
  String get navCourses => 'Предметы';

  @override
  String get navDashboard => 'Дашборд';

  @override
  String get navSettings => 'Настройки';

  @override
  String get navStatistics => 'Статистика';

  @override
  String get navStudyLog => 'Журнал учёбы';

  @override
  String get sampleBadge => 'Пример';

  @override
  String get sessionFormCourseLabel => 'Предмет';

  @override
  String sessionFormDateButton(String date) {
    return 'Дата: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Длительность должна быть больше нуля.';

  @override
  String get sessionFormHoursLabel => 'Часы';

  @override
  String get sessionFormLogAction => 'Записать сессию';

  @override
  String get sessionFormMinutesLabel => 'Минуты';

  @override
  String get sessionFormNoCourseError => 'Выберите предмет.';

  @override
  String get sessionFormNoCoursesHint =>
      'Сначала добавьте предмет, чтобы записать сессию.';

  @override
  String get sessionFormNotesLabel => 'Заметки (необязательно)';

  @override
  String get sessionFormSaving => 'Сохранение…';

  @override
  String get sessionFormTitleAdd => 'Записать учебную сессию';

  @override
  String get sessionFormTitleEdit => 'Редактировать учебную сессию';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Итого: $hours ч';
  }

  @override
  String get settingsAccent => 'Цвет темы';

  @override
  String get settingsAccentBerry => 'Ягодный';

  @override
  String get settingsAccentClay => 'Глиняный';

  @override
  String get settingsAccentForest => 'Лесной';

  @override
  String get settingsAccentSlate => 'Графитовый';

  @override
  String get settingsAccentTeal => 'Бирюзовый';

  @override
  String get settingsAccentUpdated => 'Цвет темы обновлён.';

  @override
  String get settingsAllDataDeleted => 'Все данные удалены.';

  @override
  String get settingsAppearance => 'Оформление (тёмное / светлое)';

  @override
  String get settingsCheckingSample => 'Проверка примерных данных…';

  @override
  String get settingsClear => 'Очистить';

  @override
  String get settingsClearSample => 'Очистить примерные данные';

  @override
  String get settingsClearSampleMessage =>
      'Удаляет примерные предметы и сессии. Добавленные вами предметы и сессии не удаляются.';

  @override
  String get settingsClearSampleSubtitle =>
      'Удалить встроенные примерные предметы и сессии. Ваши данные сохранятся.';

  @override
  String get settingsClearSampleTitle => 'Очистить примерные данные?';

  @override
  String get settingsCopy => 'Копировать';

  @override
  String get settingsDailyError => 'Введите 0 или положительное число минут.';

  @override
  String get settingsDailyLabel => 'Минут в день (0 = без цели)';

  @override
  String get settingsDailyTarget => 'Дневная цель учёбы';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes мин/день';
  }

  @override
  String get settingsDailyUpdated => 'Дневная цель обновлена.';

  @override
  String get settingsData => 'Данные';

  @override
  String get settingsDeleteEverything => 'Удалить всё';

  @override
  String get settingsDevMode => 'Режим разработчика';

  @override
  String get settingsDisplay => 'Экран';

  @override
  String get settingsDisplayComfortable => 'Обычный';

  @override
  String get settingsDisplayCompact => 'Компактный';

  @override
  String get settingsDisplayLarge => 'Крупный';

  @override
  String get settingsDisplaySize => 'Размер текста и элементов';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Размер экрана обновлён.';

  @override
  String get settingsExport => 'Экспорт данных';

  @override
  String get settingsExportCopied => 'Экспорт скопирован в буфер обмена.';

  @override
  String get settingsExportSubtitle =>
      'Скопировать все предметы, сессии и настройки как JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return 'предметов: $courses · сессий: $sessions · $kb КБ';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (сокращено — полный бэкап $kb КБ, используйте «Копировать» для всего)';
  }

  @override
  String get settingsFirstWeekday => 'Первый день недели';

  @override
  String get settingsFirstWeekdayUpdated => 'Первый день недели обновлён.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (удерживайте $seconds с)';
  }

  @override
  String get settingsHoldToReplace => 'Удерживайте, чтобы заменить всё';

  @override
  String get settingsHoursError => 'Введите число больше нуля.';

  @override
  String get settingsHoursHelper =>
      'По умолчанию 30. Изменение пересчитывает требования; записи сохраняются.';

  @override
  String get settingsHoursLabel => 'Часов за кредит ECTS';

  @override
  String get settingsHoursPerEcts => 'Часов за ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value ч';
  }

  @override
  String get settingsHoursUpdated => 'Часы за ECTS обновлены.';

  @override
  String get settingsImport => 'Импорт данных';

  @override
  String get settingsImportAppend => 'Добавить';

  @override
  String get settingsImportAppendAction => 'Импортировать (добавить)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Данные добавлены: предметов — $courses, сессий — $sessions.';
  }

  @override
  String get settingsImportInfo =>
      'Добавление вставляет бэкап рядом с текущими данными (настройки сохраняются). Замена сначала стирает ВСЕ предметы, сессии и настройки.';

  @override
  String get settingsImportLabel => 'Вставьте экспортированный JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return 'предметов: $courses · сессий: $sessions';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· экспортировано $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· схема v$schema';
  }

  @override
  String get settingsImportReplace => 'Заменить';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Замена сначала удаляет всё. Нажмите и УДЕРЖИВАЙТЕ кнопку ниже $seconds секунд для подтверждения.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Данные заменены: предметов — $courses, сессий — $sessions.';
  }

  @override
  String get settingsImportSubtitle =>
      'Заменить все данные из ранее экспортированного JSON-бэкапа.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Держите дальше… $remaining с';
  }

  @override
  String get settingsNoSample => 'Нет примерных данных';

  @override
  String get settingsNoSampleSubtitle =>
      'Встроенные примерные данные уже очищены.';

  @override
  String get settingsNoTarget => 'Цель не задана';

  @override
  String get settingsOverloadError => 'Введите число 5–100 ч/нед.';

  @override
  String get settingsOverloadHelper =>
      'Недели с нагрузкой выше будут отмечены красным. Очная учёба — это ~35–40 ч/нед.';

  @override
  String settingsOverloadHours(String value) {
    return '$value ч';
  }

  @override
  String get settingsOverloadLabel => 'Часов в неделю (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/нед — красным';
  }

  @override
  String get settingsOverloadThreshold => 'Порог недельной перегрузки';

  @override
  String get settingsOverloadUpdated => 'Порог перегрузки обновлён.';

  @override
  String get settingsPaceTolerance => 'Допуск опережения / отставания';

  @override
  String get settingsPasteValidBackup => 'Сначала вставьте корректный бэкап';

  @override
  String get settingsReset => 'Сбросить';

  @override
  String get settingsResetAll => 'Сбросить все данные';

  @override
  String get settingsResetAllMessage =>
      'Навсегда удаляет ВСЕ предметы, сессии и настройки. Это нельзя отменить. При необходимости сначала экспортируйте бэкап.';

  @override
  String get settingsResetAllSubtitle =>
      'Удалить все предметы, сессии и настройки.';

  @override
  String get settingsResetAllTitle => 'Сбросить все данные?';

  @override
  String get settingsResetSettings => 'Сбросить настройки';

  @override
  String get settingsResetSettingsDone =>
      'Настройки сброшены к значениям по умолчанию.';

  @override
  String get settingsResetSettingsMessage =>
      'Восстанавливает часы за ECTS (30), дневную цель (нет), первый день недели (понедельник), тему (системная), допуск (5 дней), перегрузку (35 ч/нед), размер (обычный), цвет (графитовый).';

  @override
  String get settingsResetSettingsSubtitle =>
      'Значения по умолчанию: 30 ч/ECTS, без цели, понедельник, системная тема, допуск 5 дней, перегрузка 35 ч/нед, обычный размер, графитовый цвет.';

  @override
  String get settingsResetSettingsTitle => 'Сбросить настройки?';

  @override
  String get settingsSampleData => 'Примерные данные';

  @override
  String settingsSampleDataError(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get settingsStudySettings => 'Настройки учёбы';

  @override
  String get settingsThemeDark => 'Тёмная';

  @override
  String get settingsThemeLight => 'Светлая';

  @override
  String get settingsThemeSystem => 'Системная';

  @override
  String get settingsThemeTitle => 'Тема';

  @override
  String get settingsThemeUpdated => 'Тема обновлена.';

  @override
  String settingsToleranceDays(String value) {
    return '$value дн.';
  }

  @override
  String get settingsToleranceError => 'Введите число 0–30 дней.';

  @override
  String get settingsToleranceHelper =>
      'Опережение требует запаса +N дней, отставание −N дней. 5 = стабильно, 0 = чувствительно.';

  @override
  String get settingsToleranceLabel => 'Дней запаса (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance запаса';
  }

  @override
  String get settingsToleranceUpdated => 'Допуск обновлён.';

  @override
  String get settingsWeekdayFriday => 'Пятница';

  @override
  String get settingsWeekdayMonday => 'Понедельник';

  @override
  String get settingsWeekdaySaturday => 'Суббота';

  @override
  String get settingsWeekdaySunday => 'Воскресенье';

  @override
  String get settingsWeekdayThursday => 'Четверг';

  @override
  String get settingsWeekdayTuesday => 'Вторник';

  @override
  String get settingsWeekdayWednesday => 'Среда';

  @override
  String get sortDeadline => 'Дедлайн';

  @override
  String get sortName => 'Название';

  @override
  String get sortProgress => 'Прогресс';

  @override
  String get sortStatus => 'Статус';

  @override
  String get startupTitle => 'Не удалось запустить ECTS Tracker';

  @override
  String get statsActiveDays => 'Активные дни';

  @override
  String statsActiveDaysBadge(int days) {
    return 'активн. дней: $days';
  }

  @override
  String get statsAddDeadlines => 'Добавьте дедлайны для прогноза нагрузки.';

  @override
  String get statsComingLoad => 'Будущая нагрузка';

  @override
  String get statsConsistency => 'Регулярность';

  @override
  String get statsConsistencyHint =>
      'Учебные дни за последние 30 дней. Маленькие шаги каждый день бьют зубрёжку.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% последних 30 дней';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Предмет $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'П$id';
  }

  @override
  String get statsDidPerDay => 'Делал / день (14д)';

  @override
  String get statsEmpty => 'Пока нет сессий';

  @override
  String get statsGap => 'Разрыв';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value ч';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursч';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours ч';
  }

  @override
  String get statsLast30Days => 'Последние 30 дней';

  @override
  String get statsLast7Days => 'Последние 7 дней';

  @override
  String get statsNeedPerDay => 'Нужно / день';

  @override
  String get statsNext8Weeks => 'Следующие 8 недель';

  @override
  String get statsOfLast30DaysVolume => 'от объёма последних 30 дней';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Недели перегрузки >$threshold ч отмечены красным — перенесите дедлайн или сократите объём.';
  }

  @override
  String get statsOverview => 'Обзор';

  @override
  String get statsPaceCovers => 'Прошлый темп покрывает нужный. Держите серию.';

  @override
  String statsPaceShort(String gap) {
    return 'Прошлый темп короче на $gap ч/день — добавьте блок или сократите объём.';
  }

  @override
  String get statsPastVsNeeded => 'Прошлое и нужное';

  @override
  String statsPeakPerWeek(String peak) {
    return 'пик $peak ч/нед';
  }

  @override
  String get statsPerCourse => 'По предметам';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done ч / $required ч · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Сессии';

  @override
  String statsSuggestedOrder(String order) {
    return 'Рекомендуемый порядок: $order (сначала ближайший дедлайн)';
  }

  @override
  String get statsTotal => 'Всего';

  @override
  String get statsTotalVolume => 'общий объём';

  @override
  String get statusAhead => 'С опережением';

  @override
  String get statusBehind => 'Отставание';

  @override
  String get statusCompleted => 'Завершён';

  @override
  String get statusOnTrack => 'В графике';

  @override
  String get statusOverdue => 'Просрочен';

  @override
  String get studyLogDeleteBody =>
      'Удалить эту учебную сессию? Это нельзя отменить.';

  @override
  String get studyLogDeleteTitle => 'Удалить сессию?';

  @override
  String get studyLogEmptyHint =>
      'Запишите сессию, чтобы отслеживать учебное время.';

  @override
  String get studyLogEmptyTitle => 'Пока нет учебных сессий';

  @override
  String get studyLogFabLabel => 'Записать сессию';

  @override
  String get studyLogFabTooltip => 'Записать сессию';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours ч';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Удалить примерную сессию';

  @override
  String get studyLogThisWeek => 'На этой неделе';

  @override
  String get studyLogToday => 'Сегодня';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Предмет $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'П$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS должно быть больше нуля';

  @override
  String get validationCourseEctsRequired => 'Введите кредиты ECTS';

  @override
  String get validationCourseNameRequired => 'Название обязательно';

  @override
  String get validationCourseNameTooLong => 'Название слишком длинное';

  @override
  String get validationSessionCourseRequired => 'Выберите предмет';

  @override
  String get validationSessionDurationRequired => 'Введите длительность';

  @override
  String get widgetNoProgress => 'Пока без прогресса';

  @override
  String get settingsLanguage => 'Язык';
}
