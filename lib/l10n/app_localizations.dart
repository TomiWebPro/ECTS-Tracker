import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_az.dart';
import 'app_localizations_be.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_cy.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fo.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_gd.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_hy.dart';
import 'app_localizations_id.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lb.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mk.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_mt.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pcm.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_rm.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sh.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_te.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('az'),
    Locale('be'),
    Locale('bg'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fi'),
    Locale('fo'),
    Locale('fr'),
    Locale('ga'),
    Locale('gd'),
    Locale('hi'),
    Locale('hu'),
    Locale('hy'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('ko'),
    Locale('lb'),
    Locale('lt'),
    Locale('lv'),
    Locale('mk'),
    Locale('mr'),
    Locale('mt'),
    Locale('nb'),
    Locale('nl'),
    Locale('pcm'),
    Locale('pl'),
    Locale('pt'),
    Locale('rm'),
    Locale('ro'),
    Locale('ru'),
    Locale('sh'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sv'),
    Locale('te'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// Application title shown in MaterialApp and app bars.
  ///
  /// In en, this message translates to:
  /// **'ECTS Tracker'**
  String get appTitle;

  /// Generic cancel action.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// Generic close/dismiss action.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// Generic delete action.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// Generic edit action.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// Generic error label.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get commonError;

  /// Generic empty/none label.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get commonNone;

  /// Generic save action.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// Auto-computed required-hours hint under the ECTS field. {value} is either a formatted amount like '150.0 h (30 h/ECTS)' or an em dash when no ECTS value is entered.
  ///
  /// In en, this message translates to:
  /// **'Required hours (auto): {value}'**
  String courseFormAutoHoursValue(String value);

  /// Tooltip of the clear-deadline icon button.
  ///
  /// In en, this message translates to:
  /// **'Clear deadline'**
  String get courseFormClearDeadlineTooltip;

  /// Tooltip of the clear-start-date icon button.
  ///
  /// In en, this message translates to:
  /// **'Clear start date'**
  String get courseFormClearStartTooltip;

  /// Section label above the course color choices. The 'None' chip reuses commonNone.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get courseFormColorLabel;

  /// Placeholder shown in date buttons when no date is picked. Date display format stays yyyy-MM-dd.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get courseFormDateNotSet;

  /// Course deadline picker button. {date} is a yyyy-MM-dd date or the not-set label.
  ///
  /// In en, this message translates to:
  /// **'Deadline: {date}'**
  String courseFormDeadlineButton(String date);

  /// Label of the ECTS credits text field.
  ///
  /// In en, this message translates to:
  /// **'ECTS credits'**
  String get courseFormEctsLabel;

  /// Hours-per-ECTS factor shown inside the auto-computed required-hours hint. {value} is the numeric factor, e.g. '30'.
  ///
  /// In en, this message translates to:
  /// **'{value} h/ECTS'**
  String courseFormHoursPerEctsValue(String value);

  /// Label of the course name text field.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get courseFormNameLabel;

  /// Label of the course notes text field.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get courseFormNotesLabel;

  /// Save-button label while the course form is saving. The idle label reuses commonSave; cancel reuses commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get courseFormSaving;

  /// Course start-date picker button. {date} is a yyyy-MM-dd date or the not-set label.
  ///
  /// In en, this message translates to:
  /// **'Start: {date}'**
  String courseFormStartButton(String date);

  /// Subtitle of the start-early checkbox when disabled. {date} is the yyyy-MM-dd start date.
  ///
  /// In en, this message translates to:
  /// **'Off: no pressure until {date}; excluded from Today’s pace.'**
  String courseFormStartEarlyOff(String date);

  /// Subtitle of the start-early checkbox when enabled.
  ///
  /// In en, this message translates to:
  /// **'On: time is divided until now and counts toward Today’s pace.'**
  String get courseFormStartEarlyOn;

  /// Title of the start-early checkbox shown when the start date lies in the future.
  ///
  /// In en, this message translates to:
  /// **'Start now despite future start'**
  String get courseFormStartEarlyTitle;

  /// Title of the add-course dialog.
  ///
  /// In en, this message translates to:
  /// **'Add course'**
  String get courseFormTitleAdd;

  /// Title of the edit-course dialog.
  ///
  /// In en, this message translates to:
  /// **'Edit course'**
  String get courseFormTitleEdit;

  /// Tooltip of the Courses-tab FAB that opens the new-course dialog.
  ///
  /// In en, this message translates to:
  /// **'Add course'**
  String get coursesAddTooltip;

  /// Body of the delete-course confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\" and all its study sessions? This cannot be undone.'**
  String coursesDeleteBody(String name);

  /// Title of the delete-course confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete course?'**
  String get coursesDeleteTitle;

  /// ECTS credit badge on a course row.
  ///
  /// In en, this message translates to:
  /// **'{credits} ECTS'**
  String coursesEctsValue(double credits);

  /// Hint shown when no courses exist yet.
  ///
  /// In en, this message translates to:
  /// **'Tap “New course” to create your first course.'**
  String get coursesEmptyHint;

  /// Empty-state title shown when no courses exist yet.
  ///
  /// In en, this message translates to:
  /// **'No courses yet'**
  String get coursesEmptyTitle;

  /// Status-filter dropdown option that disables status filtering.
  ///
  /// In en, this message translates to:
  /// **'All statuses'**
  String get coursesFilterAll;

  /// Message shown when no course matches the active filter.
  ///
  /// In en, this message translates to:
  /// **'No courses match this filter'**
  String get coursesFilterEmpty;

  /// Label of the Courses-tab FAB that opens the new-course dialog.
  ///
  /// In en, this message translates to:
  /// **'New course'**
  String get coursesNewCourse;

  /// Daily pace line on a course row when no weekly pace exists.
  ///
  /// In en, this message translates to:
  /// **'{daily} h/day needed'**
  String coursesPaceNeeded(String daily);

  /// Daily pace line in minutes (sub-hour pace) on a course row.
  ///
  /// In en, this message translates to:
  /// **'{daily} min/day needed'**
  String coursesPaceNeededMinutes(String daily);

  /// Daily + weekly pace line on a course row.
  ///
  /// In en, this message translates to:
  /// **'{daily} h/day • {weekly} h/week needed'**
  String coursesPaceNeededWeekly(String daily, String weekly);

  /// Daily + weekly pace line when both are sub-hour (minutes).
  ///
  /// In en, this message translates to:
  /// **'{daily} min/day • {weekly} min/week needed'**
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly);

  /// Daily minutes + weekly hours pace line on a course row.
  ///
  /// In en, this message translates to:
  /// **'{daily} min/day • {weekly} h/week needed'**
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly);

  /// Course row progress line combining hours and the (unlocalized, logic-owned) status label.
  ///
  /// In en, this message translates to:
  /// **'{done} / {required} h • {status}'**
  String coursesProgressWithStatus(String done, String required, String status);

  /// Tooltip of the delete icon on a sample course row.
  ///
  /// In en, this message translates to:
  /// **'Remove sample course'**
  String get coursesRemoveSampleTooltip;

  /// Badge showing how many courses pass the active filter.
  ///
  /// In en, this message translates to:
  /// **'{count} shown'**
  String coursesShownCount(String count);

  /// Sort dropdown item; wraps the (unlocalized, logic-owned) sort label.
  ///
  /// In en, this message translates to:
  /// **'Sort: {label}'**
  String coursesSortOption(String label);

  /// Dashboard empty-state title when every course is completed.
  ///
  /// In en, this message translates to:
  /// **'All done'**
  String get dashboardAllDone;

  /// Today line when hours were logged but nothing is due.
  ///
  /// In en, this message translates to:
  /// **'{hours} h logged (bonus)'**
  String dashboardBonusLogged(String hours);

  /// Course-count line in the overall progress card.
  ///
  /// In en, this message translates to:
  /// **'{count} course(s)'**
  String dashboardCourseCount(String count);

  /// Course-count line including upcoming courses excluded from pace.
  ///
  /// In en, this message translates to:
  /// **'{count} course(s) · {upcoming} upcoming not in today’s pace'**
  String dashboardCourseCountWithUpcoming(String count, String upcoming);

  /// Dashboard section header for active courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get dashboardCoursesTitle;

  /// Neutral deadline label on a dashboard course card.
  ///
  /// In en, this message translates to:
  /// **'Deadline {date}'**
  String dashboardDeadline(String date);

  /// Deadline label with several days remaining.
  ///
  /// In en, this message translates to:
  /// **'Deadline {date} ({days} days left)'**
  String dashboardDeadlineDaysLeft(String date, String days);

  /// Deadline label with exactly one day remaining.
  ///
  /// In en, this message translates to:
  /// **'Deadline {date} (1 day left)'**
  String dashboardDeadlineOneDayLeft(String date);

  /// Deadline label for an overdue course.
  ///
  /// In en, this message translates to:
  /// **'Deadline {date} (overdue)'**
  String dashboardDeadlineOverdue(String date);

  /// Deadline label for a course due today.
  ///
  /// In en, this message translates to:
  /// **'Deadline {date} (today)'**
  String dashboardDeadlineToday(String date);

  /// Headline pace line when study time is due today.
  ///
  /// In en, this message translates to:
  /// **'Due today — {hours} h logged'**
  String dashboardDueToday(String hours);

  /// Dashboard hint when every course is completed.
  ///
  /// In en, this message translates to:
  /// **'Every course is completed — see the Courses tab for the full list.'**
  String get dashboardEmptyHintAllDone;

  /// Dashboard hint when no courses exist yet.
  ///
  /// In en, this message translates to:
  /// **'Add a course to start tracking your ECTS progress.'**
  String get dashboardEmptyHintNoCourses;

  /// Explainer comparing achieved vs required daily pace for a behind course.
  ///
  /// In en, this message translates to:
  /// **'Behind = doing {achieved}/d, need {need}/d'**
  String dashboardExplainerBehind(String achieved, String need);

  /// Behind explainer variant for a course with early start.
  ///
  /// In en, this message translates to:
  /// **'Behind = doing {achieved}/d, need {need}/d · early start'**
  String dashboardExplainerBehindEarly(String achieved, String need);

  /// Explainer for a behind course with no finite daily pace.
  ///
  /// In en, this message translates to:
  /// **'Behind: no finite pace hits a today deadline with hours left'**
  String get dashboardExplainerBehindNoPace;

  /// Explainer for an on-track course before the first session is logged.
  ///
  /// In en, this message translates to:
  /// **'On track: no pace yet — log first session to confirm'**
  String get dashboardExplainerOnTrackNoPace;

  /// Explainer for a scheduled future course.
  ///
  /// In en, this message translates to:
  /// **'Starts in {days} d · counted from {date}'**
  String dashboardExplainerStartsIn(String days, String date);

  /// Explainer variant for a scheduled course with early start on.
  ///
  /// In en, this message translates to:
  /// **'Starts in {days} d · counted from {date} · early start on'**
  String dashboardExplainerStartsInEarly(String days, String date);

  /// Hero-card eyebrow label when nothing has been logged yet.
  ///
  /// In en, this message translates to:
  /// **'FRESH START'**
  String get dashboardFreshStart;

  /// Compact progress detail on a dashboard course row.
  ///
  /// In en, this message translates to:
  /// **'· {pct}% · {hours}h left'**
  String dashboardHoursDetail(String pct, String hours);

  /// Completed vs required hours on a dashboard course row.
  ///
  /// In en, this message translates to:
  /// **'{done} / {required} h'**
  String dashboardHoursFraction(String done, String required);

  /// Required daily hours chip in the hero-card top-3 list.
  ///
  /// In en, this message translates to:
  /// **'{hours} h/d'**
  String dashboardHoursPerDay(String hours);

  /// Required daily minutes chip (sub-hour pace) in the hero-card top-3 list.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min/d'**
  String dashboardMinutesPerDay(String minutes);

  /// Label of the dashboard button that opens the log-session dialog.
  ///
  /// In en, this message translates to:
  /// **'Log study session'**
  String get dashboardLogSessionAction;

  /// Tooltip of the dashboard app-bar action that opens the log-session dialog.
  ///
  /// In en, this message translates to:
  /// **'Log study session'**
  String get dashboardLogSessionTooltip;

  /// Badge shown instead of a percent when no courses exist.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get dashboardNewBadge;

  /// Dashboard empty-state title when no courses exist yet.
  ///
  /// In en, this message translates to:
  /// **'No courses yet'**
  String get dashboardNoCourses;

  /// Deadline label for a course without a deadline.
  ///
  /// In en, this message translates to:
  /// **'No deadline'**
  String get dashboardNoDeadline;

  /// Hero-card subtitle when no deadlines are scheduled.
  ///
  /// In en, this message translates to:
  /// **'No deadlines scheduled'**
  String get dashboardNoDeadlines;

  /// Headline pace line when nothing is due today.
  ///
  /// In en, this message translates to:
  /// **'No pace due today'**
  String get dashboardNoPaceDue;

  /// Today status when nothing is due and nothing was logged.
  ///
  /// In en, this message translates to:
  /// **'Nothing due'**
  String get dashboardNothingDue;

  /// Today status when no courses exist yet.
  ///
  /// In en, this message translates to:
  /// **'Nothing to track yet'**
  String get dashboardNothingToTrack;

  /// Pace line for a course due today with hours left.
  ///
  /// In en, this message translates to:
  /// **'Due today — {hours}h left'**
  String dashboardPaceDueToday(String hours);

  /// Pace line stating the required daily hours to finish.
  ///
  /// In en, this message translates to:
  /// **'Need {daily} h/day to finish'**
  String dashboardPaceNeedDaily(String daily);

  /// Pace line stating the required daily minutes (sub-hour pace).
  ///
  /// In en, this message translates to:
  /// **'Need {daily} min/day to finish'**
  String dashboardPaceNeedDailyMinutes(String daily);

  /// Pace line stating required daily and weekly hours to finish.
  ///
  /// In en, this message translates to:
  /// **'Need {daily} h/day · {weekly} h/week to finish'**
  String dashboardPaceNeedDailyWeekly(String daily, String weekly);

  /// Pace line when both daily and weekly paces are sub-hour.
  ///
  /// In en, this message translates to:
  /// **'Need {daily} min/day · {weekly} min/week to finish'**
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly);

  /// Pace line with daily minutes and weekly hours.
  ///
  /// In en, this message translates to:
  /// **'Need {daily} min/day · {weekly} h/week to finish'**
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly);

  /// Pace line for a scheduled course with a computable daily pace.
  ///
  /// In en, this message translates to:
  /// **'Need {hours} h/day from {date} · not in Today’s pace'**
  String dashboardPaceNeedFrom(String hours, String date);

  /// Pace line for a scheduled course with a sub-hour daily pace.
  ///
  /// In en, this message translates to:
  /// **'Need {minutes} min/day from {date} · not in Today’s pace'**
  String dashboardPaceNeedFromMinutes(String minutes, String date);

  /// Pace line for a course without a deadline.
  ///
  /// In en, this message translates to:
  /// **'No deadline — {hours}h left · no daily pressure'**
  String dashboardPaceNoDeadline(String hours);

  /// Pace line for a scheduled course without a computable daily pace.
  ///
  /// In en, this message translates to:
  /// **'Starts {date} · {hours}h to do'**
  String dashboardPaceStarts(String date, String hours);

  /// Suffix wrapper marking a daily pace as unrealistic.
  ///
  /// In en, this message translates to:
  /// **'{pace} · unrealistic'**
  String dashboardPaceUnrealistic(String pace);

  /// Overall-program progress label when no program exists.
  ///
  /// In en, this message translates to:
  /// **'PROGRAM'**
  String get dashboardProgramBare;

  /// Overall-program status when no courses exist.
  ///
  /// In en, this message translates to:
  /// **'Add a course to start tracking'**
  String get dashboardProgramEmptyHint;

  /// Overall completed vs required hours.
  ///
  /// In en, this message translates to:
  /// **'{done} / {required} h'**
  String dashboardProgramHours(String done, String required);

  /// Overall-program progress label with percent.
  ///
  /// In en, this message translates to:
  /// **'PROGRAM {pct}%'**
  String dashboardProgramLabel(String pct);

  /// Hero-card subtitle stating days of runway left.
  ///
  /// In en, this message translates to:
  /// **'{days} days of runway'**
  String dashboardRunwayDays(int days);

  /// Start-date placeholder when no start date is set.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get dashboardStartNotSet;

  /// Status pill for a scheduled course starting in N days.
  ///
  /// In en, this message translates to:
  /// **'Starts in {days}d'**
  String dashboardStartsIn(String days);

  /// Status pill for a scheduled course starting imminently.
  ///
  /// In en, this message translates to:
  /// **'Starts soon'**
  String get dashboardStartsSoon;

  /// Hero-card tip shown when no courses exist.
  ///
  /// In en, this message translates to:
  /// **'Add your first course — your daily pace and progress will appear here.'**
  String get dashboardTipEmpty;

  /// Hero-card tip shown before any hours are logged.
  ///
  /// In en, this message translates to:
  /// **'First 25 min counts most — pick the course due first.'**
  String get dashboardTipFirst;

  /// Today progress label when nothing is due.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get dashboardTodayBare;

  /// Today logged vs required hours.
  ///
  /// In en, this message translates to:
  /// **'{logged} / {pace} h'**
  String dashboardTodayHours(String logged, String pace);

  /// Today progress label with percent.
  ///
  /// In en, this message translates to:
  /// **'TODAY {pct}%'**
  String dashboardTodayLabel(String pct);

  /// Hero-card eyebrow label for today's required pace.
  ///
  /// In en, this message translates to:
  /// **'TODAY’S PACE'**
  String get dashboardTodayPaceLabel;

  /// Headline pace line with logged vs required hours.
  ///
  /// In en, this message translates to:
  /// **'{logged} / {pace} h today'**
  String dashboardTodayProgress(String logged, String pace);

  /// Explainer under the Upcoming section header.
  ///
  /// In en, this message translates to:
  /// **'Future starts — no pressure today, excluded from Today’s pace.'**
  String get dashboardUpcomingSubtitle;

  /// Dashboard section header for scheduled future courses.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get dashboardUpcomingTitle;

  /// Dev-mode unlock dialog confirm action
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get devToolsActivate;

  /// Dev-mode unlock dialog message
  ///
  /// In en, this message translates to:
  /// **'This unlocks hidden stress-test tools (pump generated data). Only for development.'**
  String get devToolsActivateMessage;

  /// Dev-mode unlock dialog title
  ///
  /// In en, this message translates to:
  /// **'Activate dev mode?'**
  String get devToolsActivateTitle;

  /// SnackBar after dev mode is activated
  ///
  /// In en, this message translates to:
  /// **'Dev mode activated.'**
  String get devToolsActivated;

  /// Dev tools tile title for clearing pumped data
  ///
  /// In en, this message translates to:
  /// **'Clear pumped data'**
  String get devToolsClearPumped;

  /// Clear pumped data confirm dialog message
  ///
  /// In en, this message translates to:
  /// **'Deletes the generated STRESS courses and their sessions. Your own data is kept.'**
  String get devToolsClearPumpedMessage;

  /// Dev tools clear-pumped-data tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Delete generated STRESS courses and sessions.'**
  String get devToolsClearPumpedSubtitle;

  /// Clear pumped data confirm dialog title
  ///
  /// In en, this message translates to:
  /// **'Clear pumped data?'**
  String get devToolsClearPumpedTitle;

  /// SnackBar after pumped data is cleared
  ///
  /// In en, this message translates to:
  /// **'Cleared {count} pumped course(s).'**
  String devToolsCleared(String count);

  /// Second pump confirmation dialog message
  ///
  /// In en, this message translates to:
  /// **'Second confirmation: this will inflate courses, lists, charts, and pace calculations, and may take a few seconds. Pump now?'**
  String get devToolsConfirmPumpMessage;

  /// Second pump confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Confirm stress pump'**
  String get devToolsConfirmPumpTitle;

  /// First pump dialog confirm action
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get devToolsContinue;

  /// Dev tools exit tile title
  ///
  /// In en, this message translates to:
  /// **'Exit dev mode'**
  String get devToolsExit;

  /// Dev tools exit tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Hide dev tools on this device.'**
  String get devToolsExitSubtitle;

  /// Second pump dialog confirm action
  ///
  /// In en, this message translates to:
  /// **'Pump data'**
  String get devToolsPumpData;

  /// First pump dialog message
  ///
  /// In en, this message translates to:
  /// **'This inserts a realistic generated semester (~10 courses, ~800 sessions over the last 12 weeks). Your existing data is kept. Continue?'**
  String get devToolsPumpMessage;

  /// Dev tools pump tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Insert a generated semester (~10 courses, ~800 sessions, 12 weeks). Existing data kept.'**
  String get devToolsPumpSubtitle;

  /// Dev tools pump tile title
  ///
  /// In en, this message translates to:
  /// **'Pump test data'**
  String get devToolsPumpTile;

  /// First pump dialog title
  ///
  /// In en, this message translates to:
  /// **'Pump test data?'**
  String get devToolsPumpTitle;

  /// SnackBar after test data pump
  ///
  /// In en, this message translates to:
  /// **'Pumped {courses} courses, {sessions} sessions.'**
  String devToolsPumped(String courses, String sessions);

  /// Dev tools pump tile subtitle while pumping
  ///
  /// In en, this message translates to:
  /// **'Pumping test data…'**
  String get devToolsPumping;

  /// Dev tools remove-all tile title
  ///
  /// In en, this message translates to:
  /// **'Remove all data'**
  String get devToolsRemoveAll;

  /// Dev remove-all confirm dialog message
  ///
  /// In en, this message translates to:
  /// **'Dev shortcut: this permanently deletes ALL courses, sessions, and settings. This cannot be undone.'**
  String get devToolsRemoveAllMessage;

  /// Dev tools remove-all tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Dev shortcut: delete ALL courses, sessions, and settings.'**
  String get devToolsRemoveAllSubtitle;

  /// Dev remove-all confirm dialog title
  ///
  /// In en, this message translates to:
  /// **'Remove all data?'**
  String get devToolsRemoveAllTitle;

  /// Bottom-nav destination: courses list.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get navCourses;

  /// Bottom-nav destination and app-bar title: dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get navDashboard;

  /// Bottom-nav destination and app-bar title: settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// Bottom-nav destination and app-bar title: statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get navStatistics;

  /// Bottom-nav destination and app-bar title: study log.
  ///
  /// In en, this message translates to:
  /// **'Study Log'**
  String get navStudyLog;

  /// Badge marking sample/seeded content.
  ///
  /// In en, this message translates to:
  /// **'Sample'**
  String get sampleBadge;

  /// Label of the session course dropdown.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get sessionFormCourseLabel;

  /// Session date picker button. {date} is a yyyy-MM-dd date.
  ///
  /// In en, this message translates to:
  /// **'Date: {date}'**
  String sessionFormDateButton(String date);

  /// Form error when saving a session with zero duration.
  ///
  /// In en, this message translates to:
  /// **'Duration must be greater than zero.'**
  String get sessionFormDurationError;

  /// Label of the session hours field.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get sessionFormHoursLabel;

  /// Save-button label in add mode. Edit mode reuses commonSave; the in-progress label is sessionFormSaving; cancel reuses commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Log session'**
  String get sessionFormLogAction;

  /// Label of the session minutes field.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get sessionFormMinutesLabel;

  /// Form error when saving a session without picking a course (with period; the inline dropdown validator without period is validationSessionCourseRequired).
  ///
  /// In en, this message translates to:
  /// **'Select a course.'**
  String get sessionFormNoCourseError;

  /// Hint shown when no courses exist yet and no session can be logged.
  ///
  /// In en, this message translates to:
  /// **'Add a course first to log a session.'**
  String get sessionFormNoCoursesHint;

  /// Label of the session notes text field.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get sessionFormNotesLabel;

  /// Save-button label while the session form is saving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get sessionFormSaving;

  /// Title of the log-session dialog.
  ///
  /// In en, this message translates to:
  /// **'Log study session'**
  String get sessionFormTitleAdd;

  /// Title of the edit-session dialog.
  ///
  /// In en, this message translates to:
  /// **'Edit study session'**
  String get sessionFormTitleEdit;

  /// Live total-duration hint under the hours/minutes fields. {hours} is formatted with two decimals.
  ///
  /// In en, this message translates to:
  /// **'Total: {hours} h'**
  String sessionFormTotalHours(String hours);

  /// Accent tile title and accent picker dialog title
  ///
  /// In en, this message translates to:
  /// **'Theme colour'**
  String get settingsAccent;

  /// Berry accent option label
  ///
  /// In en, this message translates to:
  /// **'Berry'**
  String get settingsAccentBerry;

  /// Clay accent option label
  ///
  /// In en, this message translates to:
  /// **'Clay'**
  String get settingsAccentClay;

  /// Forest accent option label
  ///
  /// In en, this message translates to:
  /// **'Forest'**
  String get settingsAccentForest;

  /// Slate accent option label
  ///
  /// In en, this message translates to:
  /// **'Slate'**
  String get settingsAccentSlate;

  /// Teal accent option label
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get settingsAccentTeal;

  /// SnackBar after accent change
  ///
  /// In en, this message translates to:
  /// **'Theme colour updated.'**
  String get settingsAccentUpdated;

  /// SnackBar after all data is deleted
  ///
  /// In en, this message translates to:
  /// **'All data deleted.'**
  String get settingsAllDataDeleted;

  /// Theme mode tile title
  ///
  /// In en, this message translates to:
  /// **'Appearance (dark / light)'**
  String get settingsAppearance;

  /// Loading title while checking for sample data
  ///
  /// In en, this message translates to:
  /// **'Checking sample data…'**
  String get settingsCheckingSample;

  /// Clear confirm action (sample and pumped data dialogs)
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get settingsClear;

  /// Clear sample data tile title
  ///
  /// In en, this message translates to:
  /// **'Clear sample data'**
  String get settingsClearSample;

  /// Clear sample data confirm dialog message
  ///
  /// In en, this message translates to:
  /// **'This removes the example courses and sessions. Courses or sessions you added yourself are not removed.'**
  String get settingsClearSampleMessage;

  /// Clear sample data tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Remove the seeded example courses and sessions. Your own data is kept.'**
  String get settingsClearSampleSubtitle;

  /// Clear sample data confirm dialog title
  ///
  /// In en, this message translates to:
  /// **'Clear sample data?'**
  String get settingsClearSampleTitle;

  /// Export dialog copy-to-clipboard action
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get settingsCopy;

  /// Daily target validation error
  ///
  /// In en, this message translates to:
  /// **'Enter 0 or a positive number of minutes.'**
  String get settingsDailyError;

  /// Daily target input label
  ///
  /// In en, this message translates to:
  /// **'Minutes per day (0 = no target)'**
  String get settingsDailyLabel;

  /// Daily target tile title and edit dialog title
  ///
  /// In en, this message translates to:
  /// **'Daily study target'**
  String get settingsDailyTarget;

  /// Daily target tile subtitle with minutes
  ///
  /// In en, this message translates to:
  /// **'{minutes} min/day'**
  String settingsDailyTargetValue(String minutes);

  /// SnackBar after daily target change
  ///
  /// In en, this message translates to:
  /// **'Daily target updated.'**
  String get settingsDailyUpdated;

  /// Data section header
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get settingsData;

  /// Destructive delete confirm action
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get settingsDeleteEverything;

  /// Dev mode section header
  ///
  /// In en, this message translates to:
  /// **'Dev mode'**
  String get settingsDevMode;

  /// Display section header
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get settingsDisplay;

  /// Comfortable display size option label
  ///
  /// In en, this message translates to:
  /// **'Comfortable'**
  String get settingsDisplayComfortable;

  /// Compact display size option label
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get settingsDisplayCompact;

  /// Large display size option label
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get settingsDisplayLarge;

  /// Display size tile title and picker dialog title
  ///
  /// In en, this message translates to:
  /// **'Text & element size'**
  String get settingsDisplaySize;

  /// Display size option with scale percent
  ///
  /// In en, this message translates to:
  /// **'{label} ({percent}%)'**
  String settingsDisplaySizeOption(String label, String percent);

  /// SnackBar after display size change
  ///
  /// In en, this message translates to:
  /// **'Display size updated.'**
  String get settingsDisplaySizeUpdated;

  /// Export tile title and export dialog title
  ///
  /// In en, this message translates to:
  /// **'Export data'**
  String get settingsExport;

  /// SnackBar after export copy
  ///
  /// In en, this message translates to:
  /// **'Export copied to clipboard.'**
  String get settingsExportCopied;

  /// Export tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Copy all courses, sessions, and settings as JSON.'**
  String get settingsExportSubtitle;

  /// Export dialog backup summary line
  ///
  /// In en, this message translates to:
  /// **'{courses} course(s) · {sessions} session(s) · {kb} KB'**
  String settingsExportSummary(String courses, String sessions, String kb);

  /// Export preview truncation note
  ///
  /// In en, this message translates to:
  /// **'… (truncated — full backup is {kb} KB, use Copy for everything)'**
  String settingsExportTruncated(String kb);

  /// First weekday tile title and picker dialog title
  ///
  /// In en, this message translates to:
  /// **'First day of week'**
  String get settingsFirstWeekday;

  /// SnackBar after first weekday change
  ///
  /// In en, this message translates to:
  /// **'First day of week updated.'**
  String get settingsFirstWeekdayUpdated;

  /// Hold-to-confirm button label with hold duration
  ///
  /// In en, this message translates to:
  /// **'{label} ({seconds}s hold)'**
  String settingsHoldLabel(String label, String seconds);

  /// Hold-to-confirm button label for replace import
  ///
  /// In en, this message translates to:
  /// **'Hold to replace everything'**
  String get settingsHoldToReplace;

  /// Hours-per-ECTS validation error
  ///
  /// In en, this message translates to:
  /// **'Enter a number greater than zero.'**
  String get settingsHoursError;

  /// Hours-per-ECTS input helper
  ///
  /// In en, this message translates to:
  /// **'Default 30. Changing recalculates requirements; logs kept.'**
  String get settingsHoursHelper;

  /// Hours-per-ECTS input label
  ///
  /// In en, this message translates to:
  /// **'Hours per ECTS credit'**
  String get settingsHoursLabel;

  /// Hours-per-ECTS tile title and edit dialog title
  ///
  /// In en, this message translates to:
  /// **'Hours per ECTS'**
  String get settingsHoursPerEcts;

  /// Hours-per-ECTS tile subtitle with hours
  ///
  /// In en, this message translates to:
  /// **'{value} h'**
  String settingsHoursPerEctsValue(String value);

  /// SnackBar after hours-per-ECTS change
  ///
  /// In en, this message translates to:
  /// **'Hours per ECTS updated.'**
  String get settingsHoursUpdated;

  /// Import tile title and import dialog title
  ///
  /// In en, this message translates to:
  /// **'Import data'**
  String get settingsImport;

  /// Import mode segment label
  ///
  /// In en, this message translates to:
  /// **'Append'**
  String get settingsImportAppend;

  /// Import dialog append confirm action
  ///
  /// In en, this message translates to:
  /// **'Import (append)'**
  String get settingsImportAppendAction;

  /// SnackBar after append import
  ///
  /// In en, this message translates to:
  /// **'Data appended: {courses} course(s), {sessions} session(s) added.'**
  String settingsImportAppended(String courses, String sessions);

  /// Import dialog mode explanation
  ///
  /// In en, this message translates to:
  /// **'Append adds the backup alongside your current data (settings kept). Replace wipes ALL courses, sessions, and settings first.'**
  String get settingsImportInfo;

  /// Import JSON input label
  ///
  /// In en, this message translates to:
  /// **'Paste exported JSON'**
  String get settingsImportLabel;

  /// Import preview counts
  ///
  /// In en, this message translates to:
  /// **'{courses} course(s) · {sessions} session(s)'**
  String settingsImportPreview(String courses, String sessions);

  /// Import preview export timestamp suffix
  ///
  /// In en, this message translates to:
  /// **' · exported {exportedAt}'**
  String settingsImportPreviewExported(String exportedAt);

  /// Import preview schema suffix
  ///
  /// In en, this message translates to:
  /// **' · schema v{schema}'**
  String settingsImportPreviewSchema(String schema);

  /// Import mode segment label
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get settingsImportReplace;

  /// Replace import hold-to-confirm warning
  ///
  /// In en, this message translates to:
  /// **'Replace deletes everything first. Press and HOLD the button below for {seconds} seconds to confirm.'**
  String settingsImportReplaceWarning(String seconds);

  /// SnackBar after replace import
  ///
  /// In en, this message translates to:
  /// **'Data replaced: {courses} course(s), {sessions} session(s) restored.'**
  String settingsImportReplaced(String courses, String sessions);

  /// Import tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Replace all data from a previously exported JSON backup.'**
  String get settingsImportSubtitle;

  /// Hold-to-confirm button label while holding
  ///
  /// In en, this message translates to:
  /// **'Keep holding… {remaining} s'**
  String settingsKeepHolding(String remaining);

  /// Tile title when no sample data is present
  ///
  /// In en, this message translates to:
  /// **'No sample data'**
  String get settingsNoSample;

  /// Tile subtitle when no sample data is present
  ///
  /// In en, this message translates to:
  /// **'Seeded example data has already been cleared.'**
  String get settingsNoSampleSubtitle;

  /// Daily target tile subtitle when no target
  ///
  /// In en, this message translates to:
  /// **'No target set'**
  String get settingsNoTarget;

  /// Overload threshold validation error
  ///
  /// In en, this message translates to:
  /// **'Enter a number 5–100 h/week.'**
  String get settingsOverloadError;

  /// Overload threshold input helper
  ///
  /// In en, this message translates to:
  /// **'Coming-load weeks above this are flagged red. Full-time study is ~35–40 h/week.'**
  String get settingsOverloadHelper;

  /// Overload hours value with unit
  ///
  /// In en, this message translates to:
  /// **'{value} h'**
  String settingsOverloadHours(String value);

  /// Overload threshold input label
  ///
  /// In en, this message translates to:
  /// **'Hours per week (5–100)'**
  String get settingsOverloadLabel;

  /// Overload tile subtitle
  ///
  /// In en, this message translates to:
  /// **'{value}/week flags red'**
  String settingsOverloadSubtitle(String value);

  /// Overload tile title and edit dialog title
  ///
  /// In en, this message translates to:
  /// **'Weekly overload threshold'**
  String get settingsOverloadThreshold;

  /// SnackBar after overload threshold change
  ///
  /// In en, this message translates to:
  /// **'Overload threshold updated.'**
  String get settingsOverloadUpdated;

  /// Pace tolerance tile title and edit dialog title
  ///
  /// In en, this message translates to:
  /// **'Ahead / behind tolerance'**
  String get settingsPaceTolerance;

  /// Hold-to-confirm button label when no valid backup
  ///
  /// In en, this message translates to:
  /// **'Paste a valid backup first'**
  String get settingsPasteValidBackup;

  /// Reset settings confirm action
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get settingsReset;

  /// Reset-all tile title
  ///
  /// In en, this message translates to:
  /// **'Reset all data'**
  String get settingsResetAll;

  /// Reset-all confirm dialog message
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes ALL courses, sessions, and settings. This cannot be undone. Export a backup first if needed.'**
  String get settingsResetAllMessage;

  /// Reset-all tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Delete all courses, sessions, and settings.'**
  String get settingsResetAllSubtitle;

  /// Reset-all confirm dialog title
  ///
  /// In en, this message translates to:
  /// **'Reset all data?'**
  String get settingsResetAllTitle;

  /// Reset settings tile title
  ///
  /// In en, this message translates to:
  /// **'Reset settings'**
  String get settingsResetSettings;

  /// SnackBar after settings reset
  ///
  /// In en, this message translates to:
  /// **'Settings reset to defaults.'**
  String get settingsResetSettingsDone;

  /// Reset settings confirm dialog message
  ///
  /// In en, this message translates to:
  /// **'Restores hours-per-ECTS (30), daily target (none), first weekday (Monday), theme (system), tolerance (5 days), overload (35 h/week), size (comfortable), colour (slate). Courses and sessions are kept.'**
  String get settingsResetSettingsMessage;

  /// Reset settings tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Restore defaults: 30 h/ECTS, no target, Monday, system theme, 5-day tolerance, 35 h/week overload, comfortable size, slate colour.'**
  String get settingsResetSettingsSubtitle;

  /// Reset settings confirm dialog title
  ///
  /// In en, this message translates to:
  /// **'Reset settings?'**
  String get settingsResetSettingsTitle;

  /// Sample data error tile title
  ///
  /// In en, this message translates to:
  /// **'Sample data'**
  String get settingsSampleData;

  /// Sample data error tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String settingsSampleDataError(String error);

  /// Study settings section header
  ///
  /// In en, this message translates to:
  /// **'Study settings'**
  String get settingsStudySettings;

  /// Dark theme option label
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// Light theme option label
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// System theme option label
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get settingsThemeSystem;

  /// Theme picker dialog title
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsThemeTitle;

  /// SnackBar after theme change
  ///
  /// In en, this message translates to:
  /// **'Theme updated.'**
  String get settingsThemeUpdated;

  /// Tolerance days value with unit
  ///
  /// In en, this message translates to:
  /// **'{value} days'**
  String settingsToleranceDays(String value);

  /// Pace tolerance validation error
  ///
  /// In en, this message translates to:
  /// **'Enter a number 0–30 days.'**
  String get settingsToleranceError;

  /// Pace tolerance input helper
  ///
  /// In en, this message translates to:
  /// **'Ahead needs +N days surplus, behind −N days. 5 = stable, 0 = sensitive.'**
  String get settingsToleranceHelper;

  /// Pace tolerance input label
  ///
  /// In en, this message translates to:
  /// **'Days of work (0–30)'**
  String get settingsToleranceLabel;

  /// Pace tolerance tile subtitle
  ///
  /// In en, this message translates to:
  /// **'{tolerance} of work'**
  String settingsToleranceOfWork(String tolerance);

  /// SnackBar after tolerance change
  ///
  /// In en, this message translates to:
  /// **'Tolerance updated.'**
  String get settingsToleranceUpdated;

  /// Friday option label
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get settingsWeekdayFriday;

  /// Monday option label
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get settingsWeekdayMonday;

  /// Saturday option label
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get settingsWeekdaySaturday;

  /// Sunday option label
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get settingsWeekdaySunday;

  /// Thursday option label
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get settingsWeekdayThursday;

  /// Tuesday option label
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get settingsWeekdayTuesday;

  /// Wednesday option label
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get settingsWeekdayWednesday;

  /// Statistics/courses: course-sort option Deadline
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get sortDeadline;

  /// Statistics/courses: course-sort option Name
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sortName;

  /// Statistics/courses: course-sort option Progress
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get sortProgress;

  /// Statistics/courses: course-sort option Status
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get sortStatus;

  /// Title shown on the startup failure screen when the database cannot be opened.
  ///
  /// In en, this message translates to:
  /// **'Could not start ECTS Tracker'**
  String get startupTitle;

  /// Statistics page: mini-stat label for distinct study days
  ///
  /// In en, this message translates to:
  /// **'Active days'**
  String get statsActiveDays;

  /// Statistics page: badge showing active-day count on the consistency card
  ///
  /// In en, this message translates to:
  /// **'{days}d active'**
  String statsActiveDaysBadge(int days);

  /// Statistics page: coming-load hint when no course has a deadline
  ///
  /// In en, this message translates to:
  /// **'Add deadlines to forecast the load.'**
  String get statsAddDeadlines;

  /// Statistics page: coming-load forecast section header
  ///
  /// In en, this message translates to:
  /// **'Coming load'**
  String get statsComingLoad;

  /// Statistics page: consistency section header
  ///
  /// In en, this message translates to:
  /// **'Consistency'**
  String get statsConsistency;

  /// Statistics page: explainer under the consistency bar
  ///
  /// In en, this message translates to:
  /// **'Study days in the last 30 days. Small steps every day beat cramming.'**
  String get statsConsistencyHint;

  /// Statistics page: consistency headline, percent is pre-formatted with toStringAsFixed(0)
  ///
  /// In en, this message translates to:
  /// **'{percent}% of last 30 days'**
  String statsConsistencyScore(String percent);

  /// Statistics page: per-course row title fallback when the course is unknown
  ///
  /// In en, this message translates to:
  /// **'Course {id}'**
  String statsCourseFallback(int id);

  /// Statistics page: avatar-name fallback for an unknown course id
  ///
  /// In en, this message translates to:
  /// **'C{id}'**
  String statsCourseShortFallback(int id);

  /// Statistics page: past-pace label, average hours logged per day over 14 days
  ///
  /// In en, this message translates to:
  /// **'Did / day (14d)'**
  String get statsDidPerDay;

  /// Statistics page: empty state when there are no study sessions
  ///
  /// In en, this message translates to:
  /// **'No sessions yet'**
  String get statsEmpty;

  /// Statistics page: gap label, past pace minus needed pace
  ///
  /// In en, this message translates to:
  /// **'Gap'**
  String get statsGap;

  /// Statistics page: gap value, sign is '+' or empty and value is pre-formatted with toStringAsFixed(1)
  ///
  /// In en, this message translates to:
  /// **'{sign}{value} h'**
  String statsGapValue(String sign, String value);

  /// Statistics page: compact hours value without space, hours pre-formatted with toStringAsFixed
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String statsHoursCompact(String hours);

  /// Statistics page: hours value with unit, hours pre-formatted with toStringAsFixed(1)
  ///
  /// In en, this message translates to:
  /// **'{hours} h'**
  String statsHoursValue(String hours);

  /// Statistics page: last-30-days section header and inline-stat label
  ///
  /// In en, this message translates to:
  /// **'Last 30 days'**
  String get statsLast30Days;

  /// Statistics page: last-7-days section header and inline-stat label
  ///
  /// In en, this message translates to:
  /// **'Last 7 days'**
  String get statsLast7Days;

  /// Statistics page: required-pace label, hours needed per day
  ///
  /// In en, this message translates to:
  /// **'Need / day'**
  String get statsNeedPerDay;

  /// Statistics page: coming-load card title
  ///
  /// In en, this message translates to:
  /// **'Next 8 weeks'**
  String get statsNext8Weeks;

  /// Statistics page: caption under the last-7-days bar chart
  ///
  /// In en, this message translates to:
  /// **'of last 30 days volume'**
  String get statsOfLast30DaysVolume;

  /// Statistics page: warning under the forecast when a week exceeds the overload threshold, threshold pre-formatted with toStringAsFixed(0 or 1)
  ///
  /// In en, this message translates to:
  /// **'Overload weeks >{threshold}h flagged red — move a deadline or cut scope.'**
  String statsOverloadWarning(String threshold);

  /// Statistics page: overview section header
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get statsOverview;

  /// Statistics page: reassurance when past pace meets the required pace
  ///
  /// In en, this message translates to:
  /// **'Past pace covers what’s needed. Keep the streak.'**
  String get statsPaceCovers;

  /// Statistics page: warning when past pace falls short, gap pre-formatted with toStringAsFixed(1)
  ///
  /// In en, this message translates to:
  /// **'Past pace is {gap} h/day short — add a block or trim scope.'**
  String statsPaceShort(String gap);

  /// Statistics page: past-vs-needed section header
  ///
  /// In en, this message translates to:
  /// **'Past vs needed'**
  String get statsPastVsNeeded;

  /// Statistics page: forecast peak badge, peak pre-formatted with toStringAsFixed(0)
  ///
  /// In en, this message translates to:
  /// **'peak {peak}h/wk'**
  String statsPeakPerWeek(String peak);

  /// Statistics page: per-course breakdown section header
  ///
  /// In en, this message translates to:
  /// **'Per course'**
  String get statsPerCourse;

  /// Statistics page: per-course progress line, all numbers pre-formatted with toStringAsFixed
  ///
  /// In en, this message translates to:
  /// **'{done} h / {required} h · {percent}%'**
  String statsPerCourseProgress(String done, String required, String percent);

  /// Statistics page: chart percentage label, percent pre-formatted with toStringAsFixed(0)
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String statsPercentValue(String percent);

  /// Statistics page: mini-stat label for session count
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get statsSessions;

  /// Statistics page: forecast hint listing course names in deadline order, order is a pre-joined display string
  ///
  /// In en, this message translates to:
  /// **'Suggested order: {order} (earliest deadline first)'**
  String statsSuggestedOrder(String order);

  /// Statistics page: mini-stat label for total hours
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get statsTotal;

  /// Statistics page: caption under the last-30-days bar chart
  ///
  /// In en, this message translates to:
  /// **'total volume'**
  String get statsTotalVolume;

  /// Course status label: ahead of pace
  ///
  /// In en, this message translates to:
  /// **'Ahead'**
  String get statusAhead;

  /// Course status label: behind pace
  ///
  /// In en, this message translates to:
  /// **'Behind'**
  String get statusBehind;

  /// Course status label: completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// Course status label: on track
  ///
  /// In en, this message translates to:
  /// **'On track'**
  String get statusOnTrack;

  /// Course status label: overdue
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get statusOverdue;

  /// Body of the delete-session confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete this study session? This cannot be undone.'**
  String get studyLogDeleteBody;

  /// Title of the delete-session confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete session?'**
  String get studyLogDeleteTitle;

  /// Hint shown when no study sessions exist yet.
  ///
  /// In en, this message translates to:
  /// **'Log a session to track your study time.'**
  String get studyLogEmptyHint;

  /// Empty-state title shown when no study sessions exist yet.
  ///
  /// In en, this message translates to:
  /// **'No study sessions yet'**
  String get studyLogEmptyTitle;

  /// Label of the study-log FAB that opens the log-session dialog.
  ///
  /// In en, this message translates to:
  /// **'Log session'**
  String get studyLogFabLabel;

  /// Tooltip of the study-log FAB.
  ///
  /// In en, this message translates to:
  /// **'Log session'**
  String get studyLogFabTooltip;

  /// Hours value badge (totals and session rows).
  ///
  /// In en, this message translates to:
  /// **'{hours} h'**
  String studyLogHoursValue(String hours);

  /// Tooltip of the delete icon on a sample session row.
  ///
  /// In en, this message translates to:
  /// **'Remove sample session'**
  String get studyLogRemoveSampleTooltip;

  /// Study-log totals label for the current week.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get studyLogThisWeek;

  /// Study-log totals label for today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get studyLogToday;

  /// Fallback session title when the course is missing.
  ///
  /// In en, this message translates to:
  /// **'Course {id}'**
  String studyLogUnknownCourse(String id);

  /// Fallback avatar initials when the course is missing.
  ///
  /// In en, this message translates to:
  /// **'C{id}'**
  String studyLogUnknownCourseShort(String id);

  /// Course ECTS validator: non-positive value.
  ///
  /// In en, this message translates to:
  /// **'ECTS must be greater than zero'**
  String get validationCourseEctsPositive;

  /// Course ECTS validator: unparseable/empty input.
  ///
  /// In en, this message translates to:
  /// **'Enter ECTS credits'**
  String get validationCourseEctsRequired;

  /// Course name validator: empty name.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get validationCourseNameRequired;

  /// Course name validator: name exceeds the max length.
  ///
  /// In en, this message translates to:
  /// **'Name is too long'**
  String get validationCourseNameTooLong;

  /// Session course dropdown validator: nothing selected.
  ///
  /// In en, this message translates to:
  /// **'Select a course'**
  String get validationSessionCourseRequired;

  /// Session duration validator: total minutes are zero.
  ///
  /// In en, this message translates to:
  /// **'Enter a duration'**
  String get validationSessionDurationRequired;

  /// Accessibility label for the zero-progress meter state.
  ///
  /// In en, this message translates to:
  /// **'No progress yet'**
  String get widgetNoProgress;

  /// Language tile title and language picker dialog title.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// Liquid glass opt-in tile title in the Display section.
  ///
  /// In en, this message translates to:
  /// **'Liquid glass'**
  String get settingsLiquidGlass;

  /// Liquid glass tile description line.
  ///
  /// In en, this message translates to:
  /// **'Frosted glass cards and bars. Off keeps the classic solid look.'**
  String get settingsLiquidGlassSubtitle;

  /// Liquid glass tile state label when the opt-in is enabled.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get settingsLiquidGlassOn;

  /// Liquid glass tile state label when the opt-in is disabled.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get settingsLiquidGlassOff;

  /// SnackBar after the liquid glass opt-in changes.
  ///
  /// In en, this message translates to:
  /// **'Liquid glass updated.'**
  String get settingsLiquidGlassUpdated;

  /// Dev-mode tile title opening the reminder preview feed.
  ///
  /// In en, this message translates to:
  /// **'Reminder preview'**
  String get devToolsReminderPreview;

  /// Dev-mode reminder preview tile description line.
  ///
  /// In en, this message translates to:
  /// **'See what would notify right now. Windows-safe test feed.'**
  String get devToolsReminderPreviewSubtitle;

  /// App-bar title of the dev-mode reminder preview page.
  ///
  /// In en, this message translates to:
  /// **'Reminder preview'**
  String get reminderPreviewTitle;

  /// Label above the fake-now stepper on the reminder preview page.
  ///
  /// In en, this message translates to:
  /// **'Preview time'**
  String get reminderPreviewNow;

  /// Button resetting the preview time to the real now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get reminderPreviewReset;

  /// Empty state of the reminder preview feed.
  ///
  /// In en, this message translates to:
  /// **'All quiet — nothing would notify at this time.'**
  String get reminderPreviewEmpty;

  /// Section header for demo custom schedules on the preview page.
  ///
  /// In en, this message translates to:
  /// **'Custom schedules (demo)'**
  String get reminderPreviewCustom;

  /// Shown when a demo custom schedule has no future fire.
  ///
  /// In en, this message translates to:
  /// **'No upcoming fire.'**
  String get reminderPreviewNoFire;

  /// Kind chip for the daily-plan nudge on the reminder preview page.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get reminderKindDaily;

  /// Kind chip for a behind-course nudge on the reminder preview page.
  ///
  /// In en, this message translates to:
  /// **'Behind'**
  String get reminderKindBehind;

  /// Kind chip for a deadline-countdown nudge on the reminder preview page.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get reminderKindDeadline;

  /// Kind chip for an overdue-course nudge on the reminder preview page.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get reminderKindOverdue;

  /// Kind chip for the weekly streak celebration on the reminder preview page.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get reminderKindStreak;

  /// Kind chip for a custom-schedule nudge on the reminder preview page.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get reminderKindCustom;

  /// Study reminders opt-in tile title in the Study section.
  ///
  /// In en, this message translates to:
  /// **'Study reminders'**
  String get settingsReminders;

  /// Reminders tile subtitle when reminders are disabled.
  ///
  /// In en, this message translates to:
  /// **'Off — turn on for a daily nudge.'**
  String get settingsRemindersOff;

  /// Reminder time tile title in the Study section.
  ///
  /// In en, this message translates to:
  /// **'Reminder time'**
  String get settingsReminderTime;

  /// SnackBar when the OS notification permission is denied.
  ///
  /// In en, this message translates to:
  /// **'Notifications are blocked — enable them in system settings.'**
  String get settingsReminderDenied;

  /// Notification duration unit (hours, >= 1 h). {value} is whole or one-decimal, e.g. '27' or '2.9'. Localize the unit; keep the placeholder.
  ///
  /// In en, this message translates to:
  /// **'{value} h'**
  String notifDurationHours(String value);

  /// Notification duration unit (sub-hour). {value} is whole minutes, e.g. '36'. Localize the unit; keep the placeholder.
  ///
  /// In en, this message translates to:
  /// **'{value} min'**
  String notifDurationMinutes(String value);

  /// Daily-plan notification title. {duration} is a localized duration like '2.9 h' or '36 min'.
  ///
  /// In en, this message translates to:
  /// **'📚 Tonight: {duration} to stay on track'**
  String notifDailyTitle(String duration);

  /// Per-course fragment inside the daily-plan body. {course} is the course name, {duration} a localized duration.
  ///
  /// In en, this message translates to:
  /// **'{course} {duration} left today'**
  String notifDailyCourseNeed(String course, String duration);

  /// Folded-course suffix in the daily-plan body when more than 2 courses are due. {count} is the hidden-course count.
  ///
  /// In en, this message translates to:
  /// **'(+{count} more)'**
  String notifDailyMore(String count);

  /// Daily-plan notification body. {detail} is the joined per-course list with optional folded suffix.
  ///
  /// In en, this message translates to:
  /// **'{detail}. Log a session to clear today.'**
  String notifDailyBody(String detail);

  /// Behind-nudge notification title. {course} is the course name.
  ///
  /// In en, this message translates to:
  /// **'⚠️ {course} slipped to Behind'**
  String notifBehindTitle(String course);

  /// Behind-nudge body when a finite pace exists and partial catch-up clears it. Durations are localized ('2.9 h', '36 min'); {days} is a plain count.
  ///
  /// In en, this message translates to:
  /// **'{left} left, {days} days to go — {pace}/day from here. Log {catchUp} to get back On track.'**
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  );

  /// Behind-nudge body when only finishing the course clears it. Same placeholders as notifBehindBodyPace minus catchUp.
  ///
  /// In en, this message translates to:
  /// **'{left} left, {days} days to go — {pace}/day from here. Only finishing the full {left} clears this — start tonight.'**
  String notifBehindBodyFull(String left, String days, String pace);

  /// Behind-nudge body on deadline day (no finite pace exists). {left} is a localized duration.
  ///
  /// In en, this message translates to:
  /// **'{left} still open and the deadline is here. Anything you log now counts.'**
  String notifBehindBodyDeadlineDay(String left);

  /// Deadline-countdown title for a course due tomorrow. {left} is a localized duration.
  ///
  /// In en, this message translates to:
  /// **'🚨 {course} is due tomorrow and still has {left} open'**
  String notifDeadlineTomorrowTitle(String course, String left);

  /// Deadline-countdown body for a course due tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Anything you log today counts double.'**
  String get notifDeadlineTomorrowBody;

  /// Deadline-countdown title for a course due in 2+ days. {days} is a plain count, {left} a localized duration.
  ///
  /// In en, this message translates to:
  /// **'⏳ {course} exam in {days} days — {left} left'**
  String notifDeadlineSoonTitle(String course, String days, String left);

  /// Deadline-countdown body when a finite pace exists. {pace} is a localized duration.
  ///
  /// In en, this message translates to:
  /// **'That\'s {pace}/day. Split it: 2 sessions a day beats one marathon.'**
  String notifDeadlineSoonBody(String pace);

  /// Deadline-countdown body when no finite pace exists.
  ///
  /// In en, this message translates to:
  /// **'Every hour you log now counts.'**
  String get notifDeadlineSoonBodyNoPace;

  /// Overdue-escalation title. {left} is a localized duration.
  ///
  /// In en, this message translates to:
  /// **'❌ {course} passed its deadline with {left} open'**
  String notifOverdueTitle(String course, String left);

  /// Overdue-escalation body.
  ///
  /// In en, this message translates to:
  /// **'Move the deadline or finish the hours — the course stays in Needs attention until then.'**
  String get notifOverdueBody;

  /// Weekly streak-celebration title. {days} is the streak length, {week} a localized duration of hours logged in the last 7 days.
  ///
  /// In en, this message translates to:
  /// **'🔥 {days}-day streak — {week} this week'**
  String notifStreakTitle(String days, String week);

  /// Weekly streak-celebration body.
  ///
  /// In en, this message translates to:
  /// **'All courses On track or Ahead. Nice run.'**
  String get notifStreakBody;

  /// Custom-schedule title when the automatic topic is used. {course} is the course name.
  ///
  /// In en, this message translates to:
  /// **'📚 Study check-in: {course}'**
  String notifCustomTitleAuto(String course);

  /// Custom-schedule title when pinned to a specific course. {course} is the course name.
  ///
  /// In en, this message translates to:
  /// **'📚 Time to update: {course}'**
  String notifCustomTitleCourse(String course);

  /// Custom-schedule body when a finite pace exists. Durations are localized.
  ///
  /// In en, this message translates to:
  /// **'{left} open · {pace}/day to finish on time. Log a session to update progress.'**
  String notifCustomBodyPace(String left, String pace);

  /// Custom-schedule body when no finite pace exists. {left} is a localized duration.
  ///
  /// In en, this message translates to:
  /// **'{left} still open — anything you log now counts.'**
  String notifCustomBodyNoPace(String left);

  /// Custom-schedule demo row header with the next fire time. {time} is a yyyy-MM-dd HH:mm timestamp (not localized).
  ///
  /// In en, this message translates to:
  /// **'Next: {time}'**
  String reminderPreviewNext(String time);

  /// Preview step-back button: one day earlier. Localize the day abbreviation, keep the -1 prefix.
  ///
  /// In en, this message translates to:
  /// **'-1d'**
  String get reminderPreviewBackDay;

  /// Preview step-forward button: one day later. Localize the day abbreviation, keep the +1 prefix.
  ///
  /// In en, this message translates to:
  /// **'+1d'**
  String get reminderPreviewFwdDay;

  /// Tag after the preview time when a fake clock override is active.
  ///
  /// In en, this message translates to:
  /// **'(fake)'**
  String get reminderPreviewFake;

  /// Label of the demo one-off custom schedule on the reminder preview page.
  ///
  /// In en, this message translates to:
  /// **'Demo check-in'**
  String get reminderPreviewDemoLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'az',
    'be',
    'bg',
    'bn',
    'ca',
    'cs',
    'cy',
    'da',
    'de',
    'el',
    'en',
    'es',
    'et',
    'eu',
    'fi',
    'fo',
    'fr',
    'ga',
    'gd',
    'hi',
    'hu',
    'hy',
    'id',
    'is',
    'it',
    'ja',
    'ka',
    'ko',
    'lb',
    'lt',
    'lv',
    'mk',
    'mr',
    'mt',
    'nb',
    'nl',
    'pcm',
    'pl',
    'pt',
    'rm',
    'ro',
    'ru',
    'sh',
    'sk',
    'sl',
    'sq',
    'sv',
    'te',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az':
      return AppLocalizationsAz();
    case 'be':
      return AppLocalizationsBe();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'cy':
      return AppLocalizationsCy();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'eu':
      return AppLocalizationsEu();
    case 'fi':
      return AppLocalizationsFi();
    case 'fo':
      return AppLocalizationsFo();
    case 'fr':
      return AppLocalizationsFr();
    case 'ga':
      return AppLocalizationsGa();
    case 'gd':
      return AppLocalizationsGd();
    case 'hi':
      return AppLocalizationsHi();
    case 'hu':
      return AppLocalizationsHu();
    case 'hy':
      return AppLocalizationsHy();
    case 'id':
      return AppLocalizationsId();
    case 'is':
      return AppLocalizationsIs();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ka':
      return AppLocalizationsKa();
    case 'ko':
      return AppLocalizationsKo();
    case 'lb':
      return AppLocalizationsLb();
    case 'lt':
      return AppLocalizationsLt();
    case 'lv':
      return AppLocalizationsLv();
    case 'mk':
      return AppLocalizationsMk();
    case 'mr':
      return AppLocalizationsMr();
    case 'mt':
      return AppLocalizationsMt();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pcm':
      return AppLocalizationsPcm();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'rm':
      return AppLocalizationsRm();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sh':
      return AppLocalizationsSh();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sq':
      return AppLocalizationsSq();
    case 'sv':
      return AppLocalizationsSv();
    case 'te':
      return AppLocalizationsTe();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
