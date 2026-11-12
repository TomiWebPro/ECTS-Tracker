// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AppLocalizationsBe extends AppLocalizations {
  AppLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Скасаваць';

  @override
  String get commonClose => 'Закрыць';

  @override
  String get commonDelete => 'Выдаліць';

  @override
  String get commonEdit => 'Рэдагаваць';

  @override
  String get commonError => 'Памылка';

  @override
  String get commonNone => 'Няма';

  @override
  String get commonSave => 'Захаваць';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Патрэбна гадзін (аўта): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Ачысціць дэдлайн';

  @override
  String get courseFormClearStartTooltip => 'Ачысціць дату пачатку';

  @override
  String get courseFormColorLabel => 'Колер';

  @override
  String get courseFormDateNotSet => 'Не зададзена';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Дэдлайн: $date';
  }

  @override
  String get courseFormEctsLabel => 'Крэдыты ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value г/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Назва';

  @override
  String get courseFormNotesLabel => 'Нататкі (неабавязкова)';

  @override
  String get courseFormSaving => 'Захаванне…';

  @override
  String courseFormStartButton(String date) {
    return 'Пачатак: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Выкл.: без нагрузкі да $date; выключана з сённяшняга тэмпу.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Укл.: час размяркоўваецца да сёння і ўлічваецца ў сённяшнім тэмпе.';

  @override
  String get courseFormStartEarlyTitle =>
      'Пачаць зараз, нягледзячы на будучы пачатак';

  @override
  String get courseFormTitleAdd => 'Дадаць курс';

  @override
  String get courseFormTitleEdit => 'Рэдагаваць курс';

  @override
  String get coursesAddTooltip => 'Дадаць курс';

  @override
  String coursesDeleteBody(String name) {
    return 'Выдаліць «$name» і ўсе яго навучальныя сесіі? Гэта нельга адмяніць.';
  }

  @override
  String get coursesDeleteTitle => 'Выдаліць курс?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Націсніце «Новы курс», каб стварыць першы курс.';

  @override
  String get coursesEmptyTitle => 'Курсаў пакуль няма';

  @override
  String get coursesFilterAll => 'Усе статусы';

  @override
  String get coursesFilterEmpty => 'Няма курсаў пад гэты фільтр';

  @override
  String get coursesNewCourse => 'Новы курс';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Трэба $daily г/дзень';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/day needed';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Трэба $daily г/дзень • $weekly г/тыдзень';
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
    return '$done / $required г • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Выдаліць прыклад-курс';

  @override
  String coursesShownCount(String count) {
    return 'Паказана $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Сартаванне: $label';
  }

  @override
  String get dashboardAllDone => 'Усё гатова';

  @override
  String dashboardBonusLogged(String hours) {
    return 'Запісана $hours г (бонус)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count курс(аў)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count курс(аў) · $upcoming будучых не ў сённяшнім тэмпе';
  }

  @override
  String get dashboardCoursesTitle => 'Курсы';

  @override
  String dashboardDeadline(String date) {
    return 'Дэдлайн $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Дэдлайн $date (засталося дзён: $days)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Дэдлайн $date (застаўся 1 дзень)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Дэдлайн $date (пратермінавана)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Дэдлайн $date (сёння)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Трэба на сёння — запісана $hours г';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Усе курсы завершаны — глядзіце ўкладку «Курсы» для поўнага спісу.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Дадайце курс, каб сачыць за ECTS-прагрэсам.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Адставанне = робіце $achieved/дзень, трэба $need/дзень';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Адставанне = робіце $achieved/дзень, трэба $need/дзень · ранні старт';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Адставанне: няма канечнага тэмпу, які паспее да сённяшняга дэдлайну з пакінутымі гадзінамі';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Па плане: тэмпу пакуль няма — запішыце першую сесію для пацверджання';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Пачынаецца праз $days дн. · лічыцца ад $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Пачынаецца праз $days дн. · лічыцца ад $date · ранні старт уключаны';
  }

  @override
  String get dashboardFreshStart => 'НОВЫ СТАРТ';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · засталося $hoursг';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required г';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours г/дзень';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/d';
  }

  @override
  String get dashboardLogSessionAction => 'Запісаць навучальную сесію';

  @override
  String get dashboardLogSessionTooltip => 'Запісаць навучальную сесію';

  @override
  String get dashboardNewBadge => 'НОВАЕ';

  @override
  String get dashboardNoCourses => 'Курсаў пакуль няма';

  @override
  String get dashboardNoDeadline => 'Без дэдлайну';

  @override
  String get dashboardNoDeadlines => 'Дэдлайны не запланаваны';

  @override
  String get dashboardNoPaceDue => 'На сёння тэмпу няма';

  @override
  String get dashboardNothingDue => 'Нічога не трэба';

  @override
  String get dashboardNothingToTrack => 'Пакуль няма за чым сачыць';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Трэба на сёння — засталося $hoursг';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Трэба $daily г/дзень, каб скончыць';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Need $daily min/day to finish';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Трэба $daily г/дзень · $weekly г/тыдзень, каб скончыць';
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
    return 'Трэба $hours г/дзень ад $date · не ў сённяшнім тэмпе';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Need $minutes min/day from $date · not in Today’s pace';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Без дэдлайну — засталося $hoursг · без штодзённага ціску';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Пачынаецца $date · трэба $hoursг';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · нерэальна';
  }

  @override
  String get dashboardProgramBare => 'ПРАГРАМА';

  @override
  String get dashboardProgramEmptyHint => 'Дадайце курс, каб пачаць сачэнне';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required г';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'ПРАГРАМА $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days дзён запасу';
  }

  @override
  String get dashboardStartNotSet => 'Не зададзена';

  @override
  String dashboardStartsIn(String days) {
    return 'Пачнецца праз $daysд';
  }

  @override
  String get dashboardStartsSoon => 'Пачнецца хутка';

  @override
  String get dashboardTipEmpty =>
      'Дадайце першы курс — штодзённы тэмп і прагрэс з\'явяцца тут.';

  @override
  String get dashboardTipFirst =>
      'Першыя 25 хвілін найважнейшыя — выберыце курс з бліжэйшым дэдлайнам.';

  @override
  String get dashboardTodayBare => 'СЁННЯ';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace г';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'СЁННЯ $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'СЁННЯШНІ ТЭМП';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace г сёння';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Будучыя старты — без ціску сёння, выключана з сённяшняга тэмпу.';

  @override
  String get dashboardUpcomingTitle => 'Будучыя';

  @override
  String get devToolsActivate => 'Актываваць';

  @override
  String get devToolsActivateMessage =>
      'Гэта адкрывае схаваныя інструменты стрэс-тэставання (генерацыя даных). Толькі для распрацоўкі.';

  @override
  String get devToolsActivateTitle => 'Актываваць рэжым распрацоўкі?';

  @override
  String get devToolsActivated => 'Рэжым распрацоўкі актываваны.';

  @override
  String get devToolsClearPumped => 'Ачысціць згенераваныя даныя';

  @override
  String get devToolsClearPumpedMessage =>
      'Выдаляе згенераваныя STRESS-курсы і іх сесіі. Вашы даныя захоўваюцца.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Выдаліць згенераваныя STRESS-курсы і сесіі.';

  @override
  String get devToolsClearPumpedTitle => 'Ачысціць згенераваныя даныя?';

  @override
  String devToolsCleared(String count) {
    return 'Ачышчана $count згенер. курса(ў).';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Другое пацверджанне: гэта павялічыць курсы, спісы, графікі і разлікі тэмпу і можа заняць некалькі секунд. Згенераваць зараз?';

  @override
  String get devToolsConfirmPumpTitle => 'Пацвердзіць стрэс-генерацыю';

  @override
  String get devToolsContinue => 'Працягнуць';

  @override
  String get devToolsExit => 'Выйсці з рэжыму распрацоўкі';

  @override
  String get devToolsExitSubtitle =>
      'Схаваць інструменты распрацоўкі на гэтай прыладзе.';

  @override
  String get devToolsPumpData => 'Згенераваць даныя';

  @override
  String get devToolsPumpMessage =>
      'Гэта ўставіць рэалістычны згенераваны семестр (~10 курсаў, ~800 сесій за апошнія 12 тыдняў). Наяўныя даныя захоўваюцца. Працягнуць?';

  @override
  String get devToolsPumpSubtitle =>
      'Уставіць згенераваны семестр (~10 курсаў, ~800 сесій, 12 тыдняў). Наяўныя даныя захоўваюцца.';

  @override
  String get devToolsPumpTile => 'Згенераваць тэставыя даныя';

  @override
  String get devToolsPumpTitle => 'Згенераваць тэставыя даныя?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Згенеравана $courses курсаў, $sessions сесій.';
  }

  @override
  String get devToolsPumping => 'Генерацыя тэставых даных…';

  @override
  String get devToolsRemoveAll => 'Выдаліць усе даныя';

  @override
  String get devToolsRemoveAllMessage =>
      'Цэтлік распрацоўкі: гэта назаўсёды выдаліць УСЕ курсы, сесіі і налады. Гэта нельга адмяніць.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Цэтлік распрацоўкі: выдаліць УСЕ курсы, сесіі і налады.';

  @override
  String get devToolsRemoveAllTitle => 'Выдаліць усе даныя?';

  @override
  String get navCourses => 'Курсы';

  @override
  String get navDashboard => 'Галоўная';

  @override
  String get navSettings => 'Налады';

  @override
  String get navStatistics => 'Статыстыка';

  @override
  String get navStudyLog => 'Журнал вучобы';

  @override
  String get sampleBadge => 'Прыклад';

  @override
  String get sessionFormCourseLabel => 'Курс';

  @override
  String sessionFormDateButton(String date) {
    return 'Дата: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Працягласць павінна быць большай за нуль.';

  @override
  String get sessionFormHoursLabel => 'Гадзіны';

  @override
  String get sessionFormLogAction => 'Запісаць сесію';

  @override
  String get sessionFormMinutesLabel => 'Хвіліны';

  @override
  String get sessionFormNoCourseError => 'Выберыце курс.';

  @override
  String get sessionFormNoCoursesHint =>
      'Спачатку дадайце курс, каб запісаць сесію.';

  @override
  String get sessionFormNotesLabel => 'Нататкі (неабавязкова)';

  @override
  String get sessionFormSaving => 'Захаванне…';

  @override
  String get sessionFormTitleAdd => 'Запісаць навучальную сесію';

  @override
  String get sessionFormTitleEdit => 'Рэдагаваць навучальную сесію';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Усяго: $hours г';
  }

  @override
  String get settingsAccent => 'Колер тэмы';

  @override
  String get settingsAccentBerry => 'Ягада';

  @override
  String get settingsAccentClay => 'Гліна';

  @override
  String get settingsAccentForest => 'Лес';

  @override
  String get settingsAccentSlate => 'Шыфер';

  @override
  String get settingsAccentTeal => 'Бірузовы';

  @override
  String get settingsAccentUpdated => 'Колер тэмы абноўлены.';

  @override
  String get settingsAllDataDeleted => 'Усе даныя выдалены.';

  @override
  String get settingsAppearance => 'Выгляд (цёмны / светлы)';

  @override
  String get settingsCheckingSample => 'Праверка прыклад-даных…';

  @override
  String get settingsClear => 'Ачысціць';

  @override
  String get settingsClearSample => 'Ачысціць прыклад-даныя';

  @override
  String get settingsClearSampleMessage =>
      'Гэта выдаляе прыклады курсаў і сесій. Курсы або сесіі, якія вы дадалі самі, не выдаляюцца.';

  @override
  String get settingsClearSampleSubtitle =>
      'Выдаліць убудаваныя прыклады курсаў і сесій. Вашы даныя захоўваюцца.';

  @override
  String get settingsClearSampleTitle => 'Ачысціць прыклад-даныя?';

  @override
  String get settingsCopy => 'Капіяваць';

  @override
  String get settingsDailyError => 'Увядзіце 0 або дадатную колькасць хвілін.';

  @override
  String get settingsDailyLabel => 'Хвілін у дзень (0 = без мэты)';

  @override
  String get settingsDailyTarget => 'Штодзённая мэта вучобы';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes хв/дзень';
  }

  @override
  String get settingsDailyUpdated => 'Штодзённая мэта абноўлена.';

  @override
  String get settingsData => 'Даныя';

  @override
  String get settingsDeleteEverything => 'Выдаліць усё';

  @override
  String get settingsDevMode => 'Рэжым распрацоўкі';

  @override
  String get settingsDisplay => 'Экран';

  @override
  String get settingsDisplayComfortable => 'Зручны';

  @override
  String get settingsDisplayCompact => 'Кампактны';

  @override
  String get settingsDisplayLarge => 'Вялікі';

  @override
  String get settingsDisplaySize => 'Памер тэксту і элементаў';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Памер экрана абноўлены.';

  @override
  String get settingsExport => 'Экспарт даных';

  @override
  String get settingsExportCopied => 'Экспарт скапіяваны ў буфер абмену.';

  @override
  String get settingsExportSubtitle =>
      'Скапіруйце ўсе курсы, сесіі і налады як JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses курс(аў) · $sessions сесій · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (урэзана — поўны бэкап $kb KB, выкарыстайце Капіяваць для ўсяго)';
  }

  @override
  String get settingsFirstWeekday => 'Першы дзень тыдня';

  @override
  String get settingsFirstWeekdayUpdated => 'Першы дзень тыдня абноўлены.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (утрымлівайце $secondsс)';
  }

  @override
  String get settingsHoldToReplace => 'Утрымлівайце, каб замяніць усё';

  @override
  String get settingsHoursError => 'Увядзіце лік, большы за нуль.';

  @override
  String get settingsHoursHelper =>
      'Стандартна 30. Змена пералічвае патрабаванні; запісы захоўваюцца.';

  @override
  String get settingsHoursLabel => 'Гадзін на крэдыт ECTS';

  @override
  String get settingsHoursPerEcts => 'Гадзін на ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value г';
  }

  @override
  String get settingsHoursUpdated => 'Гадзіны на ECTS абноўлены.';

  @override
  String get settingsImport => 'Імпарт даных';

  @override
  String get settingsImportAppend => 'Дадаць';

  @override
  String get settingsImportAppendAction => 'Імпартаваць (дадаць)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Даныя дададзены: $courses курса(ў), $sessions сесій дададзена.';
  }

  @override
  String get settingsImportInfo =>
      'Даданне дадае бэкап да бягучых даных (налады захоўваюцца). Замена спачатку сцірае УСЕ курсы, сесіі і налады.';

  @override
  String get settingsImportLabel => 'Устаўце экспартаваны JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses курс(аў) · $sessions сесій';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· экспартавана $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· схема в$schema';
  }

  @override
  String get settingsImportReplace => 'Замяніць';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Замена спачатку выдаляе ўсё. Націсніце і ЎТРЫМЛІВАЙЦЕ кнопку ніжэй $seconds секунд для пацверджання.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Даныя заменены: $courses курса(ў), $sessions сесій адноўлена.';
  }

  @override
  String get settingsImportSubtitle =>
      'Замяніць усе даныя з раней экспартаванага JSON-бэкапу.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Працягвайце ўтрымліваць… $remaining с';
  }

  @override
  String get settingsNoSample => 'Няма прыклад-даных';

  @override
  String get settingsNoSampleSubtitle =>
      'Убудаваныя прыклад-даныя ўжо ачышчаны.';

  @override
  String get settingsNoTarget => 'Мэта не зададзена';

  @override
  String get settingsOverloadError => 'Увядзіце лік 5–100 г/тыдзень.';

  @override
  String get settingsOverloadHelper =>
      'Тыдні з нагрузкай вышэй за гэта пазначаюцца чырвоным. Вочная вучоба — ~35–40 г/тыдзень.';

  @override
  String settingsOverloadHours(String value) {
    return '$value г';
  }

  @override
  String get settingsOverloadLabel => 'Гадзін на тыдзень (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/тыдзень пазначаецца чырвоным';
  }

  @override
  String get settingsOverloadThreshold => 'Тыднёвы парог перагрузкі';

  @override
  String get settingsOverloadUpdated => 'Парог перагрузкі абноўлены.';

  @override
  String get settingsPaceTolerance => 'Допуск наперад / назад';

  @override
  String get settingsPasteValidBackup => 'Спачатку ўстаўце сапраўдны бэкап';

  @override
  String get settingsReset => 'Скінуць';

  @override
  String get settingsResetAll => 'Скінуць усе даныя';

  @override
  String get settingsResetAllMessage =>
      'Гэта назаўсёды выдаліць УСЕ курсы, сесіі і налады. Гэта нельга адмяніць. Спачатку экспартуйце бэкап, калі трэба.';

  @override
  String get settingsResetAllSubtitle => 'Выдаліць усе курсы, сесіі і налады.';

  @override
  String get settingsResetAllTitle => 'Скінуць усе даныя?';

  @override
  String get settingsResetSettings => 'Скінуць налады';

  @override
  String get settingsResetSettingsDone => 'Налады скінуты да стандартных.';

  @override
  String get settingsResetSettingsMessage =>
      'Аднаўляе гадзін-на-ECTS (30), штодзённую мэту (няма), першы дзень (панядзелак), тэму (сістэмная), допуск (5 дзён), перагрузку (35 г/тыдзень), памер (зручны), колер (шыфер). Курсы і сесіі захоўваюцца.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Вярнуць стандартныя: 30 г/ECTS, без мэты, панядзелак, сістэмная тэма, допуск 5 дзён, перагрузка 35 г/тыдзень, зручны памер, шыфер колер.';

  @override
  String get settingsResetSettingsTitle => 'Скінуць налады?';

  @override
  String get settingsSampleData => 'Прыклад-даныя';

  @override
  String settingsSampleDataError(String error) {
    return 'Памылка: $error';
  }

  @override
  String get settingsStudySettings => 'Налады вучобы';

  @override
  String get settingsThemeDark => 'Цёмная';

  @override
  String get settingsThemeLight => 'Светлая';

  @override
  String get settingsThemeSystem => 'Сістэмная стандартная';

  @override
  String get settingsThemeTitle => 'Тэма';

  @override
  String get settingsThemeUpdated => 'Тэма абноўлена.';

  @override
  String settingsToleranceDays(String value) {
    return '$value дзён';
  }

  @override
  String get settingsToleranceError => 'Увядзіце лік 0–30 дзён.';

  @override
  String get settingsToleranceHelper =>
      'Наперад трэба +N дзён запасу, назад −N дзён. 5 = стабільна, 0 = адчувальна.';

  @override
  String get settingsToleranceLabel => 'Дзён працы (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance працы';
  }

  @override
  String get settingsToleranceUpdated => 'Допуск абноўлены.';

  @override
  String get settingsWeekdayFriday => 'Пятніца';

  @override
  String get settingsWeekdayMonday => 'Панядзелак';

  @override
  String get settingsWeekdaySaturday => 'Субота';

  @override
  String get settingsWeekdaySunday => 'Нядзеля';

  @override
  String get settingsWeekdayThursday => 'Чацвер';

  @override
  String get settingsWeekdayTuesday => 'Аўторак';

  @override
  String get settingsWeekdayWednesday => 'Серада';

  @override
  String get sortDeadline => 'Дэдлайн';

  @override
  String get sortName => 'Назва';

  @override
  String get sortProgress => 'Прагрэс';

  @override
  String get sortStatus => 'Статус';

  @override
  String get startupTitle => 'Не ўдалося запусціць ECTS Tracker';

  @override
  String get statsActiveDays => 'Актыўныя дні';

  @override
  String statsActiveDaysBadge(int days) {
    return '$daysд актыўна';
  }

  @override
  String get statsAddDeadlines =>
      'Дадайце дэдлайны, каб спрагназаваць нагрузку.';

  @override
  String get statsComingLoad => 'Будучая нагрузка';

  @override
  String get statsConsistency => 'Рэгулярнасць';

  @override
  String get statsConsistencyHint =>
      'Дні вучобы за апошнія 30 дзён. Малыя крокі кожны дзень лепшыя за зубрэнне.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% апошніх 30 дзён';
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
  String get statsDidPerDay => 'Зроблена / дзень (14д)';

  @override
  String get statsEmpty => 'Сесій пакуль няма';

  @override
  String get statsGap => 'Розніца';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value г';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursг';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours г';
  }

  @override
  String get statsLast30Days => 'Апошнія 30 дзён';

  @override
  String get statsLast7Days => 'Апошнія 7 дзён';

  @override
  String get statsNeedPerDay => 'Трэба / дзень';

  @override
  String get statsNext8Weeks => 'Наступныя 8 тыдняў';

  @override
  String get statsOfLast30DaysVolume => 'ад аб\'ёму апошніх 30 дзён';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Тыдні перагрузкі >$thresholdг пазначаны чырвоным — перанясіце дэдлайн або скараціце аб\'ём.';
  }

  @override
  String get statsOverview => 'Агляд';

  @override
  String get statsPaceCovers =>
      'Мінулы тэмп пакрывае патрэбнае. Трымайце рытм.';

  @override
  String statsPaceShort(String gap) {
    return 'Мінулы тэмп на $gap г/дзень меншы — дадайце блок або скараціце аб\'ём.';
  }

  @override
  String get statsPastVsNeeded => 'Мінулае супраць патрэбнага';

  @override
  String statsPeakPerWeek(String peak) {
    return 'пік $peakг/тыд';
  }

  @override
  String get statsPerCourse => 'Па курсах';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done г / $required г · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Сесіі';

  @override
  String statsSuggestedOrder(String order) {
    return 'Прапанаваны парадак: $order (спачатку бліжэйшы дэдлайн)';
  }

  @override
  String get statsTotal => 'Усяго';

  @override
  String get statsTotalVolume => 'агульны аб\'ём';

  @override
  String get statusAhead => 'Наперадзе';

  @override
  String get statusBehind => 'Адстае';

  @override
  String get statusCompleted => 'Завершаны';

  @override
  String get statusOnTrack => 'Па плане';

  @override
  String get statusOverdue => 'Пратэрмінаваны';

  @override
  String get studyLogDeleteBody =>
      'Выдаліць гэтую навучальную сесію? Гэта нельга адмяніць.';

  @override
  String get studyLogDeleteTitle => 'Выдаліць сесію?';

  @override
  String get studyLogEmptyHint => 'Запішыце сесію, каб сачыць за часам вучобы.';

  @override
  String get studyLogEmptyTitle => 'Навучальных сесій пакуль няма';

  @override
  String get studyLogFabLabel => 'Запісаць сесію';

  @override
  String get studyLogFabTooltip => 'Запісаць сесію';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours г';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Выдаліць прыклад-сесію';

  @override
  String get studyLogThisWeek => 'Гэты тыдзень';

  @override
  String get studyLogToday => 'Сёння';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Курс $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'К$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS павінна быць больш за нуль';

  @override
  String get validationCourseEctsRequired => 'Увядзіце крэдыты ECTS';

  @override
  String get validationCourseNameRequired => 'Назва абавязковая';

  @override
  String get validationCourseNameTooLong => 'Назва занадта доўгая';

  @override
  String get validationSessionCourseRequired => 'Выберыце курс';

  @override
  String get validationSessionDurationRequired => 'Увядзіце працягласць';

  @override
  String get widgetNoProgress => 'Прагрэсу пакуль няма';

  @override
  String get settingsLanguage => 'Мова';

  @override
  String get settingsLiquidGlass => 'Вадкае шкло';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Карткі і панэлі з матавага шкла. Выкл. захоўвае класічны суцэльны выгляд.';

  @override
  String get settingsLiquidGlassOn => 'Укл.';

  @override
  String get settingsLiquidGlassOff => 'Выкл.';

  @override
  String get settingsLiquidGlassUpdated => 'Вадкае шкло абноўлена.';

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
  String get reminderKindDaily => 'Daily';

  @override
  String get reminderKindBehind => 'Behind';

  @override
  String get reminderKindDeadline => 'Deadline';

  @override
  String get reminderKindOverdue => 'Overdue';

  @override
  String get reminderKindStreak => 'Streak';

  @override
  String get reminderKindCustom => 'Custom';

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
