// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Zrušit';

  @override
  String get commonClose => 'Zavřít';

  @override
  String get commonDelete => 'Smazat';

  @override
  String get commonEdit => 'Upravit';

  @override
  String get commonError => 'Chyba';

  @override
  String get commonNone => 'Žádná';

  @override
  String get commonSave => 'Uložit';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Požadované hodiny (auto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Vymazat termín';

  @override
  String get courseFormClearStartTooltip => 'Vymazat datum zahájení';

  @override
  String get courseFormColorLabel => 'Barva';

  @override
  String get courseFormDateNotSet => 'Nenastaveno';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Termín: $date';
  }

  @override
  String get courseFormEctsLabel => 'Kredity ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Název';

  @override
  String get courseFormNotesLabel => 'Poznámky (volitelné)';

  @override
  String get courseFormSaving => 'Ukládání…';

  @override
  String courseFormStartButton(String date) {
    return 'Začátek: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Vypnuto: do $date žádný tlak; vyloučeno z dnešního tempa.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Zapnuto: čas se dělí až do teď a započítává se do dnešního tempa.';

  @override
  String get courseFormStartEarlyTitle => 'Začít nyní i přes budoucí začátek';

  @override
  String get courseFormTitleAdd => 'Přidat předmět';

  @override
  String get courseFormTitleEdit => 'Upravit předmět';

  @override
  String get coursesAddTooltip => 'Přidat předmět';

  @override
  String coursesDeleteBody(String name) {
    return 'Smazat „$name“ a všechny jeho studijní lekce? Tuto akci nelze vrátit.';
  }

  @override
  String get coursesDeleteTitle => 'Smazat předmět?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Klepněte na „Nový předmět“ a vytvořte svůj první předmět.';

  @override
  String get coursesEmptyTitle => 'Zatím žádné předměty';

  @override
  String get coursesFilterAll => 'Všechny stavy';

  @override
  String get coursesFilterEmpty => 'Tomuto filtru neodpovídají žádné předměty';

  @override
  String get coursesNewCourse => 'Nový předmět';

  @override
  String coursesPaceNeeded(String daily) {
    return 'potřeba $daily h/den';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'potřeba $daily h/den • $weekly h/týden';
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
  String get coursesRemoveSampleTooltip => 'Odebrat ukázkový předmět';

  @override
  String coursesShownCount(String count) {
    return 'zobrazeno $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Řadit: $label';
  }

  @override
  String get dashboardAllDone => 'Vše hotovo';

  @override
  String dashboardBonusLogged(String hours) {
    return 'zaznamenáno $hours h (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count předmět(y)';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count předmět(y) · $upcoming nadcházejících mimo dnešní tempo';
  }

  @override
  String get dashboardCoursesTitle => 'Předměty';

  @override
  String dashboardDeadline(String date) {
    return 'Termín $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Termín $date (zbývá $days dní)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Termín $date (zbývá 1 den)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Termín $date (po termínu)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Termín $date (dnes)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Dnes na řadě — zaznamenáno $hours h';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Všechny předměty jsou dokončené — celý seznam najdete na kartě Předměty.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Přidejte předmět a začněte sledovat svůj pokrok ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Zpoždění = děláte $achieved/den, potřeba $need/den';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Zpoždění = děláte $achieved/den, potřeba $need/den · předčasný začátek';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Zpoždění: žádné konečné tempo nestihne dnešní termín se zbývajícími hodinami';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Na dobré cestě: zatím žádné tempo — zaznamenejte první lekci pro potvrzení';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Začíná za $days d · počítáno od $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Začíná za $days d · počítáno od $date · předčasný začátek zapnut';
  }

  @override
  String get dashboardFreshStart => 'NOVÝ ZAČÁTEK';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · zbývá $hours h';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/den';
  }

  @override
  String get dashboardLogSessionAction => 'Zaznamenat studijní lekci';

  @override
  String get dashboardLogSessionTooltip => 'Zaznamenat studijní lekci';

  @override
  String get dashboardNewBadge => 'NOVÉ';

  @override
  String get dashboardNoCourses => 'Zatím žádné předměty';

  @override
  String get dashboardNoDeadline => 'Bez termínu';

  @override
  String get dashboardNoDeadlines => 'Nejsou naplánované žádné termíny';

  @override
  String get dashboardNoPaceDue => 'Dnes žádné tempo';

  @override
  String get dashboardNothingDue => 'Nic není na řadě';

  @override
  String get dashboardNothingToTrack => 'Zatím není co sledovat';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Dnes na řadě — zbývá $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'K dokončení potřeba $daily h/den';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'K dokončení potřeba $daily h/den · $weekly h/týden';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Potřeba $hours h/den od $date · mimo dnešní tempo';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Bez termínu — zbývá $hours h · žádný denní tlak';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Začíná $date · zbývá $hours h';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · nerealistické';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Přidejte předmět a začněte sledovat';

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
    return 'zbývá $days dní';
  }

  @override
  String get dashboardStartNotSet => 'Nenastaveno';

  @override
  String dashboardStartsIn(String days) {
    return 'Začíná za $days d';
  }

  @override
  String get dashboardStartsSoon => 'Brzy začíná';

  @override
  String get dashboardTipEmpty =>
      'Přidejte svůj první předmět — zde se objeví vaše denní tempo a pokrok.';

  @override
  String get dashboardTipFirst =>
      'Prvních 25 minut je nejdůležitějších — vyberte předmět s nejbližším termínem.';

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
  String get dashboardTodayPaceLabel => 'DNEŠNÍ TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'dnes $logged / $pace h';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Budoucí začátky — dnes žádný tlak, vyloučeno z dnešního tempa.';

  @override
  String get dashboardUpcomingTitle => 'Nadcházející';

  @override
  String get devToolsActivate => 'Aktivovat';

  @override
  String get devToolsActivateMessage =>
      'Odemkne skryté zátěžové testovací nástroje (generování dat). Pouze pro vývoj.';

  @override
  String get devToolsActivateTitle => 'Aktivovat vývojářský režim?';

  @override
  String get devToolsActivated => 'Vývojářský režim aktivován.';

  @override
  String get devToolsClearPumped => 'Vymazat generovaná data';

  @override
  String get devToolsClearPumpedMessage =>
      'Smaže generované předměty STRESS a jejich lekce. Vaše vlastní data zůstanou zachována.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Smazat generované předměty STRESS a lekce.';

  @override
  String get devToolsClearPumpedTitle => 'Vymazat generovaná data?';

  @override
  String devToolsCleared(String count) {
    return 'Vymazáno $count generovaných předmětů.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Druhé potvrzení: tím se nafouknou předměty, seznamy, grafy a výpočty tempa a může to trvat několik sekund. Generovat nyní?';

  @override
  String get devToolsConfirmPumpTitle => 'Potvrdit zátěžové generování';

  @override
  String get devToolsContinue => 'Pokračovat';

  @override
  String get devToolsExit => 'Ukončit vývojářský režim';

  @override
  String get devToolsExitSubtitle =>
      'Skrýt vývojářské nástroje na tomto zařízení.';

  @override
  String get devToolsPumpData => 'Generovat data';

  @override
  String get devToolsPumpMessage =>
      'Tím se vloží realisticky generovaný semestr (~10 předmětů, ~800 lekcí za posledních 12 týdnů). Stávající data zůstanou zachována. Pokračovat?';

  @override
  String get devToolsPumpSubtitle =>
      'Vložit generovaný semestr (~10 předmětů, ~800 lekcí, 12 týdnů). Stávající data zůstanou.';

  @override
  String get devToolsPumpTile => 'Generovat testovací data';

  @override
  String get devToolsPumpTitle => 'Generovat testovací data?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Vygenerováno $courses předmětů, $sessions lekcí.';
  }

  @override
  String get devToolsPumping => 'Generování testovacích dat…';

  @override
  String get devToolsRemoveAll => 'Odebrat všechna data';

  @override
  String get devToolsRemoveAllMessage =>
      'Vývojářská zkratka: trvale smaže VŠECHNY předměty, lekce a nastavení. Tuto akci nelze vrátit.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Vývojářská zkratka: smazat VŠECHNY předměty, lekce a nastavení.';

  @override
  String get devToolsRemoveAllTitle => 'Odebrat všechna data?';

  @override
  String get navCourses => 'Předměty';

  @override
  String get navDashboard => 'Přehled';

  @override
  String get navSettings => 'Nastavení';

  @override
  String get navStatistics => 'Statistiky';

  @override
  String get navStudyLog => 'Deník studia';

  @override
  String get sampleBadge => 'Ukázka';

  @override
  String get sessionFormCourseLabel => 'Předmět';

  @override
  String sessionFormDateButton(String date) {
    return 'Datum: $date';
  }

  @override
  String get sessionFormDurationError => 'Délka musí být větší než nula.';

  @override
  String get sessionFormHoursLabel => 'Hodiny';

  @override
  String get sessionFormLogAction => 'Zaznamenat lekci';

  @override
  String get sessionFormMinutesLabel => 'Minuty';

  @override
  String get sessionFormNoCourseError => 'Vyberte předmět.';

  @override
  String get sessionFormNoCoursesHint =>
      'Nejprve přidejte předmět, abyste mohli zaznamenat lekci.';

  @override
  String get sessionFormNotesLabel => 'Poznámky (volitelné)';

  @override
  String get sessionFormSaving => 'Ukládání…';

  @override
  String get sessionFormTitleAdd => 'Zaznamenat studijní lekci';

  @override
  String get sessionFormTitleEdit => 'Upravit studijní lekci';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Celkem: $hours h';
  }

  @override
  String get settingsAccent => 'Barva motivu';

  @override
  String get settingsAccentBerry => 'Malinová';

  @override
  String get settingsAccentClay => 'Cihlová';

  @override
  String get settingsAccentForest => 'Lesní';

  @override
  String get settingsAccentSlate => 'Břidlicová';

  @override
  String get settingsAccentTeal => 'Tyrkysová';

  @override
  String get settingsAccentUpdated => 'Barva motivu aktualizována.';

  @override
  String get settingsAllDataDeleted => 'Všechna data smazána.';

  @override
  String get settingsAppearance => 'Vzhled (tmavý / světlý)';

  @override
  String get settingsCheckingSample => 'Kontrola ukázkových dat…';

  @override
  String get settingsClear => 'Vymazat';

  @override
  String get settingsClearSample => 'Vymazat ukázková data';

  @override
  String get settingsClearSampleMessage =>
      'Tím se odeberou ukázkové předměty a lekce. Předměty nebo lekce, které jste přidali sami, se neodeberou.';

  @override
  String get settingsClearSampleSubtitle =>
      'Odebrat předvyplněné ukázkové předměty a lekce. Vaše vlastní data zůstanou.';

  @override
  String get settingsClearSampleTitle => 'Vymazat ukázková data?';

  @override
  String get settingsCopy => 'Kopírovat';

  @override
  String get settingsDailyError => 'Zadejte 0 nebo kladný počet minut.';

  @override
  String get settingsDailyLabel => 'Minut denně (0 = bez cíle)';

  @override
  String get settingsDailyTarget => 'Denní studijní cíl';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/den';
  }

  @override
  String get settingsDailyUpdated => 'Denní cíl aktualizován.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Smazat vše';

  @override
  String get settingsDevMode => 'Vývojářský režim';

  @override
  String get settingsDisplay => 'Zobrazení';

  @override
  String get settingsDisplayComfortable => 'Pohodlné';

  @override
  String get settingsDisplayCompact => 'Kompaktní';

  @override
  String get settingsDisplayLarge => 'Velké';

  @override
  String get settingsDisplaySize => 'Velikost textu a prvků';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Velikost zobrazení aktualizována.';

  @override
  String get settingsExport => 'Exportovat data';

  @override
  String get settingsExportCopied => 'Export zkopírován do schránky.';

  @override
  String get settingsExportSubtitle =>
      'Zkopírovat všechny předměty, lekce a nastavení jako JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses předmět(y) · $sessions lekcí · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (zkráceno — plná záloha má $kb KB, pro vše použijte Kopírovat)';
  }

  @override
  String get settingsFirstWeekday => 'První den v týdnu';

  @override
  String get settingsFirstWeekdayUpdated => 'První den v týdnu aktualizován.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (podržet $seconds s)';
  }

  @override
  String get settingsHoldToReplace => 'Podržením nahradit vše';

  @override
  String get settingsHoursError => 'Zadejte číslo větší než nula.';

  @override
  String get settingsHoursHelper =>
      'Výchozí 30. Změna přepočítá požadavky; záznamy zůstanou.';

  @override
  String get settingsHoursLabel => 'Hodin na kredit ECTS';

  @override
  String get settingsHoursPerEcts => 'Hodin na ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Hodiny na ECTS aktualizovány.';

  @override
  String get settingsImport => 'Importovat data';

  @override
  String get settingsImportAppend => 'Připojit';

  @override
  String get settingsImportAppendAction => 'Importovat (připojit)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Data připojena: přidáno $courses předmětů, $sessions lekcí.';
  }

  @override
  String get settingsImportInfo =>
      'Připojení přidá zálohu k vašim stávajícím datům (nastavení zůstanou). Nahrazení nejprve smaže VŠECHNY předměty, lekce a nastavení.';

  @override
  String get settingsImportLabel => 'Vložit exportovaný JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses předmět(y) · $sessions lekcí';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· exportováno $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· schéma v$schema';
  }

  @override
  String get settingsImportReplace => 'Nahradit';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Nahrazení nejprve vše smaže. Stiskněte a PODRŽTE níže uvedené tlačítko $seconds sekund pro potvrzení.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Data nahrazena: obnoveno $courses předmětů, $sessions lekcí.';
  }

  @override
  String get settingsImportSubtitle =>
      'Nahradit všechna data z dříve exportované zálohy JSON.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Držte dál… $remaining s';
  }

  @override
  String get settingsNoSample => 'Žádná ukázková data';

  @override
  String get settingsNoSampleSubtitle =>
      'Předvyplněná ukázková data již byla vymazána.';

  @override
  String get settingsNoTarget => 'Není nastaven žádný cíl';

  @override
  String get settingsOverloadError => 'Zadejte číslo 5–100 h/týden.';

  @override
  String get settingsOverloadHelper =>
      'Týdny s nadcházející zátěží nad touto hodnotou budou označeny červeně. Prezenční studium je ~35–40 h/týden.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Hodin týdně (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/týden označí červeně';
  }

  @override
  String get settingsOverloadThreshold => 'Týdenní práh přetížení';

  @override
  String get settingsOverloadUpdated => 'Práh přetížení aktualizován.';

  @override
  String get settingsPaceTolerance => 'Tolerance předstihu / zpoždění';

  @override
  String get settingsPasteValidBackup => 'Nejprve vložte platnou zálohu';

  @override
  String get settingsReset => 'Obnovit';

  @override
  String get settingsResetAll => 'Obnovit všechna data';

  @override
  String get settingsResetAllMessage =>
      'Tím trvale smažete VŠECHNY předměty, lekce a nastavení. Tuto akci nelze vrátit. V případě potřeby si nejprve exportujte zálohu.';

  @override
  String get settingsResetAllSubtitle =>
      'Smazat všechny předměty, lekce a nastavení.';

  @override
  String get settingsResetAllTitle => 'Obnovit všechna data?';

  @override
  String get settingsResetSettings => 'Obnovit nastavení';

  @override
  String get settingsResetSettingsDone =>
      'Nastavení obnovena do výchozích hodnot.';

  @override
  String get settingsResetSettingsMessage =>
      'Obnoví hodiny na ECTS (30), denní cíl (žádný), první den v týdnu (pondělí), motiv (systémový), toleranci (5 dní), přetížení (35 h/týden), velikost (pohodlná), barvu (břidlicová). Předměty a lekce zůstanou zachovány.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Obnovit výchozí hodnoty: 30 h/ECTS, bez cíle, pondělí, systémový motiv, tolerance 5 dní, přetížení 35 h/týden, pohodlná velikost, břidlicová barva.';

  @override
  String get settingsResetSettingsTitle => 'Obnovit nastavení?';

  @override
  String get settingsSampleData => 'Ukázková data';

  @override
  String settingsSampleDataError(String error) {
    return 'Chyba: $error';
  }

  @override
  String get settingsStudySettings => 'Nastavení studia';

  @override
  String get settingsThemeDark => 'Tmavý';

  @override
  String get settingsThemeLight => 'Světlý';

  @override
  String get settingsThemeSystem => 'Systémový výchozí';

  @override
  String get settingsThemeTitle => 'Motiv';

  @override
  String get settingsThemeUpdated => 'Motiv aktualizován.';

  @override
  String settingsToleranceDays(String value) {
    return '$value dní';
  }

  @override
  String get settingsToleranceError => 'Zadejte číslo 0–30 dní.';

  @override
  String get settingsToleranceHelper =>
      'Předstih vyžaduje přebytek +N dní, zpoždění −N dní. 5 = stabilní, 0 = citlivé.';

  @override
  String get settingsToleranceLabel => 'Dní práce (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance práce';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerance aktualizována.';

  @override
  String get settingsWeekdayFriday => 'Pátek';

  @override
  String get settingsWeekdayMonday => 'Pondělí';

  @override
  String get settingsWeekdaySaturday => 'Sobota';

  @override
  String get settingsWeekdaySunday => 'Neděle';

  @override
  String get settingsWeekdayThursday => 'Čtvrtek';

  @override
  String get settingsWeekdayTuesday => 'Úterý';

  @override
  String get settingsWeekdayWednesday => 'Středa';

  @override
  String get sortDeadline => 'Termín';

  @override
  String get sortName => 'Název';

  @override
  String get sortProgress => 'Pokrok';

  @override
  String get sortStatus => 'Stav';

  @override
  String get startupTitle => 'Nepodařilo se spustit ECTS Tracker';

  @override
  String get statsActiveDays => 'Aktivní dny';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days d aktivní';
  }

  @override
  String get statsAddDeadlines => 'Přidejte termíny pro předpověď zátěže.';

  @override
  String get statsComingLoad => 'Nadcházející zátěž';

  @override
  String get statsConsistency => 'Konzistence';

  @override
  String get statsConsistencyHint =>
      'Studijní dny za posledních 30 dní. Malé kroky každý den porazí biflování.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% z posledních 30 dní';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Předmět $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'P$id';
  }

  @override
  String get statsDidPerDay => 'Děláno / den (14 d)';

  @override
  String get statsEmpty => 'Zatím žádné lekce';

  @override
  String get statsGap => 'Odchylka';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value h';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours h';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get statsLast30Days => 'Posledních 30 dní';

  @override
  String get statsLast7Days => 'Posledních 7 dní';

  @override
  String get statsNeedPerDay => 'Potřeba / den';

  @override
  String get statsNext8Weeks => 'Příštích 8 týdnů';

  @override
  String get statsOfLast30DaysVolume => 'z objemu posledních 30 dní';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Týdny s přetížením nad $threshold h označeny červeně — přesuňte termín nebo omezte rozsah.';
  }

  @override
  String get statsOverview => 'Přehled';

  @override
  String get statsPaceCovers => 'Dosavadní tempo pokrývá potřebu. Držte sérii.';

  @override
  String statsPaceShort(String gap) {
    return 'Dosavadní tempo je o $gap h/den krátké — přidejte blok nebo omezte rozsah.';
  }

  @override
  String get statsPastVsNeeded => 'Dosavadní vs. potřebné';

  @override
  String statsPeakPerWeek(String peak) {
    return 'maximum $peak h/týd.';
  }

  @override
  String get statsPerCourse => 'Podle předmětů';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Lekce';

  @override
  String statsSuggestedOrder(String order) {
    return 'Doporučené pořadí: $order (nejdříve nejbližší termín)';
  }

  @override
  String get statsTotal => 'Celkem';

  @override
  String get statsTotalVolume => 'celkový objem';

  @override
  String get statusAhead => 'V předstihu';

  @override
  String get statusBehind => 'Ve zpoždění';

  @override
  String get statusCompleted => 'Dokončeno';

  @override
  String get statusOnTrack => 'Na dobré cestě';

  @override
  String get statusOverdue => 'Po termínu';

  @override
  String get studyLogDeleteBody =>
      'Smazat tuto studijní lekci? Tuto akci nelze vrátit.';

  @override
  String get studyLogDeleteTitle => 'Smazat lekci?';

  @override
  String get studyLogEmptyHint =>
      'Zaznamenejte lekci pro sledování studijního času.';

  @override
  String get studyLogEmptyTitle => 'Zatím žádné studijní lekce';

  @override
  String get studyLogFabLabel => 'Zaznamenat lekci';

  @override
  String get studyLogFabTooltip => 'Zaznamenat lekci';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Odebrat ukázkovou lekci';

  @override
  String get studyLogThisWeek => 'Tento týden';

  @override
  String get studyLogToday => 'Dnes';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Předmět $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'P$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS musí být větší než nula';

  @override
  String get validationCourseEctsRequired => 'Zadejte kredity ECTS';

  @override
  String get validationCourseNameRequired => 'Název je povinný';

  @override
  String get validationCourseNameTooLong => 'Název je příliš dlouhý';

  @override
  String get validationSessionCourseRequired => 'Vyberte předmět';

  @override
  String get validationSessionDurationRequired => 'Zadejte délku';

  @override
  String get widgetNoProgress => 'Zatím žádný pokrok';

  @override
  String get settingsLanguage => 'Jazyk';

  @override
  String get settingsLiquidGlass => 'Tekuté sklo';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Karty a lišty z matného skla. Vypnuto zachová klasický plný vzhled.';

  @override
  String get settingsLiquidGlassOn => 'Zapnuto';

  @override
  String get settingsLiquidGlassOff => 'Vypnuto';

  @override
  String get settingsLiquidGlassUpdated => 'Tekuté sklo aktualizováno.';
}
