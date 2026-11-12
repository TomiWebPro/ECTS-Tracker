// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'გაუქმება';

  @override
  String get commonClose => 'დახურვა';

  @override
  String get commonDelete => 'წაშლა';

  @override
  String get commonEdit => 'რედაქტირება';

  @override
  String get commonError => 'შეცდომა';

  @override
  String get commonNone => 'არცერთი';

  @override
  String get commonSave => 'შენახვა';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'საჭირო საათები (ავტო): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'ვადის გასუფთავება';

  @override
  String get courseFormClearStartTooltip => 'დაწყების თარიღის გასუფთავება';

  @override
  String get courseFormColorLabel => 'ფერი';

  @override
  String get courseFormDateNotSet => 'არ არის მითითებული';

  @override
  String courseFormDeadlineButton(String date) {
    return 'ვადა: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS კრედიტები';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value სთ/ECTS';
  }

  @override
  String get courseFormNameLabel => 'სახელი';

  @override
  String get courseFormNotesLabel => 'შენიშვნები (არასავალდებულო)';

  @override
  String get courseFormSaving => 'ინახება…';

  @override
  String courseFormStartButton(String date) {
    return 'დაწყება: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'გამორთულია: ზეწოლა არ არის $date-მდე; გამორიცხულია დღევანდელი ტემპიდან.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'ჩართულია: დრო იყოფა ამ დრომდე და ითვლება დღევანდელ ტემპში.';

  @override
  String get courseFormStartEarlyTitle =>
      'ახლა დაწყება მომავალი დაწყების მიუხედავად';

  @override
  String get courseFormTitleAdd => 'კურსის დამატება';

  @override
  String get courseFormTitleEdit => 'კურსის რედაქტირება';

  @override
  String get coursesAddTooltip => 'კურსის დამატება';

  @override
  String coursesDeleteBody(String name) {
    return 'წაიშალოს „$name“ და ყველა სასწავლო სესია? ამის გაუქმება შეუძლებელია.';
  }

  @override
  String get coursesDeleteTitle => 'წაიშალოს კურსი?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'შეეხეთ „ახალი კურსი“ პირველი კურსის შესაქმნელად.';

  @override
  String get coursesEmptyTitle => 'კურსები ჯერ არ არის';

  @override
  String get coursesFilterAll => 'ყველა სტატუსი';

  @override
  String get coursesFilterEmpty => 'არცერთი კურსი არ შეესაბამება ამ ფილტრს';

  @override
  String get coursesNewCourse => 'ახალი კურსი';

  @override
  String coursesPaceNeeded(String daily) {
    return 'საჭიროა $daily სთ/დღეში';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return 'საჭიროა $daily წთ/დღეში';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'საჭიროა $daily სთ/დღეში • $weekly სთ/კვირაში';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return 'საჭიროა $daily წთ/დღეში • $weekly წთ/კვირაში';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return 'საჭიროა $daily წთ/დღეში • $weekly სთ/კვირაში';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required სთ • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'საცდელი კურსის მოშორება';

  @override
  String coursesShownCount(String count) {
    return 'ნაჩვენებია $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'დალაგება: $label';
  }

  @override
  String get dashboardAllDone => 'ყველაფერი დასრულებულია';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours სთ ჩაწერილია (ბონუსი)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count კურსი';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count კურსი · $upcoming მომავალი დღევანდელი ტემპის გარეშე';
  }

  @override
  String get dashboardCoursesTitle => 'კურსები';

  @override
  String dashboardDeadline(String date) {
    return 'ვადა $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'ვადა $date (დარჩა $days დღე)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'ვადა $date (დარჩა 1 დღე)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'ვადა $date (ვადაგადაცილებული)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'ვადა $date (დღეს)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'დღევანდელი ვალი — ჩაწერილია $hours სთ';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'ყველა კურსი დასრულებულია — სრული სია იხილეთ ჩანართში „კურსები“.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'დაამატეთ კურსი ECTS პროგრესის თვალყურისთვის.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'ჩამორჩენა = აკეთებთ $achieved/დღეში, საჭიროა $need/დღეში';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'ჩამორჩენა = აკეთებთ $achieved/დღეში, საჭიროა $need/დღეში · ადრეული დაწყება';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'ჩამორჩენა: ვერცერთი სასრული დღიური ტემპი ვერ ასწრებს დღევანდელ ვადას დარჩენილი საათებით';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'გრაფიკში ხართ: ტემპი ჯერ არ არის — დასადასტურებლად ჩაწერეთ პირველი სესია';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'იწყება $days დღეში · ითვლება $date-დან';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'იწყება $days დღეში · ითვლება $date-დან · ადრეული დაწყება ჩართულია';
  }

  @override
  String get dashboardFreshStart => 'ახალი დაწყება';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · დარჩა $hoursსთ';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required სთ';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours სთ/დღეში';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes წთ/დღეში';
  }

  @override
  String get dashboardLogSessionAction => 'სასწავლო სესიის ჩაწერა';

  @override
  String get dashboardLogSessionTooltip => 'სასწავლო სესიის ჩაწერა';

  @override
  String get dashboardNewBadge => 'ახალი';

  @override
  String get dashboardNoCourses => 'კურსები ჯერ არ არის';

  @override
  String get dashboardNoDeadline => 'ვადა არ არის';

  @override
  String get dashboardNoDeadlines => 'ვადები დაგეგმილი არ არის';

  @override
  String get dashboardNoPaceDue => 'დღეს ვალი არ არის';

  @override
  String get dashboardNothingDue => 'ვალი არ არის';

  @override
  String get dashboardNothingToTrack => 'სათვალყურებელი ჯერ არაფერია';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'დღევანდელი ვალი — დარჩა $hoursსთ';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'დასასრულებლად საჭიროა $daily სთ/დღეში';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'დასასრულებლად საჭიროა $daily წთ/დღეში';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'დასასრულებლად საჭიროა $daily სთ/დღეში · $weekly სთ/კვირაში';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'დასასრულებლად საჭიროა $daily წთ/დღეში · $weekly წთ/კვირაში';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'დასასრულებლად საჭიროა $daily წთ/დღეში · $weekly სთ/კვირაში';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'საჭიროა $hours სთ/დღეში $date-დან · დღევანდელ ტემპში არ არის';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'საჭიროა $minutes წთ/დღეში $date-დან · დღევანდელ ტემპში არ არის';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'ვადა არ არის — დარჩა $hoursსთ · დღიური ზეწოლა არ არის';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'იწყება $date · გასაკეთებელია $hoursსთ';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · არარეალისტური';
  }

  @override
  String get dashboardProgramBare => 'პროგრამა';

  @override
  String get dashboardProgramEmptyHint => 'თვალყურის დასაწყებად დაამატეთ კურსი';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required სთ';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'პროგრამა $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days დღის მარაგი';
  }

  @override
  String get dashboardStartNotSet => 'არ არის მითითებული';

  @override
  String dashboardStartsIn(String days) {
    return 'იწყება $days დღეში';
  }

  @override
  String get dashboardStartsSoon => 'მალე იწყება';

  @override
  String get dashboardTipEmpty =>
      'დაამატეთ პირველი კურსი — დღიური ტემპი და პროგრესი აქ გამოჩნდება.';

  @override
  String get dashboardTipFirst =>
      'პირველი 25 წუთი ყველაზე მნიშვნელოვანია — აირჩიეთ კურსი უახლოესი ვადით.';

  @override
  String get dashboardTodayBare => 'დღეს';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace სთ';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'დღეს $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'დღევანდელი ტემპი';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'დღეს $logged / $pace სთ';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'მომავალი დაწყებები — დღეს ზეწოლა არ არის, გამორიცხულია დღევანდელი ტემპიდან.';

  @override
  String get dashboardUpcomingTitle => 'მომავალი';

  @override
  String get devToolsActivate => 'გააქტიურება';

  @override
  String get devToolsActivateMessage =>
      'ეს ხსნის ფარულ სტრეს-ტესტის ხელსაწყოებს (ქმნის მონაცემებს). მხოლოდ მოსამზადებლად.';

  @override
  String get devToolsActivateTitle => 'გააქტიურდეს მოსამზადებელი რეჟიმი?';

  @override
  String get devToolsActivated => 'მოსამზადებელი რეჟიმი გააქტიურებულია.';

  @override
  String get devToolsClearPumped => 'შექმნილი მონაცემების გასუფთავება';

  @override
  String get devToolsClearPumpedMessage =>
      'შლის შექმნილ STRESS კურსებსა და სესიებს. თქვენი მონაცემები შენარჩუნდება.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'შექმნილი STRESS კურსებისა და სესიების წაშლა.';

  @override
  String get devToolsClearPumpedTitle => 'გასუფთავდეს შექმნილი მონაცემები?';

  @override
  String devToolsCleared(String count) {
    return 'გასუფთავდა $count შექმნილი კურსი.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'მეორე დადასტურება: ეს გაზრდის კურსებს, სიებს, დიაგრამებსა და ტემპის გამოთვლებს და შეიძლება რამდენიმე წამი გაგრძელდეს. შევქმნათ ახლა?';

  @override
  String get devToolsConfirmPumpTitle => 'სტრეს-ტესტის დადასტურება';

  @override
  String get devToolsContinue => 'გაგრძელება';

  @override
  String get devToolsExit => 'მოსამზადებელი რეჟიმიდან გასვლა';

  @override
  String get devToolsExitSubtitle =>
      'მოსამზადებელი ხელსაწყოების დამალვა ამ მოწყობილობაზე.';

  @override
  String get devToolsPumpData => 'მონაცემების შექმნა';

  @override
  String get devToolsPumpMessage =>
      'ეს ჩასვამს რეალისტურ შექმნილ სემესტრს (~10 კურსი, ~800 სესია ბოლო 12 კვირაში). თქვენი არსებული მონაცემები შენარჩუნდება. გავაგრძელოთ?';

  @override
  String get devToolsPumpSubtitle =>
      'შექმნილი სემესტრის ჩასმა (~10 კურსი, ~800 სესია, 12 კვირა). არსებული მონაცემები შენარჩუნდება.';

  @override
  String get devToolsPumpTile => 'საცდელი მონაცემების შექმნა';

  @override
  String get devToolsPumpTitle => 'შეიქმნას საცდელი მონაცემები?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'შეიქმნა $courses კურსი, $sessions სესია.';
  }

  @override
  String get devToolsPumping => 'საცდელი მონაცემების შექმნა…';

  @override
  String get devToolsRemoveAll => 'ყველა მონაცემის მოშორება';

  @override
  String get devToolsRemoveAllMessage =>
      'მოსამზადებელი მალსახმობი: ეს სამუდამოდ შლის ყველა კურსს, სესიასა და პარამეტრს. ამის გაუქმება შეუძლებელია.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'მოსამზადებელი მალსახმობი: ყველა კურსის, სესიისა და პარამეტრის წაშლა.';

  @override
  String get devToolsRemoveAllTitle => 'მოშორდეს ყველა მონაცემი?';

  @override
  String get navCourses => 'კურსები';

  @override
  String get navDashboard => 'მთავარი';

  @override
  String get navSettings => 'პარამეტრები';

  @override
  String get navStatistics => 'სტატისტიკა';

  @override
  String get navStudyLog => 'სწავლის ჟურნალი';

  @override
  String get sampleBadge => 'საცდელი';

  @override
  String get sessionFormCourseLabel => 'კურსი';

  @override
  String sessionFormDateButton(String date) {
    return 'თარიღი: $date';
  }

  @override
  String get sessionFormDurationError => 'ხანგრძლივობა უნდა იყოს ნულზე მეტი.';

  @override
  String get sessionFormHoursLabel => 'საათები';

  @override
  String get sessionFormLogAction => 'სესიის ჩაწერა';

  @override
  String get sessionFormMinutesLabel => 'წუთები';

  @override
  String get sessionFormNoCourseError => 'აირჩიეთ კურსი.';

  @override
  String get sessionFormNoCoursesHint => 'სესიის ჩასაწერად ჯერ დაამატეთ კურსი.';

  @override
  String get sessionFormNotesLabel => 'შენიშვნები (არასავალდებულო)';

  @override
  String get sessionFormSaving => 'ინახება…';

  @override
  String get sessionFormTitleAdd => 'სასწავლო სესიის ჩაწერა';

  @override
  String get sessionFormTitleEdit => 'სასწავლო სესიის რედაქტირება';

  @override
  String sessionFormTotalHours(String hours) {
    return 'სულ: $hours სთ';
  }

  @override
  String get settingsAccent => 'თემის ფერი';

  @override
  String get settingsAccentBerry => 'კენკრა';

  @override
  String get settingsAccentClay => 'თიხა';

  @override
  String get settingsAccentForest => 'ტყე';

  @override
  String get settingsAccentSlate => 'ფიქალი';

  @override
  String get settingsAccentTeal => 'ცისფერ-მწვანე';

  @override
  String get settingsAccentUpdated => 'თემის ფერი განახლდა.';

  @override
  String get settingsAllDataDeleted => 'ყველა მონაცემი წაიშალა.';

  @override
  String get settingsAppearance => 'გარეგნობა (მუქი / ღია)';

  @override
  String get settingsCheckingSample => 'საცდელი მონაცემების შემოწმება…';

  @override
  String get settingsClear => 'გასუფთავება';

  @override
  String get settingsClearSample => 'საცდელი მონაცემების გასუფთავება';

  @override
  String get settingsClearSampleMessage =>
      'ეს შლის საცდელ კურსებსა და სესიებს. თქვენს მიერ დამატებული კურსები და სესიები არ იშლება.';

  @override
  String get settingsClearSampleSubtitle =>
      'ჩადებული საცდელი კურსებისა და სესიების მოშორება. თქვენი მონაცემები შენარჩუნდება.';

  @override
  String get settingsClearSampleTitle => 'გასუფთავდეს საცდელი მონაცემები?';

  @override
  String get settingsCopy => 'კოპირება';

  @override
  String get settingsDailyError => 'შეიყვანეთ 0 ან დადებითი რიცხვი წუთების.';

  @override
  String get settingsDailyLabel => 'წუთები დღეში (0 = მიზნის გარეშე)';

  @override
  String get settingsDailyTarget => 'დღიური სასწავლო მიზანი';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes წთ/დღეში';
  }

  @override
  String get settingsDailyUpdated => 'დღიური მიზანი განახლდა.';

  @override
  String get settingsData => 'მონაცემები';

  @override
  String get settingsDeleteEverything => 'ყველაფრის წაშლა';

  @override
  String get settingsDevMode => 'მოსამზადებელი რეჟიმი';

  @override
  String get settingsDisplay => 'ეკრანი';

  @override
  String get settingsDisplayComfortable => 'კომფორტული';

  @override
  String get settingsDisplayCompact => 'კომპაქტური';

  @override
  String get settingsDisplayLarge => 'დიდი';

  @override
  String get settingsDisplaySize => 'ტექსტისა და ელემენტების ზომა';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'ეკრანის ზომა განახლდა.';

  @override
  String get settingsExport => 'მონაცემების ექსპორტი';

  @override
  String get settingsExportCopied => 'ექსპორტი დაკოპირდა გაცვლის ბუფერში.';

  @override
  String get settingsExportSubtitle =>
      'ყველა კურსის, სესიისა და პარამეტრის კოპირება JSON-ად.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses კურსი · $sessions სესია · $kb კბ';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (შეკვეცილი — სრული ასლია $kb კბ, ყველაფრისთვის გამოიყენეთ კოპირება)';
  }

  @override
  String get settingsFirstWeekday => 'კვირის პირველი დღე';

  @override
  String get settingsFirstWeekdayUpdated => 'კვირის პირველი დღე განახლდა.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($secondsწ დაჭერა)';
  }

  @override
  String get settingsHoldToReplace =>
      'ხანგრძლივად დააჭირეთ ყველაფრის ჩასანაცვლებლად';

  @override
  String get settingsHoursError => 'შეიყვანეთ ნულზე მეტი რიცხვი.';

  @override
  String get settingsHoursHelper =>
      'სტანდარტია 30. ცვლილება ხელახლა ითვლის მოთხოვნებს; ჩანაწერები შენარჩუნდება.';

  @override
  String get settingsHoursLabel => 'საათები ECTS კრედიტზე';

  @override
  String get settingsHoursPerEcts => 'საათები ECTS-ზე';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value სთ';
  }

  @override
  String get settingsHoursUpdated => 'საათები ECTS-ზე განახლდა.';

  @override
  String get settingsImport => 'მონაცემების იმპორტი';

  @override
  String get settingsImportAppend => 'დამატება';

  @override
  String get settingsImportAppendAction => 'იმპორტი (დამატება)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'მონაცემები დაემატა: $courses კურსი, $sessions სესია დაემატა.';
  }

  @override
  String get settingsImportInfo =>
      'დამატება ასლის თქვენს მიმდინარე მონაცემებს უმატებს (პარამეტრები შენარჩუნდება). ჩანაცვლება ჯერ შლის ყველა კურსს, სესიასა და პარამეტრს.';

  @override
  String get settingsImportLabel => 'ჩასვით ექსპორტირებული JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses კურსი · $sessions სესია';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · ექსპორტირებულია $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · სქემა v$schema';
  }

  @override
  String get settingsImportReplace => 'ჩანაცვლება';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'ჩანაცვლება ჯერ ყველაფერს შლის. დასადასტურებლად ხანგრძლივად დააჭირეთ ქვემოთ ღილაკს $seconds წამით.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'მონაცემები ჩანაცვლდა: $courses კურსი, $sessions სესია აღდგა.';
  }

  @override
  String get settingsImportSubtitle =>
      'ყველა მონაცემის ჩანაცვლება ადრე ექსპორტირებული JSON ასლით.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'განაგრძეთ დაჭერა… $remaining წ';
  }

  @override
  String get settingsNoSample => 'საცდელი მონაცემები არ არის';

  @override
  String get settingsNoSampleSubtitle =>
      'ჩადებული საცდელი მონაცემები უკვე გასუფთავებულია.';

  @override
  String get settingsNoTarget => 'მიზანი მითითებული არ არის';

  @override
  String get settingsOverloadError => 'შეიყვანეთ რიცხვი 5–100 სთ/კვირაში.';

  @override
  String get settingsOverloadHelper =>
      'ამ ზღვარს ზემოთ მომავალი კვირები წითლად მოინიშნება. სრული განაკვეთი სწავლაა ~35–40 სთ/კვირაში.';

  @override
  String settingsOverloadHours(String value) {
    return '$value სთ';
  }

  @override
  String get settingsOverloadLabel => 'საათები კვირაში (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/კვირაში წითლად მოინიშნება';
  }

  @override
  String get settingsOverloadThreshold => 'კვირის გადატვირთვის ზღვარი';

  @override
  String get settingsOverloadUpdated => 'გადატვირთვის ზღვარი განახლდა.';

  @override
  String get settingsPaceTolerance => 'წინ/ჩამორჩენის ტოლერანტობა';

  @override
  String get settingsPasteValidBackup => 'ჯერ ჩასვით ვალიდური ასლი';

  @override
  String get settingsReset => 'გადატვირთვა';

  @override
  String get settingsResetAll => 'ყველა მონაცემის გადატვირთვა';

  @override
  String get settingsResetAllMessage =>
      'ეს სამუდამოდ შლის ყველა კურსს, სესიასა და პარამეტრს. ამის გაუქმება შეუძლებელია. საჭიროებისას ჯერ გააკეთეთ ასლის ექსპორტი.';

  @override
  String get settingsResetAllSubtitle =>
      'ყველა კურსის, სესიისა და პარამეტრის წაშლა.';

  @override
  String get settingsResetAllTitle => 'გადაიტვირთოს ყველა მონაცემი?';

  @override
  String get settingsResetSettings => 'პარამეტრების გადატვირთვა';

  @override
  String get settingsResetSettingsDone =>
      'პარამეტრები სტანდარტულზე გადატვირთდა.';

  @override
  String get settingsResetSettingsMessage =>
      'აღადგენს საათები/ECTS (30), დღიური მიზანი (არცერთი), კვირის პირველი დღე (ორშაბათი), თემა (სისტემური), ტოლერანტობა (5 დღე), გადატვირთვა (35 სთ/კვირაში), ზომა (კომფორტული), ფერი (ფიქალი). კურსები და სესიები შენარჩუნდება.';

  @override
  String get settingsResetSettingsSubtitle =>
      'სტანდარტის აღდგენა: 30 სთ/ECTS, მიზნის გარეშე, ორშაბათი, სისტემური თემა, 5-დღიანი ტოლერანტობა, 35 სთ/კვირაში გადატვირთვა, კომფორტული ზომა, ფიქალი ფერი.';

  @override
  String get settingsResetSettingsTitle => 'გადაიტვირთოს პარამეტრები?';

  @override
  String get settingsSampleData => 'საცდელი მონაცემები';

  @override
  String settingsSampleDataError(String error) {
    return 'შეცდომა: $error';
  }

  @override
  String get settingsStudySettings => 'სწავლის პარამეტრები';

  @override
  String get settingsThemeDark => 'მუქი';

  @override
  String get settingsThemeLight => 'ღია';

  @override
  String get settingsThemeSystem => 'სისტემური სტანდარტი';

  @override
  String get settingsThemeTitle => 'თემა';

  @override
  String get settingsThemeUpdated => 'თემა განახლდა.';

  @override
  String settingsToleranceDays(String value) {
    return '$value დღე';
  }

  @override
  String get settingsToleranceError => 'შეიყვანეთ რიცხვი 0–30 დღე.';

  @override
  String get settingsToleranceHelper =>
      'წინ ყოფნა მოითხოვს +N დღის მარაგს, ჩამორჩენა −N დღეს. 5 = სტაბილური, 0 = მგრძნობიარე.';

  @override
  String get settingsToleranceLabel => 'მუშაობის დღეები (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance მუშაობის';
  }

  @override
  String get settingsToleranceUpdated => 'ტოლერანტობა განახლდა.';

  @override
  String get settingsWeekdayFriday => 'პარასკევი';

  @override
  String get settingsWeekdayMonday => 'ორშაბათი';

  @override
  String get settingsWeekdaySaturday => 'შაბათი';

  @override
  String get settingsWeekdaySunday => 'კვირა';

  @override
  String get settingsWeekdayThursday => 'ხუთშაბათი';

  @override
  String get settingsWeekdayTuesday => 'სამშაბათი';

  @override
  String get settingsWeekdayWednesday => 'ოთხშაბათი';

  @override
  String get sortDeadline => 'ვადა';

  @override
  String get sortName => 'სახელი';

  @override
  String get sortProgress => 'პროგრესი';

  @override
  String get sortStatus => 'სტატუსი';

  @override
  String get startupTitle => 'ECTS Tracker ვერ გაეშვა';

  @override
  String get statsActiveDays => 'აქტიური დღეები';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days დღე აქტიური';
  }

  @override
  String get statsAddDeadlines => 'დაამატეთ ვადები დატვირთვის პროგნოზისთვის.';

  @override
  String get statsComingLoad => 'მომავალი დატვირთვა';

  @override
  String get statsConsistency => 'თანმიმდევრულობა';

  @override
  String get statsConsistencyHint =>
      'სასწავლო დღეები ბოლო 30 დღეში. ყოველდღიური პატარა ნაბიჯები სჯობს ბლოკად სწავლას.';

  @override
  String statsConsistencyScore(String percent) {
    return 'ბოლო 30 დღის $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return 'კურსი $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'კ$id';
  }

  @override
  String get statsDidPerDay => 'გაკეთებული / დღეში (14დ)';

  @override
  String get statsEmpty => 'სესიები ჯერ არ არის';

  @override
  String get statsGap => 'სხვაობა';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value სთ';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursსთ';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours სთ';
  }

  @override
  String get statsLast30Days => 'ბოლო 30 დღე';

  @override
  String get statsLast7Days => 'ბოლო 7 დღე';

  @override
  String get statsNeedPerDay => 'საჭირო / დღეში';

  @override
  String get statsNext8Weeks => 'შემდეგი 8 კვირა';

  @override
  String get statsOfLast30DaysVolume => 'ბოლო 30 დღის მოცულობის';

  @override
  String statsOverloadWarning(String threshold) {
    return 'გადატვირთული კვირები >$thresholdსთ წითლად მოინიშნება — გადადეთ ვადა ან შეამცირეთ მოცულობა.';
  }

  @override
  String get statsOverview => 'მიმოხილვა';

  @override
  String get statsPaceCovers =>
      'წარსული ტემპი საჭირო ტემპს ფარავს. შეინარჩუნეთ რიტმი.';

  @override
  String statsPaceShort(String gap) {
    return 'წარსული ტემპი $gap სთ/დღეში ნაკლებია — დაამატეთ ბლოკი ან შეამცირეთ მოცულობა.';
  }

  @override
  String get statsPastVsNeeded => 'წარსული საჭიროების წინააღმდეგ';

  @override
  String statsPeakPerWeek(String peak) {
    return 'პიკი $peakსთ/კვ';
  }

  @override
  String get statsPerCourse => 'კურსის მიხედვით';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done სთ / $required სთ · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'სესიები';

  @override
  String statsSuggestedOrder(String order) {
    return 'შემოთავაზებული რიგი: $order (ჯერ უახლოესი ვადა)';
  }

  @override
  String get statsTotal => 'სულ';

  @override
  String get statsTotalVolume => 'საერთო მოცულობა';

  @override
  String get statusAhead => 'წინ';

  @override
  String get statusBehind => 'ჩამორჩენილი';

  @override
  String get statusCompleted => 'დასრულებული';

  @override
  String get statusOnTrack => 'გრაფიკში';

  @override
  String get statusOverdue => 'ვადაგადაცილებული';

  @override
  String get studyLogDeleteBody =>
      'წაიშალოს ეს სასწავლო სესია? ამის გაუქმება შეუძლებელია.';

  @override
  String get studyLogDeleteTitle => 'წაიშალოს სესია?';

  @override
  String get studyLogEmptyHint =>
      'ჩაწერეთ სესია თქვენი სასწავლო დროის სათვალყურებლად.';

  @override
  String get studyLogEmptyTitle => 'სასწავლო სესიები ჯერ არ არის';

  @override
  String get studyLogFabLabel => 'სესიის ჩაწერა';

  @override
  String get studyLogFabTooltip => 'სესიის ჩაწერა';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours სთ';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'საცდელი სესიის მოშორება';

  @override
  String get studyLogThisWeek => 'ამ კვირაში';

  @override
  String get studyLogToday => 'დღეს';

  @override
  String studyLogUnknownCourse(String id) {
    return 'კურსი $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'კ$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS უნდა იყოს ნულზე მეტი';

  @override
  String get validationCourseEctsRequired => 'შეიყვანეთ ECTS კრედიტები';

  @override
  String get validationCourseNameRequired => 'სახელი სავალდებულოა';

  @override
  String get validationCourseNameTooLong => 'სახელი ძალიან გრძელია';

  @override
  String get validationSessionCourseRequired => 'აირჩიეთ კურსი';

  @override
  String get validationSessionDurationRequired => 'შეიყვანეთ ხანგრძლივობა';

  @override
  String get widgetNoProgress => 'პროგრესი ჯერ არ არის';

  @override
  String get settingsLanguage => 'ენა';

  @override
  String get settingsLiquidGlass => 'თხევადი მინა';

  @override
  String get settingsLiquidGlassSubtitle =>
      'ბარათები და ზოლები მქრქალი მინით. გამორთული ტოვებს კლასიკურ მყარ იერსახეს.';

  @override
  String get settingsLiquidGlassOn => 'ჩართული';

  @override
  String get settingsLiquidGlassOff => 'გამორთული';

  @override
  String get settingsLiquidGlassUpdated => 'თხევადი მინა განახლდა.';

  @override
  String get devToolsReminderPreview => 'შეხსენების წინასწარი ნახვა';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'ნახეთ, რა გაფრთხილდებოდა ახლა. Windows-თვის უსაფრთხო სატესტო არხი.';

  @override
  String get reminderPreviewTitle => 'შეხსენების წინასწარი ნახვა';

  @override
  String get reminderPreviewNow => 'წინასწარი დრო';

  @override
  String get reminderPreviewReset => 'ახლა';

  @override
  String get reminderPreviewEmpty =>
      'ყველაფერი წყნარადაა — ამ დროს არაფერი გაფრთხილდება.';

  @override
  String get reminderPreviewCustom => 'მორგებული განრიგები (დემო)';

  @override
  String get reminderPreviewNoFire => 'მომავალი გაფრთხილება არ არის.';

  @override
  String get reminderKindDaily => 'ყოველდღიური';

  @override
  String get reminderKindBehind => 'ჩამორჩენილი';

  @override
  String get reminderKindDeadline => 'ვადა';

  @override
  String get reminderKindOverdue => 'ვადაგადაცილებული';

  @override
  String get reminderKindStreak => 'სერია';

  @override
  String get reminderKindCustom => 'მორგებული';

  @override
  String get settingsReminders => 'სასწავლო შეხსენებები';

  @override
  String get settingsRemindersOff =>
      'გამორთულია — ჩართეთ ყოველდღიური შეხსენება.';

  @override
  String get settingsReminderTime => 'შეხსენების დრო';

  @override
  String get settingsReminderDenied =>
      'შეტყობინებები დაბლოკილია — ჩართეთ სისტემის პარამეტრებში.';
}
