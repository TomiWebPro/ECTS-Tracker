// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Mégse';

  @override
  String get commonClose => 'Bezárás';

  @override
  String get commonDelete => 'Törlés';

  @override
  String get commonEdit => 'Szerkesztés';

  @override
  String get commonError => 'Hiba';

  @override
  String get commonNone => 'Nincs';

  @override
  String get commonSave => 'Mentés';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Szükséges órák (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Határidő törlése';

  @override
  String get courseFormClearStartTooltip => 'Kezdési dátum törlése';

  @override
  String get courseFormColorLabel => 'Szín';

  @override
  String get courseFormDateNotSet => 'Nincs megadva';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Határidő: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS kreditek';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value ó/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Név';

  @override
  String get courseFormNotesLabel => 'Jegyzetek (opcionális)';

  @override
  String get courseFormSaving => 'Mentés…';

  @override
  String courseFormStartButton(String date) {
    return 'Kezdés: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Ki: nincs nyomás $date dátumig; kimarad a mai tempóból.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Be: az idő mostanáig elosztva, beleszámít a mai tempóba.';

  @override
  String get courseFormStartEarlyTitle =>
      'Kezdés most a jövőbeli kezdés ellenére';

  @override
  String get courseFormTitleAdd => 'Kurzus hozzáadása';

  @override
  String get courseFormTitleEdit => 'Kurzus szerkesztése';

  @override
  String get coursesAddTooltip => 'Kurzus hozzáadása';

  @override
  String coursesDeleteBody(String name) {
    return 'Törlöd a(z) „$name” kurzust és minden tanulási alkalmát? Ez nem vonható vissza.';
  }

  @override
  String get coursesDeleteTitle => 'Törlöd a kurzust?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Koppints az „Új kurzus” gombra az első kurzus létrehozásához.';

  @override
  String get coursesEmptyTitle => 'Még nincsenek kurzusok';

  @override
  String get coursesFilterAll => 'Minden állapot';

  @override
  String get coursesFilterEmpty => 'Nincs a szűrőnek megfelelő kurzus';

  @override
  String get coursesNewCourse => 'Új kurzus';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily ó/nap szükséges';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily ó/nap • $weekly ó/hét szükséges';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required ó • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Mintakurzus eltávolítása';

  @override
  String coursesShownCount(String count) {
    return '$count megjelenítve';
  }

  @override
  String coursesSortOption(String label) {
    return 'Rendezés: $label';
  }

  @override
  String get dashboardAllDone => 'Minden kész';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours ó naplózva (bónusz)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kurzus';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kurzus · $upcoming közelgő nem számít a mai tempóba';
  }

  @override
  String get dashboardCoursesTitle => 'Kurzusok';

  @override
  String dashboardDeadline(String date) {
    return 'Határidő: $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Határidő: $date ($days nap van hátra)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Határidő: $date (1 nap van hátra)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Határidő: $date (lejárt)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Határidő: $date (ma)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Mára esedékes — $hours ó naplózva';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Minden kurzus kész — a teljes listát lásd a Kurzusok lapon.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Adj hozzá egy kurzust az ECTS-előrehaladás követéséhez.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Lemaradva = $achieved/nap a teljesítmény, $need/nap kellene';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Lemaradva = $achieved/nap a teljesítmény, $need/nap kellene · korai kezdés';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Lemaradva: nincs olyan véges tempó, amivel a mai határidő hátralévő órái teljesíthetők';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Sínen: még nincs tempó — naplózd az első alkalmat a megerősítéshez';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days nap múlva kezdődik · $date dátumtól számítva';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days nap múlva kezdődik · $date dátumtól számítva · korai kezdés bekapcsolva';
  }

  @override
  String get dashboardFreshStart => 'ÚJ KEZDET';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · $hours ó van hátra';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required ó';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours ó/nap';
  }

  @override
  String get dashboardLogSessionAction => 'Tanulási alkalom naplózása';

  @override
  String get dashboardLogSessionTooltip => 'Tanulási alkalom naplózása';

  @override
  String get dashboardNewBadge => 'ÚJ';

  @override
  String get dashboardNoCourses => 'Még nincsenek kurzusok';

  @override
  String get dashboardNoDeadline => 'Nincs határidő';

  @override
  String get dashboardNoDeadlines => 'Nincsenek ütemezett határidők';

  @override
  String get dashboardNoPaceDue => 'Mára nincs esedékes tempó';

  @override
  String get dashboardNothingDue => 'Nincs esedékes';

  @override
  String get dashboardNothingToTrack => 'Még nincs mit követni';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Mára esedékes — $hours ó van hátra';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'A befejezéshez $daily ó/nap kell';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'A befejezéshez $daily ó/nap · $weekly ó/hét kell';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$hours ó/nap kell $date dátumtól · nem számít a mai tempóba';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Nincs határidő — $hours ó van hátra · nincs napi nyomás';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Kezdődik: $date · $hours ó teendő';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · irreális';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Adj hozzá egy kurzust a követéshez';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required ó';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days napnyi tartalék';
  }

  @override
  String get dashboardStartNotSet => 'Nincs megadva';

  @override
  String dashboardStartsIn(String days) {
    return '$days nap múlva kezdődik';
  }

  @override
  String get dashboardStartsSoon => 'Hamarosan kezdődik';

  @override
  String get dashboardTipEmpty =>
      'Add hozzá az első kurzusod — itt jelenik meg a napi tempó és az előrehaladás.';

  @override
  String get dashboardTipFirst =>
      'Az első 25 perc számít a legtöbbet — válaszd a legkorábban esedékes kurzust.';

  @override
  String get dashboardTodayBare => 'MA';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace ó';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'MA $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'MAI TEMPÓ';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace ó ma';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Későbbi kezdések — ma nincs nyomás, kimaradnak a mai tempóból.';

  @override
  String get dashboardUpcomingTitle => 'Közelgő';

  @override
  String get devToolsActivate => 'Aktiválás';

  @override
  String get devToolsActivateMessage =>
      'Ez feloldja a rejtett stresszteszt-eszközöket (generált adatok betöltése). Csak fejlesztéshez.';

  @override
  String get devToolsActivateTitle => 'Aktiválod a fejlesztői módot?';

  @override
  String get devToolsActivated => 'Fejlesztői mód aktiválva.';

  @override
  String get devToolsClearPumped => 'Generált adatok törlése';

  @override
  String get devToolsClearPumpedMessage =>
      'Törli a generált STRESS kurzusokat és alkalmaikat. A saját adataid megmaradnak.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'A generált STRESS kurzusok és alkalmak törlése.';

  @override
  String get devToolsClearPumpedTitle => 'Törlöd a generált adatokat?';

  @override
  String devToolsCleared(String count) {
    return '$count generált kurzus törölve.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Második megerősítés: ez felduzzasztja a kurzusokat, listákat, diagramokat és tempószámításokat, és eltarthat néhány másodpercig. Betöltöd most?';

  @override
  String get devToolsConfirmPumpTitle => 'Stresszteszt megerősítése';

  @override
  String get devToolsContinue => 'Folytatás';

  @override
  String get devToolsExit => 'Kilépés a fejlesztői módból';

  @override
  String get devToolsExitSubtitle =>
      'Fejlesztői eszközök elrejtése ezen az eszközön.';

  @override
  String get devToolsPumpData => 'Adatok betöltése';

  @override
  String get devToolsPumpMessage =>
      'Ez egy valósághű generált félévet szúr be (~10 kurzus, ~800 alkalom az elmúlt 12 hétben). A meglévő adataid megmaradnak. Folytatod?';

  @override
  String get devToolsPumpSubtitle =>
      'Generált félév beszúrása (~10 kurzus, ~800 alkalom, 12 hét). A meglévő adatok megmaradnak.';

  @override
  String get devToolsPumpTile => 'Tesztadatok betöltése';

  @override
  String get devToolsPumpTitle => 'Betöltöd a tesztadatokat?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Betöltve: $courses kurzus, $sessions alkalom.';
  }

  @override
  String get devToolsPumping => 'Tesztadatok betöltése…';

  @override
  String get devToolsRemoveAll => 'Minden adat törlése';

  @override
  String get devToolsRemoveAllMessage =>
      'Fejlesztői parancs: véglegesen törli az ÖSSZES kurzust, alkalmat és beállítást. Ez nem vonható vissza.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Fejlesztői parancs: az ÖSSZES kurzus, alkalom és beállítás törlése.';

  @override
  String get devToolsRemoveAllTitle => 'Törlöd az összes adatot?';

  @override
  String get navCourses => 'Kurzusok';

  @override
  String get navDashboard => 'Irányítópult';

  @override
  String get navSettings => 'Beállítások';

  @override
  String get navStatistics => 'Statisztikák';

  @override
  String get navStudyLog => 'Tanulási napló';

  @override
  String get sampleBadge => 'Minta';

  @override
  String get sessionFormCourseLabel => 'Kurzus';

  @override
  String sessionFormDateButton(String date) {
    return 'Dátum: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Az időtartamnak nullánál nagyobbnak kell lennie.';

  @override
  String get sessionFormHoursLabel => 'Órák';

  @override
  String get sessionFormLogAction => 'Alkalom naplózása';

  @override
  String get sessionFormMinutesLabel => 'Percek';

  @override
  String get sessionFormNoCourseError => 'Válassz kurzust.';

  @override
  String get sessionFormNoCoursesHint =>
      'Előbb adj hozzá egy kurzust az alkalom naplózásához.';

  @override
  String get sessionFormNotesLabel => 'Jegyzetek (opcionális)';

  @override
  String get sessionFormSaving => 'Mentés…';

  @override
  String get sessionFormTitleAdd => 'Tanulási alkalom naplózása';

  @override
  String get sessionFormTitleEdit => 'Tanulási alkalom szerkesztése';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Összesen: $hours ó';
  }

  @override
  String get settingsAccent => 'Témaszín';

  @override
  String get settingsAccentBerry => 'Bogyó';

  @override
  String get settingsAccentClay => 'Agyag';

  @override
  String get settingsAccentForest => 'Erdő';

  @override
  String get settingsAccentSlate => 'Pala';

  @override
  String get settingsAccentTeal => 'Pávakék';

  @override
  String get settingsAccentUpdated => 'Témaszín frissítve.';

  @override
  String get settingsAllDataDeleted => 'Minden adat törölve.';

  @override
  String get settingsAppearance => 'Megjelenés (sötét / világos)';

  @override
  String get settingsCheckingSample => 'Mintaadatok ellenőrzése…';

  @override
  String get settingsClear => 'Törlés';

  @override
  String get settingsClearSample => 'Mintaadatok törlése';

  @override
  String get settingsClearSampleMessage =>
      'Eltávolítja a példakurzusokat és alkalmakat. A saját magad által hozzáadott kurzusok és alkalmak megmaradnak.';

  @override
  String get settingsClearSampleSubtitle =>
      'A beépített példakurzusok és alkalmak eltávolítása. A saját adataid megmaradnak.';

  @override
  String get settingsClearSampleTitle => 'Törlöd a mintaadatokat?';

  @override
  String get settingsCopy => 'Másolás';

  @override
  String get settingsDailyError => 'Adj meg 0 vagy pozitív percértéket.';

  @override
  String get settingsDailyLabel => 'Napi percek (0 = nincs cél)';

  @override
  String get settingsDailyTarget => 'Napi tanulási cél';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes perc/nap';
  }

  @override
  String get settingsDailyUpdated => 'Napi cél frissítve.';

  @override
  String get settingsData => 'Adatok';

  @override
  String get settingsDeleteEverything => 'Minden törlése';

  @override
  String get settingsDevMode => 'Fejlesztői mód';

  @override
  String get settingsDisplay => 'Kijelző';

  @override
  String get settingsDisplayComfortable => 'Kényelmes';

  @override
  String get settingsDisplayCompact => 'Kompakt';

  @override
  String get settingsDisplayLarge => 'Nagy';

  @override
  String get settingsDisplaySize => 'Szöveg- és elemméret';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Kijelzőméret frissítve.';

  @override
  String get settingsExport => 'Adatok exportálása';

  @override
  String get settingsExportCopied => 'Exportálás a vágólapra másolva.';

  @override
  String get settingsExportSubtitle =>
      'Minden kurzus, alkalom és beállítás másolása JSON-ként.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kurzus · $sessions alkalom · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (csonkítva — a teljes biztonsági mentés $kb KB, a Másolás gombbal mindent átmásolhatsz)';
  }

  @override
  String get settingsFirstWeekday => 'A hét első napja';

  @override
  String get settingsFirstWeekdayUpdated => 'A hét első napja frissítve.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds mp nyomva tartás)';
  }

  @override
  String get settingsHoldToReplace => 'Nyomva tartás a teljes cseréhez';

  @override
  String get settingsHoursError => 'Adj meg nullánál nagyobb számot.';

  @override
  String get settingsHoursHelper =>
      'Alapértelmezett 30. Módosításkor újraszámolja a követelményeket; a naplók megmaradnak.';

  @override
  String get settingsHoursLabel => 'Óra ECTS kreditenként';

  @override
  String get settingsHoursPerEcts => 'Óra ECTS-enként';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value ó';
  }

  @override
  String get settingsHoursUpdated => 'Óra/ECTS frissítve.';

  @override
  String get settingsImport => 'Adatok importálása';

  @override
  String get settingsImportAppend => 'Hozzáfűzés';

  @override
  String get settingsImportAppendAction => 'Importálás (hozzáfűzés)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Adatok hozzáfűzve: $courses kurzus, $sessions alkalom hozzáadva.';
  }

  @override
  String get settingsImportInfo =>
      'A hozzáfűzés a biztonsági mentést a jelenlegi adatok mellé adja (beállítások megmaradnak). A csere előbb MINDEN kurzust, alkalmat és beállítást töröl.';

  @override
  String get settingsImportLabel => 'Exportált JSON beillesztése';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kurzus · $sessions alkalom';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· exportálva: $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· séma v$schema';
  }

  @override
  String get settingsImportReplace => 'Csere';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'A csere előbb mindent töröl. Nyomd le és TARTSD lenyomva az alábbi gombot $seconds másodpercig a megerősítéshez.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Adatok cserélve: $courses kurzus, $sessions alkalom visszaállítva.';
  }

  @override
  String get settingsImportSubtitle =>
      'Minden adat cseréje korábban exportált JSON biztonsági mentésből.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Tartsd tovább… $remaining mp';
  }

  @override
  String get settingsNoSample => 'Nincs mintaadat';

  @override
  String get settingsNoSampleSubtitle =>
      'A beépített példaadatok már törölve lettek.';

  @override
  String get settingsNoTarget => 'Nincs beállított cél';

  @override
  String get settingsOverloadError => 'Adj meg egy számot 5–100 ó/hét között.';

  @override
  String get settingsOverloadHelper =>
      'Az ezt meghaladó terhelésű hetek pirossal jelölve. A teljes idejű tanulás ~35–40 ó/hét.';

  @override
  String settingsOverloadHours(String value) {
    return '$value ó';
  }

  @override
  String get settingsOverloadLabel => 'Óra hetente (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/hét pirossal jelölve';
  }

  @override
  String get settingsOverloadThreshold => 'Heti túlterhelési küszöb';

  @override
  String get settingsOverloadUpdated => 'Túlterhelési küszöb frissítve.';

  @override
  String get settingsPaceTolerance => 'Előny / lemaradás tűrés';

  @override
  String get settingsPasteValidBackup =>
      'Előbb illessz be egy érvényes biztonsági mentést';

  @override
  String get settingsReset => 'Visszaállítás';

  @override
  String get settingsResetAll => 'Minden adat visszaállítása';

  @override
  String get settingsResetAllMessage =>
      'Véglegesen törli az ÖSSZES kurzust, alkalmat és beállítást. Ez nem vonható vissza. Szükség esetén előbb exportálj biztonsági mentést.';

  @override
  String get settingsResetAllSubtitle =>
      'Minden kurzus, alkalom és beállítás törlése.';

  @override
  String get settingsResetAllTitle => 'Visszaállítod az összes adatot?';

  @override
  String get settingsResetSettings => 'Beállítások visszaállítása';

  @override
  String get settingsResetSettingsDone =>
      'Beállítások visszaállítva az alapértékekre.';

  @override
  String get settingsResetSettingsMessage =>
      'Visszaállítja az óra/ECTS (30), napi cél (nincs), hét első napja (hétfő), téma (rendszer), tűrés (5 nap), túlterhelés (35 ó/hét), méret (kényelmes), szín (pala) értékeket. A kurzusok és alkalmak megmaradnak.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Alapértékek visszaállítása: 30 ó/ECTS, nincs cél, hétfő, rendszertéma, 5 napos tűrés, 35 ó/hét túlterhelés, kényelmes méret, pala szín.';

  @override
  String get settingsResetSettingsTitle => 'Visszaállítod a beállításokat?';

  @override
  String get settingsSampleData => 'Mintaadatok';

  @override
  String settingsSampleDataError(String error) {
    return 'Hiba: $error';
  }

  @override
  String get settingsStudySettings => 'Tanulási beállítások';

  @override
  String get settingsThemeDark => 'Sötét';

  @override
  String get settingsThemeLight => 'Világos';

  @override
  String get settingsThemeSystem => 'Rendszer alapértelmezett';

  @override
  String get settingsThemeTitle => 'Téma';

  @override
  String get settingsThemeUpdated => 'Téma frissítve.';

  @override
  String settingsToleranceDays(String value) {
    return '$value nap';
  }

  @override
  String get settingsToleranceError => 'Adj meg egy számot 0–30 nap között.';

  @override
  String get settingsToleranceHelper =>
      'Az előny +N nap többletet, a lemaradás −N napot igényel. 5 = stabil, 0 = érzékeny.';

  @override
  String get settingsToleranceLabel => 'Munkanapok (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance munka';
  }

  @override
  String get settingsToleranceUpdated => 'Tűrés frissítve.';

  @override
  String get settingsWeekdayFriday => 'Péntek';

  @override
  String get settingsWeekdayMonday => 'Hétfő';

  @override
  String get settingsWeekdaySaturday => 'Szombat';

  @override
  String get settingsWeekdaySunday => 'Vasárnap';

  @override
  String get settingsWeekdayThursday => 'Csütörtök';

  @override
  String get settingsWeekdayTuesday => 'Kedd';

  @override
  String get settingsWeekdayWednesday => 'Szerda';

  @override
  String get sortDeadline => 'Határidő';

  @override
  String get sortName => 'Név';

  @override
  String get sortProgress => 'Előrehaladás';

  @override
  String get sortStatus => 'Állapot';

  @override
  String get startupTitle =>
      'Nem sikerült elindítani az ECTS Tracker alkalmazást';

  @override
  String get statsActiveDays => 'Aktív napok';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days nap aktív';
  }

  @override
  String get statsAddDeadlines =>
      'Adj meg határidőket a terhelés előrejelzéséhez.';

  @override
  String get statsComingLoad => 'Várható terhelés';

  @override
  String get statsConsistency => 'Következetesség';

  @override
  String get statsConsistencyHint =>
      'Tanulással töltött napok az elmúlt 30 napban. A napi kis lépések legyőzik a magolást.';

  @override
  String statsConsistencyScore(String percent) {
    return 'az elmúlt 30 nap $percent%-a';
  }

  @override
  String statsCourseFallback(int id) {
    return '$id. kurzus';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'K$id';
  }

  @override
  String get statsDidPerDay => 'Teljesítve / nap (14 nap)';

  @override
  String get statsEmpty => 'Még nincsenek alkalmak';

  @override
  String get statsGap => 'Eltérés';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value ó';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hoursó';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours ó';
  }

  @override
  String get statsLast30Days => 'Elmúlt 30 nap';

  @override
  String get statsLast7Days => 'Elmúlt 7 nap';

  @override
  String get statsNeedPerDay => 'Szükséges / nap';

  @override
  String get statsNext8Weeks => 'Következő 8 hét';

  @override
  String get statsOfLast30DaysVolume => 'az elmúlt 30 nap mennyiségéből';

  @override
  String statsOverloadWarning(String threshold) {
    return 'A(z) $threshold órát meghaladó túlterhelt hetek pirossal jelölve — helyezd át egy határidőt vagy csökkentsd a terjedelmet.';
  }

  @override
  String get statsOverview => 'Áttekintés';

  @override
  String get statsPaceCovers =>
      'Az eddigi tempó fedezi a szükségest. Tartsd a sorozatot.';

  @override
  String statsPaceShort(String gap) {
    return 'Az eddigi tempó $gap ó/nappal elmarad — iktass be egy blokkot vagy csökkentsd a terjedelmet.';
  }

  @override
  String get statsPastVsNeeded => 'Eddigi vs. szükséges';

  @override
  String statsPeakPerWeek(String peak) {
    return 'csúcs $peak ó/hét';
  }

  @override
  String get statsPerCourse => 'Kurzusonként';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done ó / $required ó · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Alkalmak';

  @override
  String statsSuggestedOrder(String order) {
    return 'Javasolt sorrend: $order (legkorábbi határidő elöl)';
  }

  @override
  String get statsTotal => 'Összesen';

  @override
  String get statsTotalVolume => 'teljes mennyiség';

  @override
  String get statusAhead => 'Előnyben';

  @override
  String get statusBehind => 'Lemaradva';

  @override
  String get statusCompleted => 'Kész';

  @override
  String get statusOnTrack => 'Sínen';

  @override
  String get statusOverdue => 'Lejárt';

  @override
  String get studyLogDeleteBody =>
      'Törlöd ezt a tanulási alkalmat? Ez nem vonható vissza.';

  @override
  String get studyLogDeleteTitle => 'Törlöd az alkalmat?';

  @override
  String get studyLogEmptyHint =>
      'Naplózz egy alkalmat a tanulási időd követéséhez.';

  @override
  String get studyLogEmptyTitle => 'Még nincsenek tanulási alkalmak';

  @override
  String get studyLogFabLabel => 'Alkalom naplózása';

  @override
  String get studyLogFabTooltip => 'Alkalom naplózása';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours ó';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Mintaalkalom eltávolítása';

  @override
  String get studyLogThisWeek => 'Ezen a héten';

  @override
  String get studyLogToday => 'Ma';

  @override
  String studyLogUnknownCourse(String id) {
    return '$id. kurzus';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'Az ECTS-nek nullánál nagyobbnak kell lennie';

  @override
  String get validationCourseEctsRequired => 'Add meg az ECTS krediteket';

  @override
  String get validationCourseNameRequired => 'A név megadása kötelező';

  @override
  String get validationCourseNameTooLong => 'A név túl hosszú';

  @override
  String get validationSessionCourseRequired => 'Válassz kurzust';

  @override
  String get validationSessionDurationRequired => 'Add meg az időtartamot';

  @override
  String get widgetNoProgress => 'Még nincs előrehaladás';

  @override
  String get settingsLanguage => 'Nyelv';
}
