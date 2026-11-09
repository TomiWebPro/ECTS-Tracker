// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AppLocalizationsHy extends AppLocalizations {
  AppLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Չեղարկել';

  @override
  String get commonClose => 'Փակել';

  @override
  String get commonDelete => 'Ջնջել';

  @override
  String get commonEdit => 'Խմբագրել';

  @override
  String get commonError => 'Սխալ';

  @override
  String get commonNone => 'Ոչ մի';

  @override
  String get commonSave => 'Պահպանել';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Պահանջվող ժամեր (ավտո)՝ $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Մաքրել վերջնաժամկետը';

  @override
  String get courseFormClearStartTooltip => 'Մաքրել մեկնարկի ամսաթիվը';

  @override
  String get courseFormColorLabel => 'Գույն';

  @override
  String get courseFormDateNotSet => 'Նշված չէ';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Վերջնաժամկետ՝ $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS կրեդիտներ';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value ժ/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Անուն';

  @override
  String get courseFormNotesLabel => 'Նշումներ (ըստ ցանկության)';

  @override
  String get courseFormSaving => 'Պահպանվում է…';

  @override
  String courseFormStartButton(String date) {
    return 'Մեկնարկ՝ $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Անջատված է․ մինչև $date ճնշում չկա; բացառված է այսօրվա տեմպից։';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Միացված է․ ժամանակը բաշխվում է մինչև հիմա և հաշվվում է այսօրվա տեմպում։';

  @override
  String get courseFormStartEarlyTitle => 'Սկսել հիմա՝ չնայած ապագա մեկնարկին';

  @override
  String get courseFormTitleAdd => 'Ավելացնել դասընթաց';

  @override
  String get courseFormTitleEdit => 'Խմբագրել դասընթացը';

  @override
  String get coursesAddTooltip => 'Ավելացնել դասընթաց';

  @override
  String coursesDeleteBody(String name) {
    return 'Ջնջե՞լ «$name»-ը և բոլոր ուսումնական նիստերը։ Սա հնարավոր չէ հետարկել։';
  }

  @override
  String get coursesDeleteTitle => 'Ջնջե՞լ դասընթացը';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Սեղմեք «Նոր դասընթաց»՝ առաջին դասընթացը ստեղծելու համար։';

  @override
  String get coursesEmptyTitle => 'Դասընթացներ դեռ չկան';

  @override
  String get coursesFilterAll => 'Բոլոր կարգավիճակները';

  @override
  String get coursesFilterEmpty =>
      'Ոչ մի դասընթաց չի համապատասխանում այս զտիչին';

  @override
  String get coursesNewCourse => 'Նոր դասընթաց';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Անհրաժեշտ է $daily ժ/օր';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Անհրաժեշտ է $daily ժ/օր • $weekly ժ/շաբաթ';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required ժ • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Հեռացնել օրինակելի դասընթացը';

  @override
  String coursesShownCount(String count) {
    return 'Ցուցադրվում է $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Դասավորել՝ $label';
  }

  @override
  String get dashboardAllDone => 'Ամեն ինչ ավարտված է';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours ժ գրանցված է (բոնուս)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count դասընթաց';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count դասընթաց · $upcoming առաջիկա՝ այսօրվա տեմպից դուրս';
  }

  @override
  String get dashboardCoursesTitle => 'Դասընթացներ';

  @override
  String dashboardDeadline(String date) {
    return 'Վերջնաժամկետ՝ $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Վերջնաժամկետ՝ $date (մնաց $days օր)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Վերջնաժամկետ՝ $date (մնաց 1 օր)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Վերջնաժամկետ՝ $date (ուշացած)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Վերջնաժամկետ՝ $date (այսօր)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Այսօրվա պարտք՝ գրանցված է $hours ժ';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Բոլոր դասընթացներն ավարտված են — ամբողջ ցանկը տեսեք «Դասընթացներ» ներդիրում։';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Ավելացրեք դասընթաց՝ ECTS առաջընթացը հետևելու համար։';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Հետ եք մնում = անում եք $achieved/օր, պետք է $need/օր';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Հետ եք մնում = անում եք $achieved/օր, պետք է $need/օր · վաղ մեկնարկ';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Հետ եք մնում․ ոչ մի վերջավոր օրական տեմպ այսօրվա վերջնաժամկետին ժամերով չի հասցնի';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Ընթացքը նորմալ է․ տեմպ դեռ չկա — գրանցեք առաջին նիստը հաստատելու համար';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Սկսվում է $days օրից · հաշվված $date-ից';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Սկսվում է $days օրից · հաշվված $date-ից · վաղ մեկնարկը միացված է';
  }

  @override
  String get dashboardFreshStart => 'ՆՈՐ ՍԿԻԶԲ';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · մնաց $hoursժ';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required ժ';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours ժ/օր';
  }

  @override
  String get dashboardLogSessionAction => 'Գրանցել ուսումնական նիստ';

  @override
  String get dashboardLogSessionTooltip => 'Գրանցել ուսումնական նիստ';

  @override
  String get dashboardNewBadge => 'ՆՈՐ';

  @override
  String get dashboardNoCourses => 'Դասընթացներ դեռ չկան';

  @override
  String get dashboardNoDeadline => 'Վերջնաժամկետ չկա';

  @override
  String get dashboardNoDeadlines => 'Վերջնաժամկետներ նախատեսված չեն';

  @override
  String get dashboardNoPaceDue => 'Այսօր պարտք չկա';

  @override
  String get dashboardNothingDue => 'Պարտք չկա';

  @override
  String get dashboardNothingToTrack => 'Հետևելու բան դեռ չկա';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Այսօրվա պարտք՝ մնաց $hoursժ';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Ավարտելու համար անհրաժեշտ է $daily ժ/օր';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Ավարտելու համար անհրաժեշտ է $daily ժ/օր · $weekly ժ/շաբաթ';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Անհրաժեշտ է $hours ժ/օր $date-ից · այսօրվա տեմպի մեջ չէ';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Վերջնաժամկետ չկա — մնաց $hoursժ · օրական ճնշում չկա';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Սկսվում է $date · անելիք՝ $hoursժ';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · անիրատեսական';
  }

  @override
  String get dashboardProgramBare => 'ԾՐԱԳԻՐ';

  @override
  String get dashboardProgramEmptyHint =>
      'Ավելացրեք դասընթաց՝ հետևելը սկսելու համար';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required ժ';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'ԾՐԱԳԻՐ $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return 'Մնաց $days օրվա պաշար';
  }

  @override
  String get dashboardStartNotSet => 'Նշված չէ';

  @override
  String dashboardStartsIn(String days) {
    return 'Սկսվում է $days օրից';
  }

  @override
  String get dashboardStartsSoon => 'Սկսվում է շուտով';

  @override
  String get dashboardTipEmpty =>
      'Ավելացրեք առաջին դասընթացը — օրական տեմպն ու առաջընթացը կերևան այստեղ։';

  @override
  String get dashboardTipFirst =>
      'Առաջին 25 րոպեն ամենակարևորն է — ընտրեք ամենամոտ վերջնաժամկետով դասընթացը։';

  @override
  String get dashboardTodayBare => 'ԱՅՍՕՐ';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace ժ';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'ԱՅՍՕՐ $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'ԱՅՍՕՐՎԱ ՏԵՄՊ';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Այսօր՝ $logged / $pace ժ';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Ապագա մեկնարկներ — այսօր ճնշում չկա, բացառված են այսօրվա տեմպից։';

  @override
  String get dashboardUpcomingTitle => 'Առաջիկա';

  @override
  String get devToolsActivate => 'Ակտիվացնել';

  @override
  String get devToolsActivateMessage =>
      'Սա բացում է թաքնված սթրես-թեստի գործիքները (ստեղծում է տվյալներ)։ Միայն մշակման համար։';

  @override
  String get devToolsActivateTitle => 'Ակտիվացնե՞լ մշակման ռեժիմը';

  @override
  String get devToolsActivated => 'Մշակման ռեժիմն ակտիվացված է։';

  @override
  String get devToolsClearPumped => 'Մաքրել ստեղծված տվյալները';

  @override
  String get devToolsClearPumpedMessage =>
      'Ջնջում է ստեղծված STRESS դասընթացներն ու նիստերը։ Ձեր տվյալները պահպանվում են։';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Ջնջել ստեղծված STRESS դասընթացներն ու նիստերը։';

  @override
  String get devToolsClearPumpedTitle => 'Մաքրե՞լ ստեղծված տվյալները';

  @override
  String devToolsCleared(String count) {
    return 'Մաքրվեց $count ստեղծված դասընթաց։';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Երկրորդ հաստատում․ սա կծանրաբեռնի դասընթացները, ցանկերը, գծապատկերներն ու տեմպի հաշվարկները և կարող է տևել մի քանի վայրկյան։ Ստեղծե՞լ հիմա։';

  @override
  String get devToolsConfirmPumpTitle => 'Հաստատել սթրես-թեստը';

  @override
  String get devToolsContinue => 'Շարունակել';

  @override
  String get devToolsExit => 'Ելնել մշակման ռեժիմից';

  @override
  String get devToolsExitSubtitle => 'Թաքցնել մշակման գործիքներն այս սարքում։';

  @override
  String get devToolsPumpData => 'Ստեղծել տվյալներ';

  @override
  String get devToolsPumpMessage =>
      'Սա տեղադրում է իրատեսական ստեղծված կիսամյակ (~10 դասընթաց, ~800 նիստ վերջին 12 շաբաթում)։ Ձեր առկա տվյալները պահպանվում են։ Շարունակե՞լ։';

  @override
  String get devToolsPumpSubtitle =>
      'Տեղադրել ստեղծված կիսամյակ (~10 դասընթաց, ~800 նիստ, 12 շաբաթ)։ Առկա տվյալները պահպանվում են։';

  @override
  String get devToolsPumpTile => 'Ստեղծել փորձնական տվյալներ';

  @override
  String get devToolsPumpTitle => 'Ստեղծե՞լ փորձնական տվյալներ';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Ստեղծվեց $courses դասընթաց, $sessions նիստ։';
  }

  @override
  String get devToolsPumping => 'Փորձնական տվյալների ստեղծում…';

  @override
  String get devToolsRemoveAll => 'Հեռացնել բոլոր տվյալները';

  @override
  String get devToolsRemoveAllMessage =>
      'Մշակման դյուրանցում․ սա ընդմիշտ ջնջում է ԲՈԼՈՐ դասընթացները, նիստերն ու կարգավորումները։ Սա հնարավոր չէ հետարկել։';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Մշակման դյուրանցում․ ջնջել ԲՈԼՈՐ դասընթացները, նիստերն ու կարգավորումները։';

  @override
  String get devToolsRemoveAllTitle => 'Հեռացնե՞լ բոլոր տվյալները';

  @override
  String get navCourses => 'Դասընթացներ';

  @override
  String get navDashboard => 'Վահանակ';

  @override
  String get navSettings => 'Կարգավորումներ';

  @override
  String get navStatistics => 'Վիճակագրություն';

  @override
  String get navStudyLog => 'Ուսման մատյան';

  @override
  String get sampleBadge => 'Օրինակ';

  @override
  String get sessionFormCourseLabel => 'Դասընթաց';

  @override
  String sessionFormDateButton(String date) {
    return 'Ամսաթիվ՝ $date';
  }

  @override
  String get sessionFormDurationError => 'Տևողությունը պետք է զրոյից մեծ լինի։';

  @override
  String get sessionFormHoursLabel => 'Ժամեր';

  @override
  String get sessionFormLogAction => 'Գրանցել նիստը';

  @override
  String get sessionFormMinutesLabel => 'Րոպեներ';

  @override
  String get sessionFormNoCourseError => 'Ընտրեք դասընթաց։';

  @override
  String get sessionFormNoCoursesHint =>
      'Նիստ գրանցելու համար նախ ավելացրեք դասընթաց։';

  @override
  String get sessionFormNotesLabel => 'Նշումներ (ըստ ցանկության)';

  @override
  String get sessionFormSaving => 'Պահպանվում է…';

  @override
  String get sessionFormTitleAdd => 'Գրանցել ուսումնական նիստ';

  @override
  String get sessionFormTitleEdit => 'Խմբագրել ուսումնական նիստը';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Ընդամենը՝ $hours ժ';
  }

  @override
  String get settingsAccent => 'Թեմայի գույն';

  @override
  String get settingsAccentBerry => 'Հատապտուղ';

  @override
  String get settingsAccentClay => 'Կավ';

  @override
  String get settingsAccentForest => 'Անտառ';

  @override
  String get settingsAccentSlate => 'Սալաքար';

  @override
  String get settingsAccentTeal => 'Փիրուզագույն';

  @override
  String get settingsAccentUpdated => 'Թեմայի գույնը թարմացվեց։';

  @override
  String get settingsAllDataDeleted => 'Բոլոր տվյալները ջնջվեցին։';

  @override
  String get settingsAppearance => 'Տեսք (մուգ / բաց)';

  @override
  String get settingsCheckingSample => 'Օրինակելի տվյալների ստուգում…';

  @override
  String get settingsClear => 'Մաքրել';

  @override
  String get settingsClearSample => 'Մաքրել օրինակելի տվյալները';

  @override
  String get settingsClearSampleMessage =>
      'Սա հեռացնում է օրինակելի դասընթացներն ու նիստերը։ Ձեր ավելացրած դասընթացներն ու նիստերը չեն հեռացվում։';

  @override
  String get settingsClearSampleSubtitle =>
      'Հեռացնել ներդրված օրինակելի դասընթացներն ու նիստերը։ Ձեր տվյալները պահպանվում են։';

  @override
  String get settingsClearSampleTitle => 'Մաքրե՞լ օրինակելի տվյալները';

  @override
  String get settingsCopy => 'Պատճենել';

  @override
  String get settingsDailyError => 'Մուտքագրեք 0 կամ դրական թվով րոպեներ։';

  @override
  String get settingsDailyLabel => 'Րոպեներ օրական (0 = առանց նպատակի)';

  @override
  String get settingsDailyTarget => 'Օրական ուսման նպատակ';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes ր/օր';
  }

  @override
  String get settingsDailyUpdated => 'Օրական նպատակը թարմացվեց։';

  @override
  String get settingsData => 'Տվյալներ';

  @override
  String get settingsDeleteEverything => 'Ջնջել ամեն ինչ';

  @override
  String get settingsDevMode => 'Մշակման ռեժիմ';

  @override
  String get settingsDisplay => 'Ցուցադրում';

  @override
  String get settingsDisplayComfortable => 'Հարմարավետ';

  @override
  String get settingsDisplayCompact => 'Կոմպակտ';

  @override
  String get settingsDisplayLarge => 'Մեծ';

  @override
  String get settingsDisplaySize => 'Տեքստի և տարրերի չափ';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Ցուցադրման չափը թարմացվեց։';

  @override
  String get settingsExport => 'Արտահանել տվյալները';

  @override
  String get settingsExportCopied => 'Արտահանումը պատճենվեց սեղմատախտակ։';

  @override
  String get settingsExportSubtitle =>
      'Պատճենել բոլոր դասընթացները, նիստերն ու կարգավորումները որպես JSON։';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses դասընթաց · $sessions նիստ · $kb ԿԲ';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (կրճատված — ամբողջ պահուստը $kb ԿԲ է, ամեն ինչի համար օգտագործեք Պատճենելը)';
  }

  @override
  String get settingsFirstWeekday => 'Շաբաթվա առաջին օր';

  @override
  String get settingsFirstWeekdayUpdated => 'Շաբաթվա առաջին օրը թարմացվեց։';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds վ պահել)';
  }

  @override
  String get settingsHoldToReplace => 'Պահեք՝ ամեն ինչ փոխարինելու համար';

  @override
  String get settingsHoursError => 'Մուտքագրեք զրոյից մեծ թիվ։';

  @override
  String get settingsHoursHelper =>
      'Ստանդարտը 30 է։ Փոփոխությունը վերահաշվում է պահանջները; գրանցումները պահպանվում են։';

  @override
  String get settingsHoursLabel => 'Ժամեր մեկ ECTS կրեդիտի համար';

  @override
  String get settingsHoursPerEcts => 'Ժամեր մեկ ECTS-ի համար';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value ժ';
  }

  @override
  String get settingsHoursUpdated => 'ECTS-ի ժամերը թարմացվեցին։';

  @override
  String get settingsImport => 'Ներմուծել տվյալները';

  @override
  String get settingsImportAppend => 'Ավելացնել';

  @override
  String get settingsImportAppendAction => 'Ներմուծել (ավելացնել)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Տվյալներն ավելացվեցին․ $courses դասընթաց, $sessions նիստ ավելացվեց։';
  }

  @override
  String get settingsImportInfo =>
      'Ավելացնելը պահուստը միացնում է ձեր ընթացիկ տվյալներին (կարգավորումները պահպանվում են)։ Փոխարինելը նախ ջնջում է ԲՈԼՈՐ դասընթացները, նիստերն ու կարգավորումները։';

  @override
  String get settingsImportLabel => 'Տեղադրեք արտահանված JSON-ը';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses դասընթաց · $sessions նիստ';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · արտահանված $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · սխեմա v$schema';
  }

  @override
  String get settingsImportReplace => 'Փոխարինել';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Փոխարինելը նախ ջնջում է ամեն ինչ։ Հաստատելու համար ՍԵՂՄԵՔ ու ՊԱՀԵՔ ներքևի կոճակը $seconds վայրկյան։';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Տվյալները փոխարինվեցին․ $courses դասընթաց, $sessions նիստ վերականգնվեց։';
  }

  @override
  String get settingsImportSubtitle =>
      'Փոխարինել բոլոր տվյալները նախկինում արտահանված JSON պահուստով։';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Շարունակեք պահել… $remaining վ';
  }

  @override
  String get settingsNoSample => 'Օրինակելի տվյալներ չկան';

  @override
  String get settingsNoSampleSubtitle =>
      'Ներդրված օրինակելի տվյալներն արդեն մաքրվել են։';

  @override
  String get settingsNoTarget => 'Նպատակ սահմանված չէ';

  @override
  String get settingsOverloadError => 'Մուտքագրեք 5–100 ժ/շաբաթ թիվ։';

  @override
  String get settingsOverloadHelper =>
      'Այս շեմից բարձր գալիք շաբաթները նշվում են կարմիր։ Լրիվ դրույքով ուսումը ~35–40 ժ/շաբաթ է։';

  @override
  String settingsOverloadHours(String value) {
    return '$value ժ';
  }

  @override
  String get settingsOverloadLabel => 'Ժամեր շաբաթական (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/շաբաթը նշվում է կարմիր';
  }

  @override
  String get settingsOverloadThreshold => 'Շաբաթական գերծանրաբեռնվածության շեմ';

  @override
  String get settingsOverloadUpdated => 'Գերծանրաբեռնվածության շեմը թարմացվեց։';

  @override
  String get settingsPaceTolerance => 'Առաջ/հետ մնալու հանդուրժողականություն';

  @override
  String get settingsPasteValidBackup => 'Նախ տեղադրեք վավեր պահուստ';

  @override
  String get settingsReset => 'Զրոյացնել';

  @override
  String get settingsResetAll => 'Զրոյացնել բոլոր տվյալները';

  @override
  String get settingsResetAllMessage =>
      'Սա ընդմիշտ ջնջում է ԲՈԼՈՐ դասընթացները, նիստերն ու կարգավորումները։ Սա հնարավոր չէ հետարկել։ Անհրաժեշտության դեպքում նախ արտահանեք պահուստ։';

  @override
  String get settingsResetAllSubtitle =>
      'Ջնջել բոլոր դասընթացները, նիստերն ու կարգավորումները։';

  @override
  String get settingsResetAllTitle => 'Զրոյացնե՞լ բոլոր տվյալները';

  @override
  String get settingsResetSettings => 'Զրոյացնել կարգավորումները';

  @override
  String get settingsResetSettingsDone =>
      'Կարգավորումները զրոյացվեցին ստանդարտ արժեքների։';

  @override
  String get settingsResetSettingsMessage =>
      'Վերականգնում է ժամեր/ECTS (30), օրական նպատակ (չկա), շաբաթվա առաջին օր (երկուշաբթի), թեմա (համակարգային), հանդուրժողականություն (5 օր), գերծանրաբեռնվածություն (35 ժ/շաբաթ), չափ (հարմարավետ), գույն (սալաքար)։ Դասընթացներն ու նիստերը պահպանվում են։';

  @override
  String get settingsResetSettingsSubtitle =>
      'Վերականգնել ստանդարտը․ 30 ժ/ECTS, առանց նպատակի, երկուշաբթի, համակարգային թեմա, 5-օրյա հանդուրժողականություն, 35 ժ/շաբաթ գերծանրաբեռնվածություն, հարմարավետ չափ, սալաքար։';

  @override
  String get settingsResetSettingsTitle => 'Զրոյացնե՞լ կարգավորումները';

  @override
  String get settingsSampleData => 'Օրինակելի տվյալներ';

  @override
  String settingsSampleDataError(String error) {
    return 'Սխալ․ $error';
  }

  @override
  String get settingsStudySettings => 'Ուսման կարգավորումներ';

  @override
  String get settingsThemeDark => 'Մուգ';

  @override
  String get settingsThemeLight => 'Բաց';

  @override
  String get settingsThemeSystem => 'Համակարգային ստանդարտ';

  @override
  String get settingsThemeTitle => 'Թեմա';

  @override
  String get settingsThemeUpdated => 'Թեման թարմացվեց։';

  @override
  String settingsToleranceDays(String value) {
    return '$value օր';
  }

  @override
  String get settingsToleranceError => 'Մուտքագրեք 0–30 օր թիվ։';

  @override
  String get settingsToleranceHelper =>
      'Առաջ լինելը պահանջում է +N օրվա պաշար, հետ մնալը՝ −N օր։ 5 = կայուն, 0 = զգայուն։';

  @override
  String get settingsToleranceLabel => 'Աշխատանքի օրեր (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance աշխատանք';
  }

  @override
  String get settingsToleranceUpdated => 'Հանդուրժողականությունը թարմացվեց։';

  @override
  String get settingsWeekdayFriday => 'Ուրբաթ';

  @override
  String get settingsWeekdayMonday => 'Երկուշաբթի';

  @override
  String get settingsWeekdaySaturday => 'Շաբաթ';

  @override
  String get settingsWeekdaySunday => 'Կիրակի';

  @override
  String get settingsWeekdayThursday => 'Հինգշաբթի';

  @override
  String get settingsWeekdayTuesday => 'Երեքշաբթի';

  @override
  String get settingsWeekdayWednesday => 'Չորեքշաբթի';

  @override
  String get sortDeadline => 'Վերջնաժամկետ';

  @override
  String get sortName => 'Անուն';

  @override
  String get sortProgress => 'Առաջընթաց';

  @override
  String get sortStatus => 'Կարգավիճակ';

  @override
  String get startupTitle => 'Չհաջողվեց գործարկել ECTS Tracker-ը';

  @override
  String get statsActiveDays => 'Ակտիվ օրեր';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days օր ակտիվ';
  }

  @override
  String get statsAddDeadlines =>
      'Ավելացրեք վերջնաժամկետներ՝ բեռը կանխատեսելու համար։';

  @override
  String get statsComingLoad => 'Առաջիկա բեռ';

  @override
  String get statsConsistency => 'Կայունություն';

  @override
  String get statsConsistencyHint =>
      'Ուսումնական օրերը վերջին 30 օրում։ Ամեն օր փոքր քայլերը հաղթում են կուտակումներին։';

  @override
  String statsConsistencyScore(String percent) {
    return 'Վերջին 30 օրվա $percent%-ը';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Դասընթաց $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'Դ$id';
  }

  @override
  String get statsDidPerDay => 'Արված / օր (14օ)';

  @override
  String get statsEmpty => 'Նիստեր դեռ չկան';

  @override
  String get statsGap => 'Բաց';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value ժ';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursժ';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours ժ';
  }

  @override
  String get statsLast30Days => 'Վերջին 30 օր';

  @override
  String get statsLast7Days => 'Վերջին 7 օր';

  @override
  String get statsNeedPerDay => 'Պետք է / օր';

  @override
  String get statsNext8Weeks => 'Հաջորդ 8 շաբաթ';

  @override
  String get statsOfLast30DaysVolume => 'վերջին 30 օրվա ծավալից';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Գերծանրաբեռնված շաբաթները >$thresholdժ նշվում են կարմիր — տեղափոխեք վերջնաժամկետը կամ կրճատեք ծավալը։';
  }

  @override
  String get statsOverview => 'Ակնարկ';

  @override
  String get statsPaceCovers =>
      'Անցած տեմպը բավարարում է անհրաժեշտը։ Շարունակեք այսպես։';

  @override
  String statsPaceShort(String gap) {
    return 'Անցած տեմպը $gap ժ/օրով պակաս է — ավելացրեք ժամանակահատված կամ կրճատեք ծավալը։';
  }

  @override
  String get statsPastVsNeeded => 'Անցածն ընդդեմ անհրաժեշտի';

  @override
  String statsPeakPerWeek(String peak) {
    return 'գագաթ $peakժ/շաբ';
  }

  @override
  String get statsPerCourse => 'Ըստ դասընթացի';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done ժ / $required ժ · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Նիստեր';

  @override
  String statsSuggestedOrder(String order) {
    return 'Առաջարկվող կարգ․ $order (սկզբում ամենամոտ վերջնաժամկետը)';
  }

  @override
  String get statsTotal => 'Ընդամենը';

  @override
  String get statsTotalVolume => 'ընդհանուր ծավալ';

  @override
  String get statusAhead => 'Առաջ';

  @override
  String get statusBehind => 'Հետ';

  @override
  String get statusCompleted => 'Ավարտված';

  @override
  String get statusOnTrack => 'Ընթացքը նորմալ է';

  @override
  String get statusOverdue => 'Ուշացած';

  @override
  String get studyLogDeleteBody =>
      'Ջնջե՞լ այս ուսումնական նիստը։ Սա հնարավոր չէ հետարկել։';

  @override
  String get studyLogDeleteTitle => 'Ջնջե՞լ նիստը';

  @override
  String get studyLogEmptyHint =>
      'Գրանցեք նիստ՝ ձեր ուսման ժամանակը հետևելու համար։';

  @override
  String get studyLogEmptyTitle => 'Ուսումնական նիստեր դեռ չկան';

  @override
  String get studyLogFabLabel => 'Գրանցել նիստ';

  @override
  String get studyLogFabTooltip => 'Գրանցել նիստ';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours ժ';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Հեռացնել օրինակելի նիստը';

  @override
  String get studyLogThisWeek => 'Այս շաբաթ';

  @override
  String get studyLogToday => 'Այսօր';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Դասընթաց $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'Դ$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS-ը պետք է զրոյից մեծ լինի';

  @override
  String get validationCourseEctsRequired => 'Մուտքագրեք ECTS կրեդիտներ';

  @override
  String get validationCourseNameRequired => 'Անունը պարտադիր է';

  @override
  String get validationCourseNameTooLong => 'Անունը չափազանց երկար է';

  @override
  String get validationSessionCourseRequired => 'Ընտրեք դասընթաց';

  @override
  String get validationSessionDurationRequired => 'Մուտքագրեք տևողություն';

  @override
  String get widgetNoProgress => 'Առաջընթաց դեռ չկա';

  @override
  String get settingsLanguage => 'Լեզու';

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
