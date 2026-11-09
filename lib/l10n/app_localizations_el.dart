// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Ακύρωση';

  @override
  String get commonClose => 'Κλείσιμο';

  @override
  String get commonDelete => 'Διαγραφή';

  @override
  String get commonEdit => 'Επεξεργασία';

  @override
  String get commonError => 'Σφάλμα';

  @override
  String get commonNone => 'Καμία';

  @override
  String get commonSave => 'Αποθήκευση';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Απαιτούμενες ώρες (αυτόματα): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Καθαρισμός προθεσμίας';

  @override
  String get courseFormClearStartTooltip => 'Καθαρισμός ημερομηνίας έναρξης';

  @override
  String get courseFormColorLabel => 'Χρώμα';

  @override
  String get courseFormDateNotSet => 'Δεν έχει οριστεί';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Προθεσμία: $date';
  }

  @override
  String get courseFormEctsLabel => 'Πιστωτικές μονάδες ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value ώ/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Όνομα';

  @override
  String get courseFormNotesLabel => 'Σημειώσεις (προαιρετικά)';

  @override
  String get courseFormSaving => 'Αποθήκευση…';

  @override
  String courseFormStartButton(String date) {
    return 'Έναρξη: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Ανενεργό: καμία πίεση έως τις $date· εξαιρείται από τον σημερινό ρυθμό.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Ενεργό: ο χρόνος κατανέμεται έως τώρα και προσμετράται στον σημερινό ρυθμό.';

  @override
  String get courseFormStartEarlyTitle =>
      'Έναρξη τώρα παρά τη μελλοντική έναρξη';

  @override
  String get courseFormTitleAdd => 'Προσθήκη μαθήματος';

  @override
  String get courseFormTitleEdit => 'Επεξεργασία μαθήματος';

  @override
  String get coursesAddTooltip => 'Προσθήκη μαθήματος';

  @override
  String coursesDeleteBody(String name) {
    return 'Διαγραφή του «$name» και όλων των συνεδριών μελέτης του; Δεν μπορεί να αναιρεθεί.';
  }

  @override
  String get coursesDeleteTitle => 'Διαγραφή μαθήματος;';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Πάτησε «Νέο μάθημα» για να δημιουργήσεις το πρώτο σου μάθημα.';

  @override
  String get coursesEmptyTitle => 'Δεν υπάρχουν μαθήματα ακόμη';

  @override
  String get coursesFilterAll => 'Όλες οι καταστάσεις';

  @override
  String get coursesFilterEmpty =>
      'Κανένα μάθημα δεν ταιριάζει με αυτό το φίλτρο';

  @override
  String get coursesNewCourse => 'Νέο μάθημα';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Απαιτούνται $daily ώ/ημέρα';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Απαιτούνται $daily ώ/ημέρα • $weekly ώ/εβδομάδα';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required ώ • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Κατάργηση δείγματος μαθήματος';

  @override
  String coursesShownCount(String count) {
    return 'Εμφανίζονται $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Ταξινόμηση: $label';
  }

  @override
  String get dashboardAllDone => 'Όλα έτοιμα';

  @override
  String dashboardBonusLogged(String hours) {
    return 'Καταγράφηκαν $hours ώ (μπόνους)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count μαθήματα';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count μαθήματα · $upcoming μελλοντικά εκτός σημερινού ρυθμού';
  }

  @override
  String get dashboardCoursesTitle => 'Μαθήματα';

  @override
  String dashboardDeadline(String date) {
    return 'Προθεσμία $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Προθεσμία $date (απομένουν $days ημέρες)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Προθεσμία $date (απομένει 1 ημέρα)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Προθεσμία $date (εκπρόθεσμη)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Προθεσμία $date (σήμερα)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Λήγει σήμερα — καταγράφηκαν $hours ώ';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Όλα τα μαθήματα ολοκληρώθηκαν — δες την πλήρη λίστα στην καρτέλα Μαθήματα.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Πρόσθεσε ένα μάθημα για να παρακολουθείς την πρόοδο ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Καθυστέρηση = κάνεις $achieved/ημ, χρειάζεσαι $need/ημ';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Καθυστέρηση = κάνεις $achieved/ημ, χρειάζεσαι $need/ημ · πρόωρη έναρξη';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Καθυστέρηση: κανένας πεπερασμένος ρυθμός δεν προλαβαίνει τη σημερινή προθεσμία με υπόλοιπο ωρών';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Εντός προγράμματος: δεν υπάρχει ρυθμός ακόμη — κατέγραψε την πρώτη συνεδρία για επιβεβαίωση';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Ξεκινά σε $days ημ · υπολογίζεται από $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Ξεκινά σε $days ημ · υπολογίζεται από $date · πρόωρη έναρξη ενεργή';
  }

  @override
  String get dashboardFreshStart => 'ΝΕΑ ΑΡΧΗ';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · απομένουν $hours ώ';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required ώ';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours ώ/ημ';
  }

  @override
  String get dashboardLogSessionAction => 'Καταγραφή συνεδρίας μελέτης';

  @override
  String get dashboardLogSessionTooltip => 'Καταγραφή συνεδρίας μελέτης';

  @override
  String get dashboardNewBadge => 'ΝΕΟ';

  @override
  String get dashboardNoCourses => 'Δεν υπάρχουν μαθήματα ακόμη';

  @override
  String get dashboardNoDeadline => 'Χωρίς προθεσμία';

  @override
  String get dashboardNoDeadlines => 'Δεν έχουν προγραμματιστεί προθεσμίες';

  @override
  String get dashboardNoPaceDue => 'Δεν οφείλεται ρυθμός σήμερα';

  @override
  String get dashboardNothingDue => 'Τίποτα οφειλόμενο';

  @override
  String get dashboardNothingToTrack =>
      'Δεν υπάρχει τίποτα για παρακολούθηση ακόμη';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Λήγει σήμερα — απομένουν $hours ώ';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Χρειάζεσαι $daily ώ/ημέρα για να ολοκληρώσεις';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Χρειάζεσαι $daily ώ/ημέρα · $weekly ώ/εβδομάδα για να ολοκληρώσεις';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Χρειάζεσαι $hours ώ/ημέρα από $date · εκτός σημερινού ρυθμού';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Χωρίς προθεσμία — απομένουν $hours ώ · χωρίς καθημερινή πίεση';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Ξεκινά $date · να γίνουν $hours ώ';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · μη ρεαλιστικό';
  }

  @override
  String get dashboardProgramBare => 'ΠΡΟΓΡΑΜΜΑ';

  @override
  String get dashboardProgramEmptyHint =>
      'Πρόσθεσε ένα μάθημα για να ξεκινήσεις την παρακολούθηση';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required ώ';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'ΠΡΟΓΡΑΜΜΑ $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days ημέρες περιθώριο';
  }

  @override
  String get dashboardStartNotSet => 'Δεν έχει οριστεί';

  @override
  String dashboardStartsIn(String days) {
    return 'Ξεκινά σε $days ημ';
  }

  @override
  String get dashboardStartsSoon => 'Ξεκινά σύντομα';

  @override
  String get dashboardTipEmpty =>
      'Πρόσθεσε το πρώτο σου μάθημα — ο ημερήσιος ρυθμός και η πρόοδός σου θα εμφανιστούν εδώ.';

  @override
  String get dashboardTipFirst =>
      'Τα πρώτα 25 λεπτά μετρούν περισσότερο — διάλεξε το μάθημα με την πιο κοντινή προθεσμία.';

  @override
  String get dashboardTodayBare => 'ΣΗΜΕΡΑ';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace ώ';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'ΣΗΜΕΡΑ $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'ΣΗΜΕΡΙΝΟΣ ΡΥΘΜΟΣ';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Σήμερα $logged / $pace ώ';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Μελλοντικές ενάρξεις — καμία πίεση σήμερα, εξαιρούνται από τον σημερινό ρυθμό.';

  @override
  String get dashboardUpcomingTitle => 'Επερχόμενα';

  @override
  String get devToolsActivate => 'Ενεργοποίηση';

  @override
  String get devToolsActivateMessage =>
      'Ξεκλειδώνει κρυφά εργαλεία δοκιμής καταπόνησης (προσθήκη παραγόμενων δεδομένων). Μόνο για ανάπτυξη.';

  @override
  String get devToolsActivateTitle =>
      'Ενεργοποίηση λειτουργίας προγραμματιστή;';

  @override
  String get devToolsActivated => 'Η λειτουργία προγραμματιστή ενεργοποιήθηκε.';

  @override
  String get devToolsClearPumped => 'Εκκαθάριση παραγόμενων δεδομένων';

  @override
  String get devToolsClearPumpedMessage =>
      'Διαγράφει τα παραγόμενα μαθήματα STRESS και τις συνεδρίες τους. Τα δικά σου δεδομένα διατηρούνται.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Διαγραφή παραγόμενων μαθημάτων και συνεδριών STRESS.';

  @override
  String get devToolsClearPumpedTitle => 'Εκκαθάριση παραγόμενων δεδομένων;';

  @override
  String devToolsCleared(String count) {
    return 'Εκκαθαρίστηκαν $count παραγόμενα μαθήματα.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Δεύτερη επιβεβαίωση: θα διογκώσει μαθήματα, λίστες, γραφήματα και υπολογισμούς ρυθμού και μπορεί να πάρει μερικά δευτερόλεπτα. Προσθήκη τώρα;';

  @override
  String get devToolsConfirmPumpTitle => 'Επιβεβαίωση δοκιμής καταπόνησης';

  @override
  String get devToolsContinue => 'Συνέχεια';

  @override
  String get devToolsExit => 'Έξοδος από λειτουργία προγραμματιστή';

  @override
  String get devToolsExitSubtitle =>
      'Απόκρυψη εργαλείων προγραμματιστή σε αυτή τη συσκευή.';

  @override
  String get devToolsPumpData => 'Προσθήκη δεδομένων';

  @override
  String get devToolsPumpMessage =>
      'Εισάγει ένα ρεαλιστικό παραγόμενο εξάμηνο (~10 μαθήματα, ~800 συνεδρίες τις τελευταίες 12 εβδομάδες). Τα υπάρχοντα δεδομένα σου διατηρούνται. Συνέχεια;';

  @override
  String get devToolsPumpSubtitle =>
      'Εισαγωγή παραγόμενου εξαμήνου (~10 μαθήματα, ~800 συνεδρίες, 12 εβδομάδες). Τα υπάρχοντα δεδομένα διατηρούνται.';

  @override
  String get devToolsPumpTile => 'Προσθήκη δεδομένων δοκιμής';

  @override
  String get devToolsPumpTitle => 'Προσθήκη δεδομένων δοκιμής;';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Προστέθηκαν $courses μαθήματα, $sessions συνεδρίες.';
  }

  @override
  String get devToolsPumping => 'Προσθήκη δεδομένων δοκιμής…';

  @override
  String get devToolsRemoveAll => 'Κατάργηση όλων των δεδομένων';

  @override
  String get devToolsRemoveAllMessage =>
      'Συντόμευση προγραμματιστή: διαγράφει οριστικά ΟΛΑ τα μαθήματα, τις συνεδρίες και τις ρυθμίσεις. Δεν μπορεί να αναιρεθεί.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Συντόμευση προγραμματιστή: διαγραφή ΟΛΩΝ των μαθημάτων, συνεδριών και ρυθμίσεων.';

  @override
  String get devToolsRemoveAllTitle => 'Κατάργηση όλων των δεδομένων;';

  @override
  String get navCourses => 'Μαθήματα';

  @override
  String get navDashboard => 'Πίνακας';

  @override
  String get navSettings => 'Ρυθμίσεις';

  @override
  String get navStatistics => 'Στατιστικά';

  @override
  String get navStudyLog => 'Ημερολόγιο μελέτης';

  @override
  String get sampleBadge => 'Δείγμα';

  @override
  String get sessionFormCourseLabel => 'Μάθημα';

  @override
  String sessionFormDateButton(String date) {
    return 'Ημερομηνία: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Η διάρκεια πρέπει να είναι μεγαλύτερη από μηδέν.';

  @override
  String get sessionFormHoursLabel => 'Ώρες';

  @override
  String get sessionFormLogAction => 'Καταγραφή συνεδρίας';

  @override
  String get sessionFormMinutesLabel => 'Λεπτά';

  @override
  String get sessionFormNoCourseError => 'Επίλεξε μάθημα.';

  @override
  String get sessionFormNoCoursesHint =>
      'Πρόσθεσε πρώτα ένα μάθημα για να καταγράψεις συνεδρία.';

  @override
  String get sessionFormNotesLabel => 'Σημειώσεις (προαιρετικά)';

  @override
  String get sessionFormSaving => 'Αποθήκευση…';

  @override
  String get sessionFormTitleAdd => 'Καταγραφή συνεδρίας μελέτης';

  @override
  String get sessionFormTitleEdit => 'Επεξεργασία συνεδρίας μελέτης';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Σύνολο: $hours ώ';
  }

  @override
  String get settingsAccent => 'Χρώμα θέματος';

  @override
  String get settingsAccentBerry => 'Μούρο';

  @override
  String get settingsAccentClay => 'Πηλός';

  @override
  String get settingsAccentForest => 'Δάσος';

  @override
  String get settingsAccentSlate => 'Σχιστόλιθος';

  @override
  String get settingsAccentTeal => 'Πετρόλ';

  @override
  String get settingsAccentUpdated => 'Το χρώμα θέματος ενημερώθηκε.';

  @override
  String get settingsAllDataDeleted => 'Όλα τα δεδομένα διαγράφηκαν.';

  @override
  String get settingsAppearance => 'Εμφάνιση (σκοτεινή / φωτεινή)';

  @override
  String get settingsCheckingSample => 'Έλεγχος δείγματος δεδομένων…';

  @override
  String get settingsClear => 'Εκκαθάριση';

  @override
  String get settingsClearSample => 'Εκκαθάριση δείγματος δεδομένων';

  @override
  String get settingsClearSampleMessage =>
      'Καταργεί τα παραδειγματικά μαθήματα και συνεδρίες. Τα μαθήματα ή οι συνεδρίες που πρόσθεσες εσύ δεν καταργούνται.';

  @override
  String get settingsClearSampleSubtitle =>
      'Κατάργηση των προκαθορισμένων παραδειγματικών μαθημάτων και συνεδριών. Τα δικά σου δεδομένα διατηρούνται.';

  @override
  String get settingsClearSampleTitle => 'Εκκαθάριση δείγματος δεδομένων;';

  @override
  String get settingsCopy => 'Αντιγραφή';

  @override
  String get settingsDailyError => 'Εισήγαγε 0 ή θετικό αριθμό λεπτών.';

  @override
  String get settingsDailyLabel => 'Λεπτά ανά ημέρα (0 = χωρίς στόχο)';

  @override
  String get settingsDailyTarget => 'Ημερήσιος στόχος μελέτης';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes λεπ/ημέρα';
  }

  @override
  String get settingsDailyUpdated => 'Ο ημερήσιος στόχος ενημερώθηκε.';

  @override
  String get settingsData => 'Δεδομένα';

  @override
  String get settingsDeleteEverything => 'Διαγραφή όλων';

  @override
  String get settingsDevMode => 'Λειτουργία προγραμματιστή';

  @override
  String get settingsDisplay => 'Οθόνη';

  @override
  String get settingsDisplayComfortable => 'Άνετη';

  @override
  String get settingsDisplayCompact => 'Συμπαγής';

  @override
  String get settingsDisplayLarge => 'Μεγάλη';

  @override
  String get settingsDisplaySize => 'Μέγεθος κειμένου και στοιχείων';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Το μέγεθος οθόνης ενημερώθηκε.';

  @override
  String get settingsExport => 'Εξαγωγή δεδομένων';

  @override
  String get settingsExportCopied => 'Η εξαγωγή αντιγράφηκε στο πρόχειρο.';

  @override
  String get settingsExportSubtitle =>
      'Αντιγραφή όλων των μαθημάτων, συνεδριών και ρυθμίσεων ως JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses μαθήματα · $sessions συνεδρίες · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (περικόπηκε — το πλήρες αντίγραφο είναι $kb KB, χρησιμοποίησε την Αντιγραφή για όλα)';
  }

  @override
  String get settingsFirstWeekday => 'Πρώτη ημέρα εβδομάδας';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Η πρώτη ημέρα εβδομάδας ενημερώθηκε.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (κράτημα $seconds δ)';
  }

  @override
  String get settingsHoldToReplace => 'Κράτησε για αντικατάσταση όλων';

  @override
  String get settingsHoursError => 'Εισήγαγε αριθμό μεγαλύτερο από μηδέν.';

  @override
  String get settingsHoursHelper =>
      'Προεπιλογή 30. Η αλλαγή επανυπολογίζει τις απαιτήσεις· οι καταγραφές διατηρούνται.';

  @override
  String get settingsHoursLabel => 'Ώρες ανά πιστωτική μονάδα ECTS';

  @override
  String get settingsHoursPerEcts => 'Ώρες ανά ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value ώ';
  }

  @override
  String get settingsHoursUpdated => 'Οι ώρες ανά ECTS ενημερώθηκαν.';

  @override
  String get settingsImport => 'Εισαγωγή δεδομένων';

  @override
  String get settingsImportAppend => 'Προσθήκη';

  @override
  String get settingsImportAppendAction => 'Εισαγωγή (προσθήκη)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Τα δεδομένα προστέθηκαν: $courses μαθήματα, $sessions συνεδρίες.';
  }

  @override
  String get settingsImportInfo =>
      'Η προσθήκη προσθέτει το αντίγραφο δίπλα στα τρέχοντα δεδομένα σου (οι ρυθμίσεις διατηρούνται). Η αντικατάσταση διαγράφει πρώτα ΟΛΑ τα μαθήματα, τις συνεδρίες και τις ρυθμίσεις.';

  @override
  String get settingsImportLabel => 'Επικόλληση εξαχθέντος JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses μαθήματα · $sessions συνεδρίες';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · εξήχθη $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · σχήμα v$schema';
  }

  @override
  String get settingsImportReplace => 'Αντικατάσταση';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Η αντικατάσταση διαγράφει πρώτα τα πάντα. Πάτησε και ΚΡΑΤΗΣΕ το παρακάτω κουμπί για $seconds δευτερόλεπτα για επιβεβαίωση.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Τα δεδομένα αντικαταστάθηκαν: αποκαταστάθηκαν $courses μαθήματα, $sessions συνεδρίες.';
  }

  @override
  String get settingsImportSubtitle =>
      'Αντικατάσταση όλων των δεδομένων από προηγούμενο αντίγραφο JSON.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Συνέχισε να κρατάς… $remaining δ';
  }

  @override
  String get settingsNoSample => 'Χωρίς δείγμα δεδομένων';

  @override
  String get settingsNoSampleSubtitle =>
      'Τα προκαθορισμένα δεδομένα δείγματος έχουν ήδη εκκαθαριστεί.';

  @override
  String get settingsNoTarget => 'Δεν έχει οριστεί στόχος';

  @override
  String get settingsOverloadError => 'Εισήγαγε αριθμό 5–100 ώ/εβδομάδα.';

  @override
  String get settingsOverloadHelper =>
      'Οι εβδομάδες φόρτου πάνω από αυτό επισημαίνονται με κόκκινο. Η πλήρης φοίτηση είναι ~35–40 ώ/εβδομάδα.';

  @override
  String settingsOverloadHours(String value) {
    return '$value ώ';
  }

  @override
  String get settingsOverloadLabel => 'Ώρες ανά εβδομάδα (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/εβδομάδα επισημαίνεται με κόκκινο';
  }

  @override
  String get settingsOverloadThreshold => 'Όριο εβδομαδιαίας υπερφόρτωσης';

  @override
  String get settingsOverloadUpdated => 'Το όριο υπερφόρτωσης ενημερώθηκε.';

  @override
  String get settingsPaceTolerance => 'Ανοχή προπορείας / καθυστέρησης';

  @override
  String get settingsPasteValidBackup =>
      'Επικόλλησε πρώτα ένα έγκυρο αντίγραφο';

  @override
  String get settingsReset => 'Επαναφορά';

  @override
  String get settingsResetAll => 'Επαναφορά όλων των δεδομένων';

  @override
  String get settingsResetAllMessage =>
      'Διαγράφει οριστικά ΟΛΑ τα μαθήματα, τις συνεδρίες και τις ρυθμίσεις. Δεν μπορεί να αναιρεθεί. Εξήγαγε πρώτα αντίγραφο αν χρειάζεται.';

  @override
  String get settingsResetAllSubtitle =>
      'Διαγραφή όλων των μαθημάτων, συνεδριών και ρυθμίσεων.';

  @override
  String get settingsResetAllTitle => 'Επαναφορά όλων των δεδομένων;';

  @override
  String get settingsResetSettings => 'Επαναφορά ρυθμίσεων';

  @override
  String get settingsResetSettingsDone =>
      'Οι ρυθμίσεις επανήλθαν στις προεπιλογές.';

  @override
  String get settingsResetSettingsMessage =>
      'Επαναφέρει ώρες ανά ECTS (30), ημερήσιο στόχο (κανέναν), πρώτη ημέρα εβδομάδας (Δευτέρα), θέμα (συστήματος), ανοχή (5 ημέρες), υπερφόρτωση (35 ώ/εβδομάδα), μέγεθος (άνετο), χρώμα (σχιστόλιθος). Τα μαθήματα και οι συνεδρίες διατηρούνται.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Επαναφορά προεπιλογών: 30 ώ/ECTS, χωρίς στόχο, Δευτέρα, θέμα συστήματος, ανοχή 5 ημερών, υπερφόρτωση 35 ώ/εβδομάδα, άνετο μέγεθος, χρώμα σχιστόλιθος.';

  @override
  String get settingsResetSettingsTitle => 'Επαναφορά ρυθμίσεων;';

  @override
  String get settingsSampleData => 'Δείγμα δεδομένων';

  @override
  String settingsSampleDataError(String error) {
    return 'Σφάλμα: $error';
  }

  @override
  String get settingsStudySettings => 'Ρυθμίσεις μελέτης';

  @override
  String get settingsThemeDark => 'Σκοτεινό';

  @override
  String get settingsThemeLight => 'Φωτεινό';

  @override
  String get settingsThemeSystem => 'Προεπιλογή συστήματος';

  @override
  String get settingsThemeTitle => 'Θέμα';

  @override
  String get settingsThemeUpdated => 'Το θέμα ενημερώθηκε.';

  @override
  String settingsToleranceDays(String value) {
    return '$value ημέρες';
  }

  @override
  String get settingsToleranceError => 'Εισήγαγε αριθμό 0–30 ημέρες.';

  @override
  String get settingsToleranceHelper =>
      'Η προπορεία χρειάζεται +N ημέρες πλεόνασμα, η καθυστέρηση −N ημέρες. 5 = σταθερό, 0 = ευαίσθητο.';

  @override
  String get settingsToleranceLabel => 'Ημέρες εργασίας (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance εργασίας';
  }

  @override
  String get settingsToleranceUpdated => 'Η ανοχή ενημερώθηκε.';

  @override
  String get settingsWeekdayFriday => 'Παρασκευή';

  @override
  String get settingsWeekdayMonday => 'Δευτέρα';

  @override
  String get settingsWeekdaySaturday => 'Σάββατο';

  @override
  String get settingsWeekdaySunday => 'Κυριακή';

  @override
  String get settingsWeekdayThursday => 'Πέμπτη';

  @override
  String get settingsWeekdayTuesday => 'Τρίτη';

  @override
  String get settingsWeekdayWednesday => 'Τετάρτη';

  @override
  String get sortDeadline => 'Προθεσμία';

  @override
  String get sortName => 'Όνομα';

  @override
  String get sortProgress => 'Πρόοδος';

  @override
  String get sortStatus => 'Κατάσταση';

  @override
  String get startupTitle => 'Αδύνατη η εκκίνηση του ECTS Tracker';

  @override
  String get statsActiveDays => 'Ενεργές ημέρες';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days ημ ενεργές';
  }

  @override
  String get statsAddDeadlines =>
      'Πρόσθεσε προθεσμίες για πρόβλεψη του φόρτου.';

  @override
  String get statsComingLoad => 'Επερχόμενος φόρτος';

  @override
  String get statsConsistency => 'Συνέπεια';

  @override
  String get statsConsistencyHint =>
      'Ημέρες μελέτης τις τελευταίες 30 ημέρες. Τα μικρά βήματα κάθε μέρα νικούν το παπαγάλισμα.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% των τελευταίων 30 ημερών';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Μάθημα $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'Μ$id';
  }

  @override
  String get statsDidPerDay => 'Έγιναν / ημέρα (14 ημ)';

  @override
  String get statsEmpty => 'Δεν υπάρχουν συνεδρίες ακόμη';

  @override
  String get statsGap => 'Διαφορά';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value ώ';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursώ';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours ώ';
  }

  @override
  String get statsLast30Days => 'Τελευταίες 30 ημέρες';

  @override
  String get statsLast7Days => 'Τελευταίες 7 ημέρες';

  @override
  String get statsNeedPerDay => 'Χρειάζονται / ημέρα';

  @override
  String get statsNext8Weeks => 'Επόμενες 8 εβδομάδες';

  @override
  String get statsOfLast30DaysVolume => 'του όγκου των τελευταίων 30 ημερών';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Οι εβδομάδες υπερφόρτωσης >$threshold ώ επισημαίνονται με κόκκινο — μετάθεσε μια προθεσμία ή μείωσε την ύλη.';
  }

  @override
  String get statsOverview => 'Επισκόπηση';

  @override
  String get statsPaceCovers =>
      'Ο προηγούμενος ρυθμός καλύπτει το απαιτούμενο. Κράτα το σερί.';

  @override
  String statsPaceShort(String gap) {
    return 'Ο προηγούμενος ρυθμός υπολείπεται κατά $gap ώ/ημέρα — πρόσθεσε ένα μπλοκ ή περιόρισε την ύλη.';
  }

  @override
  String get statsPastVsNeeded => 'Προηγούμενος vs απαιτούμενος';

  @override
  String statsPeakPerWeek(String peak) {
    return 'μέγιστο $peak ώ/εβδ';
  }

  @override
  String get statsPerCourse => 'Ανά μάθημα';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done ώ / $required ώ · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Συνεδρίες';

  @override
  String statsSuggestedOrder(String order) {
    return 'Προτεινόμενη σειρά: $order (η πιο κοντινή προθεσμία πρώτα)';
  }

  @override
  String get statsTotal => 'Σύνολο';

  @override
  String get statsTotalVolume => 'συνολικός όγκος';

  @override
  String get statusAhead => 'Μπροστά';

  @override
  String get statusBehind => 'Πίσω';

  @override
  String get statusCompleted => 'Ολοκληρωμένο';

  @override
  String get statusOnTrack => 'Εντός προγράμματος';

  @override
  String get statusOverdue => 'Εκπρόθεσμο';

  @override
  String get studyLogDeleteBody =>
      'Διαγραφή αυτής της συνεδρίας μελέτης; Δεν μπορεί να αναιρεθεί.';

  @override
  String get studyLogDeleteTitle => 'Διαγραφή συνεδρίας;';

  @override
  String get studyLogEmptyHint =>
      'Κατέγραψε μια συνεδρία για να παρακολουθείς τον χρόνο μελέτης σου.';

  @override
  String get studyLogEmptyTitle => 'Δεν υπάρχουν συνεδρίες μελέτης ακόμη';

  @override
  String get studyLogFabLabel => 'Καταγραφή συνεδρίας';

  @override
  String get studyLogFabTooltip => 'Καταγραφή συνεδρίας';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours ώ';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Κατάργηση δείγματος συνεδρίας';

  @override
  String get studyLogThisWeek => 'Αυτή την εβδομάδα';

  @override
  String get studyLogToday => 'Σήμερα';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Μάθημα $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'Μ$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'Το ECTS πρέπει να είναι μεγαλύτερο από μηδέν';

  @override
  String get validationCourseEctsRequired => 'Εισήγαγε πιστωτικές μονάδες ECTS';

  @override
  String get validationCourseNameRequired => 'Το όνομα είναι υποχρεωτικό';

  @override
  String get validationCourseNameTooLong => 'Το όνομα είναι πολύ μεγάλο';

  @override
  String get validationSessionCourseRequired => 'Επίλεξε μάθημα';

  @override
  String get validationSessionDurationRequired => 'Εισήγαγε διάρκεια';

  @override
  String get widgetNoProgress => 'Χωρίς πρόοδο ακόμη';

  @override
  String get settingsLanguage => 'Γλώσσα';

  @override
  String get settingsLiquidGlass => 'Ρευστό γυαλί';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Κάρτες και μπάρες από θαμπό γυαλί. Ανενεργό διατηρεί την κλασική συμπαγή εμφάνιση.';

  @override
  String get settingsLiquidGlassOn => 'Ενεργό';

  @override
  String get settingsLiquidGlassOff => 'Ανενεργό';

  @override
  String get settingsLiquidGlassUpdated => 'Το ρευστό γυαλί ενημερώθηκε.';
}
