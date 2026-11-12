// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Ləğv et';

  @override
  String get commonClose => 'Bağla';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonEdit => 'Redaktə et';

  @override
  String get commonError => 'Xəta';

  @override
  String get commonNone => 'Heç biri';

  @override
  String get commonSave => 'Yadda saxla';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Tələb olunan saat (avto): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Son tarixi təmizlə';

  @override
  String get courseFormClearStartTooltip => 'Başlanğıc tarixini təmizlə';

  @override
  String get courseFormColorLabel => 'Rəng';

  @override
  String get courseFormDateNotSet => 'Təyin edilməyib';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Son tarix: $date';
  }

  @override
  String get courseFormEctsLabel => 'AKTS kreditləri';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value s/AKTS';
  }

  @override
  String get courseFormNameLabel => 'Ad';

  @override
  String get courseFormNotesLabel => 'Qeydlər (istəyə bağlı)';

  @override
  String get courseFormSaving => 'Saxlanılır…';

  @override
  String courseFormStartButton(String date) {
    return 'Başlanğıc: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Söndürülüb: $date tarixinədək təzyiq yoxdur; Bugünkü tempə daxil deyil.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Aktivdir: vaxt indiyədək bölünür və Bugünkü tempə daxil edilir.';

  @override
  String get courseFormStartEarlyTitle =>
      'Gələcək başlanğıca baxmayaraq indi başla';

  @override
  String get courseFormTitleAdd => 'Fənn əlavə et';

  @override
  String get courseFormTitleEdit => 'Fənni redaktə et';

  @override
  String get coursesAddTooltip => 'Fənn əlavə et';

  @override
  String coursesDeleteBody(String name) {
    return '\"$name\" fənni və bütün tədris sessiyaları silinsin? Bu geri qaytarılmır.';
  }

  @override
  String get coursesDeleteTitle => 'Fənn silinsin?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits AKTS';
  }

  @override
  String get coursesEmptyHint =>
      'İlk fənninizi yaratmaq üçün “Yeni fənn” düyməsinə toxunun.';

  @override
  String get coursesEmptyTitle => 'Hələ fənn yoxdur';

  @override
  String get coursesFilterAll => 'Bütün statuslar';

  @override
  String get coursesFilterEmpty => 'Bu filtrə uyğun fənn yoxdur';

  @override
  String get coursesNewCourse => 'Yeni fənn';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily s/gün lazımdır';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/day needed';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily s/gün • $weekly s/həftə lazımdır';
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
    return '$done / $required s • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Nümunə fənni sil';

  @override
  String coursesShownCount(String count) {
    return '$count göstərilir';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sıralama: $label';
  }

  @override
  String get dashboardAllDone => 'Hamısı hazırdır';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours s qeydə alındı (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count fənn';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count fənn · $upcoming qarşıdakı bugünkü tempə daxil deyil';
  }

  @override
  String get dashboardCoursesTitle => 'Fənnlər';

  @override
  String dashboardDeadline(String date) {
    return 'Son tarix $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Son tarix $date (qarşıda $days gün)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Son tarix $date (1 gün qalıb)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Son tarix $date (gecikib)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Son tarix $date (bu gün)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Bu gün çatmalıdır — $hours s qeydə alındı';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Bütün fənnlər tamamlanıb — tam siyahı üçün Fənnlər bölməsinə baxın.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'AKTS tərəqqinizi izləməyə başlamaq üçün fənn əlavə edin.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Geridə = $achieved/gün edirsən, $need/gün lazımdır';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Geridə = $achieved/gün edirsən, $need/gün lazımdır · erkən başlanğıc';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Geridə: bu gün son tarixi çatan və saatı qalan işə heç bir sonlu temp çatmır';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Yoldadır: hələ temp yoxdur — təsdiq üçün ilk sessiyanı qeydə al';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days günə başlayır · $date tarixindən hesablanır';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days günə başlayır · $date tarixindən hesablanır · erkən başlanğıc aktivdir';
  }

  @override
  String get dashboardFreshStart => 'TƏZƏ BAŞLANĞIC';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · ${hours}s qalıb';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required s';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours s/gün';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/d';
  }

  @override
  String get dashboardLogSessionAction => 'Tədris sessiyası qeydə al';

  @override
  String get dashboardLogSessionTooltip => 'Tədris sessiyası qeydə al';

  @override
  String get dashboardNewBadge => 'YENİ';

  @override
  String get dashboardNoCourses => 'Hələ fənn yoxdur';

  @override
  String get dashboardNoDeadline => 'Son tarix yoxdur';

  @override
  String get dashboardNoDeadlines => 'Son tarix planlaşdırılmayıb';

  @override
  String get dashboardNoPaceDue => 'Bu gün çatmalı temp yoxdur';

  @override
  String get dashboardNothingDue => 'Çatmalı heç nə yoxdur';

  @override
  String get dashboardNothingToTrack => 'İzlənəcək heç nə yoxdur';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Bu gün çatmalıdır — ${hours}s qalıb';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Bitirmək üçün gündə $daily s lazımdır';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Need $daily min/day to finish';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Bitirmək üçün gündə $daily s · həftədə $weekly s lazımdır';
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
    return '$date tarixindən gündə $hours s lazımdır · Bugünkü tempə daxil deyil';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Need $minutes min/day from $date · not in Today’s pace';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Son tarix yoxdur — ${hours}s qalıb · gündəlik təzyiq yoxdur';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date başlayır · görüləcək ${hours}s';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · qeyri-real';
  }

  @override
  String get dashboardProgramBare => 'PROQRAM';

  @override
  String get dashboardProgramEmptyHint =>
      'İzləməyə başlamaq üçün fənn əlavə edin';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required s';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROQRAM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days gün ehtiyat var';
  }

  @override
  String get dashboardStartNotSet => 'Təyin edilməyib';

  @override
  String dashboardStartsIn(String days) {
    return '$days günə başlayır';
  }

  @override
  String get dashboardStartsSoon => 'Tezliklə başlayır';

  @override
  String get dashboardTipEmpty =>
      'İlk fənninizi əlavə edin — gündəlik tempiniz və tərəqqiniz burada görünəcək.';

  @override
  String get dashboardTipFirst =>
      'İlk 25 dəqiqə ən önəmlidir — vaxtı ilk çatan fənni seç.';

  @override
  String get dashboardTodayBare => 'BU GÜN';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace s';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'BU GÜN $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'BUGÜNKÜ TEMP';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Bu gün $logged / $pace s';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Gələcək başlanğıclar — bu gün təzyiq yoxdur, Bugünkü tempə daxil deyil.';

  @override
  String get dashboardUpcomingTitle => 'Qarşıdakı';

  @override
  String get devToolsActivate => 'Aktivləşdir';

  @override
  String get devToolsActivateMessage =>
      'Bu, gizli stress-test alətlərini açır (yaradılmış məlumat yüklənir). Yalnız inkişaf üçündür.';

  @override
  String get devToolsActivateTitle => 'Dev rejimi aktivləşdirilsin?';

  @override
  String get devToolsActivated => 'Dev rejimi aktivləşdirildi.';

  @override
  String get devToolsClearPumped => 'Yüklənmiş məlumatı təmizlə';

  @override
  String get devToolsClearPumpedMessage =>
      'Yaradılmış STRESS fənnlərini və onların sessiyalarını silir. Öz məlumatlarınız saxlanılır.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Yaradılmış STRESS fənnlərini və sessiyaları sil.';

  @override
  String get devToolsClearPumpedTitle => 'Yüklənmiş məlumat təmizlənsin?';

  @override
  String devToolsCleared(String count) {
    return '$count yüklənmiş fənn təmizləndi.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'İkinci təsdiq: bu, fənnləri, siyahıları, qrafikləri və temp hesablamalarını şişirdəcək və bir neçə saniyə çəkə bilər. İndi yüklənsin?';

  @override
  String get devToolsConfirmPumpTitle => 'Stress yükləməsini təsdiqlə';

  @override
  String get devToolsContinue => 'Davam et';

  @override
  String get devToolsExit => 'Dev rejimindən çıx';

  @override
  String get devToolsExitSubtitle => 'Bu cihazda dev alətlərini gizlət.';

  @override
  String get devToolsPumpData => 'Məlumat yüklə';

  @override
  String get devToolsPumpMessage =>
      'Bu, realistik yaradılmış semestr əlavə edir (~10 fənn, son 12 həftədə ~800 sessiya). Mövcud məlumatlarınız saxlanılır. Davam edilsin?';

  @override
  String get devToolsPumpSubtitle =>
      'Yaradılmış semestr əlavə et (~10 fənn, ~800 sessiya, 12 həftə). Mövcud məlumat saxlanılır.';

  @override
  String get devToolsPumpTile => 'Test məlumatı yüklə';

  @override
  String get devToolsPumpTitle => 'Test məlumatı yüklənsin?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses fənn, $sessions sessiya yükləndi.';
  }

  @override
  String get devToolsPumping => 'Test məlumatı yüklənir…';

  @override
  String get devToolsRemoveAll => 'Bütün məlumatı sil';

  @override
  String get devToolsRemoveAllMessage =>
      'Dev qısayolu: bu, BÜTÜN fənnləri, sessiyaları və parametrləri həmişəlik silir. Bu geri qaytarılmır.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Dev qısayolu: BÜTÜN fənnləri, sessiyaları və parametrləri sil.';

  @override
  String get devToolsRemoveAllTitle => 'Bütün məlumat silinsin?';

  @override
  String get navCourses => 'Fənnlər';

  @override
  String get navDashboard => 'Panel';

  @override
  String get navSettings => 'Parametrlər';

  @override
  String get navStatistics => 'Statistika';

  @override
  String get navStudyLog => 'Tədris jurnalı';

  @override
  String get sampleBadge => 'Nümunə';

  @override
  String get sessionFormCourseLabel => 'Fənn';

  @override
  String sessionFormDateButton(String date) {
    return 'Tarix: $date';
  }

  @override
  String get sessionFormDurationError => 'Müddət sıfırdan böyük olmalıdır.';

  @override
  String get sessionFormHoursLabel => 'Saat';

  @override
  String get sessionFormLogAction => 'Sessiyanı qeydə al';

  @override
  String get sessionFormMinutesLabel => 'Dəqiqə';

  @override
  String get sessionFormNoCourseError => 'Fənn seçin.';

  @override
  String get sessionFormNoCoursesHint =>
      'Sessiya qeydə almaq üçün əvvəlcə fənn əlavə edin.';

  @override
  String get sessionFormNotesLabel => 'Qeydlər (istəyə bağlı)';

  @override
  String get sessionFormSaving => 'Saxlanılır…';

  @override
  String get sessionFormTitleAdd => 'Tədris sessiyası qeydə al';

  @override
  String get sessionFormTitleEdit => 'Tədris sessiyasını redaktə et';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Cəmi: $hours s';
  }

  @override
  String get settingsAccent => 'Tema rəngi';

  @override
  String get settingsAccentBerry => 'Gilas';

  @override
  String get settingsAccentClay => 'Gil';

  @override
  String get settingsAccentForest => 'Meşə';

  @override
  String get settingsAccentSlate => 'Şifer';

  @override
  String get settingsAccentTeal => 'Firuzəyi';

  @override
  String get settingsAccentUpdated => 'Tema rəngi yeniləndi.';

  @override
  String get settingsAllDataDeleted => 'Bütün məlumat silindi.';

  @override
  String get settingsAppearance => 'Görünüş (tünd / açıq)';

  @override
  String get settingsCheckingSample => 'Nümunə məlumat yoxlanılır…';

  @override
  String get settingsClear => 'Təmizlə';

  @override
  String get settingsClearSample => 'Nümunə məlumatı təmizlə';

  @override
  String get settingsClearSampleMessage =>
      'Bu, nümunə fənn və sessiyaları silir. Özünüz əlavə etdiyiniz fənn və sessiyalar silinmir.';

  @override
  String get settingsClearSampleSubtitle =>
      'Əvvəlcədən əlavə edilmiş nümunə fənn və sessiyaları sil. Öz məlumatınız saxlanılır.';

  @override
  String get settingsClearSampleTitle => 'Nümunə məlumat təmizlənsin?';

  @override
  String get settingsCopy => 'Kopyala';

  @override
  String get settingsDailyError => '0 və ya müsbət dəqiqə sayı daxil edin.';

  @override
  String get settingsDailyLabel => 'Gündə dəqiqə (0 = hədəf yoxdur)';

  @override
  String get settingsDailyTarget => 'Gündəlik tədris hədəfi';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes dəq/gün';
  }

  @override
  String get settingsDailyUpdated => 'Gündəlik hədəf yeniləndi.';

  @override
  String get settingsData => 'Məlumat';

  @override
  String get settingsDeleteEverything => 'Hər şeyi sil';

  @override
  String get settingsDevMode => 'Dev rejimi';

  @override
  String get settingsDisplay => 'Ekran';

  @override
  String get settingsDisplayComfortable => 'Rahat';

  @override
  String get settingsDisplayCompact => 'Yığcam';

  @override
  String get settingsDisplayLarge => 'Böyük';

  @override
  String get settingsDisplaySize => 'Mətn və element ölçüsü';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Ekran ölçüsü yeniləndi.';

  @override
  String get settingsExport => 'Məlumatı ixrac et';

  @override
  String get settingsExportCopied => 'İxrac mübadilə buferinə kopyalandı.';

  @override
  String get settingsExportSubtitle =>
      'Bütün fənnləri, sessiyaları və parametrləri JSON kimi kopyala.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses fənn · $sessions sessiya · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (kəsildi — tam ehtiyat nüsxə $kb KB-dır, hamısı üçün Kopyala istifadə et)';
  }

  @override
  String get settingsFirstWeekday => 'Həftənin ilk günü';

  @override
  String get settingsFirstWeekdayUpdated => 'Həftənin ilk günü yeniləndi.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (${seconds}s basıb saxla)';
  }

  @override
  String get settingsHoldToReplace => 'Hər şeyi əvəz etmək üçün basıb saxla';

  @override
  String get settingsHoursError => 'Sıfırdan böyük rəqəm daxil edin.';

  @override
  String get settingsHoursHelper =>
      'Standart 30. Dəyişdirmək tələbləri yenidən hesablayır; qeydlər saxlanılır.';

  @override
  String get settingsHoursLabel => 'AKTS krediti başına saat';

  @override
  String get settingsHoursPerEcts => 'AKTS başına saat';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value s';
  }

  @override
  String get settingsHoursUpdated => 'AKTS başına saat yeniləndi.';

  @override
  String get settingsImport => 'Məlumatı idxal et';

  @override
  String get settingsImportAppend => 'Əlavə et';

  @override
  String get settingsImportAppendAction => 'İdxal et (əlavə etməklə)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Məlumat əlavə edildi: $courses fənn, $sessions sessiya əlavə olundu.';
  }

  @override
  String get settingsImportInfo =>
      'Əlavə etmə ehtiyat nüsxəni mövcud məlumatınızla birgə əlavə edir (parametrlər saxlanılır). Əvəzetmə əvvəlcə BÜTÜN fənnləri, sessiyaları və parametrləri silir.';

  @override
  String get settingsImportLabel => 'İxrac edilmiş JSON-u yapışdır';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses fənn · $sessions sessiya';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· ixrac edilib $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· sxem v$schema';
  }

  @override
  String get settingsImportReplace => 'Əvəz et';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Əvəzetmə əvvəlcə hər şeyi silir. Təsdiq üçün aşağıdakı düyməni $seconds saniyə BASIB SAXLAYIN.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Məlumat əvəz edildi: $courses fənn, $sessions sessiya bərpa olundu.';
  }

  @override
  String get settingsImportSubtitle =>
      'Əvvəlcədən ixrac edilmiş JSON ehtiyat nüsxədən bütün məlumatı əvəz et.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Saxlamağa davam et… $remaining s';
  }

  @override
  String get settingsNoSample => 'Nümunə məlumat yoxdur';

  @override
  String get settingsNoSampleSubtitle =>
      'Əvvəlcədən əlavə edilmiş nümunə məlumat artıq təmizlənib.';

  @override
  String get settingsNoTarget => 'Hədəf təyin edilməyib';

  @override
  String get settingsOverloadError => '5–100 s/həftə rəqəm daxil edin.';

  @override
  String get settingsOverloadHelper =>
      'Bundan yuxarı gələcək yük həftələri qırmızı ilə işarələnir. Tam ştat tədris ~35–40 s/həftədir.';

  @override
  String settingsOverloadHours(String value) {
    return '$value s';
  }

  @override
  String get settingsOverloadLabel => 'Həftədə saat (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/həftə qırmızı işarələnir';
  }

  @override
  String get settingsOverloadThreshold => 'Həftəlik artıq yük həddi';

  @override
  String get settingsOverloadUpdated => 'Artıq yük həddi yeniləndi.';

  @override
  String get settingsPaceTolerance => 'İrəli / geri dözümlülük';

  @override
  String get settingsPasteValidBackup =>
      'Əvvəlcə düzgün ehtiyat nüsxə yapışdır';

  @override
  String get settingsReset => 'Sıfırla';

  @override
  String get settingsResetAll => 'Bütün məlumatı sıfırla';

  @override
  String get settingsResetAllMessage =>
      'Bu, BÜTÜN fənnləri, sessiyaları və parametrləri həmişəlik silir. Bu geri qaytarılmır. Lazımdırsa əvvəlcə ehtiyat nüsxə ixrac edin.';

  @override
  String get settingsResetAllSubtitle =>
      'Bütün fənnləri, sessiyaları və parametrləri sil.';

  @override
  String get settingsResetAllTitle => 'Bütün məlumat sıfırlansın?';

  @override
  String get settingsResetSettings => 'Parametrləri sıfırla';

  @override
  String get settingsResetSettingsDone => 'Parametrlər standarta qaytarıldı.';

  @override
  String get settingsResetSettingsMessage =>
      'AKTS başına saat (30), gündəlik hədəf (yoxdur), həftənin ilk günü (bazar ertəsi), tema (sistem), dözümlülük (5 gün), artıq yük (35 s/həftə), ölçü (rahat), rəng (şifer) bərpa olunur. Fənn və sessiyalar saxlanılır.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Standartları bərpa et: 30 s/AKTS, hədəf yoxdur, bazar ertəsi, sistem teması, 5 günlük dözümlülük, 35 s/həftə artıq yük, rahat ölçü, şifer rəng.';

  @override
  String get settingsResetSettingsTitle => 'Parametrlər sıfırlansın?';

  @override
  String get settingsSampleData => 'Nümunə məlumat';

  @override
  String settingsSampleDataError(String error) {
    return 'Xəta: $error';
  }

  @override
  String get settingsStudySettings => 'Tədris parametrləri';

  @override
  String get settingsThemeDark => 'Tünd';

  @override
  String get settingsThemeLight => 'Açıq';

  @override
  String get settingsThemeSystem => 'Sistem standartı';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema yeniləndi.';

  @override
  String settingsToleranceDays(String value) {
    return '$value gün';
  }

  @override
  String get settingsToleranceError => '0–30 gün rəqəm daxil edin.';

  @override
  String get settingsToleranceHelper =>
      'İrəli üçün +N gün artıq, geri üçün −N gün lazımdır. 5 = sabit, 0 = həssas.';

  @override
  String get settingsToleranceLabel => 'İş günü (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance iş';
  }

  @override
  String get settingsToleranceUpdated => 'Dözümlülük yeniləndi.';

  @override
  String get settingsWeekdayFriday => 'Cümə';

  @override
  String get settingsWeekdayMonday => 'Bazar ertəsi';

  @override
  String get settingsWeekdaySaturday => 'Şənbə';

  @override
  String get settingsWeekdaySunday => 'Bazar';

  @override
  String get settingsWeekdayThursday => 'Cümə axşamı';

  @override
  String get settingsWeekdayTuesday => 'Çərşənbə axşamı';

  @override
  String get settingsWeekdayWednesday => 'Çərşənbə';

  @override
  String get sortDeadline => 'Son tarix';

  @override
  String get sortName => 'Ad';

  @override
  String get sortProgress => 'Tərəqqi';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'ECTS Tracker başladıla bilmədi';

  @override
  String get statsActiveDays => 'Aktiv günlər';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days gün aktiv';
  }

  @override
  String get statsAddDeadlines =>
      'Yükü proqnozlaşdırmaq üçün son tarixlər əlavə edin.';

  @override
  String get statsComingLoad => 'Gələcək yük';

  @override
  String get statsConsistency => 'Davamlılıq';

  @override
  String get statsConsistencyHint =>
      'Son 30 gündə tədris günləri. Hər gün kiçik addımlar tıxacdan yaxşıdır.';

  @override
  String statsConsistencyScore(String percent) {
    return 'Son 30 günün $percent%-i';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Fənn $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'F$id';
  }

  @override
  String get statsDidPerDay => 'Edildi / gün (14g)';

  @override
  String get statsEmpty => 'Hələ sessiya yoxdur';

  @override
  String get statsGap => 'Fərq';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value s';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}s';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours s';
  }

  @override
  String get statsLast30Days => 'Son 30 gün';

  @override
  String get statsLast7Days => 'Son 7 gün';

  @override
  String get statsNeedPerDay => 'Lazımdır / gün';

  @override
  String get statsNext8Weeks => 'Növbəti 8 həftə';

  @override
  String get statsOfLast30DaysVolume => 'son 30 gün həcminin';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Artıq yük həftələri >${threshold}s qırmızı işarələnir — son tarixi dəyiş və ya həcmi azalt.';
  }

  @override
  String get statsOverview => 'İcmal';

  @override
  String get statsPaceCovers =>
      'Keçmiş temp lazım olanı ödəyir. Ardıcıl olmağa davam et.';

  @override
  String statsPaceShort(String gap) {
    return 'Keçmiş temp $gap s/gün azdır — blok əlavə et və ya həcmi azalt.';
  }

  @override
  String get statsPastVsNeeded => 'Keçmiş və lazım olan';

  @override
  String statsPeakPerWeek(String peak) {
    return 'pik ${peak}s/həftə';
  }

  @override
  String get statsPerCourse => 'Hər fənn üzrə';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done s / $required s · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sessiyalar';

  @override
  String statsSuggestedOrder(String order) {
    return 'Tövsiyə olunan sıra: $order (əvvəlcə ən yaxın son tarix)';
  }

  @override
  String get statsTotal => 'Cəmi';

  @override
  String get statsTotalVolume => 'ümumi həcm';

  @override
  String get statusAhead => 'İrəlidə';

  @override
  String get statusBehind => 'Geridə';

  @override
  String get statusCompleted => 'Tamamlanıb';

  @override
  String get statusOnTrack => 'Yoldadır';

  @override
  String get statusOverdue => 'Gecikib';

  @override
  String get studyLogDeleteBody =>
      'Bu tədris sessiyası silinsin? Bu geri qaytarılmır.';

  @override
  String get studyLogDeleteTitle => 'Sessiya silinsin?';

  @override
  String get studyLogEmptyHint =>
      'Tədris vaxtınızı izləmək üçün sessiya qeydə alın.';

  @override
  String get studyLogEmptyTitle => 'Hələ tədris sessiyası yoxdur';

  @override
  String get studyLogFabLabel => 'Sessiya qeydə al';

  @override
  String get studyLogFabTooltip => 'Sessiya qeydə al';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours s';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Nümunə sessiyanı sil';

  @override
  String get studyLogThisWeek => 'Bu həftə';

  @override
  String get studyLogToday => 'Bu gün';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Fənn $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'F$id';
  }

  @override
  String get validationCourseEctsPositive => 'AKTS sıfırdan böyük olmalıdır';

  @override
  String get validationCourseEctsRequired => 'AKTS kreditlərini daxil edin';

  @override
  String get validationCourseNameRequired => 'Ad tələb olunur';

  @override
  String get validationCourseNameTooLong => 'Ad çox uzundur';

  @override
  String get validationSessionCourseRequired => 'Fənn seçin';

  @override
  String get validationSessionDurationRequired => 'Müddət daxil edin';

  @override
  String get widgetNoProgress => 'Hələ tərəqqi yoxdur';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsLiquidGlass => 'Maye şüşə';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Buzlu şüşə kartlar və panellər. Sönülü klassik tam görünüşü saxlayır.';

  @override
  String get settingsLiquidGlassOn => 'Aktiv';

  @override
  String get settingsLiquidGlassOff => 'Sönülü';

  @override
  String get settingsLiquidGlassUpdated => 'Maye şüşə yeniləndi.';

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
