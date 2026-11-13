// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Zrušiť';

  @override
  String get commonClose => 'Zavrieť';

  @override
  String get commonDelete => 'Odstrániť';

  @override
  String get commonEdit => 'Upraviť';

  @override
  String get commonError => 'Chyba';

  @override
  String get commonNone => 'Žiadne';

  @override
  String get commonSave => 'Uložiť';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Požadované hodiny (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Vymazať termín';

  @override
  String get courseFormClearStartTooltip => 'Vymazať dátum začiatku';

  @override
  String get courseFormColorLabel => 'Farba';

  @override
  String get courseFormDateNotSet => 'Nenastavené';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Termín: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS kredity';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Názov';

  @override
  String get courseFormNotesLabel => 'Poznámky (voliteľné)';

  @override
  String get courseFormSaving => 'Ukladá sa…';

  @override
  String courseFormStartButton(String date) {
    return 'Začiatok: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Vyp.: žiadny tlak do $date; vylúčené z dnešného tempa.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Zap.: čas sa delí až doteraz a počíta sa do dnešného tempa.';

  @override
  String get courseFormStartEarlyTitle =>
      'Začať teraz napriek budúcemu začiatku';

  @override
  String get courseFormTitleAdd => 'Pridať kurz';

  @override
  String get courseFormTitleEdit => 'Upraviť kurz';

  @override
  String get coursesAddTooltip => 'Pridať kurz';

  @override
  String coursesDeleteBody(String name) {
    return 'Odstrániť „$name” a všetky jeho študijné stretnutia? Túto akciu nemožno vrátiť.';
  }

  @override
  String get coursesDeleteTitle => 'Odstrániť kurz?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Ťukni na „Nový kurz” a vytvor prvý kurz.';

  @override
  String get coursesEmptyTitle => 'Zatiaľ žiadne kurzy';

  @override
  String get coursesFilterAll => 'Všetky stavy';

  @override
  String get coursesFilterEmpty => 'Tomuto filtru nezodpovedá žiadny kurz';

  @override
  String get coursesNewCourse => 'Nový kurz';

  @override
  String coursesPaceNeeded(String daily) {
    return 'potrebných $daily h/deň';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return 'potrebných $daily min/deň';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'potrebných $daily h/deň • $weekly h/týždeň';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return 'potrebných $daily min/deň • $weekly min/týždeň';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return 'potrebných $daily min/deň • $weekly h/týždeň';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required h • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Odstrániť ukážkový kurz';

  @override
  String coursesShownCount(String count) {
    return 'zobrazených: $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Zoradiť: $label';
  }

  @override
  String get dashboardAllDone => 'Všetko hotové';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h zaznamenaných (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kurz(y)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kurz(y) · $upcoming nadchádzajúcich mimo dnešného tempa';
  }

  @override
  String get dashboardCoursesTitle => 'Kurzy';

  @override
  String dashboardDeadline(String date) {
    return 'Termín $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Termín $date (zostáva $days dní)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Termín $date (zostáva 1 deň)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Termín $date (po termíne)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Termín $date (dnes)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Dnes na rade — zaznamenaných $hours h';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Každý kurz je dokončený — úplný zoznam nájdeš na karte Kurzy.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Pridaj kurz a začni sledovať ECTS pokrok.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Meškanie = robíš $achieved/d, treba $need/d';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Meškanie = robíš $achieved/d, treba $need/d · skorý začiatok';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Meškanie: žiadne konečné tempo nestihne dnešný termín so zostávajúcimi hodinami';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Podľa plánu: zatiaľ žiadne tempo — zaznamenaj prvé stretnutie na potvrdenie';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Začína o $days d · počítané od $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Začína o $days d · počítané od $date · skorý začiatok zapnutý';
  }

  @override
  String get dashboardFreshStart => 'NOVÝ ŠTART';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · zostáva $hours h';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/deň';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/deň';
  }

  @override
  String get dashboardLogSessionAction => 'Zaznamenať študijné stretnutie';

  @override
  String get dashboardLogSessionTooltip => 'Zaznamenať študijné stretnutie';

  @override
  String get dashboardNewBadge => 'NOVÉ';

  @override
  String get dashboardNoCourses => 'Zatiaľ žiadne kurzy';

  @override
  String get dashboardNoDeadline => 'Bez termínu';

  @override
  String get dashboardNoDeadlines => 'Žiadne naplánované termíny';

  @override
  String get dashboardNoPaceDue => 'Dnes nič na rade';

  @override
  String get dashboardNothingDue => 'Nič na rade';

  @override
  String get dashboardNothingToTrack => 'Zatiaľ nič na sledovanie';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Dnes na rade — zostáva $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Treba $daily h/deň na dokončenie';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Treba $daily min/deň na dokončenie';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Treba $daily h/deň · $weekly h/týždeň na dokončenie';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Treba $daily min/deň · $weekly min/týždeň na dokončenie';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Treba $daily min/deň · $weekly h/týždeň na dokončenie';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Treba $hours h/deň od $date · mimo dnešného tempa';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Treba $minutes min/deň od $date · mimo dnešného tempa';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Bez termínu — zostáva $hours h · žiadny denný tlak';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Začína $date · na práci $hours h';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · nerealistické';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Pridaj kurz a začni sledovanie';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days dní rezervy';
  }

  @override
  String get dashboardStartNotSet => 'Nenastavené';

  @override
  String dashboardStartsIn(String days) {
    return 'Začína o $days d';
  }

  @override
  String get dashboardStartsSoon => 'Začína čoskoro';

  @override
  String get dashboardTipEmpty =>
      'Pridaj prvý kurz — denné tempo a pokrok sa zobrazia tu.';

  @override
  String get dashboardTipFirst =>
      'Prvých 25 minút počíta najviac — vyber kurz s najbližším termínom.';

  @override
  String get dashboardTodayBare => 'DNES';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'DNES $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'DNEŠNÉ TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace h dnes';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Budúce začiatky — dnes žiadny tlak, vylúčené z dnešného tempa.';

  @override
  String get dashboardUpcomingTitle => 'Nadchádzajúce';

  @override
  String get devToolsActivate => 'Aktivovať';

  @override
  String get devToolsActivateMessage =>
      'Odomkne skryté záťažové nástroje (generovanie dát). Len na vývoj.';

  @override
  String get devToolsActivateTitle => 'Aktivovať režim dev?';

  @override
  String get devToolsActivated => 'Režim dev aktivovaný.';

  @override
  String get devToolsClearPumped => 'Vymazať generované dáta';

  @override
  String get devToolsClearPumpedMessage =>
      'Odstráni vygenerované kurzy STRESS a ich stretnutia. Tvoje dáta zostanú zachované.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Odstráni vygenerované kurzy a stretnutia STRESS.';

  @override
  String get devToolsClearPumpedTitle => 'Vymazať generované dáta?';

  @override
  String devToolsCleared(String count) {
    return 'Vymazaných $count generovaných kurzov.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Druhé potvrdenie: nafúkne kurzy, zoznamy, grafy a výpočty tempa a môže trvať niekoľko sekúnd. Generovať?';

  @override
  String get devToolsConfirmPumpTitle => 'Potvrdiť záťažové generovanie';

  @override
  String get devToolsContinue => 'Pokračovať';

  @override
  String get devToolsExit => 'Ukončiť režim dev';

  @override
  String get devToolsExitSubtitle =>
      'Skryť vývojárske nástroje na tomto zariadení.';

  @override
  String get devToolsPumpData => 'Generovať dáta';

  @override
  String get devToolsPumpMessage =>
      'Vloží realistický vygenerovaný semester (~10 kurzov, ~800 stretnutí za posledných 12 týždňov). Existujúce dáta zostanú zachované. Pokračovať?';

  @override
  String get devToolsPumpSubtitle =>
      'Vloží vygenerovaný semester (~10 kurzov, ~800 stretnutí, 12 týždňov). Existujúce dáta zachované.';

  @override
  String get devToolsPumpTile => 'Generovať testovacie dáta';

  @override
  String get devToolsPumpTitle => 'Generovať testovacie dáta?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Vygenerovaných $courses kurzov, $sessions stretnutí.';
  }

  @override
  String get devToolsPumping => 'Generujú sa testovacie dáta…';

  @override
  String get devToolsRemoveAll => 'Odstrániť všetky dáta';

  @override
  String get devToolsRemoveAllMessage =>
      'Vývojárska skratka: natrvalo odstráni VŠETKY kurzy, stretnutia a nastavenia. Nemožno vrátiť.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Vývojárska skratka: odstráni VŠETKY kurzy, stretnutia a nastavenia.';

  @override
  String get devToolsRemoveAllTitle => 'Odstrániť všetky dáta?';

  @override
  String get navCourses => 'Kurzy';

  @override
  String get navDashboard => 'Prehľad';

  @override
  String get navSettings => 'Nastavenia';

  @override
  String get navStatistics => 'Štatistiky';

  @override
  String get navStudyLog => 'Denník štúdia';

  @override
  String get sampleBadge => 'Ukážka';

  @override
  String get sessionFormCourseLabel => 'Kurz';

  @override
  String sessionFormDateButton(String date) {
    return 'Dátum: $date';
  }

  @override
  String get sessionFormDurationError => 'Trvanie musí byť väčšie ako nula.';

  @override
  String get sessionFormHoursLabel => 'Hodiny';

  @override
  String get sessionFormLogAction => 'Zaznamenať stretnutie';

  @override
  String get sessionFormMinutesLabel => 'Minúty';

  @override
  String get sessionFormModeManual => 'Ručne';

  @override
  String get sessionFormModeTimer => 'Časovač';

  @override
  String get sessionFormNoCourseError => 'Vyber kurz.';

  @override
  String get sessionFormNoCoursesHint =>
      'Najprv pridaj kurz, aby si mohol zaznamenať stretnutie.';

  @override
  String get sessionFormNotesLabel => 'Poznámky (voliteľné)';

  @override
  String get sessionFormSaving => 'Ukladá sa…';

  @override
  String get sessionFormTitleAdd => 'Zaznamenať študijné stretnutie';

  @override
  String get sessionFormTitleEdit => 'Upraviť študijné stretnutie';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Spolu: $hours h';
  }

  @override
  String get settingsAccent => 'Farba motívu';

  @override
  String get settingsAccentBerry => 'Bobuľová';

  @override
  String get settingsAccentClay => 'Hlinitá';

  @override
  String get settingsAccentForest => 'Lesná';

  @override
  String get settingsAccentSlate => 'Bridlicová';

  @override
  String get settingsAccentTeal => 'Petrolejová';

  @override
  String get settingsAccentUpdated => 'Farba motívu aktualizovaná.';

  @override
  String get settingsAllDataDeleted => 'Všetky dáta odstránené.';

  @override
  String get settingsAppearance => 'Vzhľad (tmavý / svetlý)';

  @override
  String get settingsCheckingSample => 'Kontrolujú sa ukážkové dáta…';

  @override
  String get settingsClear => 'Vymazať';

  @override
  String get settingsClearSample => 'Vymazať ukážkové dáta';

  @override
  String get settingsClearSampleMessage =>
      'Odstráni ukážkové kurzy a stretnutia. Kurzy alebo stretnutia, ktoré si pridal sám, sa neodstránia.';

  @override
  String get settingsClearSampleSubtitle =>
      'Odstráni vložené ukážkové kurzy a stretnutia. Tvoje dáta zostanú zachované.';

  @override
  String get settingsClearSampleTitle => 'Vymazať ukážkové dáta?';

  @override
  String get settingsCopy => 'Kopírovať';

  @override
  String get settingsDailyError => 'Zadaj 0 alebo kladný počet minút.';

  @override
  String get settingsDailyLabel => 'Minút denne (0 = bez cieľa)';

  @override
  String get settingsDailyTarget => 'Denný cieľ štúdia';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/deň';
  }

  @override
  String get settingsDailyUpdated => 'Denný cieľ aktualizovaný.';

  @override
  String get settingsData => 'Dáta';

  @override
  String get settingsDeleteEverything => 'Odstrániť všetko';

  @override
  String get settingsDevMode => 'Režim dev';

  @override
  String get settingsDisplay => 'Zobrazenie';

  @override
  String get settingsDisplayComfortable => 'Pohodlné';

  @override
  String get settingsDisplayCompact => 'Kompaktné';

  @override
  String get settingsDisplayLarge => 'Veľké';

  @override
  String get settingsDisplaySize => 'Veľkosť textu a prvkov';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Veľkosť zobrazenia aktualizovaná.';

  @override
  String get settingsExport => 'Exportovať dáta';

  @override
  String get settingsExportCopied => 'Export skopírovaný do schránky.';

  @override
  String get settingsExportSubtitle =>
      'Skopíruj všetky kurzy, stretnutia a nastavenia ako JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kurz(y) · $sessions stretnutí · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (skrátené — úplná záloha má $kb KB, na všetko použi Kopírovať)';
  }

  @override
  String get settingsFirstWeekday => 'Prvý deň v týždni';

  @override
  String get settingsFirstWeekdayUpdated => 'Prvý deň v týždni aktualizovaný.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (podrž $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Podrž na nahradenie všetkého';

  @override
  String get settingsHoursError => 'Zadaj číslo väčšie ako nula.';

  @override
  String get settingsHoursHelper =>
      'Predvolené 30. Zmena prepočíta požiadavky; záznamy zostanú.';

  @override
  String get settingsHoursLabel => 'Hodín na ECTS kredit';

  @override
  String get settingsHoursPerEcts => 'Hodín na ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Hodiny na ECTS aktualizované.';

  @override
  String get settingsImport => 'Importovať dáta';

  @override
  String get settingsImportAppend => 'Pridať';

  @override
  String get settingsImportAppendAction => 'Importovať (pridať)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Dáta pridané: $courses kurz(y), $sessions stretnutí.';
  }

  @override
  String get settingsImportInfo =>
      'Pridanie pripojí zálohu k aktuálnym dátam (nastavenia zostanú). Nahradenie najprv vymaže VŠETKY kurzy, stretnutia a nastavenia.';

  @override
  String get settingsImportLabel => 'Prilep exportovaný JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kurz(y) · $sessions stretnutí';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · exportované $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · schéma v$schema';
  }

  @override
  String get settingsImportReplace => 'Nahradiť';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Nahradenie najprv všetko odstráni. Na potvrdenie STLAČ A PODRŽ tlačidlo nižšie $seconds sekúnd.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Dáta nahradené: obnovených $courses kurz(y), $sessions stretnutí.';
  }

  @override
  String get settingsImportSubtitle =>
      'Nahraď všetky dáta z predtým exportovanej zálohy JSON.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Drž ďalej… $remaining s';
  }

  @override
  String get settingsNoSample => 'Žiadne ukážkové dáta';

  @override
  String get settingsNoSampleSubtitle =>
      'Vložené ukážkové dáta už boli vymazané.';

  @override
  String get settingsNoTarget => 'Žiadny cieľ';

  @override
  String get settingsOverloadError => 'Zadaj číslo 5–100 h/týždeň.';

  @override
  String get settingsOverloadHelper =>
      'Týždne s vyššou záťažou sa označia červenou. Denné štúdium je ~35–40 h/týždeň.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Hodín týždenne (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/týždeň označí červenou';
  }

  @override
  String get settingsOverloadThreshold => 'Týždenný prah preťaženia';

  @override
  String get settingsOverloadUpdated => 'Prah preťaženia aktualizovaný.';

  @override
  String get settingsPaceTolerance => 'Tolerancia predstihu / meškania';

  @override
  String get settingsPasteValidBackup => 'Najprv prilep platnú zálohu';

  @override
  String get settingsReset => 'Resetovať';

  @override
  String get settingsResetAll => 'Resetovať všetky dáta';

  @override
  String get settingsResetAllMessage =>
      'Natrvalo odstráni VŠETKY kurzy, stretnutia a nastavenia. Nemožno vrátiť. V prípade potreby najprv exportuj zálohu.';

  @override
  String get settingsResetAllSubtitle =>
      'Odstráni všetky kurzy, stretnutia a nastavenia.';

  @override
  String get settingsResetAllTitle => 'Resetovať všetky dáta?';

  @override
  String get settingsResetSettings => 'Resetovať nastavenia';

  @override
  String get settingsResetSettingsDone => 'Nastavenia obnovené na predvolené.';

  @override
  String get settingsResetSettingsMessage =>
      'Obnoví hodiny na ECTS (30), denný cieľ (žiadny), prvý deň (pondelok), motív (systémový), toleranciu (5 dní), preťaženie (35 h/týždeň), veľkosť (pohodlná), farbu (bridlicová). Kurzy a stretnutia zostanú zachované.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Obnoví predvolené: 30 h/ECTS, bez cieľa, pondelok, systémový motív, tolerancia 5 dní, preťaženie 35 h/týždeň, pohodlná veľkosť, bridlicová farba.';

  @override
  String get settingsResetSettingsTitle => 'Resetovať nastavenia?';

  @override
  String get settingsSampleData => 'Ukážkové dáta';

  @override
  String settingsSampleDataError(String error) {
    return 'Chyba: $error';
  }

  @override
  String get settingsStudySettings => 'Nastavenia štúdia';

  @override
  String get settingsThemeDark => 'Tmavý';

  @override
  String get settingsThemeLight => 'Svetlý';

  @override
  String get settingsThemeSystem => 'Systémový predvolený';

  @override
  String get settingsThemeTitle => 'Motív';

  @override
  String get settingsThemeUpdated => 'Motív aktualizovaný.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dní';
  }

  @override
  String get settingsToleranceError => 'Zadaj číslo 0–30 dní.';

  @override
  String get settingsToleranceHelper =>
      'Predstih vyžaduje +N dní rezervy, meškanie −N dní. 5 = stabilné, 0 = citlivé.';

  @override
  String get settingsToleranceLabel => 'Dní práce (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance práce';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerancia aktualizovaná.';

  @override
  String get settingsWeekdayFriday => 'Piatok';

  @override
  String get settingsWeekdayMonday => 'Pondelok';

  @override
  String get settingsWeekdaySaturday => 'Sobota';

  @override
  String get settingsWeekdaySunday => 'Nedeľa';

  @override
  String get settingsWeekdayThursday => 'Štvrtok';

  @override
  String get settingsWeekdayTuesday => 'Utorok';

  @override
  String get settingsWeekdayWednesday => 'Streda';

  @override
  String get sortDeadline => 'Termín';

  @override
  String get sortName => 'Názov';

  @override
  String get sortProgress => 'Pokrok';

  @override
  String get sortStatus => 'Stav';

  @override
  String get startupTitle => 'ECTS Tracker sa nepodarilo spustiť';

  @override
  String get statsActiveDays => 'Aktívne dni';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d aktívnych';
  }

  @override
  String get statsAddDeadlines => 'Pridaj termíny na prognózu záťaže.';

  @override
  String get statsComingLoad => 'Nadchádzajúca záťaž';

  @override
  String get statsConsistency => 'Pravidelnosť';

  @override
  String get statsConsistencyHint =>
      'Dni štúdia za posledných 30 dní. Malé kroky každý deň porazia bifľovanie.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% z posledných 30 dní';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Kurz $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'K$id';
  }

  @override
  String get statsDidPerDay => 'Hotovo / deň (14 d)';

  @override
  String get statsEmpty => 'Zatiaľ žiadne stretnutia';

  @override
  String get statsGap => 'Rozdiel';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value h';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}h';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get statsLast30Days => 'Posledných 30 dní';

  @override
  String get statsLast7Days => 'Posledných 7 dní';

  @override
  String get statsNeedPerDay => 'Treba / deň';

  @override
  String get statsNext8Weeks => 'Nasledujúcich 8 týždňov';

  @override
  String get statsOfLast30DaysVolume => 'objemu za posledných 30 dní';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Týždne s preťažením >$threshold h označené červenou — presuň termín alebo zredukuj rozsah.';
  }

  @override
  String get statsOverview => 'Prehľad';

  @override
  String get statsPaceCovers => 'Doterajšie tempo stačí. Udrž sériu.';

  @override
  String statsPaceShort(String gap) {
    return 'Doterajšie tempo je o $gap h/deň málo — pridaj blok alebo zredukuj rozsah.';
  }

  @override
  String get statsPastVsNeeded => 'Doteraz vs treba';

  @override
  String statsPeakPerWeek(String peak) {
    return 'špička $peak h/týž.';
  }

  @override
  String get statsPerCourse => 'Na kurz';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Stretnutia';

  @override
  String statsSuggestedOrder(String order) {
    return 'Navrhované poradie: $order (najprv najskorší termín)';
  }

  @override
  String get statsTotal => 'Spolu';

  @override
  String get statsTotalVolume => 'celkový objem';

  @override
  String get statusAhead => 'V predstihu';

  @override
  String get statusBehind => 'Mešká';

  @override
  String get statusCompleted => 'Dokončený';

  @override
  String get statusOnTrack => 'Podľa plánu';

  @override
  String get statusOverdue => 'Po termíne';

  @override
  String get studyLogDeleteBody =>
      'Odstrániť toto študijné stretnutie? Nemožno vrátiť.';

  @override
  String get studyLogDeleteTitle => 'Odstrániť stretnutie?';

  @override
  String get studyLogEmptyHint => 'Zaznamenaj stretnutie a sleduj čas štúdia.';

  @override
  String get studyLogEmptyTitle => 'Zatiaľ žiadne študijné stretnutia';

  @override
  String get studyLogFabLabel => 'Zaznamenať stretnutie';

  @override
  String get studyLogFabTooltip => 'Zaznamenať stretnutie';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Odstrániť ukážkové stretnutie';

  @override
  String get studyLogThisWeek => 'Tento týždeň';

  @override
  String get studyLogToday => 'Dnes';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Kurz $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return 'Meranie času: $course';
  }

  @override
  String get studyTimerAlreadyRunning =>
      'Časovač už beží. Najprv ho dokonči alebo zahoď.';

  @override
  String get studyTimerCourseLabel => 'Kurz';

  @override
  String get studyTimerDiscard => 'Zahodiť';

  @override
  String get studyTimerDiscardBody =>
      'Zahodiť aktuálny časovač bez zaznamenania? Nemožno vrátiť.';

  @override
  String get studyTimerDiscardTitle => 'Zahodiť časovač?';

  @override
  String studyTimerFinishLog(String minutes) {
    return 'Dokončiť & zaznamenať $minutes min';
  }

  @override
  String get studyTimerNoCourseError => 'Vyber kurz.';

  @override
  String get studyTimerNoCoursesHint =>
      'Najprv pridaj kurz, aby si mohol spustiť časovač.';

  @override
  String studyTimerNotifPaused(String elapsed) {
    return 'Pozastavené · $elapsed';
  }

  @override
  String get studyTimerNotifRunning => 'Ťukni pre otvorenie časovača.';

  @override
  String get studyTimerPause => 'Pozastaviť';

  @override
  String get studyTimerResume => 'Pokračovať';

  @override
  String get studyTimerStart => 'Spustiť časovač';

  @override
  String get studyTimerStartTitle => 'Spustiť časovač štúdia';

  @override
  String get studyTimerTooShort => 'Časovač ešte nebežal.';

  @override
  String get validationCourseEctsPositive => 'ECTS musí byť väčšie ako nula';

  @override
  String get validationCourseEctsRequired => 'Zadaj ECTS kredity';

  @override
  String get validationCourseNameRequired => 'Názov je povinný';

  @override
  String get validationCourseNameTooLong => 'Názov je príliš dlhý';

  @override
  String get validationSessionCourseRequired => 'Vyber kurz';

  @override
  String get validationSessionDurationRequired => 'Zadaj trvanie';

  @override
  String get widgetNoProgress => 'Zatiaľ žiadny pokrok';

  @override
  String get settingsLanguage => 'Jazyk';

  @override
  String get settingsLiquidGlass => 'Tekuté sklo';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Karty a lišty z matného skla. Vyp. zachová klasický celistvý vzhľad.';

  @override
  String get settingsLiquidGlassOn => 'Zap.';

  @override
  String get settingsLiquidGlassOff => 'Vyp.';

  @override
  String get settingsLiquidGlassUpdated => 'Tekuté sklo aktualizované.';

  @override
  String get devToolsReminderPreview => 'Náhľad pripomienok';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Pozri, čo by sa oznámilo práve teraz. Testovací kanál bezpečný pre Windows.';

  @override
  String get reminderPreviewTitle => 'Náhľad pripomienok';

  @override
  String get reminderPreviewNow => 'Čas ukážky';

  @override
  String get reminderPreviewReset => 'Teraz';

  @override
  String get reminderPreviewEmpty =>
      'Všade ticho — v tomto čase by sa nič neoznámilo.';

  @override
  String get reminderPreviewCustom => 'Vlastné rozvrhy (ukážka)';

  @override
  String get reminderPreviewNoFire => 'Žiadne nadchádzajúce spustenie.';

  @override
  String get reminderKindDaily => 'Denný';

  @override
  String get reminderKindBehind => 'Mešká';

  @override
  String get reminderKindDeadline => 'Termín';

  @override
  String get reminderKindOverdue => 'Po termíne';

  @override
  String get reminderKindStreak => 'Séria';

  @override
  String get reminderKindCustom => 'Vlastný';

  @override
  String get settingsReminders => 'Študijné pripomienky';

  @override
  String get settingsRemindersOff => 'Vyp. — zapni pre dennú pripomienku.';

  @override
  String get settingsReminderTime => 'Čas pripomienky';

  @override
  String get settingsReminderDenied =>
      'Upozornenia sú zablokované — povoľ ich v systémových nastaveniach.';

  @override
  String notifDurationHours(String value) {
    return '$value h';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value min';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Dnes večer: $duration na udržanie plánu';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course dnes ešte $duration';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count ďalších)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Zaznamenaj stretnutie a dnes máš hotovo.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course skĺzol do meškania';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return 'Zostáva $left, $days dní do konca — odteraz $pace/deň. Zaznamenaj $catchUp a si späť podľa plánu.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return 'Zostáva $left, $days dní do konca — odteraz $pace/deň. Pomôže len dokončenie celých $left — začni dnes večer.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left je stále otvorených a termín je tu. Čokoľvek si teraz zaznamenáš, sa počíta.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course má termín zajtra a stále chýba $left';
  }

  @override
  String get notifDeadlineTomorrowBody =>
      'Čokoľvek si dnes zaznamenáš, platí dvojnásobne.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ $course skúška o $days dní — zostáva $left';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'To je $pace/deň. Rozdeľ si to: 2 stretnutia denne zdolajú jeden maratón.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace =>
      'Každá hodina, ktorú si teraz zaznamenáš, sa počíta.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course prekročil termín, $left zostáva otvorených';
  }

  @override
  String get notifOverdueBody =>
      'Presuň termín alebo dokonči hodiny — kurz dovtedy zostáva v stave vyžadujúcom pozornosť.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days-dňová séria — $week tento týždeň';
  }

  @override
  String get notifStreakBody =>
      'Všetky kurzy podľa plánu alebo v predstihu. Len tak ďalej.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Študijná kontrola: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Čas na aktualizáciu: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left otvorených · $pace/deň na včasné dokončenie. Zaznamenaj stretnutie a aktualizuj pokrok.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left je stále otvorených — čokoľvek si teraz zaznamenáš, sa počíta.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Ďalšia: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1d';

  @override
  String get reminderPreviewFwdDay => '+1d';

  @override
  String get reminderPreviewFake => '(falošné)';

  @override
  String get reminderPreviewDemoLabel => 'Ukážková kontrola';
}
