// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Tühista';

  @override
  String get commonClose => 'Sulge';

  @override
  String get commonDelete => 'Kustuta';

  @override
  String get commonEdit => 'Muuda';

  @override
  String get commonError => 'Viga';

  @override
  String get commonNone => 'Puudub';

  @override
  String get commonSave => 'Salvesta';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Nõutavad tunnid (automaatne): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Tühjenda tähtaeg';

  @override
  String get courseFormClearStartTooltip => 'Tühjenda alguskuupäev';

  @override
  String get courseFormColorLabel => 'Värv';

  @override
  String get courseFormDateNotSet => 'Määramata';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Tähtaeg: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS ainepunktid';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nimi';

  @override
  String get courseFormNotesLabel => 'Märkmed (valikuline)';

  @override
  String get courseFormSaving => 'Salvestamine…';

  @override
  String courseFormStartButton(String date) {
    return 'Algus: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Väljas: kuni $date survet pole; jäetud tänase tempost välja.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Sees: aeg jaotatakse kuni praeguseni ja arvestatakse tänase temposse.';

  @override
  String get courseFormStartEarlyTitle =>
      'Alusta kohe, kuigi algus on tulevikus';

  @override
  String get courseFormTitleAdd => 'Lisa kursus';

  @override
  String get courseFormTitleEdit => 'Muuda kursust';

  @override
  String get coursesAddTooltip => 'Lisa kursus';

  @override
  String coursesDeleteBody(String name) {
    return 'Kustuta „$name” ja kõik selle õppesessioonid? Seda ei saa tagasi võtta.';
  }

  @override
  String get coursesDeleteTitle => 'Kustuta kursus?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Puuduta „Uus kursus”, et luua oma esimene kursus.';

  @override
  String get coursesEmptyTitle => 'Kursuseid veel pole';

  @override
  String get coursesFilterAll => 'Kõik olekud';

  @override
  String get coursesFilterEmpty => 'Sellele filtrile ei vasta ükski kursus';

  @override
  String get coursesNewCourse => 'Uus kursus';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Vaja $daily h/päevas';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return 'Vaja $daily min/päevas';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Vaja $daily h/päevas • $weekly h/nädalas';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return 'Vaja $daily min/päevas • $weekly min/nädalas';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return 'Vaja $daily min/päevas • $weekly h/nädalas';
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
  String get coursesRemoveSampleTooltip => 'Eemalda näidiskursus';

  @override
  String coursesShownCount(String count) {
    return 'Kuvatud $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sorteeri: $label';
  }

  @override
  String get dashboardAllDone => 'Kõik tehtud';

  @override
  String dashboardBonusLogged(String hours) {
    return 'Logitud $hours h (boonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kursust';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kursust · $upcoming tulevast pole tänases tempos';
  }

  @override
  String get dashboardCoursesTitle => 'Kursused';

  @override
  String dashboardDeadline(String date) {
    return 'Tähtaeg $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Tähtaeg $date (jäänud $days päeva)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Tähtaeg $date (jäänud 1 päev)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Tähtaeg $date (hilinenud)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Tähtaeg $date (täna)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Täna tähtaeg — logitud $hours h';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Kõik kursused on läbitud — vaata täielikku loendit vahekaardilt Kursused.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Lisa kursus, et hakata ECTS edenemist jälgima.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Mahajäämus = teed $achieved/p, vaja $need/p';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Mahajäämus = teed $achieved/p, vaja $need/p · varajane algus';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Mahajäänud: ükski lõplik tempo ei saavuta tänast tähtaega, kui tunde on veel järel';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Graafikus: tempot veel pole — logi esimene sessioon kinnituseks';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Algab $days p pärast · arvestatud alates $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Algab $days p pärast · arvestatud alates $date · varajane algus sees';
  }

  @override
  String get dashboardFreshStart => 'VÄRSKE ALGUS';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · $hours h jäänud';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/p';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/p';
  }

  @override
  String get dashboardLogSessionAction => 'Logi õppesessioon';

  @override
  String get dashboardLogSessionTooltip => 'Logi õppesessioon';

  @override
  String get dashboardNewBadge => 'UUS';

  @override
  String get dashboardNoCourses => 'Kursuseid veel pole';

  @override
  String get dashboardNoDeadline => 'Tähtaeg puudub';

  @override
  String get dashboardNoDeadlines => 'Tähtaegu pole planeeritud';

  @override
  String get dashboardNoPaceDue => 'Täna pole tempot vaja';

  @override
  String get dashboardNothingDue => 'Midagi pole vaja';

  @override
  String get dashboardNothingToTrack => 'Pole veel midagi jälgida';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Täna tähtaeg — jäänud $hours h';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Lõpetamiseks vaja $daily h/päevas';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Lõpetamiseks vaja $daily min/päevas';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Lõpetamiseks vaja $daily h/päevas · $weekly h/nädalas';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Lõpetamiseks vaja $daily min/päevas · $weekly min/nädalas';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Lõpetamiseks vaja $daily min/päevas · $weekly h/nädalas';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Vaja $hours h/päevas alates $date · pole tänases tempos';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Vaja $minutes min/päevas alates $date · pole tänases tempos';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Tähtaega pole — jäänud $hours h · igapäevast survet pole';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Algab $date · teha $hours h';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · ebarealistlik';
  }

  @override
  String get dashboardProgramBare => 'PROGRAMM';

  @override
  String get dashboardProgramEmptyHint => 'Lisa kursus, et jälgimist alustada';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAMM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days päeva varu';
  }

  @override
  String get dashboardStartNotSet => 'Määramata';

  @override
  String dashboardStartsIn(String days) {
    return 'Algab $days p pärast';
  }

  @override
  String get dashboardStartsSoon => 'Algab peagi';

  @override
  String get dashboardTipEmpty =>
      'Lisa oma esimene kursus — sinu päevane tempo ja edenemine ilmuvad siia.';

  @override
  String get dashboardTipFirst =>
      'Esimene 25 minutit loeb kõige rohkem — vali kursus, millel on kõige varasem tähtaeg.';

  @override
  String get dashboardTodayBare => 'TÄNA';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'TÄNA $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'TÄNASE PÄEVA TEMPO';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Täna $logged / $pace h';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Tulevased algused — täna survet pole, tänasest tempost välja jäetud.';

  @override
  String get dashboardUpcomingTitle => 'Eesseisvad';

  @override
  String get devToolsActivate => 'Aktiveeri';

  @override
  String get devToolsActivateMessage =>
      'See avab peidetud koormustesti tööriistad (genereeritud andmete lisamine). Ainult arenduseks.';

  @override
  String get devToolsActivateTitle => 'Aktiveerida arendajarežiim?';

  @override
  String get devToolsActivated => 'Arendajarežiim aktiveeritud.';

  @override
  String get devToolsClearPumped => 'Tühjenda genereeritud andmed';

  @override
  String get devToolsClearPumpedMessage =>
      'Kustutab genereeritud STRESS-kursused ja nende sessioonid. Sinu enda andmed säilivad.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Kustuta genereeritud STRESS-kursused ja sessioonid.';

  @override
  String get devToolsClearPumpedTitle => 'Tühjendada genereeritud andmed?';

  @override
  String devToolsCleared(String count) {
    return 'Tühjendatud $count genereeritud kursust.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Teine kinnitus: see suurendab kursuseid, loendeid, diagramme ja tempoarvutusi ning võib võtta mõne sekundi. Lisada kohe?';

  @override
  String get devToolsConfirmPumpTitle => 'Kinnita koormuskatse';

  @override
  String get devToolsContinue => 'Jätka';

  @override
  String get devToolsExit => 'Välju arendajarežiimist';

  @override
  String get devToolsExitSubtitle => 'Peida arendajatööriistad selles seadmes.';

  @override
  String get devToolsPumpData => 'Lisa andmed';

  @override
  String get devToolsPumpMessage =>
      'See lisab realistliku genereeritud semestri (~10 kursust, ~800 sessiooni viimase 12 nädala jooksul). Sinu olemasolevad andmed säilivad. Jätkata?';

  @override
  String get devToolsPumpSubtitle =>
      'Lisa genereeritud semester (~10 kursust, ~800 sessiooni, 12 nädalat). Olemasolevad andmed säilivad.';

  @override
  String get devToolsPumpTile => 'Lisa testandmed';

  @override
  String get devToolsPumpTitle => 'Lisada testandmed?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Lisatud $courses kursust, $sessions sessiooni.';
  }

  @override
  String get devToolsPumping => 'Testandmete lisamine…';

  @override
  String get devToolsRemoveAll => 'Eemalda kõik andmed';

  @override
  String get devToolsRemoveAllMessage =>
      'Arendaja otsetee: see kustutab jäädavalt KÕIK kursused, sessioonid ja seaded. Seda ei saa tagasi võtta.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Arendaja otsetee: kustuta KÕIK kursused, sessioonid ja seaded.';

  @override
  String get devToolsRemoveAllTitle => 'Eemaldada kõik andmed?';

  @override
  String get navCourses => 'Kursused';

  @override
  String get navDashboard => 'Töölaud';

  @override
  String get navSettings => 'Seaded';

  @override
  String get navStatistics => 'Statistika';

  @override
  String get navStudyLog => 'Õppelog';

  @override
  String get sampleBadge => 'Näidis';

  @override
  String get sessionFormCourseLabel => 'Kursus';

  @override
  String sessionFormDateButton(String date) {
    return 'Kuupäev: $date';
  }

  @override
  String get sessionFormDurationError => 'Kestus peab olema suurem kui null.';

  @override
  String get sessionFormHoursLabel => 'Tunnid';

  @override
  String get sessionFormLogAction => 'Logi sessioon';

  @override
  String get sessionFormMinutesLabel => 'Minutid';

  @override
  String get sessionFormNoCourseError => 'Vali kursus.';

  @override
  String get sessionFormNoCoursesHint =>
      'Sessiooni logimiseks lisa esmalt kursus.';

  @override
  String get sessionFormNotesLabel => 'Märkmed (valikuline)';

  @override
  String get sessionFormSaving => 'Salvestamine…';

  @override
  String get sessionFormTitleAdd => 'Logi õppesessioon';

  @override
  String get sessionFormTitleEdit => 'Muuda õppesessiooni';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Kokku: $hours h';
  }

  @override
  String get settingsAccent => 'Teemavärv';

  @override
  String get settingsAccentBerry => 'Mari';

  @override
  String get settingsAccentClay => 'Savi';

  @override
  String get settingsAccentForest => 'Mets';

  @override
  String get settingsAccentSlate => 'Kiltkivi';

  @override
  String get settingsAccentTeal => 'Petrool';

  @override
  String get settingsAccentUpdated => 'Teemavärv uuendatud.';

  @override
  String get settingsAllDataDeleted => 'Kõik andmed kustutatud.';

  @override
  String get settingsAppearance => 'Välimus (tume / hele)';

  @override
  String get settingsCheckingSample => 'Näidisandmete kontrollimine…';

  @override
  String get settingsClear => 'Tühjenda';

  @override
  String get settingsClearSample => 'Tühjenda näidisandmed';

  @override
  String get settingsClearSampleMessage =>
      'See eemaldab näidiskursused ja -sessioonid. Sinu enda lisatud kursuseid ega sessioone ei eemaldata.';

  @override
  String get settingsClearSampleSubtitle =>
      'Eemalda eelnevalt loodud näidiskursused ja -sessioonid. Sinu enda andmed säilivad.';

  @override
  String get settingsClearSampleTitle => 'Tühjendada näidisandmed?';

  @override
  String get settingsCopy => 'Kopeeri';

  @override
  String get settingsDailyError => 'Sisesta 0 või positiivne minutite arv.';

  @override
  String get settingsDailyLabel => 'Minutit päevas (0 = eesmärki pole)';

  @override
  String get settingsDailyTarget => 'Päevane õpieesmärk';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/päevas';
  }

  @override
  String get settingsDailyUpdated => 'Päevane eesmärk uuendatud.';

  @override
  String get settingsData => 'Andmed';

  @override
  String get settingsDeleteEverything => 'Kustuta kõik';

  @override
  String get settingsDevMode => 'Arendajarežiim';

  @override
  String get settingsDisplay => 'Kuva';

  @override
  String get settingsDisplayComfortable => 'Mugav';

  @override
  String get settingsDisplayCompact => 'Kompaktne';

  @override
  String get settingsDisplayLarge => 'Suur';

  @override
  String get settingsDisplaySize => 'Teksti ja elementide suurus';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Kuva suurus uuendatud.';

  @override
  String get settingsExport => 'Ekspordi andmed';

  @override
  String get settingsExportCopied => 'Eksport kopeeritud lõikelauale.';

  @override
  String get settingsExportSubtitle =>
      'Kopeeri kõik kursused, sessioonid ja seaded JSON-ina.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kursust · $sessions sessiooni · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (kärbitud — täielik varukoopia on $kb KB, kõige jaoks kasuta Kopeeri)';
  }

  @override
  String get settingsFirstWeekday => 'Nädala esimene päev';

  @override
  String get settingsFirstWeekdayUpdated => 'Nädala esimene päev uuendatud.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s hoia)';
  }

  @override
  String get settingsHoldToReplace => 'Hoia kõike asendamiseks';

  @override
  String get settingsHoursError => 'Sisesta nullist suurem arv.';

  @override
  String get settingsHoursHelper =>
      'Vaikimisi 30. Muutmine arvutab nõuded ümber; logid säilivad.';

  @override
  String get settingsHoursLabel => 'Tunde ühe ECTS ainepunkti kohta';

  @override
  String get settingsHoursPerEcts => 'Tunde ECTS-i kohta';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Tunnid ECTS-i kohta uuendatud.';

  @override
  String get settingsImport => 'Impordi andmed';

  @override
  String get settingsImportAppend => 'Lisa';

  @override
  String get settingsImportAppendAction => 'Impordi (lisa)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Andmed lisatud: lisatud $courses kursust, $sessions sessiooni.';
  }

  @override
  String get settingsImportInfo =>
      'Lisamine lisab varukoopia praegustele andmetele (seaded säilivad). Asendamine kustutab esmalt KÕIK kursused, sessioonid ja seaded.';

  @override
  String get settingsImportLabel => 'Kleebi eksporditud JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kursust · $sessions sessiooni';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · eksporditud $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · skeem v$schema';
  }

  @override
  String get settingsImportReplace => 'Asenda';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Asendamine kustutab esmalt kõik. Vajuta ja HOIA allolevat nuppu kinnitamiseks $seconds sekundit.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Andmed asendatud: taastatud $courses kursust, $sessions sessiooni.';
  }

  @override
  String get settingsImportSubtitle =>
      'Asenda kõik andmed varem eksporditud JSON-varukoopiast.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Hoia edasi… $remaining s';
  }

  @override
  String get settingsNoSample => 'Näidisandmeid pole';

  @override
  String get settingsNoSampleSubtitle =>
      'Eelnevalt loodud näidisandmed on juba tühjendatud.';

  @override
  String get settingsNoTarget => 'Eesmärki pole määratud';

  @override
  String get settingsOverloadError => 'Sisesta arv 5–100 h/nädalas.';

  @override
  String get settingsOverloadHelper =>
      'Sellest suurema koormusega nädalad märgitakse punasega. Täiskoormusega õpe on ~35–40 h/nädalas.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Tunde nädalas (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/nädalas märgib punasega';
  }

  @override
  String get settingsOverloadThreshold => 'Nädalase ülekoormuse lävi';

  @override
  String get settingsOverloadUpdated => 'Ülekoormuse lävi uuendatud.';

  @override
  String get settingsPaceTolerance => 'Edumaa / mahajäämuse tolerants';

  @override
  String get settingsPasteValidBackup => 'Kleebi esmalt kehtiv varukoopia';

  @override
  String get settingsReset => 'Lähtesta';

  @override
  String get settingsResetAll => 'Lähtesta kõik andmed';

  @override
  String get settingsResetAllMessage =>
      'See kustutab jäädavalt KÕIK kursused, sessioonid ja seaded. Seda ei saa tagasi võtta. Vajadusel ekspordi esmalt varukoopia.';

  @override
  String get settingsResetAllSubtitle =>
      'Kustuta kõik kursused, sessioonid ja seaded.';

  @override
  String get settingsResetAllTitle => 'Lähtestada kõik andmed?';

  @override
  String get settingsResetSettings => 'Lähtesta seaded';

  @override
  String get settingsResetSettingsDone =>
      'Seaded lähtestatud vaikeväärtustele.';

  @override
  String get settingsResetSettingsMessage =>
      'Taastab tunnid ECTS-i kohta (30), päevaeesmärgi (puudub), nädala esimese päeva (esmaspäev), teema (süsteem), tolerantsi (5 päeva), ülekoormuse (35 h/nädalas), suuruse (mugav), värvi (kiltkivi). Kursused ja sessioonid säilivad.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Taasta vaikeväärtused: 30 h/ECTS, eesmärki pole, esmaspäev, süsteemi teema, 5 päeva tolerantsi, 35 h/nädalas ülekoormus, mugav suurus, kiltkivivärv.';

  @override
  String get settingsResetSettingsTitle => 'Lähtestada seaded?';

  @override
  String get settingsSampleData => 'Näidisandmed';

  @override
  String settingsSampleDataError(String error) {
    return 'Viga: $error';
  }

  @override
  String get settingsStudySettings => 'Õppeseaded';

  @override
  String get settingsThemeDark => 'Tume';

  @override
  String get settingsThemeLight => 'Hele';

  @override
  String get settingsThemeSystem => 'Süsteemi vaikeväärtus';

  @override
  String get settingsThemeTitle => 'Teema';

  @override
  String get settingsThemeUpdated => 'Teema uuendatud.';

  @override
  String settingsToleranceDays(String value) {
    return '$value päeva';
  }

  @override
  String get settingsToleranceError => 'Sisesta arv 0–30 päeva.';

  @override
  String get settingsToleranceHelper =>
      'Edumaa vajab +N päeva varu, mahajäämus −N päeva. 5 = stabiilne, 0 = tundlik.';

  @override
  String get settingsToleranceLabel => 'Tööpäevi (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance tööd';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerants uuendatud.';

  @override
  String get settingsWeekdayFriday => 'Reede';

  @override
  String get settingsWeekdayMonday => 'Esmaspäev';

  @override
  String get settingsWeekdaySaturday => 'Laupäev';

  @override
  String get settingsWeekdaySunday => 'Pühapäev';

  @override
  String get settingsWeekdayThursday => 'Neljapäev';

  @override
  String get settingsWeekdayTuesday => 'Teisipäev';

  @override
  String get settingsWeekdayWednesday => 'Kolmapäev';

  @override
  String get sortDeadline => 'Tähtaeg';

  @override
  String get sortName => 'Nimi';

  @override
  String get sortProgress => 'Edenemine';

  @override
  String get sortStatus => 'Olek';

  @override
  String get startupTitle => 'ECTS Trackerit ei saanud käivitada';

  @override
  String get statsActiveDays => 'Aktiivsed päevad';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days p aktiivne';
  }

  @override
  String get statsAddDeadlines => 'Lisa tähtajad koormuse prognoosimiseks.';

  @override
  String get statsComingLoad => 'Eelseisev koormus';

  @override
  String get statsConsistency => 'Järjepidevus';

  @override
  String get statsConsistencyHint =>
      'Õppepäevad viimase 30 päeva jooksul. Väikesed sammud iga päev võidavad tuupimise.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% viimasest 30 päevast';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Kursus $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'K$id';
  }

  @override
  String get statsDidPerDay => 'Tehtud / päev (14 p)';

  @override
  String get statsEmpty => 'Sessioone veel pole';

  @override
  String get statsGap => 'Vahe';

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
  String get statsLast30Days => 'Viimased 30 päeva';

  @override
  String get statsLast7Days => 'Viimased 7 päeva';

  @override
  String get statsNeedPerDay => 'Vaja / päev';

  @override
  String get statsNext8Weeks => 'Järgmised 8 nädalat';

  @override
  String get statsOfLast30DaysVolume => 'viimase 30 päeva mahust';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Ülekoormusnädalad >$threshold h märgitud punasega — lükka tähtaega edasi või vähenda mahtu.';
  }

  @override
  String get statsOverview => 'Ülevaade';

  @override
  String get statsPaceCovers => 'Varasem tempo katab vajaliku. Hoia hoogu.';

  @override
  String statsPaceShort(String gap) {
    return 'Varasem tempo jääb $gap h/päevas puudu — lisa plokk või vähenda mahtu.';
  }

  @override
  String get statsPastVsNeeded => 'Varasem vs vajalik';

  @override
  String statsPeakPerWeek(String peak) {
    return 'tipp $peak h/näd';
  }

  @override
  String get statsPerCourse => 'Kursuste kaupa';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sessioonid';

  @override
  String statsSuggestedOrder(String order) {
    return 'Soovitatud järjekord: $order (varaseim tähtaeg esimesena)';
  }

  @override
  String get statsTotal => 'Kokku';

  @override
  String get statsTotalVolume => 'kogumaht';

  @override
  String get statusAhead => 'Edumaal';

  @override
  String get statusBehind => 'Mahajäänud';

  @override
  String get statusCompleted => 'Lõpetatud';

  @override
  String get statusOnTrack => 'Graafikus';

  @override
  String get statusOverdue => 'Hilinenud';

  @override
  String get studyLogDeleteBody =>
      'Kustuta see õppesessioon? Seda ei saa tagasi võtta.';

  @override
  String get studyLogDeleteTitle => 'Kustuta sessioon?';

  @override
  String get studyLogEmptyHint => 'Logi sessioon, et oma õpiaega jälgida.';

  @override
  String get studyLogEmptyTitle => 'Õppesessioone veel pole';

  @override
  String get studyLogFabLabel => 'Logi sessioon';

  @override
  String get studyLogFabTooltip => 'Logi sessioon';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Eemalda näidissessioon';

  @override
  String get studyLogThisWeek => 'See nädal';

  @override
  String get studyLogToday => 'Täna';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Kursus $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS peab olema suurem kui null';

  @override
  String get validationCourseEctsRequired => 'Sisesta ECTS ainepunktid';

  @override
  String get validationCourseNameRequired => 'Nimi on kohustuslik';

  @override
  String get validationCourseNameTooLong => 'Nimi on liiga pikk';

  @override
  String get validationSessionCourseRequired => 'Vali kursus';

  @override
  String get validationSessionDurationRequired => 'Sisesta kestus';

  @override
  String get widgetNoProgress => 'Edenemine puudub';

  @override
  String get settingsLanguage => 'Keel';

  @override
  String get settingsLiquidGlass => 'Vedel klaas';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Mattklaasist kaardid ja ribad. Väljas olles püsib klassikaline ühtne välimus.';

  @override
  String get settingsLiquidGlassOn => 'Sees';

  @override
  String get settingsLiquidGlassOff => 'Väljas';

  @override
  String get settingsLiquidGlassUpdated => 'Vedel klaas uuendatud.';

  @override
  String get devToolsReminderPreview => 'Meeldetuletuse eelvaade';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'Vaata, mis praegu teavitaks. Windowsi-turvaline testivoog.';

  @override
  String get reminderPreviewTitle => 'Meeldetuletuse eelvaade';

  @override
  String get reminderPreviewNow => 'Eelvaate aeg';

  @override
  String get reminderPreviewReset => 'Nüüd';

  @override
  String get reminderPreviewEmpty =>
      'Kõik vaikne — sel ajal ei teavitaks miski.';

  @override
  String get reminderPreviewCustom => 'Kohandatud ajakavad (demo)';

  @override
  String get reminderPreviewNoFire => 'Ühtegi eelseisvat käivitust pole.';

  @override
  String get reminderKindDaily => 'Igapäevane';

  @override
  String get reminderKindBehind => 'Mahajäänud';

  @override
  String get reminderKindDeadline => 'Tähtaeg';

  @override
  String get reminderKindOverdue => 'Hilinenud';

  @override
  String get reminderKindStreak => 'Seeria';

  @override
  String get reminderKindCustom => 'Kohandatud';

  @override
  String get settingsReminders => 'Õppemeeldetuletused';

  @override
  String get settingsRemindersOff =>
      'Väljas — lülita sisse igapäevase meeldetuletuse jaoks.';

  @override
  String get settingsReminderTime => 'Meeldetuletuse aeg';

  @override
  String get settingsReminderDenied =>
      'Teavitused on blokeeritud — luba need süsteemi seadetes.';

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
    return '📚 Täna õhtul: $duration, et püsida Graafikus';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course: täna jäänud $duration';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count veel)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Logi sessioon, et tänane seljataha saada.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course on nüüd Mahajäänud';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return '$left jäänud, $days päeva aega — $pace/päevas siit edasi. Logi $catchUp, et jõuda tagasi Graafikusse.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left jäänud, $days päeva aega — $pace/päevas siit edasi. Ainult täieliku $left lõpetamine kustutab selle — alusta täna õhtul.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left on veel lahti ja tähtaeg on käes. Kõik, mis nüüd logid, loeb.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course tähtaeg on homme ja $left on veel lahti';
  }

  @override
  String get notifDeadlineTomorrowBody => 'Kõik, mis täna logid, loeb topelt.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ $course eksam $days päeva pärast — jäänud $left';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'See on $pace/päevas. Jaga ära: 2 sessiooni päevas võidab ühe maratoni.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Iga tund, mille nüüd logid, loeb.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course tähtaeg möödus, aga $left on veel lahti';
  }

  @override
  String get notifOverdueBody =>
      'Lükka tähtaega edasi või tee tunnid täis — seniajani vajab kursus tähelepanu.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days-päevane seeria — $week sel nädalal';
  }

  @override
  String get notifStreakBody =>
      'Kõik kursused on Graafikus või Edumaal. Tubli hoog.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Õppimise kontroll: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Aeg uuendada: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left lahti · $pace/päevas, et õigeks ajaks valmis saada. Logi sessioon edenemise uuendamiseks.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left on veel lahti — kõik, mis nüüd logid, loeb.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Järgmine: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1p';

  @override
  String get reminderPreviewFwdDay => '+1p';

  @override
  String get reminderPreviewFake => '(võlts)';

  @override
  String get reminderPreviewDemoLabel => 'Demo-kontroll';
}
