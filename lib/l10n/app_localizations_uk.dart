// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Скасувати';

  @override
  String get commonClose => 'Закрити';

  @override
  String get commonDelete => 'Видалити';

  @override
  String get commonEdit => 'Редагувати';

  @override
  String get commonError => 'Помилка';

  @override
  String get commonNone => 'Немає';

  @override
  String get commonSave => 'Зберегти';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Необхідно годин (авто): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Очистити дедлайн';

  @override
  String get courseFormClearStartTooltip => 'Очистити дату початку';

  @override
  String get courseFormColorLabel => 'Колір';

  @override
  String get courseFormDateNotSet => 'Не встановлено';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Дедлайн: $date';
  }

  @override
  String get courseFormEctsLabel => 'Кредити ЄКТС';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value год/ЄКТС';
  }

  @override
  String get courseFormNameLabel => 'Назва';

  @override
  String get courseFormNotesLabel => 'Нотатки (необов’язково)';

  @override
  String get courseFormSaving => 'Збереження…';

  @override
  String courseFormStartButton(String date) {
    return 'Початок: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Вимк.: жодного навантаження до $date; виключено із сьогоднішнього темпу.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Увімк.: час розподіляється дотепер і зараховується до сьогоднішнього темпу.';

  @override
  String get courseFormStartEarlyTitle => 'Почати зараз попри майбутній старт';

  @override
  String get courseFormTitleAdd => 'Додати курс';

  @override
  String get courseFormTitleEdit => 'Редагувати курс';

  @override
  String get coursesAddTooltip => 'Додати курс';

  @override
  String coursesDeleteBody(String name) {
    return 'Видалити «$name» та всі його навчальні сесії? Це не можна скасувати.';
  }

  @override
  String get coursesDeleteTitle => 'Видалити курс?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ЄКТС';
  }

  @override
  String get coursesEmptyHint =>
      'Торкніться «Новий курс», щоб створити свій перший курс.';

  @override
  String get coursesEmptyTitle => 'Курсів поки немає';

  @override
  String get coursesFilterAll => 'Усі статуси';

  @override
  String get coursesFilterEmpty => 'Жоден курс не відповідає фільтру';

  @override
  String get coursesNewCourse => 'Новий курс';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Потрібно $daily год/день';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return 'Потрібно $daily хв/день';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Потрібно $daily год/день • $weekly год/тиждень';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return 'Потрібно $daily хв/день • $weekly хв/тиждень';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return 'Потрібно $daily хв/день • $weekly год/тиждень';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required год • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Видалити зразковий курс';

  @override
  String coursesShownCount(String count) {
    return 'Показано: $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Сортування: $label';
  }

  @override
  String get dashboardAllDone => 'Усе виконано';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours год записано (бонус)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count курс(ів)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count курс(ів) · $upcoming майбутніх не в сьогоднішньому темпі';
  }

  @override
  String get dashboardCoursesTitle => 'Курси';

  @override
  String dashboardDeadline(String date) {
    return 'Дедлайн $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Дедлайн $date (залишилось $days дн.)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Дедлайн $date (залишився 1 день)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Дедлайн $date (прострочено)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Дедлайн $date (сьогодні)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'На сьогодні — записано $hours год';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Усі курси завершено — повний список дивіться на вкладці «Курси».';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Додайте курс, щоб почати відстежувати свій прогрес за ЄКТС.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Відставання = робите $achieved/день, треба $need/день';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Відставання = робите $achieved/день, треба $need/день · ранній старт';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Відставання: жоден скінченний темп не встигає на сьогоднішній дедлайн із залишком годин';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'За планом: темпу поки немає — запишіть першу сесію для підтвердження';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Починається за $days дн. · відлік від $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Починається за $days дн. · відлік від $date · ранній старт увімкнено';
  }

  @override
  String get dashboardFreshStart => 'НОВИЙ СТАРТ';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · залишилось $hours год';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required год';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours год/день';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes хв/день';
  }

  @override
  String get dashboardLogSessionAction => 'Записати навчальну сесію';

  @override
  String get dashboardLogSessionTooltip => 'Записати навчальну сесію';

  @override
  String get dashboardNewBadge => 'НОВЕ';

  @override
  String get dashboardNoCourses => 'Курсів поки немає';

  @override
  String get dashboardNoDeadline => 'Без дедлайну';

  @override
  String get dashboardNoDeadlines => 'Дедлайнів не заплановано';

  @override
  String get dashboardNoPaceDue => 'Сьогодні темпу немає';

  @override
  String get dashboardNothingDue => 'Нічого не належить';

  @override
  String get dashboardNothingToTrack => 'Поки нічого відстежувати';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'На сьогодні — залишилось $hours год';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Щоб завершити, треба $daily год/день';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Щоб завершити, треба $daily хв/день';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Щоб завершити, треба $daily год/день · $weekly год/тиждень';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Щоб завершити, треба $daily хв/день · $weekly хв/тиждень';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Щоб завершити, треба $daily хв/день · $weekly год/тиждень';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Треба $hours год/день з $date · не в сьогоднішньому темпі';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Треба $minutes хв/день з $date · не в сьогоднішньому темпі';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Без дедлайну — залишилось $hours год · без щоденного тиску';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Починається $date · належить $hours год';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · нереально';
  }

  @override
  String get dashboardProgramBare => 'ПРОГРАМА';

  @override
  String get dashboardProgramEmptyHint =>
      'Додайте курс, щоб почати відстежувати';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required год';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'ПРОГРАМА $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days днів запасу';
  }

  @override
  String get dashboardStartNotSet => 'Не встановлено';

  @override
  String dashboardStartsIn(String days) {
    return 'Починається за $days дн.';
  }

  @override
  String get dashboardStartsSoon => 'Скоро починається';

  @override
  String get dashboardTipEmpty =>
      'Додайте свій перший курс — тут з’являться ваш щоденний темп і прогрес.';

  @override
  String get dashboardTipFirst =>
      'Перші 25 хв важать найбільше — оберіть курс із найближчим дедлайном.';

  @override
  String get dashboardTodayBare => 'СЬОГОДНІ';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace год';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'СЬОГОДНІ $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'СЬОГОДНІШНІЙ ТЕМП';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace год сьогодні';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Майбутні старти — сьогодні без тиску, виключено із сьогоднішнього темпу.';

  @override
  String get dashboardUpcomingTitle => 'Майбутні';

  @override
  String get devToolsActivate => 'Активувати';

  @override
  String get devToolsActivateMessage =>
      'Це розблоковує приховані інструменти стрес-тестування (генерація даних). Лише для розробки.';

  @override
  String get devToolsActivateTitle => 'Активувати режим розробника?';

  @override
  String get devToolsActivated => 'Режим розробника активовано.';

  @override
  String get devToolsClearPumped => 'Очистити згенеровані дані';

  @override
  String get devToolsClearPumpedMessage =>
      'Видаляє згенеровані STRESS-курси та їхні сесії. Ваші власні дані зберігаються.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Видалити згенеровані STRESS-курси та сесії.';

  @override
  String get devToolsClearPumpedTitle => 'Очистити згенеровані дані?';

  @override
  String devToolsCleared(String count) {
    return 'Очищено $count згенерованих курс(ів).';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Друге підтвердження: це роздує курси, списки, діаграми й розрахунки темпу та може тривати кілька секунд. Генерувати зараз?';

  @override
  String get devToolsConfirmPumpTitle => 'Підтвердити стрес-генерацію';

  @override
  String get devToolsContinue => 'Продовжити';

  @override
  String get devToolsExit => 'Вийти з режиму розробника';

  @override
  String get devToolsExitSubtitle =>
      'Приховати інструменти розробника на цьому пристрої.';

  @override
  String get devToolsPumpData => 'Згенерувати дані';

  @override
  String get devToolsPumpMessage =>
      'Це вставляє реалістичний згенерований семестр (~10 курсів, ~800 сесій за останні 12 тижнів). Ваші наявні дані зберігаються. Продовжити?';

  @override
  String get devToolsPumpSubtitle =>
      'Вставити згенерований семестр (~10 курсів, ~800 сесій, 12 тижнів). Наявні дані зберігаються.';

  @override
  String get devToolsPumpTile => 'Згенерувати тестові дані';

  @override
  String get devToolsPumpTitle => 'Згенерувати тестові дані?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Згенеровано $courses курсів, $sessions сесій.';
  }

  @override
  String get devToolsPumping => 'Генерація тестових даних…';

  @override
  String get devToolsRemoveAll => 'Видалити всі дані';

  @override
  String get devToolsRemoveAllMessage =>
      'Швидка дія розробника: це назавжди видаляє ВСІ курси, сесії та налаштування. Це не можна скасувати.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Швидка дія розробника: видалити ВСІ курси, сесії та налаштування.';

  @override
  String get devToolsRemoveAllTitle => 'Видалити всі дані?';

  @override
  String get navCourses => 'Курси';

  @override
  String get navDashboard => 'Головна';

  @override
  String get navSettings => 'Налаштування';

  @override
  String get navStatistics => 'Статистика';

  @override
  String get navStudyLog => 'Журнал навчання';

  @override
  String get sampleBadge => 'Зразок';

  @override
  String get sessionFormCourseLabel => 'Курс';

  @override
  String sessionFormDateButton(String date) {
    return 'Дата: $date';
  }

  @override
  String get sessionFormDurationError => 'Тривалість має бути більшою за нуль.';

  @override
  String get sessionFormHoursLabel => 'Години';

  @override
  String get sessionFormLogAction => 'Записати сесію';

  @override
  String get sessionFormMinutesLabel => 'Хвилини';

  @override
  String get sessionFormNoCourseError => 'Виберіть курс.';

  @override
  String get sessionFormNoCoursesHint =>
      'Спочатку додайте курс, щоб записати сесію.';

  @override
  String get sessionFormNotesLabel => 'Нотатки (необов’язково)';

  @override
  String get sessionFormSaving => 'Збереження…';

  @override
  String get sessionFormTitleAdd => 'Записати навчальну сесію';

  @override
  String get sessionFormTitleEdit => 'Редагувати навчальну сесію';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Усього: $hours год';
  }

  @override
  String get settingsAccent => 'Колір теми';

  @override
  String get settingsAccentBerry => 'Ягідний';

  @override
  String get settingsAccentClay => 'Глиняний';

  @override
  String get settingsAccentForest => 'Лісовий';

  @override
  String get settingsAccentSlate => 'Сланцевий';

  @override
  String get settingsAccentTeal => 'Бірюзовий';

  @override
  String get settingsAccentUpdated => 'Колір теми оновлено.';

  @override
  String get settingsAllDataDeleted => 'Усі дані видалено.';

  @override
  String get settingsAppearance => 'Вигляд (темний / світлий)';

  @override
  String get settingsCheckingSample => 'Перевірка зразкових даних…';

  @override
  String get settingsClear => 'Очистити';

  @override
  String get settingsClearSample => 'Очистити зразкові дані';

  @override
  String get settingsClearSampleMessage =>
      'Це видаляє приклади курсів і сесій. Курси чи сесії, які ви додали самі, не видаляються.';

  @override
  String get settingsClearSampleSubtitle =>
      'Видалити початкові приклади курсів і сесій. Ваші власні дані зберігаються.';

  @override
  String get settingsClearSampleTitle => 'Очистити зразкові дані?';

  @override
  String get settingsCopy => 'Копіювати';

  @override
  String get settingsDailyError => 'Введіть 0 або додатну кількість хвилин.';

  @override
  String get settingsDailyLabel => 'Хвилин на день (0 = без цілі)';

  @override
  String get settingsDailyTarget => 'Щоденна навчальна ціль';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes хв/день';
  }

  @override
  String get settingsDailyUpdated => 'Щоденну ціль оновлено.';

  @override
  String get settingsData => 'Дані';

  @override
  String get settingsDeleteEverything => 'Видалити все';

  @override
  String get settingsDevMode => 'Режим розробника';

  @override
  String get settingsDisplay => 'Відображення';

  @override
  String get settingsDisplayComfortable => 'Зручний';

  @override
  String get settingsDisplayCompact => 'Компактний';

  @override
  String get settingsDisplayLarge => 'Великий';

  @override
  String get settingsDisplaySize => 'Розмір тексту й елементів';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Розмір відображення оновлено.';

  @override
  String get settingsExport => 'Експортувати дані';

  @override
  String get settingsExportCopied => 'Експорт скопійовано до буфера обміну.';

  @override
  String get settingsExportSubtitle =>
      'Скопіювати всі курси, сесії та налаштування як JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses курс(ів) · $sessions сесій · $kb КБ';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (скорочено — повна резервна копія $kb КБ, для всього використайте «Копіювати»)';
  }

  @override
  String get settingsFirstWeekday => 'Перший день тижня';

  @override
  String get settingsFirstWeekdayUpdated => 'Перший день тижня оновлено.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (утримуйте $seconds с)';
  }

  @override
  String get settingsHoldToReplace => 'Утримуйте, щоб замінити все';

  @override
  String get settingsHoursError => 'Введіть число, більше за нуль.';

  @override
  String get settingsHoursHelper =>
      'За замовчуванням 30. Зміна перераховує вимоги; записи зберігаються.';

  @override
  String get settingsHoursLabel => 'Годин на кредит ЄКТС';

  @override
  String get settingsHoursPerEcts => 'Годин на ЄКТС';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value год';
  }

  @override
  String get settingsHoursUpdated => 'Годин на ЄКТС оновлено.';

  @override
  String get settingsImport => 'Імпортувати дані';

  @override
  String get settingsImportAppend => 'Додати';

  @override
  String get settingsImportAppendAction => 'Імпортувати (додати)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Дані додано: $courses курс(ів), $sessions сесій додано.';
  }

  @override
  String get settingsImportInfo =>
      'Додавання додає резервну копію поруч із поточними даними (налаштування зберігаються). Заміна спочатку знищує ВСІ курси, сесії та налаштування.';

  @override
  String get settingsImportLabel => 'Вставте експортований JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses курс(ів) · $sessions сесій';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · експортовано $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · схема v$schema';
  }

  @override
  String get settingsImportReplace => 'Замінити';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Заміна спочатку все видаляє. НАТИСНІТЬ і УТРИМУЙТЕ кнопку нижче $seconds секунд для підтвердження.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Дані замінено: $courses курс(ів), $sessions сесій відновлено.';
  }

  @override
  String get settingsImportSubtitle =>
      'Замінити всі дані з раніше експортованої резервної копії JSON.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Тримайте далі… $remaining с';
  }

  @override
  String get settingsNoSample => 'Немає зразкових даних';

  @override
  String get settingsNoSampleSubtitle => 'Початкові приклади вже очищено.';

  @override
  String get settingsNoTarget => 'Ціль не встановлено';

  @override
  String get settingsOverloadError => 'Введіть число 5–100 год/тиждень.';

  @override
  String get settingsOverloadHelper =>
      'Тижні майбутнього навантаження вище цього позначаються червоним. Повноцінне навчання — це ~35–40 год/тиждень.';

  @override
  String settingsOverloadHours(String value) {
    return '$value год';
  }

  @override
  String get settingsOverloadLabel => 'Годин на тиждень (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/тиждень позначається червоним';
  }

  @override
  String get settingsOverloadThreshold => 'Тижневий поріг перевантаження';

  @override
  String get settingsOverloadUpdated => 'Поріг перевантаження оновлено.';

  @override
  String get settingsPaceTolerance => 'Допуск випередження / відставання';

  @override
  String get settingsPasteValidBackup =>
      'Спочатку вставте дійсну резервну копію';

  @override
  String get settingsReset => 'Скинути';

  @override
  String get settingsResetAll => 'Скинути всі дані';

  @override
  String get settingsResetAllMessage =>
      'Це назавжди видаляє ВСІ курси, сесії та налаштування. Це не можна скасувати. За потреби спочатку експортуйте резервну копію.';

  @override
  String get settingsResetAllSubtitle =>
      'Видалити всі курси, сесії та налаштування.';

  @override
  String get settingsResetAllTitle => 'Скинути всі дані?';

  @override
  String get settingsResetSettings => 'Скинути налаштування';

  @override
  String get settingsResetSettingsDone =>
      'Налаштування скинуто до стандартних.';

  @override
  String get settingsResetSettingsMessage =>
      'Відновлює годин на ЄКТС (30), щоденну ціль (немає), перший день тижня (понеділок), тему (системна), допуск (5 днів), перевантаження (35 год/тиждень), розмір (зручний), колір (сланцевий). Курси та сесії зберігаються.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Відновити стандартні: 30 год/ЄКТС, без цілі, понеділок, системна тема, допуск 5 днів, перевантаження 35 год/тиждень, зручний розмір, сланцевий колір.';

  @override
  String get settingsResetSettingsTitle => 'Скинути налаштування?';

  @override
  String get settingsSampleData => 'Зразкові дані';

  @override
  String settingsSampleDataError(String error) {
    return 'Помилка: $error';
  }

  @override
  String get settingsStudySettings => 'Налаштування навчання';

  @override
  String get settingsThemeDark => 'Темна';

  @override
  String get settingsThemeLight => 'Світла';

  @override
  String get settingsThemeSystem => 'Системна';

  @override
  String get settingsThemeTitle => 'Тема';

  @override
  String get settingsThemeUpdated => 'Тему оновлено.';

  @override
  String settingsToleranceDays(String value) {
    return '$value днів';
  }

  @override
  String get settingsToleranceError => 'Введіть число 0–30 днів.';

  @override
  String get settingsToleranceHelper =>
      'Випередження потребує запасу +N днів, відставання −N днів. 5 = стабільно, 0 = чутливо.';

  @override
  String get settingsToleranceLabel => 'Днів роботи (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance роботи';
  }

  @override
  String get settingsToleranceUpdated => 'Допуск оновлено.';

  @override
  String get settingsWeekdayFriday => 'П’ятниця';

  @override
  String get settingsWeekdayMonday => 'Понеділок';

  @override
  String get settingsWeekdaySaturday => 'Субота';

  @override
  String get settingsWeekdaySunday => 'Неділя';

  @override
  String get settingsWeekdayThursday => 'Четвер';

  @override
  String get settingsWeekdayTuesday => 'Вівторок';

  @override
  String get settingsWeekdayWednesday => 'Середа';

  @override
  String get sortDeadline => 'Дедлайн';

  @override
  String get sortName => 'Назва';

  @override
  String get sortProgress => 'Прогрес';

  @override
  String get sortStatus => 'Статус';

  @override
  String get startupTitle => 'Не вдалося запустити ECTS Tracker';

  @override
  String get statsActiveDays => 'Активні дні';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days дн. активності';
  }

  @override
  String get statsAddDeadlines =>
      'Додайте дедлайни, щоб прогнозувати навантаження.';

  @override
  String get statsComingLoad => 'Майбутнє навантаження';

  @override
  String get statsConsistency => 'Регулярність';

  @override
  String get statsConsistencyHint =>
      'Дні навчання за останні 30 днів. Маленькі кроки щодня кращі за зубріння.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% за останні 30 днів';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Курс $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'К$id';
  }

  @override
  String get statsDidPerDay => 'Зроблено / день (14 дн.)';

  @override
  String get statsEmpty => 'Сесій поки немає';

  @override
  String get statsGap => 'Розрив';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value год';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursгод';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours год';
  }

  @override
  String get statsLast30Days => 'Останні 30 днів';

  @override
  String get statsLast7Days => 'Останні 7 днів';

  @override
  String get statsNeedPerDay => 'Треба / день';

  @override
  String get statsNext8Weeks => 'Наступні 8 тижнів';

  @override
  String get statsOfLast30DaysVolume => 'обсягу за останні 30 днів';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Тижні перевантаження >$threshold год позначаються червоним — перенесіть дедлайн або скоротіть обсяг.';
  }

  @override
  String get statsOverview => 'Огляд';

  @override
  String get statsPaceCovers =>
      'Попередній темп покриває потрібне. Тримайте серію.';

  @override
  String statsPaceShort(String gap) {
    return 'Попередній темп на $gap год/день менший — додайте блок або скоротіть обсяг.';
  }

  @override
  String get statsPastVsNeeded => 'Минуле проти потрібного';

  @override
  String statsPeakPerWeek(String peak) {
    return 'пік $peak год/тиж.';
  }

  @override
  String get statsPerCourse => 'За курсами';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done год / $required год · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Сесії';

  @override
  String statsSuggestedOrder(String order) {
    return 'Запропонований порядок: $order (спочатку найближчий дедлайн)';
  }

  @override
  String get statsTotal => 'Усього';

  @override
  String get statsTotalVolume => 'загальний обсяг';

  @override
  String get statusAhead => 'Попереду';

  @override
  String get statusBehind => 'Відставання';

  @override
  String get statusCompleted => 'Завершено';

  @override
  String get statusOnTrack => 'За планом';

  @override
  String get statusOverdue => 'Прострочено';

  @override
  String get studyLogDeleteBody =>
      'Видалити цю навчальну сесію? Це не можна скасувати.';

  @override
  String get studyLogDeleteTitle => 'Видалити сесію?';

  @override
  String get studyLogEmptyHint =>
      'Запишіть сесію, щоб відстежувати свій навчальний час.';

  @override
  String get studyLogEmptyTitle => 'Навчальних сесій поки немає';

  @override
  String get studyLogFabLabel => 'Записати сесію';

  @override
  String get studyLogFabTooltip => 'Записати сесію';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours год';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Видалити зразкову сесію';

  @override
  String get studyLogThisWeek => 'Цього тижня';

  @override
  String get studyLogToday => 'Сьогодні';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Курс $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'К$id';
  }

  @override
  String get validationCourseEctsPositive => 'ЄКТС має бути більше за нуль';

  @override
  String get validationCourseEctsRequired => 'Введіть кредити ЄКТС';

  @override
  String get validationCourseNameRequired => 'Назва обов’язкова';

  @override
  String get validationCourseNameTooLong => 'Назва занадто довга';

  @override
  String get validationSessionCourseRequired => 'Виберіть курс';

  @override
  String get validationSessionDurationRequired => 'Введіть тривалість';

  @override
  String get widgetNoProgress => 'Прогресу поки немає';

  @override
  String get settingsLanguage => 'Мова';

  @override
  String get settingsLiquidGlass => 'Рідке скло';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Картки й панелі з матового скла. Вимкнено — класичний суцільний вигляд.';

  @override
  String get settingsLiquidGlassOn => 'Увімкнено';

  @override
  String get settingsLiquidGlassOff => 'Вимкнено';

  @override
  String get settingsLiquidGlassUpdated => 'Рідке скло оновлено.';

  @override
  String get devToolsReminderPreview => 'Перегляд нагадувань';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Подивіться, що сповістило б просто зараз. Безпечна для Windows тестова стрічка.';

  @override
  String get reminderPreviewTitle => 'Перегляд нагадувань';

  @override
  String get reminderPreviewNow => 'Час перегляду';

  @override
  String get reminderPreviewReset => 'Зараз';

  @override
  String get reminderPreviewEmpty => 'Тихо — у цей час нічого не сповіщатиме.';

  @override
  String get reminderPreviewCustom => 'Власні розклади (демо)';

  @override
  String get reminderPreviewNoFire => 'Немає майбутніх спрацьовувань.';

  @override
  String get reminderKindDaily => 'Щоденний';

  @override
  String get reminderKindBehind => 'Відставання';

  @override
  String get reminderKindDeadline => 'Дедлайн';

  @override
  String get reminderKindOverdue => 'Прострочено';

  @override
  String get reminderKindStreak => 'Серія';

  @override
  String get reminderKindCustom => 'Власний';

  @override
  String get settingsReminders => 'Нагадування про навчання';

  @override
  String get settingsRemindersOff =>
      'Вимкнено — увімкніть для щоденного нагадування.';

  @override
  String get settingsReminderTime => 'Час нагадування';

  @override
  String get settingsReminderDenied =>
      'Сповіщення заблоковано — увімкніть їх у системних налаштуваннях.';

  @override
  String notifDurationHours(String value) {
    return '$value год';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value хв';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Сьогодні ввечері: $duration, щоб утримати план';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course сьогодні ще $duration';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count ще)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Запишіть сесію, щоб закрити сьогоднішній день.';
  }

  @override
  String notifBehindTitle(String course) {
    return '⚠️ $course перейшов у відставання';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return 'Залишилось $left, $days дн. попереду — звідси $pace/день. Запишіть $catchUp, щоб повернутися до плану.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return 'Залишилось $left, $days дн. попереду — звідси $pace/день. Допоможе лише повне закриття $left — почніть сьогодні ввечері.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left ще відкрито, а дедлайн уже настав. Усе, що запишете зараз, зараховується.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course — дедлайн завтра, і ще відкрито $left';
  }

  @override
  String get notifDeadlineTomorrowBody =>
      'Усе, що запишете сьогодні, зараховується подвійно.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Іспит $course за $days дн. — залишилось $left';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Це $pace/день. Розділіть: 2 сесії на день кращі за один марафон.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace =>
      'Кожна година, яку запишете зараз, зараховується.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course прострочив дедлайн, відкрито $left';
  }

  @override
  String get notifOverdueBody =>
      'Перенесіть дедлайн або закрийте години — курс доти залишається таким, що потребує уваги.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days-денна серія — $week цього тижня';
  }

  @override
  String get notifStreakBody =>
      'Усі курси за планом або попереду. Так тримати.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Навчальна перевірка: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Час оновити: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left відкрито · $pace/день, щоб встигнути вчасно. Запишіть сесію, щоб оновити прогрес.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left ще відкрито — усе, що запишете зараз, зараховується.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Наступне: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1 дн.';

  @override
  String get reminderPreviewFwdDay => '+1 дн.';

  @override
  String get reminderPreviewFake => '(фейк)';

  @override
  String get reminderPreviewDemoLabel => 'Демо-перевірка';
}
