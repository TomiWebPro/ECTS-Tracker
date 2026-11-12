// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonError => 'Hata';

  @override
  String get commonNone => 'Yok';

  @override
  String get commonSave => 'Kaydet';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Gerekli saat (otomatik): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Son tarihi temizle';

  @override
  String get courseFormClearStartTooltip => 'Başlangıç tarihini temizle';

  @override
  String get courseFormColorLabel => 'Renk';

  @override
  String get courseFormDateNotSet => 'Belirtilmedi';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Son tarih: $date';
  }

  @override
  String get courseFormEctsLabel => 'AKTS kredisi';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value sa/AKTS';
  }

  @override
  String get courseFormNameLabel => 'Ad';

  @override
  String get courseFormNotesLabel => 'Notlar (isteğe bağlı)';

  @override
  String get courseFormSaving => 'Kaydediliyor…';

  @override
  String courseFormStartButton(String date) {
    return 'Başlangıç: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Kapalı: $date tarihine kadar baskı yok; Bugünün temposuna dahil değil.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Açık: süre şu ana kadar bölünür ve Bugünün temposuna dahil edilir.';

  @override
  String get courseFormStartEarlyTitle =>
      'Gelecekteki başlangıca rağmen şimdi başla';

  @override
  String get courseFormTitleAdd => 'Ders ekle';

  @override
  String get courseFormTitleEdit => 'Dersi düzenle';

  @override
  String get coursesAddTooltip => 'Ders ekle';

  @override
  String coursesDeleteBody(String name) {
    return '“$name” dersi ve tüm çalışma oturumları silinsin mi? Bu işlem geri alınamaz.';
  }

  @override
  String get coursesDeleteTitle => 'Ders silinsin mi?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits AKTS';
  }

  @override
  String get coursesEmptyHint =>
      '“Yeni ders” düğmesine dokunarak ilk dersini oluştur.';

  @override
  String get coursesEmptyTitle => 'Henüz ders yok';

  @override
  String get coursesFilterAll => 'Tüm durumlar';

  @override
  String get coursesFilterEmpty => 'Bu filtreyle eşleşen ders yok';

  @override
  String get coursesNewCourse => 'Yeni ders';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily sa/gün gerekli';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily min/day needed';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily sa/gün • $weekly sa/hafta gerekli';
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
    return '$done / $required sa • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Örnek dersi kaldır';

  @override
  String coursesShownCount(String count) {
    return '$count gösteriliyor';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sıralama: $label';
  }

  @override
  String get dashboardAllDone => 'Tümü tamamlandı';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours sa kaydedildi (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count ders';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count ders · $upcoming yaklaşan, bugünün temposunda değil';
  }

  @override
  String get dashboardCoursesTitle => 'Dersler';

  @override
  String dashboardDeadline(String date) {
    return 'Son tarih $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Son tarih $date ($days gün kaldı)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Son tarih $date (1 gün kaldı)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Son tarih $date (gecikmiş)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Son tarih $date (bugün)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Bugün vadesi var — $hours sa kaydedildi';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Tüm dersler tamamlandı — tam liste için Dersler sekmesine bak.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'AKTS ilerlemeni takip etmeye başlamak için ders ekle.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Geride = $achieved/gün yapıyorsun, $need/gün gerekli';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Geride = $achieved/gün yapıyorsun, $need/gün gerekli · erken başlangıç';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Geride: kalan saatlerle bugünkü son tarihe ulaşan sonlu bir tempo yok';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Yolunda: henüz tempo yok — onaylamak için ilk oturumu kaydet';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days gün içinde başlıyor · $date tarihinden sayılır';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days gün içinde başlıyor · $date tarihinden sayılır · erken başlangıç açık';
  }

  @override
  String get dashboardFreshStart => 'YENİ BAŞLANGIÇ';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· %$pct · ${hours}sa kaldı';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required sa';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours sa/gün';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes min/d';
  }

  @override
  String get dashboardLogSessionAction => 'Çalışma oturumu kaydet';

  @override
  String get dashboardLogSessionTooltip => 'Çalışma oturumu kaydet';

  @override
  String get dashboardNewBadge => 'YENİ';

  @override
  String get dashboardNoCourses => 'Henüz ders yok';

  @override
  String get dashboardNoDeadline => 'Son tarih yok';

  @override
  String get dashboardNoDeadlines => 'Planlanmış son tarih yok';

  @override
  String get dashboardNoPaceDue => 'Bugün vadesi gelen tempo yok';

  @override
  String get dashboardNothingDue => 'Vadesi gelen yok';

  @override
  String get dashboardNothingToTrack => 'Henüz takip edilecek bir şey yok';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Bugün vadesi var — ${hours}sa kaldı';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Bitirmek için günde $daily sa gerekli';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Need $daily min/day to finish';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Bitirmek için günde $daily sa · haftada $weekly sa gerekli';
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
    return '$date tarihinden itibaren günde $hours sa gerekli · Bugünün temposunda değil';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Need $minutes min/day from $date · not in Today’s pace';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Son tarih yok — ${hours}sa kaldı · günlük baskı yok';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date tarihinde başlıyor · yapılacak ${hours}sa';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · gerçekçi değil';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Takibe başlamak için ders ekle';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required sa';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM %$pct';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days günlük süre kaldı';
  }

  @override
  String get dashboardStartNotSet => 'Belirtilmedi';

  @override
  String dashboardStartsIn(String days) {
    return '$days gün içinde başlıyor';
  }

  @override
  String get dashboardStartsSoon => 'Yakında başlıyor';

  @override
  String get dashboardTipEmpty =>
      'İlk dersini ekle — günlük tempon ve ilerlemen burada görünecek.';

  @override
  String get dashboardTipFirst =>
      'İlk 25 dakika en önemlisi — önce vadesi gelen dersi seç.';

  @override
  String get dashboardTodayBare => 'BUGÜN';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace sa';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'BUGÜN %$pct';
  }

  @override
  String get dashboardTodayPaceLabel => 'BUGÜNÜN TEMPOSU';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Bugün $logged / $pace sa';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Gelecekteki başlangıçlar — bugün baskı yok, Bugünün temposuna dahil değil.';

  @override
  String get dashboardUpcomingTitle => 'Yaklaşan';

  @override
  String get devToolsActivate => 'Etkinleştir';

  @override
  String get devToolsActivateMessage =>
      'Bu, gizli stres testi araçlarının kilidini açar (üretilmiş veri yükler). Yalnızca geliştirme içindir.';

  @override
  String get devToolsActivateTitle => 'Geliştirici modu etkinleştirilsin mi?';

  @override
  String get devToolsActivated => 'Geliştirici modu etkinleştirildi.';

  @override
  String get devToolsClearPumped => 'Yüklenen veriyi temizle';

  @override
  String get devToolsClearPumpedMessage =>
      'Üretilen STRES derslerini ve oturumlarını siler. Kendi verilerin korunur.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Üretilen STRES derslerini ve oturumlarını sil.';

  @override
  String get devToolsClearPumpedTitle => 'Yüklenen veri temizlensin mi?';

  @override
  String devToolsCleared(String count) {
    return '$count yüklenmiş ders temizlendi.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'İkinci onay: bu işlem dersleri, listeleri, grafikleri ve tempo hesaplarını şişirir ve birkaç saniye sürebilir. Şimdi yüklensin mi?';

  @override
  String get devToolsConfirmPumpTitle => 'Stres yüklemesini onayla';

  @override
  String get devToolsContinue => 'Devam et';

  @override
  String get devToolsExit => 'Geliştirici modundan çık';

  @override
  String get devToolsExitSubtitle => 'Bu cihazda geliştirici araçlarını gizle.';

  @override
  String get devToolsPumpData => 'Veri yükle';

  @override
  String get devToolsPumpMessage =>
      'Bu, gerçekçi üretilmiş bir dönem ekler (~10 ders, son 12 haftada ~800 oturum). Mevcut verilerin korunur. Devam edilsin mi?';

  @override
  String get devToolsPumpSubtitle =>
      'Üretilmiş bir dönem ekle (~10 ders, ~800 oturum, 12 hafta). Mevcut veri korunur.';

  @override
  String get devToolsPumpTile => 'Test verisi yükle';

  @override
  String get devToolsPumpTitle => 'Test verisi yüklensin mi?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses ders, $sessions oturum yüklendi.';
  }

  @override
  String get devToolsPumping => 'Test verisi yükleniyor…';

  @override
  String get devToolsRemoveAll => 'Tüm veriyi kaldır';

  @override
  String get devToolsRemoveAllMessage =>
      'Geliştirici kısayolu: bu işlem TÜM dersleri, oturumları ve ayarları kalıcı olarak siler. Bu işlem geri alınamaz.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Geliştirici kısayolu: TÜM dersleri, oturumları ve ayarları sil.';

  @override
  String get devToolsRemoveAllTitle => 'Tüm veri kaldırılsın mı?';

  @override
  String get navCourses => 'Dersler';

  @override
  String get navDashboard => 'Panel';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get navStatistics => 'İstatistikler';

  @override
  String get navStudyLog => 'Çalışma Günlüğü';

  @override
  String get sampleBadge => 'Örnek';

  @override
  String get sessionFormCourseLabel => 'Ders';

  @override
  String sessionFormDateButton(String date) {
    return 'Tarih: $date';
  }

  @override
  String get sessionFormDurationError => 'Süre sıfırdan büyük olmalıdır.';

  @override
  String get sessionFormHoursLabel => 'Saat';

  @override
  String get sessionFormLogAction => 'Oturumu kaydet';

  @override
  String get sessionFormMinutesLabel => 'Dakika';

  @override
  String get sessionFormNoCourseError => 'Bir ders seç.';

  @override
  String get sessionFormNoCoursesHint =>
      'Oturum kaydetmek için önce ders ekle.';

  @override
  String get sessionFormNotesLabel => 'Notlar (isteğe bağlı)';

  @override
  String get sessionFormSaving => 'Kaydediliyor…';

  @override
  String get sessionFormTitleAdd => 'Çalışma oturumu kaydet';

  @override
  String get sessionFormTitleEdit => 'Çalışma oturumunu düzenle';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Toplam: $hours sa';
  }

  @override
  String get settingsAccent => 'Tema rengi';

  @override
  String get settingsAccentBerry => 'Böğürtlen';

  @override
  String get settingsAccentClay => 'Kil';

  @override
  String get settingsAccentForest => 'Orman';

  @override
  String get settingsAccentSlate => 'Arduvaz';

  @override
  String get settingsAccentTeal => 'Camgöbeği';

  @override
  String get settingsAccentUpdated => 'Tema rengi güncellendi.';

  @override
  String get settingsAllDataDeleted => 'Tüm veriler silindi.';

  @override
  String get settingsAppearance => 'Görünüm (koyu / açık)';

  @override
  String get settingsCheckingSample => 'Örnek veri denetleniyor…';

  @override
  String get settingsClear => 'Temizle';

  @override
  String get settingsClearSample => 'Örnek veriyi temizle';

  @override
  String get settingsClearSampleMessage =>
      'Bu işlem örnek dersleri ve oturumları kaldırır. Kendi eklediğin dersler veya oturumlar kaldırılmaz.';

  @override
  String get settingsClearSampleSubtitle =>
      'Hazır örnek dersleri ve oturumları kaldır. Kendi verilerin korunur.';

  @override
  String get settingsClearSampleTitle => 'Örnek veri temizlensin mi?';

  @override
  String get settingsCopy => 'Kopyala';

  @override
  String get settingsDailyError => '0 veya pozitif bir dakika sayısı gir.';

  @override
  String get settingsDailyLabel => 'Günde dakika (0 = hedef yok)';

  @override
  String get settingsDailyTarget => 'Günlük çalışma hedefi';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes dk/gün';
  }

  @override
  String get settingsDailyUpdated => 'Günlük hedef güncellendi.';

  @override
  String get settingsData => 'Veri';

  @override
  String get settingsDeleteEverything => 'Her şeyi sil';

  @override
  String get settingsDevMode => 'Geliştirici modu';

  @override
  String get settingsDisplay => 'Ekran';

  @override
  String get settingsDisplayComfortable => 'Rahat';

  @override
  String get settingsDisplayCompact => 'Sıkı';

  @override
  String get settingsDisplayLarge => 'Büyük';

  @override
  String get settingsDisplaySize => 'Metin ve öğe boyutu';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label (%$percent)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Ekran boyutu güncellendi.';

  @override
  String get settingsExport => 'Veriyi dışa aktar';

  @override
  String get settingsExportCopied => 'Dışa aktarım panoya kopyalandı.';

  @override
  String get settingsExportSubtitle =>
      'Tüm dersleri, oturumları ve ayarları JSON olarak kopyala.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses ders · $sessions oturum · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (kısaltıldı — tam yedek $kb KB, tamamı için Kopyala seçeneğini kullan)';
  }

  @override
  String get settingsFirstWeekday => 'Haftanın ilk günü';

  @override
  String get settingsFirstWeekdayUpdated => 'Haftanın ilk günü güncellendi.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label ($seconds sn basılı tut)';
  }

  @override
  String get settingsHoldToReplace => 'Her şeyi değiştirmek için basılı tut';

  @override
  String get settingsHoursError => 'Sıfırdan büyük bir sayı gir.';

  @override
  String get settingsHoursHelper =>
      'Varsayılan 30. Değişiklik gereksinimleri yeniden hesaplar; kayıtlar korunur.';

  @override
  String get settingsHoursLabel => 'AKTS kredisi başına saat';

  @override
  String get settingsHoursPerEcts => 'AKTS başına saat';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value sa';
  }

  @override
  String get settingsHoursUpdated => 'AKTS başına saat güncellendi.';

  @override
  String get settingsImport => 'Veriyi içe aktar';

  @override
  String get settingsImportAppend => 'Ekle';

  @override
  String get settingsImportAppendAction => 'İçe aktar (ekle)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Veri eklendi: $courses ders, $sessions oturum eklendi.';
  }

  @override
  String get settingsImportInfo =>
      'Ekleme, yedeği mevcut verinin yanına ekler (ayarlar korunur). Değiştirme önce TÜM dersleri, oturumları ve ayarları siler.';

  @override
  String get settingsImportLabel => 'Dışa aktarılan JSON\'u yapıştır';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses ders · $sessions oturum';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· dışa aktarım $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· şema v$schema';
  }

  @override
  String get settingsImportReplace => 'Değiştir';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Değiştirme önce her şeyi siler. Onaylamak için aşağıdaki düğmeye $seconds saniye BASILI TUT.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Veri değiştirildi: $courses ders, $sessions oturum geri yüklendi.';
  }

  @override
  String get settingsImportSubtitle =>
      'Önceden dışa aktarılmış bir JSON yedeğinden tüm veriyi değiştir.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Basılı tutmaya devam et… $remaining sn';
  }

  @override
  String get settingsNoSample => 'Örnek veri yok';

  @override
  String get settingsNoSampleSubtitle => 'Hazır örnek veri zaten temizlendi.';

  @override
  String get settingsNoTarget => 'Hedef belirlenmedi';

  @override
  String get settingsOverloadError => '5–100 arası bir sayı gir (sa/hafta).';

  @override
  String get settingsOverloadHelper =>
      'Bu değerin üzerindeki gelecek yük haftaları kırmızı işaretlenir. Tam zamanlı çalışma ~35–40 sa/haftadır.';

  @override
  String settingsOverloadHours(String value) {
    return '$value sa';
  }

  @override
  String get settingsOverloadLabel => 'Haftada saat (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/hafta kırmızıyla işaretlenir';
  }

  @override
  String get settingsOverloadThreshold => 'Haftalık aşırı yük eşiği';

  @override
  String get settingsOverloadUpdated => 'Aşırı yük eşiği güncellendi.';

  @override
  String get settingsPaceTolerance => 'İleri / geri toleransı';

  @override
  String get settingsPasteValidBackup => 'Önce geçerli bir yedek yapıştır';

  @override
  String get settingsReset => 'Sıfırla';

  @override
  String get settingsResetAll => 'Tüm veriyi sıfırla';

  @override
  String get settingsResetAllMessage =>
      'Bu işlem TÜM dersleri, oturumları ve ayarları kalıcı olarak siler. Bu işlem geri alınamaz. Gerekirse önce yedek dışa aktar.';

  @override
  String get settingsResetAllSubtitle =>
      'Tüm dersleri, oturumları ve ayarları sil.';

  @override
  String get settingsResetAllTitle => 'Tüm veri sıfırlansın mı?';

  @override
  String get settingsResetSettings => 'Ayarları sıfırla';

  @override
  String get settingsResetSettingsDone => 'Ayarlar varsayılanlara döndürüldü.';

  @override
  String get settingsResetSettingsMessage =>
      'AKTS başına saat (30), günlük hedef (yok), haftanın ilk günü (Pazartesi), tema (sistem), tolerans (5 gün), aşırı yük (35 sa/hafta), boyut (rahat), renk (arduvaz) geri yüklenir. Dersler ve oturumlar korunur.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Varsayılanları geri yükle: 30 sa/AKTS, hedef yok, Pazartesi, sistem teması, 5 gün tolerans, 35 sa/hafta aşırı yük, rahat boyut, arduvaz renk.';

  @override
  String get settingsResetSettingsTitle => 'Ayarlar sıfırlansın mı?';

  @override
  String get settingsSampleData => 'Örnek veri';

  @override
  String settingsSampleDataError(String error) {
    return 'Hata: $error';
  }

  @override
  String get settingsStudySettings => 'Çalışma ayarları';

  @override
  String get settingsThemeDark => 'Koyu';

  @override
  String get settingsThemeLight => 'Açık';

  @override
  String get settingsThemeSystem => 'Sistem varsayılanı';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema güncellendi.';

  @override
  String settingsToleranceDays(String value) {
    return '$value gün';
  }

  @override
  String get settingsToleranceError => '0–30 arası bir gün sayısı gir.';

  @override
  String get settingsToleranceHelper =>
      'İleri durum +N gün fazla, geri durum −N gün gerektirir. 5 = dengeli, 0 = hassas.';

  @override
  String get settingsToleranceLabel => 'İş günü (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance iş';
  }

  @override
  String get settingsToleranceUpdated => 'Tolerans güncellendi.';

  @override
  String get settingsWeekdayFriday => 'Cuma';

  @override
  String get settingsWeekdayMonday => 'Pazartesi';

  @override
  String get settingsWeekdaySaturday => 'Cumartesi';

  @override
  String get settingsWeekdaySunday => 'Pazar';

  @override
  String get settingsWeekdayThursday => 'Perşembe';

  @override
  String get settingsWeekdayTuesday => 'Salı';

  @override
  String get settingsWeekdayWednesday => 'Çarşamba';

  @override
  String get sortDeadline => 'Son tarih';

  @override
  String get sortName => 'Ad';

  @override
  String get sortProgress => 'İlerleme';

  @override
  String get sortStatus => 'Durum';

  @override
  String get startupTitle => 'ECTS Tracker başlatılamadı';

  @override
  String get statsActiveDays => 'Aktif günler';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days gün aktif';
  }

  @override
  String get statsAddDeadlines => 'Yükü tahmin etmek için son tarihler ekle.';

  @override
  String get statsComingLoad => 'Gelecek yük';

  @override
  String get statsConsistency => 'Tutarlılık';

  @override
  String get statsConsistencyHint =>
      'Son 30 günde çalışılan günler. Her gün küçük adımlar, sıkıştırmaktan iyidir.';

  @override
  String statsConsistencyScore(String percent) {
    return 'Son 30 günün %$percent\'i';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Ders $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'D$id';
  }

  @override
  String get statsDidPerDay => 'Yapılan / gün (14g)';

  @override
  String get statsEmpty => 'Henüz oturum yok';

  @override
  String get statsGap => 'Fark';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value sa';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}sa';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours sa';
  }

  @override
  String get statsLast30Days => 'Son 30 gün';

  @override
  String get statsLast7Days => 'Son 7 gün';

  @override
  String get statsNeedPerDay => 'Gerekli / gün';

  @override
  String get statsNext8Weeks => 'Gelecek 8 hafta';

  @override
  String get statsOfLast30DaysVolume => 'son 30 günlük hacmin';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Aşırı yük haftaları >${threshold}sa kırmızıyla işaretlenir — bir son tarihi ertele veya kapsamı daralt.';
  }

  @override
  String get statsOverview => 'Genel bakış';

  @override
  String get statsPaceCovers =>
      'Geçmiş tempo ihtiyacı karşılıyor. Seriyi koru.';

  @override
  String statsPaceShort(String gap) {
    return 'Geçmiş tempo günde $gap sa eksik — bir blok ekle veya kapsamı daralt.';
  }

  @override
  String get statsPastVsNeeded => 'Geçmiş ve gerekli';

  @override
  String statsPeakPerWeek(String peak) {
    return 'zirve ${peak}sa/hf';
  }

  @override
  String get statsPerCourse => 'Ders başına';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done sa / $required sa · %$percent';
  }

  @override
  String statsPercentValue(String percent) {
    return '%$percent';
  }

  @override
  String get statsSessions => 'Oturumlar';

  @override
  String statsSuggestedOrder(String order) {
    return 'Önerilen sıra: $order (önce en yakın son tarih)';
  }

  @override
  String get statsTotal => 'Toplam';

  @override
  String get statsTotalVolume => 'toplam hacim';

  @override
  String get statusAhead => 'Önde';

  @override
  String get statusBehind => 'Geride';

  @override
  String get statusCompleted => 'Tamamlandı';

  @override
  String get statusOnTrack => 'Yolunda';

  @override
  String get statusOverdue => 'Gecikmiş';

  @override
  String get studyLogDeleteBody =>
      'Bu çalışma oturumu silinsin mi? Bu işlem geri alınamaz.';

  @override
  String get studyLogDeleteTitle => 'Oturum silinsin mi?';

  @override
  String get studyLogEmptyHint =>
      'Çalışma süreni takip etmek için bir oturum kaydet.';

  @override
  String get studyLogEmptyTitle => 'Henüz çalışma oturumu yok';

  @override
  String get studyLogFabLabel => 'Oturum kaydet';

  @override
  String get studyLogFabTooltip => 'Oturum kaydet';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours sa';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Örnek oturumu kaldır';

  @override
  String get studyLogThisWeek => 'Bu hafta';

  @override
  String get studyLogToday => 'Bugün';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Ders $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'D$id';
  }

  @override
  String get validationCourseEctsPositive => 'AKTS sıfırdan büyük olmalıdır';

  @override
  String get validationCourseEctsRequired => 'AKTS kredisini gir';

  @override
  String get validationCourseNameRequired => 'Ad gerekli';

  @override
  String get validationCourseNameTooLong => 'Ad çok uzun';

  @override
  String get validationSessionCourseRequired => 'Bir ders seç';

  @override
  String get validationSessionDurationRequired => 'Bir süre gir';

  @override
  String get widgetNoProgress => 'Henüz ilerleme yok';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsLiquidGlass => 'Sıvı cam';

  @override
  String get settingsLiquidGlassSubtitle =>
      'Buzlu cam kartlar ve çubuklar. Kapalı klasik düz görünümü korur.';

  @override
  String get settingsLiquidGlassOn => 'Açık';

  @override
  String get settingsLiquidGlassOff => 'Kapalı';

  @override
  String get settingsLiquidGlassUpdated => 'Sıvı cam güncellendi.';

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
