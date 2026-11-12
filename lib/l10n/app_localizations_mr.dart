// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'रद्द करा';

  @override
  String get commonClose => 'बंद करा';

  @override
  String get commonDelete => 'हटवा';

  @override
  String get commonEdit => 'संपादित करा';

  @override
  String get commonError => 'त्रुटी';

  @override
  String get commonNone => 'काहीही नाही';

  @override
  String get commonSave => 'जतन करा';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'आवश्यक तास (स्वयंचलित): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'अंतिम तारीख साफ करा';

  @override
  String get courseFormClearStartTooltip => 'सुरुवातीची तारीख साफ करा';

  @override
  String get courseFormColorLabel => 'रंग';

  @override
  String get courseFormDateNotSet => 'निश्चित नाही';

  @override
  String courseFormDeadlineButton(String date) {
    return 'अंतिम तारीख: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS क्रेडिट';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value ता/ECTS';
  }

  @override
  String get courseFormNameLabel => 'नाव';

  @override
  String get courseFormNotesLabel => 'टिपा (पर्यायी)';

  @override
  String get courseFormSaving => 'जतन होत आहे…';

  @override
  String courseFormStartButton(String date) {
    return 'सुरुवात: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'बंद: $date पर्यंत दबाव नाही; आजच्या गतीत समाविष्ट नाही.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'चालू: वेळ आतापर्यंत विभागली आहे आणि आजच्या गतीत समाविष्ट आहे.';

  @override
  String get courseFormStartEarlyTitle =>
      'सुरुवात पुढे असली तरी आत्ताच सुरू करा';

  @override
  String get courseFormTitleAdd => 'अभ्यासक्रम जोडा';

  @override
  String get courseFormTitleEdit => 'अभ्यासक्रम संपादित करा';

  @override
  String get coursesAddTooltip => 'अभ्यासक्रम जोडा';

  @override
  String coursesDeleteBody(String name) {
    return '“$name” आणि त्याची सर्व अभ्यास सत्रे हटवायची? हे पूर्ववत करता येणार नाही.';
  }

  @override
  String get coursesDeleteTitle => 'अभ्यासक्रम हटवायचा?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'पहिला अभ्यासक्रम तयार करण्यासाठी “New course” वर टॅप करा.';

  @override
  String get coursesEmptyTitle => 'अद्याप अभ्यासक्रम नाहीत';

  @override
  String get coursesFilterAll => 'सर्व स्थिती';

  @override
  String get coursesFilterEmpty => 'या फिल्टरशी जुळणारा अभ्यासक्रम नाही';

  @override
  String get coursesNewCourse => 'नवीन अभ्यासक्रम';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily ता/दिवस आवश्यक';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily मि/दिवस आवश्यक';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily ता/दिवस • $weekly ता/आठवडा आवश्यक';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily मि/दिवस • $weekly मि/आठवडा आवश्यक';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily मि/दिवस • $weekly ता/आठवडा आवश्यक';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required ता • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'नमुना अभ्यासक्रम काढा';

  @override
  String coursesShownCount(String count) {
    return '$count दाखवले';
  }

  @override
  String coursesSortOption(String label) {
    return 'क्रमवारी: $label';
  }

  @override
  String get dashboardAllDone => 'सर्व पूर्ण';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours ता नोंदवले (बोनस)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count अभ्यासक्रम';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count अभ्यासक्रम · $upcoming आगामी आजच्या गतीत नाहीत';
  }

  @override
  String get dashboardCoursesTitle => 'अभ्यासक्रम';

  @override
  String dashboardDeadline(String date) {
    return 'अंतिम तारीख $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'अंतिम तारीख $date ($days दिवस बाकी)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'अंतिम तारीख $date (1 दिवस बाकी)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'अंतिम तारीख $date (मुदत संपली)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'अंतिम तारीख $date (आज)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'आजचे उद्दिष्ट — $hours ता नोंदवले';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'प्रत्येक अभ्यासक्रम पूर्ण — संपूर्ण यादीसाठी अभ्यासक्रम टॅब पहा.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'ECTS प्रगतीचा मागोवा घेण्यासाठी अभ्यासक्रम जोडा.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'मागे = $achieved/दिवस करत आहात, $need/दिवस आवश्यक';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'मागे = $achieved/दिवस करत आहात, $need/दिवस आवश्यक · लवकर सुरुवात';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'मागे: उरलेल्या तासांत आजची अंतिम तारीख गाठणारी निश्चित गती नाही';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'योग्य मार्गावर: अद्याप गती नाही — खात्रीसाठी पहिले सत्र नोंदवा';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days दिवसांत सुरू · $date पासून मोजणी';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days दिवसांत सुरू · $date पासून मोजणी · लवकर सुरुवात चालू';
  }

  @override
  String get dashboardFreshStart => 'नवी सुरुवात';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · $hoursता बाकी';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required ता';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours ता/दिवस';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes मि/दिवस';
  }

  @override
  String get dashboardLogSessionAction => 'अभ्यास सत्र नोंदवा';

  @override
  String get dashboardLogSessionTooltip => 'अभ्यास सत्र नोंदवा';

  @override
  String get dashboardNewBadge => 'नवीन';

  @override
  String get dashboardNoCourses => 'अद्याप अभ्यासक्रम नाहीत';

  @override
  String get dashboardNoDeadline => 'अंतिम तारीख नाही';

  @override
  String get dashboardNoDeadlines => 'अंतिम तारखा ठरलेल्या नाहीत';

  @override
  String get dashboardNoPaceDue => 'आज कोणतेही उद्दिष्ट नाही';

  @override
  String get dashboardNothingDue => 'काहीही थकलेले नाही';

  @override
  String get dashboardNothingToTrack => 'अद्याप मागोवा घेण्यासारखे काही नाही';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'आजचे उद्दिष्ट — $hoursता बाकी';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'पूर्ण करण्यासाठी $daily ता/दिवस आवश्यक';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'पूर्ण करण्यासाठी $daily मि/दिवस आवश्यक';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'पूर्ण करण्यासाठी $daily ता/दिवस · $weekly ता/आठवडा आवश्यक';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'पूर्ण करण्यासाठी $daily मि/दिवस · $weekly मि/आठवडा आवश्यक';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'पूर्ण करण्यासाठी $daily मि/दिवस · $weekly ता/आठवडा आवश्यक';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$date पासून $hours ता/दिवस आवश्यक · आजच्या गतीत नाही';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return '$date पासून $minutes मि/दिवस आवश्यक · आजच्या गतीत नाही';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'अंतिम तारीख नाही — $hoursता बाकी · दैनंदिन दबाव नाही';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date रोजी सुरू · $hoursता करायचे';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · अवास्तव';
  }

  @override
  String get dashboardProgramBare => 'कार्यक्रम';

  @override
  String get dashboardProgramEmptyHint =>
      'मागोवा सुरू करण्यासाठी अभ्यासक्रम जोडा';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required ता';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'कार्यक्रम $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days दिवसांची मुदत बाकी';
  }

  @override
  String get dashboardStartNotSet => 'निश्चित नाही';

  @override
  String dashboardStartsIn(String days) {
    return '$days दिवसांत सुरू';
  }

  @override
  String get dashboardStartsSoon => 'लवकरच सुरू';

  @override
  String get dashboardTipEmpty =>
      'पहिला अभ्यासक्रम जोडा — दैनंदिन गती व प्रगती येथे दिसेल.';

  @override
  String get dashboardTipFirst =>
      'पहिली 25 मिनिटे सर्वांत महत्त्वाची — ज्या अभ्यासक्रमाची अंतिम तारीख आधी, तो निवडा.';

  @override
  String get dashboardTodayBare => 'आज';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace ता';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'आज $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'आजची गती';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'आज $logged / $pace ता';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'भविष्यातील सुरुवात — आज दबाव नाही, आजच्या गतीत समाविष्ट नाही.';

  @override
  String get dashboardUpcomingTitle => 'आगामी';

  @override
  String get devToolsActivate => 'सक्रिय करा';

  @override
  String get devToolsActivateMessage =>
      'हे लपलेली ताण-चाचणी साधने उघडते (तयार केलेला डेटा भरते). फक्त विकासासाठी.';

  @override
  String get devToolsActivateTitle => 'देव मोड सक्रिय करायचा?';

  @override
  String get devToolsActivated => 'देव मोड सक्रिय झाला.';

  @override
  String get devToolsClearPumped => 'भरलेला डेटा साफ करा';

  @override
  String get devToolsClearPumpedMessage =>
      'तयार केलेले STRESS अभ्यासक्रम व सत्रे हटवते. तुमचा स्वतःचा डेटा जपला जातो.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'तयार केलेले STRESS अभ्यासक्रम व सत्रे हटवा.';

  @override
  String get devToolsClearPumpedTitle => 'भरलेला डेटा साफ करायचा?';

  @override
  String devToolsCleared(String count) {
    return '$count भरलेले अभ्यासक्रम साफ केले.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'दुसरी खात्री: यामुळे अभ्यासक्रम, याद्या, तक्ते व गती हिशोब फुगतील आणि काही सेकंद लागू शकतात. आता भरायचे?';

  @override
  String get devToolsConfirmPumpTitle => 'ताण-भरण्याची खात्री करा';

  @override
  String get devToolsContinue => 'पुढे चला';

  @override
  String get devToolsExit => 'देव मोडमधून बाहेर पडा';

  @override
  String get devToolsExitSubtitle => 'या डिव्हाइसवर देव साधने लपवा.';

  @override
  String get devToolsPumpData => 'डेटा भरा';

  @override
  String get devToolsPumpMessage =>
      'हे वास्तववादी तयार सत्र जोडते (~10 अभ्यासक्रम, गेल्या 12 आठवड्यांतील ~800 सत्रे). तुमचा विद्यमान डेटा जपला जातो. पुढे जायचे?';

  @override
  String get devToolsPumpSubtitle =>
      'तयार सत्र जोडा (~10 अभ्यासक्रम, ~800 सत्रे, 12 आठवडे). विद्यमान डेटा जपला जातो.';

  @override
  String get devToolsPumpTile => 'चाचणी डेटा भरा';

  @override
  String get devToolsPumpTitle => 'चाचणी डेटा भरायचा?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses अभ्यासक्रम, $sessions सत्रे भरली.';
  }

  @override
  String get devToolsPumping => 'चाचणी डेटा भरत आहे…';

  @override
  String get devToolsRemoveAll => 'सर्व डेटा काढा';

  @override
  String get devToolsRemoveAllMessage =>
      'देव शॉर्टकट: हे सर्व अभ्यासक्रम, सत्रे व सेटिंग्ज कायमचे हटवते. हे पूर्ववत करता येणार नाही.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'देव शॉर्टकट: सर्व अभ्यासक्रम, सत्रे व सेटिंग्ज हटवा.';

  @override
  String get devToolsRemoveAllTitle => 'सर्व डेटा काढायचा?';

  @override
  String get navCourses => 'अभ्यासक्रम';

  @override
  String get navDashboard => 'डॅशबोर्ड';

  @override
  String get navSettings => 'सेटिंग्ज';

  @override
  String get navStatistics => 'आकडेवारी';

  @override
  String get navStudyLog => 'अभ्यास नोंद';

  @override
  String get sampleBadge => 'नमुना';

  @override
  String get sessionFormCourseLabel => 'अभ्यासक्रम';

  @override
  String sessionFormDateButton(String date) {
    return 'तारीख: $date';
  }

  @override
  String get sessionFormDurationError => 'कालावधी शून्यापेक्षा जास्त असावा.';

  @override
  String get sessionFormHoursLabel => 'तास';

  @override
  String get sessionFormLogAction => 'सत्र नोंदवा';

  @override
  String get sessionFormMinutesLabel => 'मिनिटे';

  @override
  String get sessionFormNoCourseError => 'अभ्यासक्रम निवडा.';

  @override
  String get sessionFormNoCoursesHint =>
      'सत्र नोंदवण्यासाठी आधी अभ्यासक्रम जोडा.';

  @override
  String get sessionFormNotesLabel => 'टिपा (पर्यायी)';

  @override
  String get sessionFormSaving => 'जतन होत आहे…';

  @override
  String get sessionFormTitleAdd => 'अभ्यास सत्र नोंदवा';

  @override
  String get sessionFormTitleEdit => 'अभ्यास सत्र संपादित करा';

  @override
  String sessionFormTotalHours(String hours) {
    return 'एकूण: $hours ता';
  }

  @override
  String get settingsAccent => 'थीम रंग';

  @override
  String get settingsAccentBerry => 'बेरी';

  @override
  String get settingsAccentClay => 'माती';

  @override
  String get settingsAccentForest => 'जंगल';

  @override
  String get settingsAccentSlate => 'स्लेट';

  @override
  String get settingsAccentTeal => 'टील';

  @override
  String get settingsAccentUpdated => 'थीम रंग अद्ययावत केला.';

  @override
  String get settingsAllDataDeleted => 'सर्व डेटा हटवला.';

  @override
  String get settingsAppearance => 'स्वरूप (गडद / उजळ)';

  @override
  String get settingsCheckingSample => 'नमुना डेटा तपासत आहे…';

  @override
  String get settingsClear => 'साफ करा';

  @override
  String get settingsClearSample => 'नमुना डेटा साफ करा';

  @override
  String get settingsClearSampleMessage =>
      'हे उदाहरण अभ्यासक्रम व सत्रे काढते. तुम्ही स्वतः जोडलेले अभ्यासक्रम किंवा सत्रे काढली जात नाहीत.';

  @override
  String get settingsClearSampleSubtitle =>
      'दिलेले नमुना अभ्यासक्रम व सत्रे काढा. तुमचा स्वतःचा डेटा जपला जातो.';

  @override
  String get settingsClearSampleTitle => 'नमुना डेटा साफ करायचा?';

  @override
  String get settingsCopy => 'प्रतिलिपी';

  @override
  String get settingsDailyError => '0 किंवा धन संख्या मिनिटांत लिहा.';

  @override
  String get settingsDailyLabel => 'दररोज मिनिटे (0 = उद्दिष्ट नाही)';

  @override
  String get settingsDailyTarget => 'दैनंदिन अभ्यास उद्दिष्ट';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes मि/दिवस';
  }

  @override
  String get settingsDailyUpdated => 'दैनंदिन उद्दिष्ट अद्ययावत केले.';

  @override
  String get settingsData => 'डेटा';

  @override
  String get settingsDeleteEverything => 'सर्वकाही हटवा';

  @override
  String get settingsDevMode => 'देव मोड';

  @override
  String get settingsDisplay => 'प्रदर्शन';

  @override
  String get settingsDisplayComfortable => 'आरामदायी';

  @override
  String get settingsDisplayCompact => 'संक्षिप्त';

  @override
  String get settingsDisplayLarge => 'मोठे';

  @override
  String get settingsDisplaySize => 'मजकूर व घटक आकार';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'प्रदर्शन आकार अद्ययावत केला.';

  @override
  String get settingsExport => 'डेटा निर्यात';

  @override
  String get settingsExportCopied => 'निर्यात क्लिपबोर्डवर प्रतिलिपी केली.';

  @override
  String get settingsExportSubtitle =>
      'सर्व अभ्यासक्रम, सत्रे व सेटिंग्ज JSON म्हणून प्रतिलिपी करा.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses अभ्यासक्रम · $sessions सत्रे · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (छाटले — संपूर्ण बॅकअप $kb KB, सर्वांसाठी प्रतिलिपी वापरा)';
  }

  @override
  String get settingsFirstWeekday => 'आठवड्याचा पहिला दिवस';

  @override
  String get settingsFirstWeekdayUpdated =>
      'आठवड्याचा पहिला दिवस अद्ययावत केला.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds से धरून ठेवा)';
  }

  @override
  String get settingsHoldToReplace => 'सर्व बदलण्यासाठी धरून ठेवा';

  @override
  String get settingsHoursError => 'शून्यापेक्षा मोठी संख्या लिहा.';

  @override
  String get settingsHoursHelper =>
      'पूर्वनिर्धारित 30. बदलामुळे आवश्यकता पुन्हा मोजल्या जातात; नोंदी जपल्या जातात.';

  @override
  String get settingsHoursLabel => 'प्रति ECTS क्रेडिट तास';

  @override
  String get settingsHoursPerEcts => 'प्रति ECTS तास';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value ता';
  }

  @override
  String get settingsHoursUpdated => 'प्रति ECTS तास अद्ययावत केले.';

  @override
  String get settingsImport => 'डेटा आयात';

  @override
  String get settingsImportAppend => 'जोडा';

  @override
  String get settingsImportAppendAction => 'आयात (जोडा)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'डेटा जोडला: $courses अभ्यासक्रम, $sessions सत्रे जोडली.';
  }

  @override
  String get settingsImportInfo =>
      'जोडणे बॅकअप सध्याच्या डेटाशेजारी ठेवते (सेटिंग्ज जपल्या जातात). बदलणे आधी सर्व अभ्यासक्रम, सत्रे व सेटिंग्ज हटवते.';

  @override
  String get settingsImportLabel => 'निर्यात केलेले JSON चिकटवा';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses अभ्यासक्रम · $sessions सत्रे';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· निर्यात $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· योजना v$schema';
  }

  @override
  String get settingsImportReplace => 'बदला';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'बदलणे आधी सर्वकाही हटवते. खात्रीसाठी खालचे बटण $seconds सेकंद धरून ठेवा.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'डेटा बदलला: $courses अभ्यासक्रम, $sessions सत्रे परत आणली.';
  }

  @override
  String get settingsImportSubtitle =>
      'आधी निर्यात केलेल्या JSON बॅकअपमधून सर्व डेटा बदला.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'धरून ठेवा… $remaining से';
  }

  @override
  String get settingsNoSample => 'नमुना डेटा नाही';

  @override
  String get settingsNoSampleSubtitle => 'दिलेला नमुना डेटा आधीच साफ केला आहे.';

  @override
  String get settingsNoTarget => 'उद्दिष्ट ठरलेले नाही';

  @override
  String get settingsOverloadError => '5–100 मधील संख्या लिहा (ता/आठवडा).';

  @override
  String get settingsOverloadHelper =>
      'यावरील येणारे भार-आठवडे लाल चिन्हांकित होतात. पूर्णवेळ अभ्यास ~35–40 ता/आठवडा.';

  @override
  String settingsOverloadHours(String value) {
    return '$value ता';
  }

  @override
  String get settingsOverloadLabel => 'दर आठवड्याला तास (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/आठवडा लाल चिन्हांकित होईल';
  }

  @override
  String get settingsOverloadThreshold => 'साप्ताहिक अतिभार मर्यादा';

  @override
  String get settingsOverloadUpdated => 'अतिभार मर्यादा अद्ययावत केली.';

  @override
  String get settingsPaceTolerance => 'पुढे / मागे सहनशीलता';

  @override
  String get settingsPasteValidBackup => 'आधी वैध बॅकअप चिकटवा';

  @override
  String get settingsReset => 'पूर्ववत करा';

  @override
  String get settingsResetAll => 'सर्व डेटा पूर्ववत करा';

  @override
  String get settingsResetAllMessage =>
      'हे सर्व अभ्यासक्रम, सत्रे व सेटिंग्ज कायमचे हटवते. हे पूर्ववत करता येणार नाही. गरज असल्यास आधी बॅकअप निर्यात करा.';

  @override
  String get settingsResetAllSubtitle =>
      'सर्व अभ्यासक्रम, सत्रे व सेटिंग्ज हटवा.';

  @override
  String get settingsResetAllTitle => 'सर्व डेटा पूर्ववत करायचा?';

  @override
  String get settingsResetSettings => 'सेटिंग्ज पूर्ववत करा';

  @override
  String get settingsResetSettingsDone => 'सेटिंग्ज पूर्वनिर्धारित केल्या.';

  @override
  String get settingsResetSettingsMessage =>
      'प्रति ECTS तास (30), दैनंदिन उद्दिष्ट (नाही), आठवड्याचा पहिला दिवस (सोमवार), थीम (सिस्टम), सहनशीलता (5 दिवस), अतिभार (35 ता/आठवडा), आकार (आरामदायी), रंग (स्लेट) परत आणते. अभ्यासक्रम व सत्रे जपली जातात.';

  @override
  String get settingsResetSettingsSubtitle =>
      'पूर्वनिर्धारित परत आणा: 30 ता/ECTS, उद्दिष्ट नाही, सोमवार, सिस्टम थीम, 5 दिवस सहनशीलता, 35 ता/आठवडा अतिभार, आरामदायी आकार, स्लेट रंग.';

  @override
  String get settingsResetSettingsTitle => 'सेटिंग्ज पूर्ववत करायच्या?';

  @override
  String get settingsSampleData => 'नमुना डेटा';

  @override
  String settingsSampleDataError(String error) {
    return 'त्रुटी: $error';
  }

  @override
  String get settingsStudySettings => 'अभ्यास सेटिंग्ज';

  @override
  String get settingsThemeDark => 'गडद';

  @override
  String get settingsThemeLight => 'उजळ';

  @override
  String get settingsThemeSystem => 'सिस्टम पूर्वनिर्धारित';

  @override
  String get settingsThemeTitle => 'थीम';

  @override
  String get settingsThemeUpdated => 'थीम अद्ययावत केली.';

  @override
  String settingsToleranceDays(String value) {
    return '$value दिवस';
  }

  @override
  String get settingsToleranceError => '0–30 मधील दिवस संख्या लिहा.';

  @override
  String get settingsToleranceHelper =>
      'पुढे राहण्यासाठी +N दिवस जादा, मागे −N दिवस लागतात. 5 = स्थिर, 0 = संवेदनशील.';

  @override
  String get settingsToleranceLabel => 'कामाचे दिवस (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance काम';
  }

  @override
  String get settingsToleranceUpdated => 'सहनशीलता अद्ययावत केली.';

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
  String get settingsWeekdayTuesday => 'मंगळवार';

  @override
  String get settingsWeekdayWednesday => 'बुधवार';

  @override
  String get sortDeadline => 'अंतिम तारीख';

  @override
  String get sortName => 'नाव';

  @override
  String get sortProgress => 'प्रगती';

  @override
  String get sortStatus => 'स्थिती';

  @override
  String get startupTitle => 'ECTS Tracker सुरू करता आला नाही';

  @override
  String get statsActiveDays => 'सक्रिय दिवस';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days दिवस सक्रिय';
  }

  @override
  String get statsAddDeadlines => 'भाराचा अंदाज घेण्यासाठी अंतिम तारखा जोडा.';

  @override
  String get statsComingLoad => 'येणारा भार';

  @override
  String get statsConsistency => 'सातत्य';

  @override
  String get statsConsistencyHint =>
      'गेल्या 30 दिवसांतील अभ्यास दिवस. रोज छोटी पावले घाईघाईच्या अभ्यासापेक्षा चांगली.';

  @override
  String statsConsistencyScore(String percent) {
    return 'गेल्या 30 दिवसांपैकी $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return 'अभ्यासक्रम $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'अ$id';
  }

  @override
  String get statsDidPerDay => 'केले / दिवस (14दि)';

  @override
  String get statsEmpty => 'अद्याप सत्रे नाहीत';

  @override
  String get statsGap => 'तूट';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value ता';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursता';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours ता';
  }

  @override
  String get statsLast30Days => 'गेले 30 दिवस';

  @override
  String get statsLast7Days => 'गेले 7 दिवस';

  @override
  String get statsNeedPerDay => 'आवश्यक / दिवस';

  @override
  String get statsNext8Weeks => 'पुढील 8 आठवडे';

  @override
  String get statsOfLast30DaysVolume => 'गेल्या 30 दिवसांच्या घनफळापैकी';

  @override
  String statsOverloadWarning(String threshold) {
    return 'अतिभार आठवडे >$thresholdता लाल चिन्हांकित — अंतिम तारीख पुढे ढकला किंवा व्याप्ती कमी करा.';
  }

  @override
  String get statsOverview => 'आढावा';

  @override
  String get statsPaceCovers => 'मागील गती गरज भागवते. ओघ कायम ठेवा.';

  @override
  String statsPaceShort(String gap) {
    return 'मागील गती $gap ता/दिवस कमी — एक गट जोडा किंवा व्याप्ती कमी करा.';
  }

  @override
  String get statsPastVsNeeded => 'मागील विरुद्ध आवश्यक';

  @override
  String statsPeakPerWeek(String peak) {
    return 'शिखर $peakता/आ';
  }

  @override
  String get statsPerCourse => 'प्रति अभ्यासक्रम';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done ता / $required ता · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'सत्रे';

  @override
  String statsSuggestedOrder(String order) {
    return 'सुचवलेला क्रम: $order (आधी जवळची अंतिम तारीख)';
  }

  @override
  String get statsTotal => 'एकूण';

  @override
  String get statsTotalVolume => 'एकूण घनफळ';

  @override
  String get statusAhead => 'पुढे';

  @override
  String get statusBehind => 'मागे';

  @override
  String get statusCompleted => 'पूर्ण';

  @override
  String get statusOnTrack => 'योग्य मार्गावर';

  @override
  String get statusOverdue => 'मुदत संपलेली';

  @override
  String get studyLogDeleteBody =>
      'हे अभ्यास सत्र हटवायचे? हे पूर्ववत करता येणार नाही.';

  @override
  String get studyLogDeleteTitle => 'सत्र हटवायचे?';

  @override
  String get studyLogEmptyHint =>
      'अभ्यास वेळेचा मागोवा घेण्यासाठी सत्र नोंदवा.';

  @override
  String get studyLogEmptyTitle => 'अद्याप अभ्यास सत्रे नाहीत';

  @override
  String get studyLogFabLabel => 'सत्र नोंदवा';

  @override
  String get studyLogFabTooltip => 'सत्र नोंदवा';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours ता';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'नमुना सत्र काढा';

  @override
  String get studyLogThisWeek => 'हा आठवडा';

  @override
  String get studyLogToday => 'आज';

  @override
  String studyLogUnknownCourse(String id) {
    return 'अभ्यासक्रम $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'अ$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS शून्यापेक्षा जास्त असावे';

  @override
  String get validationCourseEctsRequired => 'ECTS क्रेडिट लिहा';

  @override
  String get validationCourseNameRequired => 'नाव आवश्यक';

  @override
  String get validationCourseNameTooLong => 'नाव खूप लांब';

  @override
  String get validationSessionCourseRequired => 'अभ्यासक्रम निवडा';

  @override
  String get validationSessionDurationRequired => 'कालावधी लिहा';

  @override
  String get widgetNoProgress => 'अद्याप प्रगती नाही';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsLiquidGlass => 'लिक्विड ग्लास';

  @override
  String get settingsLiquidGlassSubtitle =>
      'फ्रॉस्टेड काचेची कार्डे आणि बार. बंद केल्यास पारंपरिक ठोस रूप राहते.';

  @override
  String get settingsLiquidGlassOn => 'चालू';

  @override
  String get settingsLiquidGlassOff => 'बंद';

  @override
  String get settingsLiquidGlassUpdated => 'लिक्विड ग्लास अद्ययावत केला.';

  @override
  String get devToolsReminderPreview => 'स्मरणपत्र पूर्वावलोकन';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'आत्ता कशाची सूचना येईल ते पहा. Windows-सुरक्षित चाचणी फीड.';

  @override
  String get reminderPreviewTitle => 'स्मरणपत्र पूर्वावलोकन';

  @override
  String get reminderPreviewNow => 'पूर्वावलोकन वेळ';

  @override
  String get reminderPreviewReset => 'आत्ता';

  @override
  String get reminderPreviewEmpty => 'सर्व शांत — या वेळी कोणतीही सूचना नाही.';

  @override
  String get reminderPreviewCustom => 'सानुकूल वेळापत्रके (डेमो)';

  @override
  String get reminderPreviewNoFire => 'कोणतीही आगामी सूचना नाही.';

  @override
  String get reminderKindDaily => 'दैनंदिन';

  @override
  String get reminderKindBehind => 'मागे';

  @override
  String get reminderKindDeadline => 'अंतिम तारीख';

  @override
  String get reminderKindOverdue => 'मुदत संपलेली';

  @override
  String get reminderKindStreak => 'सलग';

  @override
  String get reminderKindCustom => 'सानुकूल';

  @override
  String get settingsReminders => 'अभ्यास स्मरणपत्रे';

  @override
  String get settingsRemindersOff => 'बंद — दैनंदिन स्मरणपत्र चालू करा.';

  @override
  String get settingsReminderTime => 'स्मरणपत्र वेळ';

  @override
  String get settingsReminderDenied =>
      'सूचना अवरोधित आहेत — सिस्टम सेटिंग्जमध्ये सक्षम करा.';
}
