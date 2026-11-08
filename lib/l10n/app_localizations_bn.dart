// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get commonClose => 'বন্ধ করুন';

  @override
  String get commonDelete => 'মুছুন';

  @override
  String get commonEdit => 'সম্পাদনা';

  @override
  String get commonError => 'ত্রুটি';

  @override
  String get commonNone => 'কোনোটি নয়';

  @override
  String get commonSave => 'সংরক্ষণ';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'প্রয়োজনীয় সময় (স্বয়ংক্রিয়): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'সমাপ্তির তারিখ মুছুন';

  @override
  String get courseFormClearStartTooltip => 'শুরুর তারিখ মুছুন';

  @override
  String get courseFormColorLabel => 'রং';

  @override
  String get courseFormDateNotSet => 'নির্ধারিত নয়';

  @override
  String courseFormDeadlineButton(String date) {
    return 'সমাপ্তি: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS ক্রেডিট';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value ঘণ্টা/ECTS';
  }

  @override
  String get courseFormNameLabel => 'নাম';

  @override
  String get courseFormNotesLabel => 'নোট (ঐচ্ছিক)';

  @override
  String get courseFormSaving => 'সংরক্ষণ করা হচ্ছে…';

  @override
  String courseFormStartButton(String date) {
    return 'শুরু: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'বন্ধ: $date পর্যন্ত কোনো চাপ নেই; আজকের গতিতে অন্তর্ভুক্ত নয়।';
  }

  @override
  String get courseFormStartEarlyOn =>
      'চালু: সময় এখন পর্যন্ত ভাগ করা হয়েছে এবং আজকের গতিতে অন্তর্ভুক্ত।';

  @override
  String get courseFormStartEarlyTitle => 'ভবিষ্যতে শুরু হলেও এখনই শুরু করুন';

  @override
  String get courseFormTitleAdd => 'কোর্স যোগ করুন';

  @override
  String get courseFormTitleEdit => 'কোর্স সম্পাদনা';

  @override
  String get coursesAddTooltip => 'কোর্স যোগ করুন';

  @override
  String coursesDeleteBody(String name) {
    return '“$name” এবং এর সব পড়াশোনার সেশন মুছে ফেলবেন? এটি পূর্বাবস্থায় ফেরানো যাবে না।';
  }

  @override
  String get coursesDeleteTitle => 'কোর্স মুছে ফেলবেন?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'প্রথম কোর্স তৈরি করতে “New course”-এ ট্যাপ করুন।';

  @override
  String get coursesEmptyTitle => 'এখনও কোনো কোর্স নেই';

  @override
  String get coursesFilterAll => 'সব অবস্থা';

  @override
  String get coursesFilterEmpty => 'এই ফিল্টারের সাথে কোনো কোর্স মিলছে না';

  @override
  String get coursesNewCourse => 'নতুন কোর্স';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily ঘণ্টা/দিন প্রয়োজন';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily ঘণ্টা/দিন • $weekly ঘণ্টা/সপ্তাহ প্রয়োজন';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required ঘণ্টা • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'নমুনা কোর্স সরান';

  @override
  String coursesShownCount(String count) {
    return '$countটি দেখানো হচ্ছে';
  }

  @override
  String coursesSortOption(String label) {
    return 'সাজান: $label';
  }

  @override
  String get dashboardAllDone => 'সব সম্পন্ন';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours ঘণ্টা লগ করা হয়েছে (বোনাস)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$countটি কোর্স';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$countটি কোর্স · $upcomingটি আসন্ন আজকের গতিতে নেই';
  }

  @override
  String get dashboardCoursesTitle => 'কোর্সসমূহ';

  @override
  String dashboardDeadline(String date) {
    return 'সমাপ্তি $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'সমাপ্তি $date ($days দিন বাকি)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'সমাপ্তি $date (১ দিন বাকি)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'সমাপ্তি $date (মেয়াদোত্তীর্ণ)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'সমাপ্তি $date (আজ)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'আজকের লক্ষ্য — $hours ঘণ্টা লগ হয়েছে';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'প্রতিটি কোর্স সম্পন্ন — সম্পূর্ণ তালিকার জন্য কোর্স ট্যাব দেখুন।';

  @override
  String get dashboardEmptyHintNoCourses =>
      'ECTS অগ্রগতি ট্র্যাক করতে একটি কোর্স যোগ করুন।';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'পিছিয়ে = $achieved/দিন করছেন, $need/দিন প্রয়োজন';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'পিছিয়ে = $achieved/দিন করছেন, $need/দিন প্রয়োজন · আগাম শুরু';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'পিছিয়ে: বাকি সময় দিয়ে আজকের সমাপ্তি ধরার মতো কোনো নির্দিষ্ট গতি নেই';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'সঠিক পথে: এখনও গতি নেই — নিশ্চিত করতে প্রথম সেশন লগ করুন';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days দিনে শুরু · $date থেকে গণনা';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days দিনে শুরু · $date থেকে গণনা · আগাম শুরু চালু';
  }

  @override
  String get dashboardFreshStart => 'নতুন শুরু';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · $hoursঘণ্টা বাকি';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required ঘণ্টা';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours ঘণ্টা/দিন';
  }

  @override
  String get dashboardLogSessionAction => 'পড়াশোনার সেশন লগ করুন';

  @override
  String get dashboardLogSessionTooltip => 'পড়াশোনার সেশন লগ করুন';

  @override
  String get dashboardNewBadge => 'নতুন';

  @override
  String get dashboardNoCourses => 'এখনও কোনো কোর্স নেই';

  @override
  String get dashboardNoDeadline => 'কোনো সমাপ্তি তারিখ নেই';

  @override
  String get dashboardNoDeadlines => 'কোনো সমাপ্তি নির্ধারিত নেই';

  @override
  String get dashboardNoPaceDue => 'আজ কোনো লক্ষ্য নেই';

  @override
  String get dashboardNothingDue => 'কিছু বকেয়া নেই';

  @override
  String get dashboardNothingToTrack => 'এখনও ট্র্যাক করার মতো কিছু নেই';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'আজকের লক্ষ্য — $hoursঘণ্টা বাকি';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'শেষ করতে $daily ঘণ্টা/দিন প্রয়োজন';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'শেষ করতে $daily ঘণ্টা/দিন · $weekly ঘণ্টা/সপ্তাহ প্রয়োজন';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$date থেকে $hours ঘণ্টা/দিন প্রয়োজন · আজকের গতিতে নেই';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'সমাপ্তি নেই — $hoursঘণ্টা বাকি · দৈনিক চাপ নেই';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date শুরু · $hoursঘণ্টা বাকি';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · অবাস্তব';
  }

  @override
  String get dashboardProgramBare => 'প্রোগ্রাম';

  @override
  String get dashboardProgramEmptyHint =>
      'ট্র্যাকিং শুরু করতে একটি কোর্স যোগ করুন';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required ঘণ্টা';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'প্রোগ্রাম $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days দিনের সময় বাকি';
  }

  @override
  String get dashboardStartNotSet => 'নির্ধারিত নয়';

  @override
  String dashboardStartsIn(String days) {
    return '$days দিনে শুরু';
  }

  @override
  String get dashboardStartsSoon => 'শীঘ্রই শুরু';

  @override
  String get dashboardTipEmpty =>
      'প্রথম কোর্স যোগ করুন — দৈনিক গতি ও অগ্রগতি এখানে দেখা যাবে।';

  @override
  String get dashboardTipFirst =>
      'প্রথম ২৫ মিনিট সবচেয়ে গুরুত্বপূর্ণ — যে কোর্সের সমাপ্তি আগে, সেটি বেছে নিন।';

  @override
  String get dashboardTodayBare => 'আজ';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace ঘণ্টা';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'আজ $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'আজকের গতি';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'আজ $logged / $pace ঘণ্টা';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'ভবিষ্যতে শুরু — আজ কোনো চাপ নেই, আজকের গতিতে অন্তর্ভুক্ত নয়।';

  @override
  String get dashboardUpcomingTitle => 'আসন্ন';

  @override
  String get devToolsActivate => 'সক্রিয় করুন';

  @override
  String get devToolsActivateMessage =>
      'এটি লুকানো স্ট্রেস-টেস্ট সরঞ্জাম চালু করে (তৈরি করা ডেটা লোড করে)। শুধু ডেভেলপমেন্টের জন্য।';

  @override
  String get devToolsActivateTitle => 'ডেভ মোড সক্রিয় করবেন?';

  @override
  String get devToolsActivated => 'ডেভ মোড সক্রিয় হয়েছে।';

  @override
  String get devToolsClearPumped => 'লোড করা ডেটা মুছুন';

  @override
  String get devToolsClearPumpedMessage =>
      'তৈরি করা STRESS কোর্স ও সেশন মুছে ফেলে। আপনার নিজের ডেটা রক্ষিত থাকবে।';

  @override
  String get devToolsClearPumpedSubtitle =>
      'তৈরি করা STRESS কোর্স ও সেশন মুছুন।';

  @override
  String get devToolsClearPumpedTitle => 'লোড করা ডেটা মুছে ফেলবেন?';

  @override
  String devToolsCleared(String count) {
    return '$countটি লোড করা কোর্স মোছা হয়েছে।';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'দ্বিতীয় নিশ্চিতকরণ: এটি কোর্স, তালিকা, চার্ট ও গতি হিসাব ফুলিয়ে দেবে এবং কয়েক সেকেন্ড লাগতে পারে। এখন লোড করবেন?';

  @override
  String get devToolsConfirmPumpTitle => 'স্ট্রেস লোড নিশ্চিত করুন';

  @override
  String get devToolsContinue => 'চালিয়ে যান';

  @override
  String get devToolsExit => 'ডেভ মোড থেকে বের হন';

  @override
  String get devToolsExitSubtitle => 'এই ডিভাইসে ডেভ সরঞ্জাম লুকান।';

  @override
  String get devToolsPumpData => 'ডেটা লোড করুন';

  @override
  String get devToolsPumpMessage =>
      'এটি একটি বাস্তবসম্মত তৈরি সেমিস্টার যোগ করে (~১০টি কোর্স, গত ১২ সপ্তাহে ~৮০০ সেশন)। আপনার বিদ্যমান ডেটা রক্ষিত থাকবে। চালিয়ে যাবেন?';

  @override
  String get devToolsPumpSubtitle =>
      'একটি তৈরি সেমিস্টার যোগ করুন (~১০টি কোর্স, ~৮০০ সেশন, ১২ সপ্তাহ)। বিদ্যমান ডেটা রক্ষিত থাকবে।';

  @override
  String get devToolsPumpTile => 'টেস্ট ডেটা লোড করুন';

  @override
  String get devToolsPumpTitle => 'টেস্ট ডেটা লোড করবেন?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$coursesটি কোর্স, $sessionsটি সেশন লোড হয়েছে।';
  }

  @override
  String get devToolsPumping => 'টেস্ট ডেটা লোড হচ্ছে…';

  @override
  String get devToolsRemoveAll => 'সব ডেটা সরান';

  @override
  String get devToolsRemoveAllMessage =>
      'ডেভ শর্টকাট: এটি সব কোর্স, সেশন ও সেটিংস স্থায়ীভাবে মুছে ফেলে। এটি পূর্বাবস্থায় ফেরানো যাবে না।';

  @override
  String get devToolsRemoveAllSubtitle =>
      'ডেভ শর্টকাট: সব কোর্স, সেশন ও সেটিংস মুছুন।';

  @override
  String get devToolsRemoveAllTitle => 'সব ডেটা সরিয়ে ফেলবেন?';

  @override
  String get navCourses => 'কোর্স';

  @override
  String get navDashboard => 'ড্যাশবোর্ড';

  @override
  String get navSettings => 'সেটিংস';

  @override
  String get navStatistics => 'পরিসংখ্যান';

  @override
  String get navStudyLog => 'পড়াশোনার লগ';

  @override
  String get sampleBadge => 'নমুনা';

  @override
  String get sessionFormCourseLabel => 'কোর্স';

  @override
  String sessionFormDateButton(String date) {
    return 'তারিখ: $date';
  }

  @override
  String get sessionFormDurationError => 'সময়কাল শূন্যের বেশি হতে হবে।';

  @override
  String get sessionFormHoursLabel => 'ঘণ্টা';

  @override
  String get sessionFormLogAction => 'সেশন লগ করুন';

  @override
  String get sessionFormMinutesLabel => 'মিনিট';

  @override
  String get sessionFormNoCourseError => 'একটি কোর্স বেছে নিন।';

  @override
  String get sessionFormNoCoursesHint =>
      'সেশন লগ করতে আগে একটি কোর্স যোগ করুন।';

  @override
  String get sessionFormNotesLabel => 'নোট (ঐচ্ছিক)';

  @override
  String get sessionFormSaving => 'সংরক্ষণ করা হচ্ছে…';

  @override
  String get sessionFormTitleAdd => 'পড়াশোনার সেশন লগ করুন';

  @override
  String get sessionFormTitleEdit => 'পড়াশোনার সেশন সম্পাদনা';

  @override
  String sessionFormTotalHours(String hours) {
    return 'মোট: $hours ঘণ্টা';
  }

  @override
  String get settingsAccent => 'থিমের রং';

  @override
  String get settingsAccentBerry => 'বেরি';

  @override
  String get settingsAccentClay => 'মাটি';

  @override
  String get settingsAccentForest => 'বন';

  @override
  String get settingsAccentSlate => 'স্লেট';

  @override
  String get settingsAccentTeal => 'টিল';

  @override
  String get settingsAccentUpdated => 'থিমের রং আপডেট হয়েছে।';

  @override
  String get settingsAllDataDeleted => 'সব ডেটা মোছা হয়েছে।';

  @override
  String get settingsAppearance => 'চেহারা (ডার্ক / লাইট)';

  @override
  String get settingsCheckingSample => 'নমুনা ডেটা পরীক্ষা করা হচ্ছে…';

  @override
  String get settingsClear => 'মুছুন';

  @override
  String get settingsClearSample => 'নমুনা ডেটা মুছুন';

  @override
  String get settingsClearSampleMessage =>
      'এটি উদাহরণ কোর্স ও সেশন সরিয়ে ফেলে। আপনি নিজে যোগ করা কোর্স বা সেশন সরানো হয় না।';

  @override
  String get settingsClearSampleSubtitle =>
      'বীজ নমুনা কোর্স ও সেশন সরান। আপনার নিজের ডেটা রক্ষিত থাকবে।';

  @override
  String get settingsClearSampleTitle => 'নমুনা ডেটা মুছে ফেলবেন?';

  @override
  String get settingsCopy => 'কপি';

  @override
  String get settingsDailyError => '0 বা ধনাত্মক মিনিট সংখ্যা লিখুন।';

  @override
  String get settingsDailyLabel => 'প্রতিদিন মিনিট (0 = কোনো লক্ষ্য নেই)';

  @override
  String get settingsDailyTarget => 'দৈনিক পড়াশোনার লক্ষ্য';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes মিনিট/দিন';
  }

  @override
  String get settingsDailyUpdated => 'দৈনিক লক্ষ্য আপডেট হয়েছে।';

  @override
  String get settingsData => 'ডেটা';

  @override
  String get settingsDeleteEverything => 'সবকিছু মুছুন';

  @override
  String get settingsDevMode => 'ডেভ মোড';

  @override
  String get settingsDisplay => 'ডিসপ্লে';

  @override
  String get settingsDisplayComfortable => 'আরামদায়ক';

  @override
  String get settingsDisplayCompact => 'ঘন';

  @override
  String get settingsDisplayLarge => 'বড়';

  @override
  String get settingsDisplaySize => 'লেখা ও উপাদানের আকার';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'ডিসপ্লে আকার আপডেট হয়েছে।';

  @override
  String get settingsExport => 'ডেটা এক্সপোর্ট';

  @override
  String get settingsExportCopied => 'এক্সপোর্ট ক্লিপবোর্ডে কপি হয়েছে।';

  @override
  String get settingsExportSubtitle =>
      'সব কোর্স, সেশন ও সেটিংস JSON হিসেবে কপি করুন।';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$coursesটি কোর্স · $sessionsটি সেশন · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (ছাঁটা হয়েছে — সম্পূর্ণ ব্যাকআপ $kb KB, সবকিছুর জন্য কপি ব্যবহার করুন)';
  }

  @override
  String get settingsFirstWeekday => 'সপ্তাহের প্রথম দিন';

  @override
  String get settingsFirstWeekdayUpdated => 'সপ্তাহের প্রথম দিন আপডেট হয়েছে।';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds সেকেন্ড ধরে রাখুন)';
  }

  @override
  String get settingsHoldToReplace => 'সব প্রতিস্থাপন করতে ধরে রাখুন';

  @override
  String get settingsHoursError => 'শূন্যের বেশি একটি সংখ্যা লিখুন।';

  @override
  String get settingsHoursHelper =>
      'ডিফল্ট 30। পরিবর্তনে প্রয়োজন পুনর্গণনা হয়; লগ রক্ষিত থাকে।';

  @override
  String get settingsHoursLabel => 'প্রতি ECTS ক্রেডিটে ঘণ্টা';

  @override
  String get settingsHoursPerEcts => 'প্রতি ECTS-এ ঘণ্টা';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value ঘণ্টা';
  }

  @override
  String get settingsHoursUpdated => 'প্রতি ECTS-এ ঘণ্টা আপডেট হয়েছে।';

  @override
  String get settingsImport => 'ডেটা ইমপোর্ট';

  @override
  String get settingsImportAppend => 'যোগ করুন';

  @override
  String get settingsImportAppendAction => 'ইমপোর্ট (যোগ)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'ডেটা যোগ হয়েছে: $coursesটি কোর্স, $sessionsটি সেশন যোগ হয়েছে।';
  }

  @override
  String get settingsImportInfo =>
      'যোগ করা ব্যাকআপকে বর্তমান ডেটার পাশে রাখে (সেটিংস রক্ষিত থাকে)। প্রতিস্থাপন আগে সব কোর্স, সেশন ও সেটিংস মুছে ফেলে।';

  @override
  String get settingsImportLabel => 'এক্সপোর্ট করা JSON পেস্ট করুন';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$coursesটি কোর্স · $sessionsটি সেশন';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· এক্সপোর্ট $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· স্কিমা v$schema';
  }

  @override
  String get settingsImportReplace => 'প্রতিস্থাপন';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'প্রতিস্থাপন আগে সবকিছু মুছে ফেলে। নিশ্চিত করতে নিচের বোতাম $seconds সেকেন্ড ধরে চেপে রাখুন।';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'ডেটা প্রতিস্থাপিত: $coursesটি কোর্স, $sessionsটি সেশন ফিরিয়ে আনা হয়েছে।';
  }

  @override
  String get settingsImportSubtitle =>
      'আগে এক্সপোর্ট করা JSON ব্যাকআপ থেকে সব ডেটা প্রতিস্থাপন করুন।';

  @override
  String settingsKeepHolding(String remaining) {
    return 'ধরে রাখুন… $remaining সেকেন্ড';
  }

  @override
  String get settingsNoSample => 'কোনো নমুনা ডেটা নেই';

  @override
  String get settingsNoSampleSubtitle => 'বীজ নমুনা ডেটা ইতিমধ্যে মোছা হয়েছে।';

  @override
  String get settingsNoTarget => 'কোনো লক্ষ্য নির্ধারিত নেই';

  @override
  String get settingsOverloadError =>
      '5–100 এর মধ্যে সংখ্যা লিখুন (ঘণ্টা/সপ্তাহ)।';

  @override
  String get settingsOverloadHelper =>
      'এর উপরে আসন্ন লোড সপ্তাহ লাল চিহ্নিত হয়। পূর্ণকালীন পড়াশোনা ~35–40 ঘণ্টা/সপ্তাহ।';

  @override
  String settingsOverloadHours(String value) {
    return '$value ঘণ্টা';
  }

  @override
  String get settingsOverloadLabel => 'প্রতি সপ্তাহে ঘণ্টা (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/সপ্তাহ লাল চিহ্নিত হবে';
  }

  @override
  String get settingsOverloadThreshold => 'সাপ্তাহিক ওভারলোড সীমা';

  @override
  String get settingsOverloadUpdated => 'ওভারলোড সীমা আপডেট হয়েছে।';

  @override
  String get settingsPaceTolerance => 'এগিয়ে / পিছিয়ে সহনশীলতা';

  @override
  String get settingsPasteValidBackup => 'আগে একটি বৈধ ব্যাকআপ পেস্ট করুন';

  @override
  String get settingsReset => 'রিসেট';

  @override
  String get settingsResetAll => 'সব ডেটা রিসেট';

  @override
  String get settingsResetAllMessage =>
      'এটি সব কোর্স, সেশন ও সেটিংস স্থায়ীভাবে মুছে ফেলে। এটি পূর্বাবস্থায় ফেরানো যাবে না। প্রয়োজনে আগে ব্যাকআপ এক্সপোর্ট করুন।';

  @override
  String get settingsResetAllSubtitle => 'সব কোর্স, সেশন ও সেটিংস মুছুন।';

  @override
  String get settingsResetAllTitle => 'সব ডেটা রিসেট করবেন?';

  @override
  String get settingsResetSettings => 'সেটিংস রিসেট';

  @override
  String get settingsResetSettingsDone => 'সেটিংস ডিফল্টে ফিরিয়ে আনা হয়েছে।';

  @override
  String get settingsResetSettingsMessage =>
      'প্রতি ECTS-এ ঘণ্টা (30), দৈনিক লক্ষ্য (নেই), সপ্তাহের প্রথম দিন (সোমবার), থিম (সিস্টেম), সহনশীলতা (5 দিন), ওভারলোড (35 ঘণ্টা/সপ্তাহ), আকার (আরামদায়ক), রং (স্লেট) পুনরুদ্ধার করে। কোর্স ও সেশন রক্ষিত থাকে।';

  @override
  String get settingsResetSettingsSubtitle =>
      'ডিফল্ট পুনরুদ্ধার: 30 ঘণ্টা/ECTS, লক্ষ্য নেই, সোমবার, সিস্টেম থিম, 5 দিন সহনশীলতা, 35 ঘণ্টা/সপ্তাহ ওভারলোড, আরামদায়ক আকার, স্লেট রং।';

  @override
  String get settingsResetSettingsTitle => 'সেটিংস রিসেট করবেন?';

  @override
  String get settingsSampleData => 'নমুনা ডেটা';

  @override
  String settingsSampleDataError(String error) {
    return 'ত্রুটি: $error';
  }

  @override
  String get settingsStudySettings => 'পড়াশোনার সেটিংস';

  @override
  String get settingsThemeDark => 'ডার্ক';

  @override
  String get settingsThemeLight => 'লাইট';

  @override
  String get settingsThemeSystem => 'সিস্টেম ডিফল্ট';

  @override
  String get settingsThemeTitle => 'থিম';

  @override
  String get settingsThemeUpdated => 'থিম আপডেট হয়েছে।';

  @override
  String settingsToleranceDays(String value) {
    return '$value দিন';
  }

  @override
  String get settingsToleranceError => '0–30 এর মধ্যে দিন সংখ্যা লিখুন।';

  @override
  String get settingsToleranceHelper =>
      'এগিয়ে থাকতে +N দিন উদ্বৃত্ত, পিছিয়ে −N দিন প্রয়োজন। 5 = স্থিতিশীল, 0 = সংবেদনশীল।';

  @override
  String get settingsToleranceLabel => 'কাজের দিন (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance কাজ';
  }

  @override
  String get settingsToleranceUpdated => 'সহনশীলতা আপডেট হয়েছে।';

  @override
  String get settingsWeekdayFriday => 'শুক্রবার';

  @override
  String get settingsWeekdayMonday => 'সোমবার';

  @override
  String get settingsWeekdaySaturday => 'শনিবার';

  @override
  String get settingsWeekdaySunday => 'রবিবার';

  @override
  String get settingsWeekdayThursday => 'বৃহস্পতিবার';

  @override
  String get settingsWeekdayTuesday => 'মঙ্গলবার';

  @override
  String get settingsWeekdayWednesday => 'বুধবার';

  @override
  String get sortDeadline => 'সমাপ্তি';

  @override
  String get sortName => 'নাম';

  @override
  String get sortProgress => 'অগ্রগতি';

  @override
  String get sortStatus => 'অবস্থা';

  @override
  String get startupTitle => 'ECTS Tracker চালু করা যায়নি';

  @override
  String get statsActiveDays => 'সক্রিয় দিন';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days দিন সক্রিয়';
  }

  @override
  String get statsAddDeadlines => 'লোডের পূর্বাভাস দিতে সমাপ্তি যোগ করুন।';

  @override
  String get statsComingLoad => 'আসন্ন লোড';

  @override
  String get statsConsistency => 'ধারাবাহিকতা';

  @override
  String get statsConsistencyHint =>
      'গত 30 দিনে পড়াশোনার দিন। প্রতিদিন ছোট পদক্ষেপ গাদা পড়ার চেয়ে ভালো।';

  @override
  String statsConsistencyScore(String percent) {
    return 'গত 30 দিনের $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return 'কোর্স $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'কো$id';
  }

  @override
  String get statsDidPerDay => 'করা / দিন (14দি)';

  @override
  String get statsEmpty => 'এখনও কোনো সেশন নেই';

  @override
  String get statsGap => 'ঘাটতি';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value ঘণ্টা';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursঘণ্টা';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours ঘণ্টা';
  }

  @override
  String get statsLast30Days => 'গত 30 দিন';

  @override
  String get statsLast7Days => 'গত 7 দিন';

  @override
  String get statsNeedPerDay => 'প্রয়োজন / দিন';

  @override
  String get statsNext8Weeks => 'পরের 8 সপ্তাহ';

  @override
  String get statsOfLast30DaysVolume => 'গত 30 দিনের ভলিউমের';

  @override
  String statsOverloadWarning(String threshold) {
    return 'ওভারলোড সপ্তাহ >$thresholdঘণ্টা লাল চিহ্নিত — সমাপ্তি পিছিয়ে দিন বা পরিধি কমান।';
  }

  @override
  String get statsOverview => 'সারসংক্ষেপ';

  @override
  String get statsPaceCovers => 'অতীত গতি প্রয়োজন মেটাচ্ছে। ধারা বজায় রাখুন।';

  @override
  String statsPaceShort(String gap) {
    return 'অতীত গতি $gap ঘণ্টা/দিন কম — একটি ব্লক যোগ করুন বা পরিধি কমান।';
  }

  @override
  String get statsPastVsNeeded => 'অতীত বনাম প্রয়োজন';

  @override
  String statsPeakPerWeek(String peak) {
    return 'সর্বোচ্চ $peakঘণ্টা/সপ্তাহ';
  }

  @override
  String get statsPerCourse => 'প্রতি কোর্স';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done ঘণ্টা / $required ঘণ্টা · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'সেশন';

  @override
  String statsSuggestedOrder(String order) {
    return 'প্রস্তাবিত ক্রম: $order (আগে নিকটতম সমাপ্তি)';
  }

  @override
  String get statsTotal => 'মোট';

  @override
  String get statsTotalVolume => 'মোট ভলিউম';

  @override
  String get statusAhead => 'এগিয়ে';

  @override
  String get statusBehind => 'পিছিয়ে';

  @override
  String get statusCompleted => 'সম্পন্ন';

  @override
  String get statusOnTrack => 'সঠিক পথে';

  @override
  String get statusOverdue => 'মেয়াদোত্তীর্ণ';

  @override
  String get studyLogDeleteBody =>
      'এই পড়াশোনার সেশন মুছে ফেলবেন? এটি পূর্বাবস্থায় ফেরানো যাবে না।';

  @override
  String get studyLogDeleteTitle => 'সেশন মুছে ফেলবেন?';

  @override
  String get studyLogEmptyHint =>
      'পড়াশোনার সময় ট্র্যাক করতে একটি সেশন লগ করুন।';

  @override
  String get studyLogEmptyTitle => 'এখনও কোনো পড়াশোনার সেশন নেই';

  @override
  String get studyLogFabLabel => 'সেশন লগ করুন';

  @override
  String get studyLogFabTooltip => 'সেশন লগ করুন';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours ঘণ্টা';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'নমুনা সেশন সরান';

  @override
  String get studyLogThisWeek => 'এই সপ্তাহ';

  @override
  String get studyLogToday => 'আজ';

  @override
  String studyLogUnknownCourse(String id) {
    return 'কোর্স $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'কো$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS শূন্যের বেশি হতে হবে';

  @override
  String get validationCourseEctsRequired => 'ECTS ক্রেডিট লিখুন';

  @override
  String get validationCourseNameRequired => 'নাম আবশ্যক';

  @override
  String get validationCourseNameTooLong => 'নাম খুব দীর্ঘ';

  @override
  String get validationSessionCourseRequired => 'একটি কোর্স বেছে নিন';

  @override
  String get validationSessionDurationRequired => 'একটি সময়কাল লিখুন';

  @override
  String get widgetNoProgress => 'এখনও কোনো অগ্রগতি নেই';

  @override
  String get settingsLanguage => 'ভাষা';
}
