// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Peruuta';

  @override
  String get commonClose => 'Sulje';

  @override
  String get commonDelete => 'Poista';

  @override
  String get commonEdit => 'Muokkaa';

  @override
  String get commonError => 'Virhe';

  @override
  String get commonNone => 'Ei mitään';

  @override
  String get commonSave => 'Tallenna';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Vaaditut tunnit (automaattinen): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Tyhjennä määräaika';

  @override
  String get courseFormClearStartTooltip => 'Tyhjennä aloituspäivä';

  @override
  String get courseFormColorLabel => 'Väri';

  @override
  String get courseFormDateNotSet => 'Ei asetettu';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Määräaika: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS-opintopisteet';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value h/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nimi';

  @override
  String get courseFormNotesLabel => 'Muistiinpanot (valinnainen)';

  @override
  String get courseFormSaving => 'Tallennetaan…';

  @override
  String courseFormStartButton(String date) {
    return 'Alku: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Pois: ei painetta ennen päivää $date; jätetty pois tämän päivän tahdista.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Päällä: aika jaetaan tähän hetkeen asti ja lasketaan mukaan tämän päivän tahtiin.';

  @override
  String get courseFormStartEarlyTitle =>
      'Aloita nyt tulevasta aloituksesta huolimatta';

  @override
  String get courseFormTitleAdd => 'Lisää kurssi';

  @override
  String get courseFormTitleEdit => 'Muokkaa kurssia';

  @override
  String get coursesAddTooltip => 'Lisää kurssi';

  @override
  String coursesDeleteBody(String name) {
    return 'Poistetaanko ”$name” ja kaikki sen opiskelukerrat? Tätä ei voi kumota.';
  }

  @override
  String get coursesDeleteTitle => 'Poistetaanko kurssi?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint =>
      'Napauta ”Uusi kurssi” luodaksesi ensimmäisen kurssisi.';

  @override
  String get coursesEmptyTitle => 'Ei kursseja vielä';

  @override
  String get coursesFilterAll => 'Kaikki tilat';

  @override
  String get coursesFilterEmpty => 'Yksikään kurssi ei vastaa tätä suodatinta';

  @override
  String get coursesNewCourse => 'Uusi kurssi';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Tarvitaan $daily h/päivä';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/day needed';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Tarvitaan $daily h/päivä • $weekly h/viikko';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily min/day • $weekly min/week needed';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily min/day • $weekly h/week needed';
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
  String get coursesRemoveSampleTooltip => 'Poista esimerkkikurssi';

  @override
  String coursesShownCount(String count) {
    return 'Näytetään $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Lajittelu: $label';
  }

  @override
  String get dashboardAllDone => 'Kaikki valmista';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours h kirjattu (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kurssia';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kurssia · $upcoming tulevaa ei tämän päivän tahdissa';
  }

  @override
  String get dashboardCoursesTitle => 'Kurssit';

  @override
  String dashboardDeadline(String date) {
    return 'Määräaika $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Määräaika $date ($days päivää jäljellä)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Määräaika $date (1 päivä jäljellä)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Määräaika $date (myöhässä)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Määräaika $date (tänään)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Tänään erääntyy — kirjattu $hours h';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Kaikki kurssit on suoritettu — katso koko luettelo Kurssit-välilehdeltä.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Lisää kurssi aloittaaksesi ECTS-edistymisen seurannan.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Jäljessä = teet $achieved/pv, tarvit $need/pv';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Jäljessä = teet $achieved/pv, tarvit $need/pv · varhainen aloitus';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Jäljessä: mikään rajallinen tahti ei saavuta tämän päivän määräaikaa, kun tunteja on jäljellä';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Aikataulussa: ei tahtia vielä — kirjaa ensimmäinen kerta vahvistukseksi';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Alkaa $days pv kuluttua · laskettu alkaen $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Alkaa $days pv kuluttua · laskettu alkaen $date · varhainen aloitus päällä';
  }

  @override
  String get dashboardFreshStart => 'UUSI ALKU';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct % · $hours h jäljellä';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours h/pv';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/d';
  }

  @override
  String get dashboardLogSessionAction => 'Kirjaa opiskelukerta';

  @override
  String get dashboardLogSessionTooltip => 'Kirjaa opiskelukerta';

  @override
  String get dashboardNewBadge => 'UUSI';

  @override
  String get dashboardNoCourses => 'Ei kursseja vielä';

  @override
  String get dashboardNoDeadline => 'Ei määräaikaa';

  @override
  String get dashboardNoDeadlines => 'Ei määräaikoja';

  @override
  String get dashboardNoPaceDue => 'Tänään ei tahtia';

  @override
  String get dashboardNothingDue => 'Ei mitään erääntymässä';

  @override
  String get dashboardNothingToTrack => 'Ei vielä seurattavaa';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Tänään erääntyy — $hours h jäljellä';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Valmistumiseen tarvitaan $daily h/päivä';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Need $daily min/day to finish';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Valmistumiseen tarvitaan $daily h/päivä · $weekly h/viikko';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Need $daily min/day · $weekly min/week to finish';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Need $daily min/day · $weekly h/week to finish';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Tarvitaan $hours h/päivä alkaen $date · ei tämän päivän tahdissa';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Need $minutes min/day from $date · not in Today’s pace';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Ei määräaikaa — $hours h jäljellä · ei päivittäistä painetta';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Alkaa $date · tehtävää $hours h';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · epärealistinen';
  }

  @override
  String get dashboardProgramBare => 'OHJELMA';

  @override
  String get dashboardProgramEmptyHint =>
      'Lisää kurssi aloittaaksesi seurannan';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required h';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'OHJELMA $pct %';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days päivää varaa';
  }

  @override
  String get dashboardStartNotSet => 'Ei asetettu';

  @override
  String dashboardStartsIn(String days) {
    return 'Alkaa $days pv kuluttua';
  }

  @override
  String get dashboardStartsSoon => 'Alkaa pian';

  @override
  String get dashboardTipEmpty =>
      'Lisää ensimmäinen kurssisi — päivittäinen tahtisi ja edistymisesi näkyvät täällä.';

  @override
  String get dashboardTipFirst =>
      'Ensimmäiset 25 minuuttia merkitsevät eniten — valitse kurssi, jonka määräaika on ensin.';

  @override
  String get dashboardTodayBare => 'TÄNÄÄN';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace h';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'TÄNÄÄN $pct %';
  }

  @override
  String get dashboardTodayPaceLabel => 'TÄMÄN PÄIVÄN TAHTI';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Tänään $logged / $pace h';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Tulevat aloitukset — ei painetta tänään, jätetty pois tämän päivän tahdista.';

  @override
  String get dashboardUpcomingTitle => 'Tulevat';

  @override
  String get devToolsActivate => 'Aktivoi';

  @override
  String get devToolsActivateMessage =>
      'Tämä avaa piilotetut kuormitustestityökalut (luodun datan lisääminen). Vain kehitykseen.';

  @override
  String get devToolsActivateTitle => 'Aktivoidaanko kehittäjätila?';

  @override
  String get devToolsActivated => 'Kehittäjätila aktivoitu.';

  @override
  String get devToolsClearPumped => 'Tyhjennä luotu data';

  @override
  String get devToolsClearPumpedMessage =>
      'Poistaa luodut STRESS-kurssit ja niiden kerrat. Omat tietosi säilyvät.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Poista luodut STRESS-kurssit ja kerrat.';

  @override
  String get devToolsClearPumpedTitle => 'Tyhjennetäänkö luotu data?';

  @override
  String devToolsCleared(String count) {
    return 'Tyhjennetty $count luotua kurssia.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Toinen vahvistus: tämä paisuttaa kursseja, luetteloita, kaavioita ja tahtilaskelmia ja voi kestää muutaman sekunnin. Lisätäänkö nyt?';

  @override
  String get devToolsConfirmPumpTitle => 'Vahvista kuormitustesti';

  @override
  String get devToolsContinue => 'Jatka';

  @override
  String get devToolsExit => 'Poistu kehittäjätilasta';

  @override
  String get devToolsExitSubtitle =>
      'Piilota kehittäjätyökalut tällä laitteella.';

  @override
  String get devToolsPumpData => 'Lisää data';

  @override
  String get devToolsPumpMessage =>
      'Tämä lisää realistisen luodun lukukauden (~10 kurssia, ~800 kertaa viimeisen 12 viikon ajalta). Olemassa olevat tietosi säilyvät. Jatketaanko?';

  @override
  String get devToolsPumpSubtitle =>
      'Lisää luotu lukukausi (~10 kurssia, ~800 kertaa, 12 viikkoa). Olemassa oleva data säilyy.';

  @override
  String get devToolsPumpTile => 'Lisää testidata';

  @override
  String get devToolsPumpTitle => 'Lisätäänkö testidata?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Lisätty $courses kurssia, $sessions kertaa.';
  }

  @override
  String get devToolsPumping => 'Lisätään testidataa…';

  @override
  String get devToolsRemoveAll => 'Poista kaikki data';

  @override
  String get devToolsRemoveAllMessage =>
      'Kehittäjän oikotie: tämä poistaa pysyvästi KAIKKI kurssit, kerrat ja asetukset. Tätä ei voi kumota.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Kehittäjän oikotie: poista KAIKKI kurssit, kerrat ja asetukset.';

  @override
  String get devToolsRemoveAllTitle => 'Poistetaanko kaikki data?';

  @override
  String get navCourses => 'Kurssit';

  @override
  String get navDashboard => 'Kojelauta';

  @override
  String get navSettings => 'Asetukset';

  @override
  String get navStatistics => 'Tilastot';

  @override
  String get navStudyLog => 'Opiskeluloki';

  @override
  String get sampleBadge => 'Esimerkki';

  @override
  String get sessionFormCourseLabel => 'Kurssi';

  @override
  String sessionFormDateButton(String date) {
    return 'Päivämäärä: $date';
  }

  @override
  String get sessionFormDurationError =>
      'Keston on oltava suurempi kuin nolla.';

  @override
  String get sessionFormHoursLabel => 'Tunnit';

  @override
  String get sessionFormLogAction => 'Kirjaa kerta';

  @override
  String get sessionFormMinutesLabel => 'Minuutit';

  @override
  String get sessionFormNoCourseError => 'Valitse kurssi.';

  @override
  String get sessionFormNoCoursesHint =>
      'Lisää ensin kurssi kirjataksesi kerran.';

  @override
  String get sessionFormNotesLabel => 'Muistiinpanot (valinnainen)';

  @override
  String get sessionFormSaving => 'Tallennetaan…';

  @override
  String get sessionFormTitleAdd => 'Kirjaa opiskelukerta';

  @override
  String get sessionFormTitleEdit => 'Muokkaa opiskelukertaa';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Yhteensä: $hours h';
  }

  @override
  String get settingsAccent => 'Teemaväri';

  @override
  String get settingsAccentBerry => 'Marja';

  @override
  String get settingsAccentClay => 'Savi';

  @override
  String get settingsAccentForest => 'Metsä';

  @override
  String get settingsAccentSlate => 'Liuske';

  @override
  String get settingsAccentTeal => 'Petrooli';

  @override
  String get settingsAccentUpdated => 'Teemaväri päivitetty.';

  @override
  String get settingsAllDataDeleted => 'Kaikki data poistettu.';

  @override
  String get settingsAppearance => 'Ulkoasu (tumma / vaalea)';

  @override
  String get settingsCheckingSample => 'Tarkistetaan esimerkkidataa…';

  @override
  String get settingsClear => 'Tyhjennä';

  @override
  String get settingsClearSample => 'Tyhjennä esimerkkidata';

  @override
  String get settingsClearSampleMessage =>
      'Tämä poistaa esimerkkikurssit ja -kerrat. Itse lisäämiäsi kursseja tai kertoja ei poisteta.';

  @override
  String get settingsClearSampleSubtitle =>
      'Poista valmiit esimerkkikurssit ja -kerrat. Omat tietosi säilyvät.';

  @override
  String get settingsClearSampleTitle => 'Tyhjennetäänkö esimerkkidata?';

  @override
  String get settingsCopy => 'Kopioi';

  @override
  String get settingsDailyError => 'Anna 0 tai positiivinen minuuttimäärä.';

  @override
  String get settingsDailyLabel => 'Minuuttia päivässä (0 = ei tavoitetta)';

  @override
  String get settingsDailyTarget => 'Päivittäinen opiskelutavoite';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes min/päivä';
  }

  @override
  String get settingsDailyUpdated => 'Päivittäinen tavoite päivitetty.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Poista kaikki';

  @override
  String get settingsDevMode => 'Kehittäjätila';

  @override
  String get settingsDisplay => 'Näyttö';

  @override
  String get settingsDisplayComfortable => 'Mukava';

  @override
  String get settingsDisplayCompact => 'Tiivis';

  @override
  String get settingsDisplayLarge => 'Suuri';

  @override
  String get settingsDisplaySize => 'Tekstin ja elementtien koko';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent %)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Näytön koko päivitetty.';

  @override
  String get settingsExport => 'Vie data';

  @override
  String get settingsExportCopied => 'Vienti kopioitu leikepöydälle.';

  @override
  String get settingsExportSubtitle =>
      'Kopioi kaikki kurssit, kerrat ja asetukset JSON-muodossa.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kurssia · $sessions kertaa · $kb kt';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (katkaistu — täysi varmuuskopio on $kb kt, käytä Kopioi kaikkeen)';
  }

  @override
  String get settingsFirstWeekday => 'Viikon ensimmäinen päivä';

  @override
  String get settingsFirstWeekdayUpdated =>
      'Viikon ensimmäinen päivä päivitetty.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds s pito)';
  }

  @override
  String get settingsHoldToReplace => 'Korvaa kaikki pitämällä';

  @override
  String get settingsHoursError => 'Anna nollaa suurempi luku.';

  @override
  String get settingsHoursHelper =>
      'Oletus 30. Muutos laskee vaatimukset uudelleen; kirjaukset säilyvät.';

  @override
  String get settingsHoursLabel => 'Tuntia per ECTS-opintopiste';

  @override
  String get settingsHoursPerEcts => 'Tuntia per ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value h';
  }

  @override
  String get settingsHoursUpdated => 'Tunnit per ECTS päivitetty.';

  @override
  String get settingsImport => 'Tuo data';

  @override
  String get settingsImportAppend => 'Liitä';

  @override
  String get settingsImportAppendAction => 'Tuo (liitä)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Data liitetty: lisätty $courses kurssia, $sessions kertaa.';
  }

  @override
  String get settingsImportInfo =>
      'Liittäminen lisää varmuuskopion nykyisten tietojen rinnalle (asetukset säilyvät). Korvaaminen tyhjentää ensin KAIKKI kurssit, kerrat ja asetukset.';

  @override
  String get settingsImportLabel => 'Liitä viety JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kurssia · $sessions kertaa';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · viety $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · skeema v$schema';
  }

  @override
  String get settingsImportReplace => 'Korvaa';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Korvaaminen poistaa ensin kaiken. Paina ja PIDÄ alla olevaa painiketta $seconds sekuntia vahvistaaksesi.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Data korvattu: palautettu $courses kurssia, $sessions kertaa.';
  }

  @override
  String get settingsImportSubtitle =>
      'Korvaa kaikki data aiemmin viedystä JSON-varmuuskopiosta.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Pidä vielä… $remaining s';
  }

  @override
  String get settingsNoSample => 'Ei esimerkkidataa';

  @override
  String get settingsNoSampleSubtitle =>
      'Valmis esimerkkidata on jo tyhjennetty.';

  @override
  String get settingsNoTarget => 'Ei tavoitetta';

  @override
  String get settingsOverloadError => 'Anna luku 5–100 h/viikko.';

  @override
  String get settingsOverloadHelper =>
      'Tämän ylittävät kuormitusviikot merkitään punaisella. Päätoiminen opiskelu on ~35–40 h/viikko.';

  @override
  String settingsOverloadHours(String value) {
    return '$value h';
  }

  @override
  String get settingsOverloadLabel => 'Tuntia viikossa (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/viikko merkitään punaisella';
  }

  @override
  String get settingsOverloadThreshold => 'Viikoittaisen ylikuormituksen raja';

  @override
  String get settingsOverloadUpdated => 'Ylikuormitusraja päivitetty.';

  @override
  String get settingsPaceTolerance => 'Edellä / jäljessä -sieto';

  @override
  String get settingsPasteValidBackup => 'Liitä ensin kelvollinen varmuuskopio';

  @override
  String get settingsReset => 'Palauta';

  @override
  String get settingsResetAll => 'Palauta kaikki data';

  @override
  String get settingsResetAllMessage =>
      'Tämä poistaa pysyvästi KAIKKI kurssit, kerrat ja asetukset. Tätä ei voi kumota. Vie ensin varmuuskopio tarvittaessa.';

  @override
  String get settingsResetAllSubtitle =>
      'Poista kaikki kurssit, kerrat ja asetukset.';

  @override
  String get settingsResetAllTitle => 'Palautetaanko kaikki data?';

  @override
  String get settingsResetSettings => 'Palauta asetukset';

  @override
  String get settingsResetSettingsDone => 'Asetukset palautettu oletuksiin.';

  @override
  String get settingsResetSettingsMessage =>
      'Palauttaa tunnit per ECTS (30), päivätavoitteen (ei mitään), viikon ensimmäisen päivän (maanantai), teeman (järjestelmä), siedon (5 päivää), ylikuormituksen (35 h/viikko), koon (mukava), värin (liuske). Kurssit ja kerrat säilyvät.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Palauta oletukset: 30 h/ECTS, ei tavoitetta, maanantai, järjestelmäteema, 5 päivän sieto, 35 h/viikko ylikuormitus, mukava koko, liuske.';

  @override
  String get settingsResetSettingsTitle => 'Palautetaanko asetukset?';

  @override
  String get settingsSampleData => 'Esimerkkidata';

  @override
  String settingsSampleDataError(String error) {
    return 'Virhe: $error';
  }

  @override
  String get settingsStudySettings => 'Opiskeluasetukset';

  @override
  String get settingsThemeDark => 'Tumma';

  @override
  String get settingsThemeLight => 'Vaalea';

  @override
  String get settingsThemeSystem => 'Järjestelmän oletus';

  @override
  String get settingsThemeTitle => 'Teema';

  @override
  String get settingsThemeUpdated => 'Teema päivitetty.';

  @override
  String settingsToleranceDays(String value) {
    return '$value päivää';
  }

  @override
  String get settingsToleranceError => 'Anna luku 0–30 päivää.';

  @override
  String get settingsToleranceHelper =>
      'Edellä vaatii +N päivää ylijäämää, jäljessä −N päivää. 5 = vakaa, 0 = herkkä.';

  @override
  String get settingsToleranceLabel => 'Työpäivää (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance työtä';
  }

  @override
  String get settingsToleranceUpdated => 'Sieto päivitetty.';

  @override
  String get settingsWeekdayFriday => 'Perjantai';

  @override
  String get settingsWeekdayMonday => 'Maanantai';

  @override
  String get settingsWeekdaySaturday => 'Lauantai';

  @override
  String get settingsWeekdaySunday => 'Sunnuntai';

  @override
  String get settingsWeekdayThursday => 'Torstai';

  @override
  String get settingsWeekdayTuesday => 'Tiistai';

  @override
  String get settingsWeekdayWednesday => 'Keskiviikko';

  @override
  String get sortDeadline => 'Määräaika';

  @override
  String get sortName => 'Nimi';

  @override
  String get sortProgress => 'Edistyminen';

  @override
  String get sortStatus => 'Tila';

  @override
  String get startupTitle => 'ECTS Trackerin käynnistys epäonnistui';

  @override
  String get statsActiveDays => 'Aktiiviset päivät';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days pv aktiivinen';
  }

  @override
  String get statsAddDeadlines => 'Lisää määräajat kuorman ennustamiseksi.';

  @override
  String get statsComingLoad => 'Tuleva kuorma';

  @override
  String get statsConsistency => 'Säännöllisyys';

  @override
  String get statsConsistencyHint =>
      'Opiskelupäivät viimeisen 30 päivän aikana. Pienet askeleet joka päivä voittavat pänttäämisen.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent % viimeisestä 30 päivästä';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Kurssi $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'K$id';
  }

  @override
  String get statsDidPerDay => 'Tehty / pv (14 pv)';

  @override
  String get statsEmpty => 'Ei kertoja vielä';

  @override
  String get statsGap => 'Ero';

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
  String get statsLast30Days => 'Viimeiset 30 päivää';

  @override
  String get statsLast7Days => 'Viimeiset 7 päivää';

  @override
  String get statsNeedPerDay => 'Tarvitaan / pv';

  @override
  String get statsNext8Weeks => 'Seuraavat 8 viikkoa';

  @override
  String get statsOfLast30DaysVolume => 'viimeisen 30 päivän määrästä';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Ylikuormitusviikot >$threshold h merkitty punaisella — siirrä määräaikaa tai karsi laajuutta.';
  }

  @override
  String get statsOverview => 'Yleiskatsaus';

  @override
  String get statsPaceCovers =>
      'Aiempi tahti kattaa tarvittavan. Pidä putki yllä.';

  @override
  String statsPaceShort(String gap) {
    return 'Aiempi tahti on $gap h/päivä vajaa — lisää jakso tai karsi laajuutta.';
  }

  @override
  String get statsPastVsNeeded => 'Aiempi vs tarvittava';

  @override
  String statsPeakPerWeek(String peak) {
    return 'huippu $peak h/vko';
  }

  @override
  String get statsPerCourse => 'Kursseittain';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done h / $required h · $percent %';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent %';
  }

  @override
  String get statsSessions => 'Kerrat';

  @override
  String statsSuggestedOrder(String order) {
    return 'Ehdotettu järjestys: $order (varhaisin määräaika ensin)';
  }

  @override
  String get statsTotal => 'Yhteensä';

  @override
  String get statsTotalVolume => 'kokonaimäärä';

  @override
  String get statusAhead => 'Edellä';

  @override
  String get statusBehind => 'Jäljessä';

  @override
  String get statusCompleted => 'Suoritettu';

  @override
  String get statusOnTrack => 'Aikataulussa';

  @override
  String get statusOverdue => 'Myöhässä';

  @override
  String get studyLogDeleteBody =>
      'Poistetaanko tämä opiskelukerta? Tätä ei voi kumota.';

  @override
  String get studyLogDeleteTitle => 'Poistetaanko kerta?';

  @override
  String get studyLogEmptyHint => 'Kirjaa kerta seurataksesi opiskeluaikaasi.';

  @override
  String get studyLogEmptyTitle => 'Ei opiskelukertoja vielä';

  @override
  String get studyLogFabLabel => 'Kirjaa kerta';

  @override
  String get studyLogFabTooltip => 'Kirjaa kerta';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours h';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Poista esimerkkikerta';

  @override
  String get studyLogThisWeek => 'Tämä viikko';

  @override
  String get studyLogToday => 'Tänään';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Kurssi $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String get validationCourseEctsPositive =>
      'ECTS:n on oltava suurempi kuin nolla';

  @override
  String get validationCourseEctsRequired => 'Anna ECTS-opintopisteet';

  @override
  String get validationCourseNameRequired => 'Nimi vaaditaan';

  @override
  String get validationCourseNameTooLong => 'Nimi on liian pitkä';

  @override
  String get validationSessionCourseRequired => 'Valitse kurssi';

  @override
  String get validationSessionDurationRequired => 'Anna kesto';

  @override
  String get widgetNoProgress => 'Ei edistystä vielä';

  @override
  String get settingsLanguage => 'Kieli';

  @override
  String get settingsLiquidGlass => 'Nestelasi';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Huurrelasista tehdyt kortit ja palkit. Pois käytössä säilyy klassinen yhtenäinen ilme.';

  @override
  String get settingsLiquidGlassOn => 'Päällä';

  @override
  String get settingsLiquidGlassOff => 'Pois';

  @override
  String get settingsLiquidGlassUpdated => 'Nestelasi päivitetty.';

  @override
  String get devToolsReminderPreview => 'Reminder preview';

  @override
  String get devToolsReminderPreviewSubtitle =>
      'See what would notify right now. Windows-safe test feed.';

  @override
  String get reminderPreviewTitle => 'Reminder preview';

  @override
  String get reminderPreviewNow => 'Preview time';

  @override
  String get reminderPreviewReset => 'Now';

  @override
  String get reminderPreviewEmpty =>
      'All quiet — nothing would notify at this time.';

  @override
  String get reminderPreviewCustom => 'Custom schedules (demo)';

  @override
  String get reminderPreviewNoFire => 'No upcoming fire.';

  @override
  String get reminderKindDaily => 'Daily';

  @override
  String get reminderKindBehind => 'Behind';

  @override
  String get reminderKindDeadline => 'Deadline';

  @override
  String get reminderKindOverdue => 'Overdue';

  @override
  String get reminderKindStreak => 'Streak';

  @override
  String get reminderKindCustom => 'Custom';

  @override
  String get settingsReminders => 'Study reminders';

  @override
  String get settingsRemindersOff => 'Off — turn on for a daily nudge.';

  @override
  String get settingsReminderTime => 'Reminder time';

  @override
  String get settingsReminderDenied =>
      'Notifications are blocked — enable them in system settings.';
}
