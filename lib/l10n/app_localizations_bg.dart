// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Отказ';

  @override
  String get commonClose => 'Затвори';

  @override
  String get commonDelete => 'Изтрий';

  @override
  String get commonEdit => 'Редактирай';

  @override
  String get commonError => 'Грешка';

  @override
  String get commonNone => 'Няма';

  @override
  String get commonSave => 'Запази';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Необходими часове (авто): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Изчисти крайния срок';

  @override
  String get courseFormClearStartTooltip => 'Изчисти началната дата';

  @override
  String get courseFormColorLabel => 'Цвят';

  @override
  String get courseFormDateNotSet => 'Не е зададено';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Краен срок: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS кредити';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value ч/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Име';

  @override
  String get courseFormNotesLabel => 'Бележки (по избор)';

  @override
  String get courseFormSaving => 'Запазване…';

  @override
  String courseFormStartButton(String date) {
    return 'Начало: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Изкл.: без напрежение до $date; изключено от днешното темпо.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Вкл.: времето се разпределя досега и се брои към днешното темпо.';

  @override
  String get courseFormStartEarlyTitle =>
      'Започни сега въпреки бъдещото начало';

  @override
  String get courseFormTitleAdd => 'Добави курс';

  @override
  String get courseFormTitleEdit => 'Редактирай курса';

  @override
  String get coursesAddTooltip => 'Добави курс';

  @override
  String coursesDeleteBody(String name) {
    return 'Да изтрия ли „$name“ и всичките му учебни сесии? Това не може да се отмени.';
  }

  @override
  String get coursesDeleteTitle => 'Да изтрия ли курса?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Докосни „New course“, за да създадеш първия си курс.';

  @override
  String get coursesEmptyTitle => 'Все още няма курсове';

  @override
  String get coursesFilterAll => 'Всички статуси';

  @override
  String get coursesFilterEmpty => 'Няма курсове, отговарящи на този филтър';

  @override
  String get coursesNewCourse => 'Нов курс';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Нужни са $daily ч/ден';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Нужни са $daily ч/ден • $weekly ч/седмица';
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
  String get coursesRemoveSampleTooltip => 'Премахни примерния курс';

  @override
  String coursesShownCount(String count) {
    return 'Показани: $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Сортиране: $label';
  }

  @override
  String get dashboardAllDone => 'Всичко е готово';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours ч записани (бонус)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count курс(а)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count курс(а) · $upcoming предстоящи извън днешното темпо';
  }

  @override
  String get dashboardCoursesTitle => 'Курсове';

  @override
  String dashboardDeadline(String date) {
    return 'Краен срок $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Краен срок $date (остават $days дни)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Краен срок $date (остава 1 ден)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Краен срок $date (просрочен)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Краен срок $date (днес)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Дължимо днес — записани $hours ч';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Всички курсове са завършени — виж раздела Courses за пълния списък.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Добави курс, за да започнеш да следиш ECTS напредъка си.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Изоставаш = правиш $achieved/ден, трябват $need/ден';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Изоставаш = правиш $achieved/ден, трябват $need/ден · ранен старт';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Изоставаш: няма постижимо темпо за днешен срок с оставащи часове';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'В график: още няма темпо — запиши първата сесия за потвърждение';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Започва след $days дни · броено от $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Започва след $days дни · броено от $date · ранният старт е вкл.';
  }

  @override
  String get dashboardFreshStart => 'НОВО НАЧАЛО';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · остават $hours ч';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required ч';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours ч/ден';
  }

  @override
  String get dashboardLogSessionAction => 'Запиши учебна сесия';

  @override
  String get dashboardLogSessionTooltip => 'Запиши учебна сесия';

  @override
  String get dashboardNewBadge => 'НОВО';

  @override
  String get dashboardNoCourses => 'Все още няма курсове';

  @override
  String get dashboardNoDeadline => 'Без краен срок';

  @override
  String get dashboardNoDeadlines => 'Няма планирани крайни срокове';

  @override
  String get dashboardNoPaceDue => 'Няма дължимо темпо днес';

  @override
  String get dashboardNothingDue => 'Нищо дължимо';

  @override
  String get dashboardNothingToTrack => 'Все още няма какво да се следи';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Дължимо днес — остават $hours ч';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Трябват $daily ч/ден, за да завършиш';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Трябват $daily ч/ден · $weekly ч/седмица, за да завършиш';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Трябват $hours ч/ден от $date · извън днешното темпо';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Без срок — остават $hours ч · без дневно напрежение';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Започва на $date · остават $hours ч';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · нереалистично';
  }

  @override
  String get dashboardProgramBare => 'ПРОГРАМА';

  @override
  String get dashboardProgramEmptyHint =>
      'Добави курс, за да започнеш проследяването';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required ч';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'ПРОГРАМА $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days дни запас';
  }

  @override
  String get dashboardStartNotSet => 'Не е зададено';

  @override
  String dashboardStartsIn(String days) {
    return 'Започва след $days дни';
  }

  @override
  String get dashboardStartsSoon => 'Започва скоро';

  @override
  String get dashboardTipEmpty =>
      'Добави първия си курс — дневното ти темпо и напредъкът ще се появят тук.';

  @override
  String get dashboardTipFirst =>
      'Първите 25 мин са най-важни — избери курса с най-близък срок.';

  @override
  String get dashboardTodayBare => 'ДНЕС';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace ч';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'ДНЕС $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'ДНЕШНО ТЕМПО';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace ч днес';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Бъдещи начала — без напрежение днес, изключени от днешното темпо.';

  @override
  String get dashboardUpcomingTitle => 'Предстоящи';

  @override
  String get devToolsActivate => 'Активирай';

  @override
  String get devToolsActivateMessage =>
      'Това отключва скрити стрес-тест инструменти (генерирани данни). Само за разработка.';

  @override
  String get devToolsActivateTitle => 'Да активирам ли дев режима?';

  @override
  String get devToolsActivated => 'Дев режимът е активиран.';

  @override
  String get devToolsClearPumped => 'Изчисти генерираните данни';

  @override
  String get devToolsClearPumpedMessage =>
      'Изтрива генерираните STRESS курсове и сесиите им. Твоите данни се запазват.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Изтрий генерираните STRESS курсове и сесии.';

  @override
  String get devToolsClearPumpedTitle => 'Да изчистя ли генерираните данни?';

  @override
  String devToolsCleared(String count) {
    return 'Изчистени $count генерирани курс(а).';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Второ потвърждение: това ще надуе курсовете, списъците, графиките и изчисленията и може да отнеме няколко секунди. Да генерирам ли сега?';

  @override
  String get devToolsConfirmPumpTitle => 'Потвърди стрес-теста';

  @override
  String get devToolsContinue => 'Продължи';

  @override
  String get devToolsExit => 'Излез от дев режима';

  @override
  String get devToolsExitSubtitle =>
      'Скрий дев инструментите на това устройство.';

  @override
  String get devToolsPumpData => 'Генерирай данни';

  @override
  String get devToolsPumpMessage =>
      'Това вмъква реалистичен генериран семестър (~10 курса, ~800 сесии за последните 12 седмици). Съществуващите ти данни се запазват. Да продължа ли?';

  @override
  String get devToolsPumpSubtitle =>
      'Вмъкни генериран семестър (~10 курса, ~800 сесии, 12 седмици). Съществуващите данни се запазват.';

  @override
  String get devToolsPumpTile => 'Генерирай тестови данни';

  @override
  String get devToolsPumpTitle => 'Да генерирам ли тестови данни?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Генерирани $courses курса, $sessions сесии.';
  }

  @override
  String get devToolsPumping => 'Генериране на тестови данни…';

  @override
  String get devToolsRemoveAll => 'Премахни всички данни';

  @override
  String get devToolsRemoveAllMessage =>
      'Дев пряк път: това трайно изтрива ВСИЧКИ курсове, сесии и настройки. Не може да се отмени.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Дев пряк път: изтрий ВСИЧКИ курсове, сесии и настройки.';

  @override
  String get devToolsRemoveAllTitle => 'Да премахна ли всички данни?';

  @override
  String get navCourses => 'Курсове';

  @override
  String get navDashboard => 'Табло';

  @override
  String get navSettings => 'Настройки';

  @override
  String get navStatistics => 'Статистика';

  @override
  String get navStudyLog => 'Дневник';

  @override
  String get sampleBadge => 'Пример';

  @override
  String get sessionFormCourseLabel => 'Курс';

  @override
  String sessionFormDateButton(String date) {
    return 'Дата: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Продължителността трябва да е по-голяма от нула.';

  @override
  String get sessionFormHoursLabel => 'Часове';

  @override
  String get sessionFormLogAction => 'Запиши сесия';

  @override
  String get sessionFormMinutesLabel => 'Минути';

  @override
  String get sessionFormNoCourseError => 'Избери курс.';

  @override
  String get sessionFormNoCoursesHint =>
      'Първо добави курс, за да запишеш сесия.';

  @override
  String get sessionFormNotesLabel => 'Бележки (по избор)';

  @override
  String get sessionFormSaving => 'Запазване…';

  @override
  String get sessionFormTitleAdd => 'Запиши учебна сесия';

  @override
  String get sessionFormTitleEdit => 'Редактирай учебна сесия';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Общо: $hours ч';
  }

  @override
  String get settingsAccent => 'Цвят на темата';

  @override
  String get settingsAccentBerry => 'Горски плод';

  @override
  String get settingsAccentClay => 'Глина';

  @override
  String get settingsAccentForest => 'Гора';

  @override
  String get settingsAccentSlate => 'Шифер';

  @override
  String get settingsAccentTeal => 'Петролено';

  @override
  String get settingsAccentUpdated => 'Цветът на темата е обновен.';

  @override
  String get settingsAllDataDeleted => 'Всички данни са изтрити.';

  @override
  String get settingsAppearance => 'Изглед (тъмен / светъл)';

  @override
  String get settingsCheckingSample => 'Проверка на примерните данни…';

  @override
  String get settingsClear => 'Изчисти';

  @override
  String get settingsClearSample => 'Изчисти примерните данни';

  @override
  String get settingsClearSampleMessage =>
      'Това премахва примерните курсове и сесии. Добавените от теб курсове или сесии не се премахват.';

  @override
  String get settingsClearSampleSubtitle =>
      'Премахни вградените примерни курсове и сесии. Твоите данни се запазват.';

  @override
  String get settingsClearSampleTitle => 'Да изчистя ли примерните данни?';

  @override
  String get settingsCopy => 'Копирай';

  @override
  String get settingsDailyError => 'Въведи 0 или положителен брой минути.';

  @override
  String get settingsDailyLabel => 'Минути на ден (0 = без цел)';

  @override
  String get settingsDailyTarget => 'Дневна учебна цел';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes мин/ден';
  }

  @override
  String get settingsDailyUpdated => 'Дневната цел е обновена.';

  @override
  String get settingsData => 'Данни';

  @override
  String get settingsDeleteEverything => 'Изтрий всичко';

  @override
  String get settingsDevMode => 'Дев режим';

  @override
  String get settingsDisplay => 'Екран';

  @override
  String get settingsDisplayComfortable => 'Удобен';

  @override
  String get settingsDisplayCompact => 'Компактен';

  @override
  String get settingsDisplayLarge => 'Голям';

  @override
  String get settingsDisplaySize => 'Размер на текст и елементи';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Размерът на екрана е обновен.';

  @override
  String get settingsExport => 'Експортирай данни';

  @override
  String get settingsExportCopied => 'Експортът е копиран в клипборда.';

  @override
  String get settingsExportSubtitle =>
      'Копирай всички курсове, сесии и настройки като JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses курс(а) · $sessions сесии · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (съкратено — пълното копие е $kb KB, използвай Copy за всичко)';
  }

  @override
  String get settingsFirstWeekday => 'Първи ден на седмицата';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Първият ден на седмицата е обновен.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (задръж $seconds с)';
  }

  @override
  String get settingsHoldToReplace => 'Задръж, за да замениш всичко';

  @override
  String get settingsHoursError => 'Въведи число, по-голямо от нула.';

  @override
  String get settingsHoursHelper =>
      'По подразбиране 30. Промяната преизчислява нуждите; записите се запазват.';

  @override
  String get settingsHoursLabel => 'Часове за ECTS кредит';

  @override
  String get settingsHoursPerEcts => 'Часове за ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value ч';
  }

  @override
  String get settingsHoursUpdated => 'Часовете за ECTS са обновени.';

  @override
  String get settingsImport => 'Импортирай данни';

  @override
  String get settingsImportAppend => 'Добави';

  @override
  String get settingsImportAppendAction => 'Импортирай (добави)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Данните са добавени: $courses курс(а), $sessions сесии.';
  }

  @override
  String get settingsImportInfo =>
      'Добавянето прибавя копието към текущите данни (настройките се запазват). Замяната първо изтрива ВСИЧКИ курсове, сесии и настройки.';

  @override
  String get settingsImportLabel => 'Постави експортирания JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses курс(а) · $sessions сесии';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · експортирано на $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · схема v$schema';
  }

  @override
  String get settingsImportReplace => 'Замени';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Замяната първо изтрива всичко. Натисни и ЗАДРЪЖ бутона по-долу за $seconds секунди за потвърждение.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Данните са заменени: възстановени $courses курс(а), $sessions сесии.';
  }

  @override
  String get settingsImportSubtitle =>
      'Замени всички данни от предишно експортирано JSON копие.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Продължи да държиш… $remaining с';
  }

  @override
  String get settingsNoSample => 'Няма примерни данни';

  @override
  String get settingsNoSampleSubtitle =>
      'Вградените примерни данни вече са изчистени.';

  @override
  String get settingsNoTarget => 'Няма зададена цел';

  @override
  String get settingsOverloadError => 'Въведи число 5–100 ч/седмица.';

  @override
  String get settingsOverloadHelper =>
      'Седмиците с предстоящо натоварване над това се маркират в червено. Редовното учене е ~35–40 ч/седмица.';

  @override
  String settingsOverloadHours(String value) {
    return '$value ч';
  }

  @override
  String get settingsOverloadLabel => 'Часове на седмица (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/седмица се маркира в червено';
  }

  @override
  String get settingsOverloadThreshold => 'Седмичен праг на претоварване';

  @override
  String get settingsOverloadUpdated => 'Прагът на претоварване е обновен.';

  @override
  String get settingsPaceTolerance => 'Толеранс напред / назад';

  @override
  String get settingsPasteValidBackup => 'Първо постави валидно копие';

  @override
  String get settingsReset => 'Нулирай';

  @override
  String get settingsResetAll => 'Нулирай всички данни';

  @override
  String get settingsResetAllMessage =>
      'Това трайно изтрива ВСИЧКИ курсове, сесии и настройки. Не може да се отмени. Първо експортирай копие, ако е нужно.';

  @override
  String get settingsResetAllSubtitle =>
      'Изтрий всички курсове, сесии и настройки.';

  @override
  String get settingsResetAllTitle => 'Да нулирам ли всички данни?';

  @override
  String get settingsResetSettings => 'Нулирай настройките';

  @override
  String get settingsResetSettingsDone => 'Настройките са нулирани.';

  @override
  String get settingsResetSettingsMessage =>
      'Възстановява часове за ECTS (30), дневна цел (няма), първи делничен ден (понеделник), тема (системна), толеранс (5 дни), претоварване (35 ч/седмица), размер (удобен), цвят (шифер). Курсовете и сесиите се запазват.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Възстанови стандартните: 30 ч/ECTS, без цел, понеделник, системна тема, 5 дни толеранс, 35 ч/седмица претоварване, удобен размер, шифер цвят.';

  @override
  String get settingsResetSettingsTitle => 'Да нулирам ли настройките?';

  @override
  String get settingsSampleData => 'Примерни данни';

  @override
  String settingsSampleDataError(String error) {
    return 'Грешка: $error';
  }

  @override
  String get settingsStudySettings => 'Учебни настройки';

  @override
  String get settingsThemeDark => 'Тъмна';

  @override
  String get settingsThemeLight => 'Светла';

  @override
  String get settingsThemeSystem => 'Системна';

  @override
  String get settingsThemeTitle => 'Тема';

  @override
  String get settingsThemeUpdated => 'Темата е обновена.';

  @override
  String settingsToleranceDays(String value) {
    return '$value дни';
  }

  @override
  String get settingsToleranceError => 'Въведи число 0–30 дни.';

  @override
  String get settingsToleranceHelper =>
      'Напред изисква +N дни излишък, назад е −N дни. 5 = стабилно, 0 = чувствително.';

  @override
  String get settingsToleranceLabel => 'Дни работа (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance работа';
  }

  @override
  String get settingsToleranceUpdated => 'Толерансът е обновен.';

  @override
  String get settingsWeekdayFriday => 'Петък';

  @override
  String get settingsWeekdayMonday => 'Понеделник';

  @override
  String get settingsWeekdaySaturday => 'Събота';

  @override
  String get settingsWeekdaySunday => 'Неделя';

  @override
  String get settingsWeekdayThursday => 'Четвъртък';

  @override
  String get settingsWeekdayTuesday => 'Вторник';

  @override
  String get settingsWeekdayWednesday => 'Сряда';

  @override
  String get sortDeadline => 'Краен срок';

  @override
  String get sortName => 'Име';

  @override
  String get sortProgress => 'Напредък';

  @override
  String get sortStatus => 'Статус';

  @override
  String get startupTitle => 'ECTS Tracker не можа да стартира';

  @override
  String get statsActiveDays => 'Активни дни';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days дни активност';
  }

  @override
  String get statsAddDeadlines =>
      'Добави крайни срокове, за да се прогнозира натоварването.';

  @override
  String get statsComingLoad => 'Предстоящо натоварване';

  @override
  String get statsConsistency => 'Постоянство';

  @override
  String get statsConsistencyHint =>
      'Учебни дни през последните 30 дни. Малките стъпки всеки ден побеждават зубренето.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% от последните 30 дни';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Курс $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Направено / ден (14 дни)';

  @override
  String get statsEmpty => 'Все още няма сесии';

  @override
  String get statsGap => 'Разлика';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value ч';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours ч';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours ч';
  }

  @override
  String get statsLast30Days => 'Последните 30 дни';

  @override
  String get statsLast7Days => 'Последните 7 дни';

  @override
  String get statsNeedPerDay => 'Нужно / ден';

  @override
  String get statsNext8Weeks => 'Следващите 8 седмици';

  @override
  String get statsOfLast30DaysVolume => 'от обема за последните 30 дни';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Претоварените седмици >$threshold ч са в червено — премести срок или намали обхвата.';
  }

  @override
  String get statsOverview => 'Преглед';

  @override
  String get statsPaceCovers =>
      'Миналото темпо покрива нужното. Запази серията.';

  @override
  String statsPaceShort(String gap) {
    return 'Миналото темпо е с $gap ч/ден по-малко — добави блок или намали обхвата.';
  }

  @override
  String get statsPastVsNeeded => 'Минало срещу нужно';

  @override
  String statsPeakPerWeek(String peak) {
    return 'пик $peak ч/седм.';
  }

  @override
  String get statsPerCourse => 'По курсове';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done ч / $required ч · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Сесии';

  @override
  String statsSuggestedOrder(String order) {
    return 'Предложен ред: $order (най-ранен срок първо)';
  }

  @override
  String get statsTotal => 'Общо';

  @override
  String get statsTotalVolume => 'общ обем';

  @override
  String get statusAhead => 'Напред';

  @override
  String get statusBehind => 'Изостава';

  @override
  String get statusCompleted => 'Завършен';

  @override
  String get statusOnTrack => 'В график';

  @override
  String get statusOverdue => 'Просрочен';

  @override
  String get studyLogDeleteBody =>
      'Да изтрия ли тази учебна сесия? Това не може да се отмени.';

  @override
  String get studyLogDeleteTitle => 'Да изтрия ли сесията?';

  @override
  String get studyLogEmptyHint =>
      'Запиши сесия, за да следиш учебното си време.';

  @override
  String get studyLogEmptyTitle => 'Все още няма учебни сесии';

  @override
  String get studyLogFabLabel => 'Запиши сесия';

  @override
  String get studyLogFabTooltip => 'Запиши сесия';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours ч';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Премахни примерната сесия';

  @override
  String get studyLogThisWeek => 'Тази седмица';

  @override
  String get studyLogToday => 'Днес';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Курс $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'ECTS трябва да е по-голямо от нула';

  @override
  String get validationCourseEctsRequired => 'Въведи ECTS кредити';

  @override
  String get validationCourseNameRequired => 'Името е задължително';

  @override
  String get validationCourseNameTooLong => 'Името е твърде дълго';

  @override
  String get validationSessionCourseRequired => 'Избери курс';

  @override
  String get validationSessionDurationRequired => 'Въведи продължителност';

  @override
  String get widgetNoProgress => 'Все още няма напредък';

  @override
  String get settingsLanguage => 'Език';

  @override
  String get settingsLiquidGlass => 'Течно стъкло';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Карти и ленти от матирано стъкло. Изкл. запазва класическия плътен вид.';

  @override
  String get settingsLiquidGlassOn => 'Вкл.';

  @override
  String get settingsLiquidGlassOff => 'Изкл.';

  @override
  String get settingsLiquidGlassUpdated => 'Течното стъкло е обновено.';
}
