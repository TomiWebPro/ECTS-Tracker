// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonClose => 'बंद करें';

  @override
  String get commonDelete => 'हटाएँ';

  @override
  String get commonEdit => 'संपादित करें';

  @override
  String get commonError => 'त्रुटि';

  @override
  String get commonNone => 'कोई नहीं';

  @override
  String get commonSave => 'सहेजें';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'आवश्यक घंटे (स्वतः): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'समय-सीमा साफ़ करें';

  @override
  String get courseFormClearStartTooltip => 'आरंभ तिथि साफ़ करें';

  @override
  String get courseFormColorLabel => 'रंग';

  @override
  String get courseFormDateNotSet => 'निर्धारित नहीं';

  @override
  String courseFormDeadlineButton(String date) {
    return 'समय-सीमा: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS क्रेडिट';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value घंटे/ECTS';
  }

  @override
  String get courseFormNameLabel => 'नाम';

  @override
  String get courseFormNotesLabel => 'नोट्स (वैकल्पिक)';

  @override
  String get courseFormSaving => 'सहेजा जा रहा है…';

  @override
  String courseFormStartButton(String date) {
    return 'आरंभ: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'बंद: $date तक कोई दबाव नहीं; आज की गति में शामिल नहीं।';
  }

  @override
  String get courseFormStartEarlyOn =>
      'चालू: समय अब तक बाँटा गया है और आज की गति में गिना जाता है।';

  @override
  String get courseFormStartEarlyTitle =>
      'भविष्य में आरंभ होने पर भी अभी से शुरू करें';

  @override
  String get courseFormTitleAdd => 'कोर्स जोड़ें';

  @override
  String get courseFormTitleEdit => 'कोर्स संपादित करें';

  @override
  String get coursesAddTooltip => 'कोर्स जोड़ें';

  @override
  String coursesDeleteBody(String name) {
    return '“$name” और उसके सभी अध्ययन सत्र हटाएँ? यह पूर्ववत नहीं होगा।';
  }

  @override
  String get coursesDeleteTitle => 'कोर्स हटाएँ?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'पहला कोर्स बनाने के लिए “नया कोर्स” दबाएँ।';

  @override
  String get coursesEmptyTitle => 'अभी कोई कोर्स नहीं';

  @override
  String get coursesFilterAll => 'सभी स्थितियाँ';

  @override
  String get coursesFilterEmpty => 'इस फ़िल्टर से कोई कोर्स मेल नहीं खाता';

  @override
  String get coursesNewCourse => 'नया कोर्स';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily घंटे/दिन आवश्यक';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily घंटे/दिन • $weekly घंटे/सप्ताह आवश्यक';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required घंटे • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'नमूना कोर्स हटाएँ';

  @override
  String coursesShownCount(String count) {
    return '$count दिखाए गए';
  }

  @override
  String coursesSortOption(String label) {
    return 'क्रम: $label';
  }

  @override
  String get dashboardAllDone => 'सब पूर्ण';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours घंटे दर्ज (अतिरिक्त)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count कोर्स';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count कोर्स · $upcoming आगामी आज की गति में शामिल नहीं';
  }

  @override
  String get dashboardCoursesTitle => 'कोर्स';

  @override
  String dashboardDeadline(String date) {
    return 'समय-सीमा $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'समय-सीमा $date ($days दिन शेष)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'समय-सीमा $date (1 दिन शेष)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'समय-सीमा $date (विलंबित)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'समय-सीमा $date (आज)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'आज देय — $hours घंटे दर्ज';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'सभी कोर्स पूर्ण हो गए — पूरी सूची के लिए कोर्स टैब देखें।';

  @override
  String get dashboardEmptyHintNoCourses =>
      'ECTS प्रगति ट्रैक करना शुरू करने के लिए कोर्स जोड़ें।';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'पीछे = $achieved/दिन हो रहा, $need/दिन चाहिए';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'पीछे = $achieved/दिन हो रहा, $need/दिन चाहिए · जल्दी शुरुआत';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'पीछे: आज की समय-सीमा में शेष घंटों के साथ कोई निश्चित गति नहीं';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'सही दिशा में: अभी कोई गति नहीं — पहला सत्र दर्ज करने पर पुष्टि होगी';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days दिन में शुरू · $date से गिना गया';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days दिन में शुरू · $date से गिना गया · जल्दी शुरुआत चालू';
  }

  @override
  String get dashboardFreshStart => 'नई शुरुआत';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · $hours घंटे शेष';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required घंटे';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours घंटे/दिन';
  }

  @override
  String get dashboardLogSessionAction => 'अध्ययन सत्र दर्ज करें';

  @override
  String get dashboardLogSessionTooltip => 'अध्ययन सत्र दर्ज करें';

  @override
  String get dashboardNewBadge => 'नया';

  @override
  String get dashboardNoCourses => 'अभी कोई कोर्स नहीं';

  @override
  String get dashboardNoDeadline => 'कोई समय-सीमा नहीं';

  @override
  String get dashboardNoDeadlines => 'कोई समय-सीमा निर्धारित नहीं';

  @override
  String get dashboardNoPaceDue => 'आज कोई गति देय नहीं';

  @override
  String get dashboardNothingDue => 'कुछ देय नहीं';

  @override
  String get dashboardNothingToTrack => 'अभी ट्रैक करने को कुछ नहीं';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'आज देय — $hours घंटे शेष';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'पूरा करने के लिए $daily घंटे/दिन चाहिए';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'पूरा करने के लिए $daily घंटे/दिन · $weekly घंटे/सप्ताह चाहिए';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$date से $hours घंटे/दिन चाहिए · आज की गति में शामिल नहीं';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'कोई समय-सीमा नहीं — $hours घंटे शेष · कोई दैनिक दबाव नहीं';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date से शुरू · $hours घंटे करने हैं';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · अवास्तविक';
  }

  @override
  String get dashboardProgramBare => 'कार्यक्रम';

  @override
  String get dashboardProgramEmptyHint =>
      'ट्रैकिंग शुरू करने के लिए कोर्स जोड़ें';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required घंटे';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'कार्यक्रम $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days दिन का समय शेष';
  }

  @override
  String get dashboardStartNotSet => 'निर्धारित नहीं';

  @override
  String dashboardStartsIn(String days) {
    return '$days दिन में शुरू';
  }

  @override
  String get dashboardStartsSoon => 'जल्द शुरू हो रहा';

  @override
  String get dashboardTipEmpty =>
      'पहला कोर्स जोड़ें — आपकी दैनिक गति और प्रगति यहाँ दिखेगी।';

  @override
  String get dashboardTipFirst =>
      'पहले 25 मिनट सबसे अहम हैं — सबसे पहले देय कोर्स चुनें।';

  @override
  String get dashboardTodayBare => 'आज';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace घंटे';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'आज $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'आज की गति';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'आज $logged / $pace घंटे';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'भविष्य में शुरू — आज कोई दबाव नहीं, आज की गति से बाहर।';

  @override
  String get dashboardUpcomingTitle => 'आगामी';

  @override
  String get devToolsActivate => 'सक्रिय करें';

  @override
  String get devToolsActivateMessage =>
      'यह छिपे हुए स्ट्रेस-टेस्ट साधन खोलता है (जनरेट किया डेटा भरता है)। केवल विकास हेतु।';

  @override
  String get devToolsActivateTitle => 'डेवलपर मोड सक्रिय करें?';

  @override
  String get devToolsActivated => 'डेवलपर मोड सक्रिय हो गया।';

  @override
  String get devToolsClearPumped => 'जनरेट किया डेटा साफ़ करें';

  @override
  String get devToolsClearPumpedMessage =>
      'जनरेट किए गए STRESS कोर्स और उनके सत्र हटाता है। आपका अपना डेटा बना रहता है।';

  @override
  String get devToolsClearPumpedSubtitle =>
      'जनरेट किए गए STRESS कोर्स और सत्र हटाएँ।';

  @override
  String get devToolsClearPumpedTitle => 'जनरेट किया डेटा साफ़ करें?';

  @override
  String devToolsCleared(String count) {
    return '$count जनरेट कोर्स साफ़ किए गए।';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'दूसरी पुष्टि: इससे कोर्स, सूचियाँ, चार्ट और गति गणनाएँ बढ़ जाएँगी और कुछ सेकंड लग सकते हैं। अभी भरें?';

  @override
  String get devToolsConfirmPumpTitle => 'स्ट्रेस डेटा भरने की पुष्टि';

  @override
  String get devToolsContinue => 'जारी रखें';

  @override
  String get devToolsExit => 'डेवलपर मोड से बाहर निकलें';

  @override
  String get devToolsExitSubtitle => 'इस डिवाइस पर डेवलपर साधन छिपाएँ।';

  @override
  String get devToolsPumpData => 'डेटा भरें';

  @override
  String get devToolsPumpMessage =>
      'यह एक यथार्थवादी जनरेट सेमेस्टर डालता है (~10 कोर्स, पिछले 12 हफ़्तों के ~800 सत्र)। आपका मौजूदा डेटा बना रहता है। जारी रखें?';

  @override
  String get devToolsPumpSubtitle =>
      'जनरेट सेमेस्टर डालें (~10 कोर्स, ~800 सत्र, 12 हफ़्ते)। मौजूदा डेटा बना रहता है।';

  @override
  String get devToolsPumpTile => 'टेस्ट डेटा भरें';

  @override
  String get devToolsPumpTitle => 'टेस्ट डेटा भरें?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses कोर्स, $sessions सत्र भरे गए।';
  }

  @override
  String get devToolsPumping => 'टेस्ट डेटा भरा जा रहा है…';

  @override
  String get devToolsRemoveAll => 'सारा डेटा हटाएँ';

  @override
  String get devToolsRemoveAllMessage =>
      'डेवलपर शॉर्टकट: यह सभी कोर्स, सत्र और सेटिंग्स स्थायी रूप से हटाता है। यह पूर्ववत नहीं होगा।';

  @override
  String get devToolsRemoveAllSubtitle =>
      'डेवलपर शॉर्टकट: सभी कोर्स, सत्र और सेटिंग्स हटाएँ।';

  @override
  String get devToolsRemoveAllTitle => 'सारा डेटा हटाएँ?';

  @override
  String get navCourses => 'कोर्स';

  @override
  String get navDashboard => 'डैशबोर्ड';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String get navStatistics => 'आँकड़े';

  @override
  String get navStudyLog => 'अध्ययन लॉग';

  @override
  String get sampleBadge => 'नमूना';

  @override
  String get sessionFormCourseLabel => 'कोर्स';

  @override
  String sessionFormDateButton(String date) {
    return 'तिथि: $date';
  }

  @override
  String get sessionFormDurationError => 'अवधि शून्य से अधिक होनी चाहिए।';

  @override
  String get sessionFormHoursLabel => 'घंटे';

  @override
  String get sessionFormLogAction => 'सत्र दर्ज करें';

  @override
  String get sessionFormMinutesLabel => 'मिनट';

  @override
  String get sessionFormNoCourseError => 'कोर्स चुनें।';

  @override
  String get sessionFormNoCoursesHint =>
      'सत्र दर्ज करने के लिए पहले कोर्स जोड़ें।';

  @override
  String get sessionFormNotesLabel => 'नोट्स (वैकल्पिक)';

  @override
  String get sessionFormSaving => 'सहेजा जा रहा है…';

  @override
  String get sessionFormTitleAdd => 'अध्ययन सत्र दर्ज करें';

  @override
  String get sessionFormTitleEdit => 'अध्ययन सत्र संपादित करें';

  @override
  String sessionFormTotalHours(String hours) {
    return 'कुल: $hours घंटे';
  }

  @override
  String get settingsAccent => 'थीम रंग';

  @override
  String get settingsAccentBerry => 'बेरी';

  @override
  String get settingsAccentClay => 'मिट्टी';

  @override
  String get settingsAccentForest => 'वन';

  @override
  String get settingsAccentSlate => 'स्लेट';

  @override
  String get settingsAccentTeal => 'टील';

  @override
  String get settingsAccentUpdated => 'थीम रंग अपडेट हो गया।';

  @override
  String get settingsAllDataDeleted => 'सारा डेटा हटा दिया गया।';

  @override
  String get settingsAppearance => 'दिखावट (गहरा / हल्का)';

  @override
  String get settingsCheckingSample => 'नमूना डेटा जाँचा जा रहा है…';

  @override
  String get settingsClear => 'साफ़ करें';

  @override
  String get settingsClearSample => 'नमूना डेटा साफ़ करें';

  @override
  String get settingsClearSampleMessage =>
      'यह उदाहरण कोर्स और सत्र हटाता है। आपके खुद जोड़े कोर्स या सत्र नहीं हटाए जाते।';

  @override
  String get settingsClearSampleSubtitle =>
      'बीज रूप में दिए उदाहरण कोर्स और सत्र हटाएँ। आपका डेटा बना रहता है।';

  @override
  String get settingsClearSampleTitle => 'नमूना डेटा साफ़ करें?';

  @override
  String get settingsCopy => 'कॉपी करें';

  @override
  String get settingsDailyError => '0 या धनात्मक मिनट संख्या दर्ज करें।';

  @override
  String get settingsDailyLabel => 'प्रतिदिन मिनट (0 = कोई लक्ष्य नहीं)';

  @override
  String get settingsDailyTarget => 'दैनिक अध्ययन लक्ष्य';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes मिनट/दिन';
  }

  @override
  String get settingsDailyUpdated => 'दैनिक लक्ष्य अपडेट हो गया।';

  @override
  String get settingsData => 'डेटा';

  @override
  String get settingsDeleteEverything => 'सब कुछ हटाएँ';

  @override
  String get settingsDevMode => 'डेवलपर मोड';

  @override
  String get settingsDisplay => 'प्रदर्शन';

  @override
  String get settingsDisplayComfortable => 'आरामदायक';

  @override
  String get settingsDisplayCompact => 'सघन';

  @override
  String get settingsDisplayLarge => 'बड़ा';

  @override
  String get settingsDisplaySize => 'टेक्स्ट व तत्व आकार';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'प्रदर्शन आकार अपडेट हो गया।';

  @override
  String get settingsExport => 'डेटा निर्यात करें';

  @override
  String get settingsExportCopied => 'निर्यात क्लिपबोर्ड पर कॉपी हो गया।';

  @override
  String get settingsExportSubtitle =>
      'सभी कोर्स, सत्र और सेटिंग्स JSON के रूप में कॉपी करें।';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses कोर्स · $sessions सत्र · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (काटा गया — पूरा बैकअप $kb KB है, सब कुछ पाने के लिए कॉपी दबाएँ)';
  }

  @override
  String get settingsFirstWeekday => 'सप्ताह का पहला दिन';

  @override
  String get settingsFirstWeekdayUpdated => 'सप्ताह का पहला दिन अपडेट हो गया।';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds सेकंड दबाएँ)';
  }

  @override
  String get settingsHoldToReplace => 'सब कुछ बदलने के लिए दबाकर रखें';

  @override
  String get settingsHoursError => 'शून्य से बड़ी संख्या दर्ज करें।';

  @override
  String get settingsHoursHelper =>
      'डिफ़ॉल्ट 30। बदलने पर आवश्यकताएँ पुनः गिनी जाती हैं; लॉग बने रहते हैं।';

  @override
  String get settingsHoursLabel => 'प्रति ECTS क्रेडिट घंटे';

  @override
  String get settingsHoursPerEcts => 'प्रति ECTS घंटे';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value घंटे';
  }

  @override
  String get settingsHoursUpdated => 'प्रति ECTS घंटे अपडेट हो गए।';

  @override
  String get settingsImport => 'डेटा आयात करें';

  @override
  String get settingsImportAppend => 'जोड़ें';

  @override
  String get settingsImportAppendAction => 'आयात करें (जोड़कर)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'डेटा जोड़ा गया: $courses कोर्स, $sessions सत्र जोड़े गए।';
  }

  @override
  String get settingsImportInfo =>
      'जोड़ना बैकअप को मौजूदा डेटा के साथ रखता है (सेटिंग्स बनी रहती हैं)। बदलना पहले सभी कोर्स, सत्र और सेटिंग्स मिटाता है।';

  @override
  String get settingsImportLabel => 'निर्यात किया JSON चिपकाएँ';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses कोर्स · $sessions सत्र';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · निर्यात $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · स्कीमा v$schema';
  }

  @override
  String get settingsImportReplace => 'बदलें';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'बदलना पहले सब कुछ हटाता है। पुष्टि के लिए नीचे बटन को $seconds सेकंड तक दबाकर रखें।';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'डेटा बदला गया: $courses कोर्स, $sessions सत्र बहाल किए गए।';
  }

  @override
  String get settingsImportSubtitle =>
      'पहले निर्यात किए JSON बैकअप से सारा डेटा बदलें।';

  @override
  String settingsKeepHolding(String remaining) {
    return 'दबाए रखें… $remaining सेकंड';
  }

  @override
  String get settingsNoSample => 'कोई नमूना डेटा नहीं';

  @override
  String get settingsNoSampleSubtitle =>
      'बीज रूपी उदाहरण डेटा पहले ही साफ़ हो चुका है।';

  @override
  String get settingsNoTarget => 'कोई लक्ष्य निर्धारित नहीं';

  @override
  String get settingsOverloadError => '5–100 घंटे/सप्ताह की संख्या दर्ज करें।';

  @override
  String get settingsOverloadHelper =>
      'इससे ऊपर के आगामी-भार सप्ताह लाल दिखाए जाते हैं। पूर्णकालिक अध्ययन ~35–40 घंटे/सप्ताह है।';

  @override
  String settingsOverloadHours(String value) {
    return '$value घंटे';
  }

  @override
  String get settingsOverloadLabel => 'प्रति सप्ताह घंटे (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/सप्ताह लाल दिखेगा';
  }

  @override
  String get settingsOverloadThreshold => 'साप्ताहिक अतिभार सीमा';

  @override
  String get settingsOverloadUpdated => 'अतिभार सीमा अपडेट हो गई।';

  @override
  String get settingsPaceTolerance => 'आगे / पीछे सहनशीलता';

  @override
  String get settingsPasteValidBackup => 'पहले मान्य बैकअप चिपकाएँ';

  @override
  String get settingsReset => 'रीसेट करें';

  @override
  String get settingsResetAll => 'सारा डेटा रीसेट करें';

  @override
  String get settingsResetAllMessage =>
      'यह सभी कोर्स, सत्र और सेटिंग्स स्थायी रूप से हटाता है। यह पूर्ववत नहीं होगा। ज़रूरत हो तो पहले बैकअप निर्यात करें।';

  @override
  String get settingsResetAllSubtitle => 'सभी कोर्स, सत्र और सेटिंग्स हटाएँ।';

  @override
  String get settingsResetAllTitle => 'सारा डेटा रीसेट करें?';

  @override
  String get settingsResetSettings => 'सेटिंग्स रीसेट करें';

  @override
  String get settingsResetSettingsDone => 'सेटिंग्स डिफ़ॉल्ट पर रीसेट हो गईं।';

  @override
  String get settingsResetSettingsMessage =>
      'प्रति-ECTS घंटे (30), दैनिक लक्ष्य (कोई नहीं), पहला सप्ताह-दिन (सोमवार), थीम (सिस्टम), सहनशीलता (5 दिन), अतिभार (35 घंटे/सप्ताह), आकार (आरामदायक), रंग (स्लेट) बहाल होते हैं। कोर्स और सत्र बने रहते हैं।';

  @override
  String get settingsResetSettingsSubtitle =>
      'डिफ़ॉल्ट बहाल करें: 30 घंटे/ECTS, कोई लक्ष्य नहीं, सोमवार, सिस्टम थीम, 5-दिन सहनशीलता, 35 घंटे/सप्ताह अतिभार, आरामदायक आकार, स्लेट रंग।';

  @override
  String get settingsResetSettingsTitle => 'सेटिंग्स रीसेट करें?';

  @override
  String get settingsSampleData => 'नमूना डेटा';

  @override
  String settingsSampleDataError(String error) {
    return 'त्रुटि: $error';
  }

  @override
  String get settingsStudySettings => 'अध्ययन सेटिंग्स';

  @override
  String get settingsThemeDark => 'गहरा';

  @override
  String get settingsThemeLight => 'हल्का';

  @override
  String get settingsThemeSystem => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get settingsThemeTitle => 'थीम';

  @override
  String get settingsThemeUpdated => 'थीम अपडेट हो गई।';

  @override
  String settingsToleranceDays(String value) {
    return '$value दिन';
  }

  @override
  String get settingsToleranceError => '0–30 दिन की संख्या दर्ज करें।';

  @override
  String get settingsToleranceHelper =>
      'आगे के लिए +N दिन अधिशेष चाहिए, पीछे के लिए −N दिन। 5 = स्थिर, 0 = संवेदनशील।';

  @override
  String get settingsToleranceLabel => 'काम के दिन (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return 'काम की $tolerance';
  }

  @override
  String get settingsToleranceUpdated => 'सहनशीलता अपडेट हो गई।';

  @override
  String get settingsWeekdayFriday => 'शुक्रवार';

  @override
  String get settingsWeekdayMonday => 'सोमवार';

  @override
  String get settingsWeekdaySaturday => 'शनिवार';

  @override
  String get settingsWeekdaySunday => 'रविवार';

  @override
  String get settingsWeekdayThursday => 'गुरुवार';

  @override
  String get settingsWeekdayTuesday => 'मंगलवार';

  @override
  String get settingsWeekdayWednesday => 'बुधवार';

  @override
  String get sortDeadline => 'समय-सीमा';

  @override
  String get sortName => 'नाम';

  @override
  String get sortProgress => 'प्रगति';

  @override
  String get sortStatus => 'स्थिति';

  @override
  String get startupTitle => 'ECTS Tracker शुरू नहीं हो सका';

  @override
  String get statsActiveDays => 'सक्रिय दिन';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days दिन सक्रिय';
  }

  @override
  String get statsAddDeadlines =>
      'भार का पूर्वानुमान पाने के लिए समय-सीमाएँ जोड़ें।';

  @override
  String get statsComingLoad => 'आगामी भार';

  @override
  String get statsConsistency => 'निरंतरता';

  @override
  String get statsConsistencyHint =>
      'पिछले 30 दिनों में अध्ययन के दिन। रोज़ छोटे कदम रट्टा मारने से बेहतर हैं।';

  @override
  String statsConsistencyScore(String percent) {
    return 'पिछले 30 दिनों का $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return 'कोर्स $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'को$id';
  }

  @override
  String get statsDidPerDay => 'किया / दिन (14 दिन)';

  @override
  String get statsEmpty => 'अभी कोई सत्र नहीं';

  @override
  String get statsGap => 'अंतर';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value घंटे';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursघंटे';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours घंटे';
  }

  @override
  String get statsLast30Days => 'पिछले 30 दिन';

  @override
  String get statsLast7Days => 'पिछले 7 दिन';

  @override
  String get statsNeedPerDay => 'चाहिए / दिन';

  @override
  String get statsNext8Weeks => 'अगले 8 सप्ताह';

  @override
  String get statsOfLast30DaysVolume => 'पिछले 30 दिनों की मात्रा का';

  @override
  String statsOverloadWarning(String threshold) {
    return '$threshold घंटे से अधिक अतिभार सप्ताह लाल दिखेंगे — समय-सीमा बदलें या दायरा घटाएँ।';
  }

  @override
  String get statsOverview => 'अवलोकन';

  @override
  String get statsPaceCovers =>
      'पिछली गति ज़रूरत पूरी करती है। क्रम बनाए रखें।';

  @override
  String statsPaceShort(String gap) {
    return 'पिछली गति $gap घंटे/दिन कम है — समय बढ़ाएँ या दायरा घटाएँ।';
  }

  @override
  String get statsPastVsNeeded => 'पिछला बनाम आवश्यक';

  @override
  String statsPeakPerWeek(String peak) {
    return 'चरम $peak घंटे/सप्ताह';
  }

  @override
  String get statsPerCourse => 'प्रति कोर्स';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done घंटे / $required घंटे · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'सत्र';

  @override
  String statsSuggestedOrder(String order) {
    return 'सुझाया क्रम: $order (सबसे पहली समय-सीमा पहले)';
  }

  @override
  String get statsTotal => 'कुल';

  @override
  String get statsTotalVolume => 'कुल मात्रा';

  @override
  String get statusAhead => 'आगे';

  @override
  String get statusBehind => 'पीछे';

  @override
  String get statusCompleted => 'पूर्ण';

  @override
  String get statusOnTrack => 'सही दिशा में';

  @override
  String get statusOverdue => 'विलंबित';

  @override
  String get studyLogDeleteBody =>
      'यह अध्ययन सत्र हटाएँ? यह पूर्ववत नहीं होगा।';

  @override
  String get studyLogDeleteTitle => 'सत्र हटाएँ?';

  @override
  String get studyLogEmptyHint =>
      'अध्ययन समय ट्रैक करने के लिए सत्र दर्ज करें।';

  @override
  String get studyLogEmptyTitle => 'अभी कोई अध्ययन सत्र नहीं';

  @override
  String get studyLogFabLabel => 'सत्र दर्ज करें';

  @override
  String get studyLogFabTooltip => 'सत्र दर्ज करें';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours घंटे';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'नमूना सत्र हटाएँ';

  @override
  String get studyLogThisWeek => 'इस सप्ताह';

  @override
  String get studyLogToday => 'आज';

  @override
  String studyLogUnknownCourse(String id) {
    return 'कोर्स $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'को$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS शून्य से अधिक होना चाहिए';

  @override
  String get validationCourseEctsRequired => 'ECTS क्रेडिट दर्ज करें';

  @override
  String get validationCourseNameRequired => 'नाम आवश्यक है';

  @override
  String get validationCourseNameTooLong => 'नाम बहुत लंबा है';

  @override
  String get validationSessionCourseRequired => 'कोर्स चुनें';

  @override
  String get validationSessionDurationRequired => 'अवधि दर्ज करें';

  @override
  String get widgetNoProgress => 'अभी कोई प्रगति नहीं';

  @override
  String get settingsLanguage => 'भाषा';

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
