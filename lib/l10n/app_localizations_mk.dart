// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Откажи';

  @override
  String get commonClose => 'Затвори';

  @override
  String get commonDelete => 'Избриши';

  @override
  String get commonEdit => 'Уреди';

  @override
  String get commonError => 'Грешка';

  @override
  String get commonNone => 'Нема';

  @override
  String get commonSave => 'Зачувај';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Потребни часови (автоматски): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Исчисти рок';

  @override
  String get courseFormClearStartTooltip => 'Исчисти почетен датум';

  @override
  String get courseFormColorLabel => 'Боја';

  @override
  String get courseFormDateNotSet => 'Не е поставено';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Рок: $date';
  }

  @override
  String get courseFormEctsLabel => 'ЕКТС кредити';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value ч/ЕКТС';
  }

  @override
  String get courseFormNameLabel => 'Име';

  @override
  String get courseFormNotesLabel => 'Забелешки (опционално)';

  @override
  String get courseFormSaving => 'Се зачувува…';

  @override
  String courseFormStartButton(String date) {
    return 'Почеток: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Исклучено: нема притисок до $date; исклучено од денешното темпо.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Вклучено: времето се дели до сега и се вбројува во денешното темпо.';

  @override
  String get courseFormStartEarlyTitle =>
      'Започни сега и покрај идниот почеток';

  @override
  String get courseFormTitleAdd => 'Додај предмет';

  @override
  String get courseFormTitleEdit => 'Уреди предмет';

  @override
  String get coursesAddTooltip => 'Додај предмет';

  @override
  String coursesDeleteBody(String name) {
    return 'Да се избрише „$name“ и сите негови сесии? Ова не може да се врати.';
  }

  @override
  String get coursesDeleteTitle => 'Да се избрише предметот?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ЕКТС';
  }

  @override
  String get coursesEmptyHint =>
      'Допрете „Нов предмет“ за да го создадете првиот предмет.';

  @override
  String get coursesEmptyTitle => 'Сè уште нема предмети';

  @override
  String get coursesFilterAll => 'Сите статуси';

  @override
  String get coursesFilterEmpty => 'Ниеден предмет не одговара на филтерот';

  @override
  String get coursesNewCourse => 'Нов предмет';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Потребно $daily ч/ден';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/day needed';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Потребно $daily ч/ден • $weekly ч/седмица';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/day • $weekly min/week needed';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/day • $weekly h/week needed';
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
  String get coursesRemoveSampleTooltip => 'Отстрани примерок-предмет';

  @override
  String coursesShownCount(String count) {
    return 'Прикажани $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Подреди: $label';
  }

  @override
  String get dashboardAllDone => 'Сè е завршено';

  @override
  String dashboardBonusLogged(String hours) {
    return 'Запишани $hours ч (бонус)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count предмет(и)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count предмет(и) · $upcoming идни не се во денешното темпо';
  }

  @override
  String get dashboardCoursesTitle => 'Предмети';

  @override
  String dashboardDeadline(String date) {
    return 'Рок $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Рок $date (остануваат $days дена)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Рок $date (останува 1 ден)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Рок $date (задоцнето)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Рок $date (денес)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Доспева денес — запишани $hours ч';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Сите предмети се завршени — видете го табот Предмети за целата листа.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Додајте предмет за да го следите ЕКТС-напредокот.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Задоцнување = правите $achieved/ден, треба $need/ден';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Задоцнување = правите $achieved/ден, треба $need/ден · ран почеток';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Задоцнување: нема конечно темпо што го исполнува денешниот рок со преостанати часови';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Во тек: сè уште нема темпо — запишете ја првата сесија за потврда';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Започнува за $days дена · се брои од $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Започнува за $days дена · се брои од $date · ран почеток вклучен';
  }

  @override
  String get dashboardFreshStart => 'НОВ ПОЧЕТОК';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · остануваат $hoursч';
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
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/d';
  }

  @override
  String get dashboardLogSessionAction => 'Запиши сесија за учење';

  @override
  String get dashboardLogSessionTooltip => 'Запиши сесија за учење';

  @override
  String get dashboardNewBadge => 'НОВО';

  @override
  String get dashboardNoCourses => 'Сè уште нема предмети';

  @override
  String get dashboardNoDeadline => 'Без рок';

  @override
  String get dashboardNoDeadlines => 'Нема закажани рокови';

  @override
  String get dashboardNoPaceDue => 'Нема темпо за денес';

  @override
  String get dashboardNothingDue => 'Ништо не доспева';

  @override
  String get dashboardNothingToTrack => 'Нема што да се следи уште';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Доспева денес — остануваат $hoursч';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Потребно $daily ч/ден за да заврши';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Need $daily min/day to finish';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Потребно $daily ч/ден · $weekly ч/седмица за да заврши';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Need $daily min/day · $weekly min/week to finish';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Need $daily min/day · $weekly h/week to finish';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Потребно $hours ч/ден од $date · не е во денешното темпо';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Need $minutes min/day from $date · not in Today’s pace';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Без рок — остануваат $hoursч · без дневен притисок';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Започнува $date · треба $hoursч';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · нереално';
  }

  @override
  String get dashboardProgramBare => 'ПРОГРАМА';

  @override
  String get dashboardProgramEmptyHint =>
      'Додајте предмет за да започнете со следење';

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
    return '$days дена залиха';
  }

  @override
  String get dashboardStartNotSet => 'Не е поставено';

  @override
  String dashboardStartsIn(String days) {
    return 'Започнува за $daysд';
  }

  @override
  String get dashboardStartsSoon => 'Започнува наскоро';

  @override
  String get dashboardTipEmpty =>
      'Додајте го првиот предмет — дневното темпо и напредокот ќе се појават тука.';

  @override
  String get dashboardTipFirst =>
      'Првите 25 минути се најважни — изберете го предметот што прв доспева.';

  @override
  String get dashboardTodayBare => 'ДЕНЕС';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace ч';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'ДЕНЕС $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'ДЕНЕШНО ТЕМПО';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace ч денес';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Идни почетоци — без притисок денес, исклучени од денешното темпо.';

  @override
  String get dashboardUpcomingTitle => 'Претстојни';

  @override
  String get devToolsActivate => 'Активирај';

  @override
  String get devToolsActivateMessage =>
      'Ова отклучува скриени алатки за стрес-тестирање (генерирање податоци). Само за развој.';

  @override
  String get devToolsActivateTitle => 'Да се активира развоен режим?';

  @override
  String get devToolsActivated => 'Развојниот режим е активиран.';

  @override
  String get devToolsClearPumped => 'Исчисти генерирани податоци';

  @override
  String get devToolsClearPumpedMessage =>
      'Ги брише генерираните STRESS предмети и нивните сесии. Вашите податоци се зачувуваат.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Избриши ги генерираните STRESS предмети и сесии.';

  @override
  String get devToolsClearPumpedTitle =>
      'Да се исчистат генерираните податоци?';

  @override
  String devToolsCleared(String count) {
    return 'Исчистени $count генерирани предмет(и).';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Втора потврда: ова ќе ги наполни предметите, листите, графиконите и пресметките на темпото и може да потрае неколку секунди. Да се генерира сега?';

  @override
  String get devToolsConfirmPumpTitle => 'Потврди стрес-генерирање';

  @override
  String get devToolsContinue => 'Продолжи';

  @override
  String get devToolsExit => 'Излези од развоен режим';

  @override
  String get devToolsExitSubtitle => 'Скриј ги развојните алатки на овој уред.';

  @override
  String get devToolsPumpData => 'Генерирај податоци';

  @override
  String get devToolsPumpMessage =>
      'Ова внесува реален генериран семестар (~10 предмети, ~800 сесии во последните 12 недели). Постоечките податоци се зачувуваат. Да се продолжи?';

  @override
  String get devToolsPumpSubtitle =>
      'Внеси генериран семестар (~10 предмети, ~800 сесии, 12 недели). Постоечките податоци се зачувуваат.';

  @override
  String get devToolsPumpTile => 'Генерирај тест-податоци';

  @override
  String get devToolsPumpTitle => 'Да се генерираат тест-податоци?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Генерирани $courses предмети, $sessions сесии.';
  }

  @override
  String get devToolsPumping => 'Се генерираат тест-податоци…';

  @override
  String get devToolsRemoveAll => 'Отстрани ги сите податоци';

  @override
  String get devToolsRemoveAllMessage =>
      'Развојна кратенка: ова трајно ги брише СИТЕ предмети, сесии и поставки. Ова не може да се врати.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Развојна кратенка: избриши ги СИТЕ предмети, сесии и поставки.';

  @override
  String get devToolsRemoveAllTitle => 'Да се отстранат сите податоци?';

  @override
  String get navCourses => 'Предмети';

  @override
  String get navDashboard => 'Контролна табла';

  @override
  String get navSettings => 'Поставки';

  @override
  String get navStatistics => 'Статистика';

  @override
  String get navStudyLog => 'Дневник за учење';

  @override
  String get sampleBadge => 'Примерок';

  @override
  String get sessionFormCourseLabel => 'Предмет';

  @override
  String sessionFormDateButton(String date) {
    return 'Датум: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Времетраењето мора да е поголемо од нула.';

  @override
  String get sessionFormHoursLabel => 'Часови';

  @override
  String get sessionFormLogAction => 'Запиши сесија';

  @override
  String get sessionFormMinutesLabel => 'Минути';

  @override
  String get sessionFormNoCourseError => 'Изберете предмет.';

  @override
  String get sessionFormNoCoursesHint =>
      'Прво додајте предмет за да запишете сесија.';

  @override
  String get sessionFormNotesLabel => 'Забелешки (опционално)';

  @override
  String get sessionFormSaving => 'Се зачувува…';

  @override
  String get sessionFormTitleAdd => 'Запиши сесија за учење';

  @override
  String get sessionFormTitleEdit => 'Уреди сесија за учење';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Вкупно: $hours ч';
  }

  @override
  String get settingsAccent => 'Боја на тема';

  @override
  String get settingsAccentBerry => 'Бобинка';

  @override
  String get settingsAccentClay => 'Глина';

  @override
  String get settingsAccentForest => 'Шума';

  @override
  String get settingsAccentSlate => 'Чеша';

  @override
  String get settingsAccentTeal => 'Тиркизна';

  @override
  String get settingsAccentUpdated => 'Бојата на темата е ажурирана.';

  @override
  String get settingsAllDataDeleted => 'Сите податоци се избришани.';

  @override
  String get settingsAppearance => 'Изглед (темно / светло)';

  @override
  String get settingsCheckingSample => 'Се проверуваат примерок-податоци…';

  @override
  String get settingsClear => 'Исчисти';

  @override
  String get settingsClearSample => 'Исчисти примерок-податоци';

  @override
  String get settingsClearSampleMessage =>
      'Ова ги отстранува пример-предметите и сесиите. Предметите или сесиите што сами сте ги додале не се отстрануваат.';

  @override
  String get settingsClearSampleSubtitle =>
      'Отстранете ги вградените пример-предмети и сесии. Вашите податоци се зачувуваат.';

  @override
  String get settingsClearSampleTitle => 'Да се исчистат примерок-податоците?';

  @override
  String get settingsCopy => 'Копирај';

  @override
  String get settingsDailyError => 'Внесете 0 или позитивен број на минути.';

  @override
  String get settingsDailyLabel => 'Минути дневно (0 = без цел)';

  @override
  String get settingsDailyTarget => 'Дневна цел за учење';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes мин/ден';
  }

  @override
  String get settingsDailyUpdated => 'Дневната цел е ажурирана.';

  @override
  String get settingsData => 'Податоци';

  @override
  String get settingsDeleteEverything => 'Избриши сè';

  @override
  String get settingsDevMode => 'Развоен режим';

  @override
  String get settingsDisplay => 'Приказ';

  @override
  String get settingsDisplayComfortable => 'Удобно';

  @override
  String get settingsDisplayCompact => 'Компактно';

  @override
  String get settingsDisplayLarge => 'Големо';

  @override
  String get settingsDisplaySize => 'Големина на текст и елементи';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated =>
      'Големината на приказот е ажурирана.';

  @override
  String get settingsExport => 'Извези податоци';

  @override
  String get settingsExportCopied => 'Извозот е копиран во клипборд.';

  @override
  String get settingsExportSubtitle =>
      'Копирајте ги сите предмети, сесии и поставки како JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses предмет(и) · $sessions сесии · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (скратено — целосната резервна копија е $kb KB, користете Копирај за сè)';
  }

  @override
  String get settingsFirstWeekday => 'Прв ден во седмицата';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Првиот ден во седмицата е ажуриран.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (држете $secondsс)';
  }

  @override
  String get settingsHoldToReplace => 'Држете за да замените сè';

  @override
  String get settingsHoursError => 'Внесете број поголем од нула.';

  @override
  String get settingsHoursHelper =>
      'Стандардно 30. Промената ги пресметува барањата; записите се зачувуваат.';

  @override
  String get settingsHoursLabel => 'Часови по ЕКТС-кредит';

  @override
  String get settingsHoursPerEcts => 'Часови по ЕКТС';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value ч';
  }

  @override
  String get settingsHoursUpdated => 'Часовите по ЕКТС се ажурирани.';

  @override
  String get settingsImport => 'Увези податоци';

  @override
  String get settingsImportAppend => 'Додај';

  @override
  String get settingsImportAppendAction => 'Увези (додај)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Податоците се додадени: $courses предмет(и), $sessions сесии.';
  }

  @override
  String get settingsImportInfo =>
      'Додавањето ја додава резервната копија кон тековните податоци (поставките се зачувуваат). Замената прво ги брише СИТЕ предмети, сесии и поставки.';

  @override
  String get settingsImportLabel => 'Вметнете го извезениот JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses предмет(и) · $sessions сесии';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· извезено $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· шема в$schema';
  }

  @override
  String get settingsImportReplace => 'Замени';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Замената прво брише сè. Притиснете и ДРЖЕТЕ го копчето подолу $seconds секунди за потврда.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Податоците се заменети: $courses предмет(и), $sessions сесии се вратени.';
  }

  @override
  String get settingsImportSubtitle =>
      'Заменете ги сите податоци од претходно извезена JSON резервна копија.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Продолжете да држите… $remaining с';
  }

  @override
  String get settingsNoSample => 'Нема примерок-податоци';

  @override
  String get settingsNoSampleSubtitle =>
      'Вградените пример-податоци се веќе исчистени.';

  @override
  String get settingsNoTarget => 'Нема поставена цел';

  @override
  String get settingsOverloadError => 'Внесете број 5–100 ч/седмица.';

  @override
  String get settingsOverloadHelper =>
      'Седмиците со оптоварување над ова се означуваат црвено. Редовните студии се ~35–40 ч/седмица.';

  @override
  String settingsOverloadHours(String value) {
    return '$value ч';
  }

  @override
  String get settingsOverloadLabel => 'Часови седмично (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/седмично се означува црвено';
  }

  @override
  String get settingsOverloadThreshold => 'Праг на седмично преоптоварување';

  @override
  String get settingsOverloadUpdated => 'Прагот на преоптоварување е ажуриран.';

  @override
  String get settingsPaceTolerance => 'Толеранција напред / назад';

  @override
  String get settingsPasteValidBackup =>
      'Прво вметнете важечка резервна копија';

  @override
  String get settingsReset => 'Ресетирај';

  @override
  String get settingsResetAll => 'Ресетирај ги сите податоци';

  @override
  String get settingsResetAllMessage =>
      'Ова трајно ги брише СИТЕ предмети, сесии и поставки. Ова не може да се врати. Прво извезете резервна копија ако е потребно.';

  @override
  String get settingsResetAllSubtitle =>
      'Избришете ги сите предмети, сесии и поставки.';

  @override
  String get settingsResetAllTitle => 'Да се ресетираат сите податоци?';

  @override
  String get settingsResetSettings => 'Ресетирај поставки';

  @override
  String get settingsResetSettingsDone =>
      'Поставките се вратени на стандардни.';

  @override
  String get settingsResetSettingsMessage =>
      'Ги враќа часови-по-ЕКТС (30), дневна цел (нема), прв ден (понеделник), тема (системска), толеранција (5 дена), преоптоварување (35 ч/седмица), големина (удобно), боја (чеша). Предметите и сесиите се зачувуваат.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Врати стандардни: 30 ч/ЕКТС, без цел, понеделник, системска тема, толеранција 5 дена, преоптоварување 35 ч/седмица, удобна големина, чеша боја.';

  @override
  String get settingsResetSettingsTitle => 'Да се ресетираат поставките?';

  @override
  String get settingsSampleData => 'Примерок-податоци';

  @override
  String settingsSampleDataError(String error) {
    return 'Грешка: $error';
  }

  @override
  String get settingsStudySettings => 'Поставки за учење';

  @override
  String get settingsThemeDark => 'Темна';

  @override
  String get settingsThemeLight => 'Светла';

  @override
  String get settingsThemeSystem => 'Системска стандардна';

  @override
  String get settingsThemeTitle => 'Тема';

  @override
  String get settingsThemeUpdated => 'Темата е ажурирана.';

  @override
  String settingsToleranceDays(String value) {
    return '$value дена';
  }

  @override
  String get settingsToleranceError => 'Внесете број 0–30 дена.';

  @override
  String get settingsToleranceHelper =>
      'Напред бара +N дена вишок, назад −N дена. 5 = стабилно, 0 = чувствително.';

  @override
  String get settingsToleranceLabel => 'Дена работа (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance работа';
  }

  @override
  String get settingsToleranceUpdated => 'Толеранцијата е ажурирана.';

  @override
  String get settingsWeekdayFriday => 'Петок';

  @override
  String get settingsWeekdayMonday => 'Понеделник';

  @override
  String get settingsWeekdaySaturday => 'Сабота';

  @override
  String get settingsWeekdaySunday => 'Недела';

  @override
  String get settingsWeekdayThursday => 'Четврток';

  @override
  String get settingsWeekdayTuesday => 'Вторник';

  @override
  String get settingsWeekdayWednesday => 'Среда';

  @override
  String get sortDeadline => 'Рок';

  @override
  String get sortName => 'Име';

  @override
  String get sortProgress => 'Напредок';

  @override
  String get sortStatus => 'Статус';

  @override
  String get startupTitle => 'Не можеше да се стартува ECTS Tracker';

  @override
  String get statsActiveDays => 'Активни денови';

  @override
  String statsActiveDaysBadge(int days) {
    return '$daysд активни';
  }

  @override
  String get statsAddDeadlines =>
      'Додајте рокови за да го предвидите оптоварувањето.';

  @override
  String get statsComingLoad => 'Претстојно оптоварување';

  @override
  String get statsConsistency => 'Конзистентност';

  @override
  String get statsConsistencyHint =>
      'Денови за учење во последните 30 дена. Мали чекори секој ден се подобри од кампањско учење.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% од последните 30 дена';
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
  String get statsDidPerDay => 'Направено / ден (14д)';

  @override
  String get statsEmpty => 'Сè уште нема сесии';

  @override
  String get statsGap => 'Разлика';

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
  String get statsLast30Days => 'Последни 30 дена';

  @override
  String get statsLast7Days => 'Последни 7 дена';

  @override
  String get statsNeedPerDay => 'Потребно / ден';

  @override
  String get statsNext8Weeks => 'Следни 8 седмици';

  @override
  String get statsOfLast30DaysVolume => 'од обемот на последните 30 дена';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Седмиците со преоптоварување >$thresholdч се означени црвено — преместете рок или намалете обем.';
  }

  @override
  String get statsOverview => 'Преглед';

  @override
  String get statsPaceCovers =>
      'Минатото темпо го покрива потребното. Продолжете во ритам.';

  @override
  String statsPaceShort(String gap) {
    return 'Минатото темпо е $gap ч/ден кратко — додајте блок или намалете обем.';
  }

  @override
  String get statsPastVsNeeded => 'Минато наспроти потребно';

  @override
  String statsPeakPerWeek(String peak) {
    return 'врв $peakч/сед';
  }

  @override
  String get statsPerCourse => 'По предмет';

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
    return 'Предложен редослед: $order (најран рок прв)';
  }

  @override
  String get statsTotal => 'Вкупно';

  @override
  String get statsTotalVolume => 'вкупен обем';

  @override
  String get statusAhead => 'Напред';

  @override
  String get statusBehind => 'Задоцнува';

  @override
  String get statusCompleted => 'Завршено';

  @override
  String get statusOnTrack => 'Во тек';

  @override
  String get statusOverdue => 'Задоцнето';

  @override
  String get studyLogDeleteBody =>
      'Да се избрише оваа сесија? Ова не може да се врати.';

  @override
  String get studyLogDeleteTitle => 'Да се избрише сесијата?';

  @override
  String get studyLogEmptyHint =>
      'Запишете сесија за да го следите времето за учење.';

  @override
  String get studyLogEmptyTitle => 'Сè уште нема сесии за учење';

  @override
  String get studyLogFabLabel => 'Запиши сесија';

  @override
  String get studyLogFabTooltip => 'Запиши сесија';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours ч';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Отстрани примерок-сесија';

  @override
  String get studyLogThisWeek => 'Оваа седмица';

  @override
  String get studyLogToday => 'Денес';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Предмет $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'П$id';
  }

  @override
  String get validationCourseEctsPositive => 'ЕКТС мора да е поголемо од нула';

  @override
  String get validationCourseEctsRequired => 'Внесете ЕКТС кредити';

  @override
  String get validationCourseNameRequired => 'Името е задолжително';

  @override
  String get validationCourseNameTooLong => 'Името е предолго';

  @override
  String get validationSessionCourseRequired => 'Изберете предмет';

  @override
  String get validationSessionDurationRequired => 'Внесете времетраење';

  @override
  String get widgetNoProgress => 'Сè уште нема напредок';

  @override
  String get settingsLanguage => 'Јазик';

  @override
  String get settingsLiquidGlass => 'Течно стакло';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Картички и ленти од матирано стакло. Исклучено го задржува класичниот солиден изглед.';

  @override
  String get settingsLiquidGlassOn => 'Вклучено';

  @override
  String get settingsLiquidGlassOff => 'Исклучено';

  @override
  String get settingsLiquidGlassUpdated => 'Течното стакло е ажурирано.';

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
