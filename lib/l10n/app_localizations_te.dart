// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'రద్దు చేయి';

  @override
  String get commonClose => 'మూసివేయి';

  @override
  String get commonDelete => 'తొలగించు';

  @override
  String get commonEdit => 'సవరించు';

  @override
  String get commonError => 'లోపం';

  @override
  String get commonNone => 'ఏదీ లేదు';

  @override
  String get commonSave => 'సేవ్ చేయి';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'అవసరమైన గంటలు (ఆటో): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'గడువును తొలగించు';

  @override
  String get courseFormClearStartTooltip => 'ప్రారంభ తేదీని తొలగించు';

  @override
  String get courseFormColorLabel => 'రంగు';

  @override
  String get courseFormDateNotSet => 'సెట్ చేయలేదు';

  @override
  String courseFormDeadlineButton(String date) {
    return 'గడువు: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS క్రెడిట్లు';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value గం/ECTS';
  }

  @override
  String get courseFormNameLabel => 'పేరు';

  @override
  String get courseFormNotesLabel => 'గమనికలు (ఐచ్ఛికం)';

  @override
  String get courseFormSaving => 'సేవ్ అవుతోంది…';

  @override
  String courseFormStartButton(String date) {
    return 'ప్రారంభం: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'ఆఫ్: $date వరకు ఒత్తిడి లేదు; నేటి వేగంలో చేర్చబడదు.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'ఆన్: సమయం ఇప్పటి వరకు విభజించబడి నేటి వేగంలో లెక్కించబడుతుంది.';

  @override
  String get courseFormStartEarlyTitle =>
      'భవిష్యత్ ప్రారంభం ఉన్నా ఇప్పుడే మొదలుపెట్టు';

  @override
  String get courseFormTitleAdd => 'కోర్సు జోడించు';

  @override
  String get courseFormTitleEdit => 'కోర్సును సవరించు';

  @override
  String get coursesAddTooltip => 'కోర్సు జోడించు';

  @override
  String coursesDeleteBody(String name) {
    return '\"$name\" మరియు దాని అన్ని స్టడీ సెషన్లను తొలగించాలా? దీన్ని రద్దు చేయలేరు.';
  }

  @override
  String get coursesDeleteTitle => 'కోర్సును తొలగించాలా?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'మీ మొదటి కోర్సును సృష్టించడానికి “కొత్త కోర్సు” నొక్కండి.';

  @override
  String get coursesEmptyTitle => 'ఇంకా కోర్సులు లేవు';

  @override
  String get coursesFilterAll => 'అన్ని స్థితులు';

  @override
  String get coursesFilterEmpty => 'ఈ ఫిల్టర్‌కు ఏ కోర్సూ సరిపోలలేదు';

  @override
  String get coursesNewCourse => 'కొత్త కోర్సు';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily గం/రోజు అవసరం';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily నిమి/రోజు అవసరం';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily గం/రోజు • $weekly గం/వారం అవసరం';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily నిమి/రోజు • $weekly నిమి/వారం అవసరం';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily నిమి/రోజు • $weekly గం/వారం అవసరం';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required గం • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'నమూనా కోర్సును తొలగించు';

  @override
  String coursesShownCount(String count) {
    return '$count చూపబడ్డాయి';
  }

  @override
  String coursesSortOption(String label) {
    return 'క్రమబద్ధీకరణ: $label';
  }

  @override
  String get dashboardAllDone => 'అన్నీ పూర్తయ్యాయి';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours గం నమోదైంది (బోనస్)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count కోర్సు(లు)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count కోర్సు(లు) · $upcoming రాబోయేవి నేటి వేగంలో లేవు';
  }

  @override
  String get dashboardCoursesTitle => 'కోర్సులు';

  @override
  String dashboardDeadline(String date) {
    return 'గడువు $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'గడువు $date ($days రోజులు మిగిలాయి)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'గడువు $date (1 రోజు మిగిలింది)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'గడువు $date (మీరిపోయింది)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'గడువు $date (ఈరోజు)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'ఈరోజు గడువు — $hours గం నమోదైంది';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'అన్ని కోర్సులు పూర్తయ్యాయి — పూర్తి జాబితా కోసం కోర్సులు ట్యాబ్ చూడండి.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'మీ ECTS పురోగతిని ట్రాక్ చేయడానికి కోర్సును జోడించండి.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'వెనుకబడింది = $achieved/రోజు చేస్తున్నారు, $need/రోజు అవసరం';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'వెనుకబడింది = $achieved/రోజు, అవసరం $need/రోజు · ముందస్తు ప్రారంభం';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'వెనుకబడింది: గంటలు మిగిలి నేటి గడువుకు సరిపోయే వేగం లేదు';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'సక్రమంగా ఉంది: ఇంకా వేగం లేదు — నిర్ధారించడానికి మొదటి సెషన్ నమోదు చేయండి';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days రోజుల్లో మొదలవుతుంది · $date నుండి లెక్క';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days రోజుల్లో మొదలవుతుంది · $date నుండి లెక్క · ముందస్తు ప్రారంభం ఆన్';
  }

  @override
  String get dashboardFreshStart => 'కొత్త ప్రారంభం';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · $hoursగం మిగిలింది';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required గం';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours గం/రోజు';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes నిమి/రోజు';
  }

  @override
  String get dashboardLogSessionAction => 'స్టడీ సెషన్ నమోదు చేయి';

  @override
  String get dashboardLogSessionTooltip => 'స్టడీ సెషన్ నమోదు చేయి';

  @override
  String get dashboardNewBadge => 'కొత్తది';

  @override
  String get dashboardNoCourses => 'ఇంకా కోర్సులు లేవు';

  @override
  String get dashboardNoDeadline => 'గడువు లేదు';

  @override
  String get dashboardNoDeadlines => 'గడువులు షెడ్యూల్ చేయలేదు';

  @override
  String get dashboardNoPaceDue => 'ఈరోజు గడువు వేగం లేదు';

  @override
  String get dashboardNothingDue => 'గడువు ఏమీ లేదు';

  @override
  String get dashboardNothingToTrack => 'ట్రాక్ చేయడానికి ఇంకా ఏమీ లేదు';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'ఈరోజు గడువు — $hoursగం మిగిలింది';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'పూర్తి చేయడానికి $daily గం/రోజు అవసరం';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'పూర్తి చేయడానికి $daily నిమి/రోజు అవసరం';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'పూర్తికి $daily గం/రోజు · $weekly గం/వారం అవసరం';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'పూర్తికి $daily నిమి/రోజు · $weekly నిమి/వారం అవసరం';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'పూర్తికి $daily నిమి/రోజు · $weekly గం/వారం అవసరం';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$date నుండి $hours గం/రోజు అవసరం · నేటి వేగంలో లేదు';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return '$date నుండి $minutes నిమి/రోజు అవసరం · నేటి వేగంలో లేదు';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'గడువు లేదు — $hoursగం మిగిలింది · రోజువారీ ఒత్తిడి లేదు';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$dateన మొదలవుతుంది · $hoursగం చేయాలి';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · అవాస్తవికం';
  }

  @override
  String get dashboardProgramBare => 'ప్రోగ్రామ్';

  @override
  String get dashboardProgramEmptyHint =>
      'ట్రాకింగ్ ప్రారంభించడానికి కోర్సు జోడించండి';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required గం';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'ప్రోగ్రామ్ $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days రోజుల గడువు మిగిలింది';
  }

  @override
  String get dashboardStartNotSet => 'సెట్ చేయలేదు';

  @override
  String dashboardStartsIn(String days) {
    return '$daysరోజుల్లో మొదలవుతుంది';
  }

  @override
  String get dashboardStartsSoon => 'త్వరలో మొదలవుతుంది';

  @override
  String get dashboardTipEmpty =>
      'మీ మొదటి కోర్సును జోడించండి — మీ రోజువారీ వేగం, పురోగతి ఇక్కడ కనిపిస్తాయి.';

  @override
  String get dashboardTipFirst =>
      'మొదటి 25 నిమిషాలే ముఖ్యం — ముందు గడువు ఉన్న కోర్సును ఎంచుకోండి.';

  @override
  String get dashboardTodayBare => 'ఈరోజు';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace గం';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'ఈరోజు $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'నేటి వేగం';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'ఈరోజు $logged / $pace గం';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'భవిష్యత్ ప్రారంభాలు — ఈరోజు ఒత్తిడి లేదు, నేటి వేగంలో చేర్చబడవు.';

  @override
  String get dashboardUpcomingTitle => 'రాబోయేవి';

  @override
  String get devToolsActivate => 'సక్రియం చేయి';

  @override
  String get devToolsActivateMessage =>
      'ఇది దాచిన స్ట్రెస్-టెస్ట్ సాధనాలను అన్‌లాక్ చేస్తుంది (ఉత్పత్తి డేటా నింపుతుంది). అభివృద్ధి కోసం మాత్రమే.';

  @override
  String get devToolsActivateTitle => 'డెవ్ మోడ్‌ను సక్రియం చేయాలా?';

  @override
  String get devToolsActivated => 'డెవ్ మోడ్ సక్రియమైంది.';

  @override
  String get devToolsClearPumped => 'నింపిన డేటాను క్లియర్ చేయి';

  @override
  String get devToolsClearPumpedMessage =>
      'ఉత్పత్తి చేసిన STRESS కోర్సులు, వాటి సెషన్లను తొలగిస్తుంది. మీ డేటా అలాగే ఉంటుంది.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'ఉత్పత్తి చేసిన STRESS కోర్సులు, సెషన్లను తొలగించు.';

  @override
  String get devToolsClearPumpedTitle => 'నింపిన డేటాను క్లియర్ చేయాలా?';

  @override
  String devToolsCleared(String count) {
    return '$count నింపిన కోర్సు(లు) క్లియర్ చేయబడ్డాయి.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'రెండో నిర్ధారణ: ఇది కోర్సులు, జాబితాలు, చార్టులు, వేగ లెక్కలను పెంచుతుంది, కొన్ని సెకన్లు పట్టవచ్చు. ఇప్పుడు నింపాలా?';

  @override
  String get devToolsConfirmPumpTitle => 'స్ట్రెస్ పంప్‌ను నిర్ధారించు';

  @override
  String get devToolsContinue => 'కొనసాగించు';

  @override
  String get devToolsExit => 'డెవ్ మోడ్ నుండి నిష్క్రమించు';

  @override
  String get devToolsExitSubtitle => 'ఈ పరికరంలో డెవ్ సాధనాలను దాచు.';

  @override
  String get devToolsPumpData => 'డేటా నింపు';

  @override
  String get devToolsPumpMessage =>
      'ఇది వాస్తవిక ఉత్పత్తి సెమిస్టర్‌ను చేరుస్తుంది (~10 కోర్సులు, గత 12 వారాల్లో ~800 సెషన్లు). మీ ప్రస్తుత డేటా అలాగే ఉంటుంది. కొనసాగించాలా?';

  @override
  String get devToolsPumpSubtitle =>
      'ఉత్పత్తి సెమిస్టర్ చేర్చు (~10 కోర్సులు, ~800 సెషన్లు, 12 వారాలు). ప్రస్తుత డేటా అలాగే ఉంటుంది.';

  @override
  String get devToolsPumpTile => 'టెస్ట్ డేటా నింపు';

  @override
  String get devToolsPumpTitle => 'టెస్ట్ డేటా నింపాలా?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses కోర్సులు, $sessions సెషన్లు నింపబడ్డాయి.';
  }

  @override
  String get devToolsPumping => 'టెస్ట్ డేటా నింపుతోంది…';

  @override
  String get devToolsRemoveAll => 'మొత్తం డేటా తొలగించు';

  @override
  String get devToolsRemoveAllMessage =>
      'డెవ్ షార్ట్‌కట్: ఇది అన్ని కోర్సులు, సెషన్లు, సెట్టింగులను శాశ్వతంగా తొలగిస్తుంది. దీన్ని రద్దు చేయలేరు.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'డెవ్ షార్ట్‌కట్: అన్ని కోర్సులు, సెషన్లు, సెట్టింగులు తొలగించు.';

  @override
  String get devToolsRemoveAllTitle => 'మొత్తం డేటా తొలగించాలా?';

  @override
  String get navCourses => 'కోర్సులు';

  @override
  String get navDashboard => 'డాష్‌బోర్డ్';

  @override
  String get navSettings => 'సెట్టింగ్‌లు';

  @override
  String get navStatistics => 'గణాంకాలు';

  @override
  String get navStudyLog => 'స్టడీ లాగ్';

  @override
  String get sampleBadge => 'నమూనా';

  @override
  String get sessionFormCourseLabel => 'కోర్సు';

  @override
  String sessionFormDateButton(String date) {
    return 'తేదీ: $date';
  }

  @override
  String get sessionFormDurationError => 'వ్యవధి సున్నా కంటే ఎక్కువ ఉండాలి.';

  @override
  String get sessionFormHoursLabel => 'గంటలు';

  @override
  String get sessionFormLogAction => 'సెషన్ నమోదు చేయి';

  @override
  String get sessionFormMinutesLabel => 'నిమిషాలు';

  @override
  String get sessionFormModeManual => 'మాన్యువల్';

  @override
  String get sessionFormModeTimer => 'టైమర్';

  @override
  String get sessionFormNoCourseError => 'కోర్సును ఎంచుకోండి.';

  @override
  String get sessionFormNoCoursesHint =>
      'సెషన్ నమోదు చేయడానికి ముందు కోర్సు జోడించండి.';

  @override
  String get sessionFormNotesLabel => 'గమనికలు (ఐచ్ఛికం)';

  @override
  String get sessionFormSaving => 'సేవ్ అవుతోంది…';

  @override
  String get sessionFormTitleAdd => 'స్టడీ సెషన్ నమోదు చేయి';

  @override
  String get sessionFormTitleEdit => 'స్టడీ సెషన్ సవరించు';

  @override
  String sessionFormTotalHours(String hours) {
    return 'మొత్తం: $hours గం';
  }

  @override
  String get settingsAccent => 'థీమ్ రంగు';

  @override
  String get settingsAccentBerry => 'బెర్రీ';

  @override
  String get settingsAccentClay => 'క్లే';

  @override
  String get settingsAccentForest => 'అడవి';

  @override
  String get settingsAccentSlate => 'స్లేట్';

  @override
  String get settingsAccentTeal => 'టీల్';

  @override
  String get settingsAccentUpdated => 'థీమ్ రంగు నవీకరించబడింది.';

  @override
  String get settingsAllDataDeleted => 'మొత్తం డేటా తొలగించబడింది.';

  @override
  String get settingsAppearance => 'స్వరూపం (డార్క్ / లైట్)';

  @override
  String get settingsCheckingSample => 'నమూనా డేటా తనిఖీ చేస్తోంది…';

  @override
  String get settingsClear => 'క్లియర్ చేయి';

  @override
  String get settingsClearSample => 'నమూనా డేటా క్లియర్ చేయి';

  @override
  String get settingsClearSampleMessage =>
      'ఇది ఉదాహరణ కోర్సులు, సెషన్లను తొలగిస్తుంది. మీరు జోడించినవి తొలగించబడవు.';

  @override
  String get settingsClearSampleSubtitle =>
      'సీడ్ చేసిన ఉదాహరణ కోర్సులు, సెషన్లను తొలగించు. మీ డేటా అలాగే ఉంటుంది.';

  @override
  String get settingsClearSampleTitle => 'నమూనా డేటా క్లియర్ చేయాలా?';

  @override
  String get settingsCopy => 'కాపీ చేయి';

  @override
  String get settingsDailyError => '0 లేదా ధనాత్మక నిమిషాల సంఖ్య నమోదు చేయండి.';

  @override
  String get settingsDailyLabel => 'రోజుకు నిమిషాలు (0 = లక్ష్యం లేదు)';

  @override
  String get settingsDailyTarget => 'రోజువారీ స్టడీ లక్ష్యం';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes నిమి/రోజు';
  }

  @override
  String get settingsDailyUpdated => 'రోజువారీ లక్ష్యం నవీకరించబడింది.';

  @override
  String get settingsData => 'డేటా';

  @override
  String get settingsDeleteEverything => 'అన్నీ తొలగించు';

  @override
  String get settingsDevMode => 'డెవ్ మోడ్';

  @override
  String get settingsDisplay => 'డిస్‌ప్లే';

  @override
  String get settingsDisplayComfortable => 'సౌకర్యవంతం';

  @override
  String get settingsDisplayCompact => 'కాంపాక్ట్';

  @override
  String get settingsDisplayLarge => 'పెద్దది';

  @override
  String get settingsDisplaySize => 'టెక్స్ట్ & ఎలిమెంట్ పరిమాణం';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'డిస్‌ప్లే పరిమాణం నవీకరించబడింది.';

  @override
  String get settingsExport => 'డేటా ఎగుమతి చేయి';

  @override
  String get settingsExportCopied => 'ఎగుమతి క్లిప్‌బోర్డ్‌కు కాపీ చేయబడింది.';

  @override
  String get settingsExportSubtitle =>
      'అన్ని కోర్సులు, సెషన్లు, సెట్టింగులను JSONగా కాపీ చేయండి.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses కోర్సు(లు) · $sessions సెషన్(లు) · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (కుదించబడింది — పూర్తి బ్యాకప్ $kb KB, అన్నింటికీ కాపీ వాడండి)';
  }

  @override
  String get settingsFirstWeekday => 'వారం మొదటి రోజు';

  @override
  String get settingsFirstWeekdayUpdated => 'వారం మొదటి రోజు నవీకరించబడింది.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($secondsసె నొక్కి ఉంచండి)';
  }

  @override
  String get settingsHoldToReplace => 'అన్నీ భర్తీ చేయడానికి నొక్కి ఉంచండి';

  @override
  String get settingsHoursError => 'సున్నా కంటే ఎక్కువ సంఖ్య నమోదు చేయండి.';

  @override
  String get settingsHoursHelper =>
      'డిఫాల్ట్ 30. మార్చితే అవసరాలు తిరిగి లెక్కించబడతాయి; లాగ్‌లు అలాగే ఉంటాయి.';

  @override
  String get settingsHoursLabel => 'ECTS క్రెడిట్‌కు గంటలు';

  @override
  String get settingsHoursPerEcts => 'ECTSకు గంటలు';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value గం';
  }

  @override
  String get settingsHoursUpdated => 'ECTSకు గంటలు నవీకరించబడ్డాయి.';

  @override
  String get settingsImport => 'డేటా దిగుమతి చేయి';

  @override
  String get settingsImportAppend => 'జోడించు';

  @override
  String get settingsImportAppendAction => 'దిగుమతి (జోడించు)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'డేటా జోడించబడింది: $courses కోర్సు(లు), $sessions సెషన్(లు) చేర్చబడ్డాయి.';
  }

  @override
  String get settingsImportInfo =>
      'జోడించు బ్యాకప్‌ను ప్రస్తుత డేటాతో పాటు చేరుస్తుంది (సెట్టింగులు అలాగే ఉంటాయి). భర్తీ చేయి ముందు అన్ని కోర్సులు, సెషన్లు, సెట్టింగులను తుడిచివేస్తుంది.';

  @override
  String get settingsImportLabel => 'ఎగుమతి చేసిన JSON అతికించండి';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses కోర్సు(లు) · $sessions సెషన్(లు)';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · ఎగుమతి $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · స్కీమా v$schema';
  }

  @override
  String get settingsImportReplace => 'భర్తీ చేయి';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'భర్తీ చేయి ముందు అన్నీ తొలగిస్తుంది. నిర్ధారించడానికి కింది బటన్‌ను $seconds సెకన్లు నొక్కి ఉంచండి.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'డేటా భర్తీ చేయబడింది: $courses కోర్సు(లు), $sessions సెషన్(లు) పునరుద్ధరించబడ్డాయి.';
  }

  @override
  String get settingsImportSubtitle =>
      'గతంలో ఎగుమతి చేసిన JSON బ్యాకప్ నుండి మొత్తం డేటాను భర్తీ చేయండి.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'నొక్కి ఉంచండి… $remaining సె';
  }

  @override
  String get settingsNoSample => 'నమూనా డేటా లేదు';

  @override
  String get settingsNoSampleSubtitle =>
      'సీడ్ చేసిన ఉదాహరణ డేటా ఇప్పటికే క్లియర్ చేయబడింది.';

  @override
  String get settingsNoTarget => 'లక్ష్యం సెట్ చేయలేదు';

  @override
  String get settingsOverloadError => '5–100 గం/వారం సంఖ్య నమోదు చేయండి.';

  @override
  String get settingsOverloadHelper =>
      'దీని కంటే ఎక్కువ రాబోయే లోడ్ వారాలు ఎరుపుతో గుర్తించబడతాయి. పూర్తికాల చదువు ~35–40 గం/వారం.';

  @override
  String settingsOverloadHours(String value) {
    return '$value గం';
  }

  @override
  String get settingsOverloadLabel => 'వారానికి గంటలు (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/వారం ఎరుపు గుర్తు';
  }

  @override
  String get settingsOverloadThreshold => 'వారపు ఓవర్‌లోడ్ పరిమితి';

  @override
  String get settingsOverloadUpdated => 'ఓవర్‌లోడ్ పరిమితి నవీకరించబడింది.';

  @override
  String get settingsPaceTolerance => 'ముందు / వెనుక సహనం';

  @override
  String get settingsPasteValidBackup =>
      'ముందు చెల్లుబాటు అయ్యే బ్యాకప్ అతికించండి';

  @override
  String get settingsReset => 'రీసెట్ చేయి';

  @override
  String get settingsResetAll => 'మొత్తం డేటా రీసెట్ చేయి';

  @override
  String get settingsResetAllMessage =>
      'ఇది అన్ని కోర్సులు, సెషన్లు, సెట్టింగులను శాశ్వతంగా తొలగిస్తుంది. దీన్ని రద్దు చేయలేరు. అవసరమైతే ముందు బ్యాకప్ ఎగుమతి చేయండి.';

  @override
  String get settingsResetAllSubtitle =>
      'అన్ని కోర్సులు, సెషన్లు, సెట్టింగులు తొలగించు.';

  @override
  String get settingsResetAllTitle => 'మొత్తం డేటా రీసెట్ చేయాలా?';

  @override
  String get settingsResetSettings => 'సెట్టింగులు రీసెట్ చేయి';

  @override
  String get settingsResetSettingsDone =>
      'సెట్టింగులు డిఫాల్ట్‌లకు రీసెట్ చేయబడ్డాయి.';

  @override
  String get settingsResetSettingsMessage =>
      'గంటలు/ECTS (30), రోజువారీ లక్ష్యం (లేదు), వారం మొదటి రోజు (సోమవారం), థీమ్ (సిస్టమ్), సహనం (5 రోజులు), ఓవర్‌లోడ్ (35 గం/వారం), పరిమాణం (సౌకర్యవంతం), రంగు (స్లేట్) పునరుద్ధరిస్తుంది. కోర్సులు, సెషన్లు అలాగే ఉంటాయి.';

  @override
  String get settingsResetSettingsSubtitle =>
      'డిఫాల్ట్‌లు పునరుద్ధరించు: 30 గం/ECTS, లక్ష్యం లేదు, సోమవారం, సిస్టమ్ థీమ్, 5 రోజుల సహనం, 35 గం/వారం ఓవర్‌లోడ్, సౌకర్యవంత పరిమాణం, స్లేట్ రంగు.';

  @override
  String get settingsResetSettingsTitle => 'సెట్టింగులు రీసెట్ చేయాలా?';

  @override
  String get settingsSampleData => 'నమూనా డేటా';

  @override
  String settingsSampleDataError(String error) {
    return 'లోపం: $error';
  }

  @override
  String get settingsStudySettings => 'స్టడీ సెట్టింగులు';

  @override
  String get settingsThemeDark => 'డార్క్';

  @override
  String get settingsThemeLight => 'లైట్';

  @override
  String get settingsThemeSystem => 'సిస్టమ్ డిఫాల్ట్';

  @override
  String get settingsThemeTitle => 'థీమ్';

  @override
  String get settingsThemeUpdated => 'థీమ్ నవీకరించబడింది.';

  @override
  String settingsToleranceDays(String value) {
    return '$value రోజులు';
  }

  @override
  String get settingsToleranceError => '0–30 రోజుల సంఖ్య నమోదు చేయండి.';

  @override
  String get settingsToleranceHelper =>
      'ముందుండాలంటే +N రోజుల మిగులు, వెనుకబడితే −N రోజులు. 5 = స్థిరం, 0 = సున్నితం.';

  @override
  String get settingsToleranceLabel => 'పని రోజులు (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance పని';
  }

  @override
  String get settingsToleranceUpdated => 'సహనం నవీకరించబడింది.';

  @override
  String get settingsWeekdayFriday => 'శుక్రవారం';

  @override
  String get settingsWeekdayMonday => 'సోమవారం';

  @override
  String get settingsWeekdaySaturday => 'శనివారం';

  @override
  String get settingsWeekdaySunday => 'ఆదివారం';

  @override
  String get settingsWeekdayThursday => 'గురువారం';

  @override
  String get settingsWeekdayTuesday => 'మంగళవారం';

  @override
  String get settingsWeekdayWednesday => 'బుధవారం';

  @override
  String get sortDeadline => 'గడువు';

  @override
  String get sortName => 'పేరు';

  @override
  String get sortProgress => 'పురోగతి';

  @override
  String get sortStatus => 'స్థితి';

  @override
  String get startupTitle => 'ECTS Tracker ప్రారంభించలేకపోయింది';

  @override
  String get statsActiveDays => 'చురుకైన రోజులు';

  @override
  String statsActiveDaysBadge(int days) {
    return '$daysరోజులు చురుకుగా';
  }

  @override
  String get statsAddDeadlines => 'లోడ్ అంచనా కోసం గడువులు జోడించండి.';

  @override
  String get statsComingLoad => 'రాబోయే లోడ్';

  @override
  String get statsConsistency => 'స్థిరత్వం';

  @override
  String get statsConsistencyHint =>
      'గత 30 రోజుల్లో చదివిన రోజులు. ప్రతిరోజూ చిన్న అడుగులే ఒక్కసారి బట్టీపట్టడం కంటే మేలు.';

  @override
  String statsConsistencyScore(String percent) {
    return 'గత 30 రోజుల్లో $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return 'కోర్సు $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'చేసింది / రోజు (14రో)';

  @override
  String get statsEmpty => 'ఇంకా సెషన్లు లేవు';

  @override
  String get statsGap => 'అంతరం';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value గం';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursగం';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours గం';
  }

  @override
  String get statsLast30Days => 'గత 30 రోజులు';

  @override
  String get statsLast7Days => 'గత 7 రోజులు';

  @override
  String get statsNeedPerDay => 'అవసరం / రోజు';

  @override
  String get statsNext8Weeks => 'తర్వాత 8 వారాలు';

  @override
  String get statsOfLast30DaysVolume => 'గత 30 రోజుల పరిమాణంలో';

  @override
  String statsOverloadWarning(String threshold) {
    return '>$thresholdగం ఓవర్‌లోడ్ వారాలు ఎరుపు గుర్తు — గడువును జరపండి లేదా పరిధి తగ్గించండి.';
  }

  @override
  String get statsOverview => 'సారాంశం';

  @override
  String get statsPaceCovers =>
      'గత వేగం అవసరానికి సరిపోతుంది. పరంపర కొనసాగించండి.';

  @override
  String statsPaceShort(String gap) {
    return 'గత వేగం $gap గం/రోజు తక్కువ — ఒక బ్లాక్ జోడించండి లేదా పరిధి తగ్గించండి.';
  }

  @override
  String get statsPastVsNeeded => 'గతం vs అవసరం';

  @override
  String statsPeakPerWeek(String peak) {
    return 'గరిష్ఠ $peakగం/వారం';
  }

  @override
  String get statsPerCourse => 'కోర్సుకు';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done గం / $required గం · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'సెషన్లు';

  @override
  String statsSuggestedOrder(String order) {
    return 'సూచించిన క్రమం: $order (ముందు గడువు మొదట)';
  }

  @override
  String get statsTotal => 'మొత్తం';

  @override
  String get statsTotalVolume => 'మొత్తం పరిమాణం';

  @override
  String get statusAhead => 'ముందంజ';

  @override
  String get statusBehind => 'వెనుకబడింది';

  @override
  String get statusCompleted => 'పూర్తయింది';

  @override
  String get statusOnTrack => 'సక్రమంగా';

  @override
  String get statusOverdue => 'గడువు మీరింది';

  @override
  String get studyLogDeleteBody =>
      'ఈ స్టడీ సెషన్ తొలగించాలా? దీన్ని రద్దు చేయలేరు.';

  @override
  String get studyLogDeleteTitle => 'సెషన్ తొలగించాలా?';

  @override
  String get studyLogEmptyHint =>
      'మీ స్టడీ సమయాన్ని ట్రాక్ చేయడానికి సెషన్ నమోదు చేయండి.';

  @override
  String get studyLogEmptyTitle => 'ఇంకా స్టడీ సెషన్లు లేవు';

  @override
  String get studyLogFabLabel => 'సెషన్ నమోదు';

  @override
  String get studyLogFabTooltip => 'సెషన్ నమోదు';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours గం';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'నమూనా సెషన్ తొలగించు';

  @override
  String get studyLogThisWeek => 'ఈ వారం';

  @override
  String get studyLogToday => 'ఈరోజు';

  @override
  String studyLogUnknownCourse(String id) {
    return 'కోర్సు $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return '$course కొలుస్తోంది';
  }

  @override
  String get studyTimerAlreadyRunning =>
      'టైమర్ ఇప్పటికే నడుస్తోంది. ముందు దాన్ని ముగించండి లేదా విస్మరించండి.';

  @override
  String get studyTimerCourseLabel => 'కోర్సు';

  @override
  String get studyTimerDiscard => 'విస్మరించు';

  @override
  String get studyTimerDiscardBody =>
      'ప్రస్తుత టైమర్‌ను నమోదు చేయకుండా విస్మరించాలా? దీన్ని రద్దు చేయలేరు.';

  @override
  String get studyTimerDiscardTitle => 'టైమర్ విస్మరించాలా?';

  @override
  String studyTimerFinishLog(String minutes) {
    return 'ముగించు & $minutes నిమి నమోదు చేయి';
  }

  @override
  String get studyTimerNoCourseError => 'కోర్సును ఎంచుకోండి.';

  @override
  String get studyTimerNoCoursesHint =>
      'టైమర్ ప్రారంభించడానికి ముందు కోర్సు జోడించండి.';

  @override
  String studyTimerNotifPaused(String elapsed) {
    return 'పాజ్‌లో ఉంది · $elapsed';
  }

  @override
  String get studyTimerNotifRunning => 'టైమర్ తెరవడానికి నొక్కండి';

  @override
  String get studyTimerPause => 'పాజ్ చేయి';

  @override
  String get studyTimerResume => 'కొనసాగించు';

  @override
  String get studyTimerStart => 'టైమర్ ప్రారంభించు';

  @override
  String get studyTimerStartTitle => 'స్టడీ టైమర్ ప్రారంభించు';

  @override
  String get studyTimerTooShort => 'టైమర్ ఇంకా నడవలేదు.';

  @override
  String get validationCourseEctsPositive => 'ECTS సున్నా కంటే ఎక్కువ ఉండాలి';

  @override
  String get validationCourseEctsRequired => 'ECTS క్రెడిట్లు నమోదు చేయండి';

  @override
  String get validationCourseNameRequired => 'పేరు అవసరం';

  @override
  String get validationCourseNameTooLong => 'పేరు చాలా పొడవుగా ఉంది';

  @override
  String get validationSessionCourseRequired => 'కోర్సు ఎంచుకోండి';

  @override
  String get validationSessionDurationRequired => 'వ్యవధి నమోదు చేయండి';

  @override
  String get widgetNoProgress => 'ఇంకా పురోగతి లేదు';

  @override
  String get settingsLanguage => 'భాష';

  @override
  String get settingsLiquidGlass => 'లిక్విడ్ గ్లాస్';

  @override
  String get settingsLiquidGlassSubtitle =>
      'ఫ్రాస్టెడ్ గ్లాస్ కార్డులు, బార్లు. ఆఫ్‌లో క్లాసిక్ సాలిడ్ రూపం ఉంటుంది.';

  @override
  String get settingsLiquidGlassOn => 'ఆన్';

  @override
  String get settingsLiquidGlassOff => 'ఆఫ్';

  @override
  String get settingsLiquidGlassUpdated => 'లిక్విడ్ గ్లాస్ నవీకరించబడింది.';

  @override
  String get devToolsReminderPreview => 'రిమైండర్ ప్రివ్యూ';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'ప్రస్తుతం ఏమి నోటిఫై అవుతుందో చూడండి. Windows-సురక్షిత టెస్ట్ ఫీడ్.';

  @override
  String get reminderPreviewTitle => 'రిమైండర్ ప్రివ్యూ';

  @override
  String get reminderPreviewNow => 'ప్రివ్యూ సమయం';

  @override
  String get reminderPreviewReset => 'ఇప్పుడు';

  @override
  String get reminderPreviewEmpty =>
      'అంతా ప్రశాంతం — ఈ సమయంలో ఏమీ నోటిఫై అవ్వదు.';

  @override
  String get reminderPreviewCustom => 'అనుకూల షెడ్యూళ్లు (డెమో)';

  @override
  String get reminderPreviewNoFire => 'రాబోయే ట్రిగ్గర్ ఏదీ లేదు.';

  @override
  String get reminderKindDaily => 'రోజువారీ';

  @override
  String get reminderKindBehind => 'వెనుకబడింది';

  @override
  String get reminderKindDeadline => 'గడువు';

  @override
  String get reminderKindOverdue => 'గడువు మీరింది';

  @override
  String get reminderKindStreak => 'వరుస';

  @override
  String get reminderKindCustom => 'అనుకూల';

  @override
  String get settingsReminders => 'స్టడీ రిమైండర్లు';

  @override
  String get settingsRemindersOff => 'ఆఫ్ — రోజువారీ రిమైండర్ కోసం ఆన్ చేయండి.';

  @override
  String get settingsReminderTime => 'రిమైండర్ సమయం';

  @override
  String get settingsReminderDenied =>
      'నోటిఫికేషన్లు బ్లాక్ చేయబడ్డాయి — సిస్టమ్ సెట్టింగుల్లో వాటిని ప్రారంభించండి.';

  @override
  String notifDurationHours(String value) {
    return '$value గం';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value నిమి';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 ఈ రాత్రి: సక్రమంగా ఉండేందుకు $duration';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course ఈరోజు $duration మిగిలింది';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count ఇంకా)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. ఈరోజు పూర్తి చేయడానికి సెషన్ నమోదు చేయండి.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course వెనుకబడింది';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return '$left మిగిలింది, $days రోజులు ఉన్నాయి — ఇక్కడి నుండి $pace/రోజు. తిరిగి సక్రమంగా రావడానికి $catchUp నమోదు చేయండి.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left మిగిలింది, $days రోజులు ఉన్నాయి — ఇక్కడి నుండి $pace/రోజు. మొత్తం $left పూర్తి చేస్తేనే ఇది తొలగుతుంది — ఈ రాత్రే మొదలుపెట్టండి.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left ఇంకా మిగిలి ఉంది, గడువు వచ్చేసింది. ఇప్పుడు మీరు నమోదు చేసేదంతా లెక్కలోకి వస్తుంది.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course గడువు రేపు, ఇంకా $left మిగిలి ఉంది';
  }

  @override
  String get notifDeadlineTomorrowBody =>
      'ఈరోజు మీరు నమోదు చేసేదంతా రెట్టింపు లెక్క.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ $days రోజుల్లో $course పరీక్ష — $left మిగిలింది';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'అంటే $pace/రోజు. విడగొట్టండి: రోజుకు 2 సెషన్లు ఒక మారథాన్ కంటే మేలు.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace =>
      'ఇప్పుడు మీరు నమోదు చేసే ప్రతి గంటా లెక్కలోకి వస్తుంది.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course గడువు దాటిపోయింది, $left మిగిలి ఉంది';
  }

  @override
  String get notifOverdueBody =>
      'గడువును మార్చండి లేదా గంటలు పూర్తి చేయండి — అప్పటివరకు కోర్సు శ్రద్ధ అవసరం స్థితిలోనే ఉంటుంది.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days రోజుల వరుస — ఈ వారం $week';
  }

  @override
  String get notifStreakBody =>
      'అన్ని కోర్సులు సక్రమంగా లేదా ముందంజలో ఉన్నాయి. బాగా చేస్తున్నారు.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 స్టడీ చెక్-ఇన్: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 నవీకరించే సమయం: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left మిగిలి ఉంది · సకాలంలో పూర్తికి $pace/రోజు. పురోగతి నవీకరించడానికి సెషన్ నమోదు చేయండి.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left ఇంకా మిగిలి ఉంది — ఇప్పుడు మీరు నమోదు చేసేదంతా లెక్కలోకి వస్తుంది.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'తర్వాత: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1రో';

  @override
  String get reminderPreviewFwdDay => '+1రో';

  @override
  String get reminderPreviewFake => '(నకిలీ)';

  @override
  String get reminderPreviewDemoLabel => 'డెమో చెక్-ఇన్';
}
