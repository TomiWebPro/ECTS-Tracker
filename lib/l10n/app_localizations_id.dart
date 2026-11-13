// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonClose => 'Tutup';

  @override
  String get commonDelete => 'Hapus';

  @override
  String get commonEdit => 'Ubah';

  @override
  String get commonError => 'Kesalahan';

  @override
  String get commonNone => 'Tidak ada';

  @override
  String get commonSave => 'Simpan';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Jam yang dibutuhkan (otomatis): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Hapus tenggat';

  @override
  String get courseFormClearStartTooltip => 'Hapus tanggal mulai';

  @override
  String get courseFormColorLabel => 'Warna';

  @override
  String get courseFormDateNotSet => 'Belum ditentukan';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Tenggat: $date';
  }

  @override
  String get courseFormEctsLabel => 'Kredit ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value jam/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Nama';

  @override
  String get courseFormNotesLabel => 'Catatan (opsional)';

  @override
  String get courseFormSaving => 'Menyimpan…';

  @override
  String courseFormStartButton(String date) {
    return 'Mulai: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Mati: tanpa tekanan hingga $date; dikecualikan dari kecepatan Hari Ini.';
  }

  @override
  String get courseFormStartEarlyOn => 'Aktif: waktu dibagi hingga saat ini dan dihitung dalam kecepatan Hari Ini.';

  @override
  String get courseFormStartEarlyTitle => 'Mulai sekarang walau tanggal mulai di masa depan';

  @override
  String get courseFormTitleAdd => 'Tambah kursus';

  @override
  String get courseFormTitleEdit => 'Edit kursus';

  @override
  String get coursesAddTooltip => 'Tambah kursus';

  @override
  String coursesDeleteBody(String name) {
    return 'Hapus \"$name\" beserta semua sesi belajarnya? Tindakan ini tidak dapat dibatalkan.';
  }

  @override
  String get coursesDeleteTitle => 'Hapus kursus?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Ketuk “Kursus baru” untuk membuat kursus pertama Anda.';

  @override
  String get coursesEmptyTitle => 'Belum ada kursus';

  @override
  String get coursesFilterAll => 'Semua status';

  @override
  String get coursesFilterEmpty => 'Tidak ada kursus yang cocok dengan filter ini';

  @override
  String get coursesNewCourse => 'Kursus baru';

  @override
  String coursesPaceNeeded(String daily) {
    return 'perlu $daily jam/hari';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return 'perlu $daily mnt/hari';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'perlu $daily jam/hari • $weekly jam/minggu';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return 'perlu $daily mnt/hari • $weekly mnt/minggu';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return 'perlu $daily mnt/hari • $weekly jam/minggu';
  }

  @override
  String coursesProgressWithStatus(String done, String required, String status) {
    return '$done / $required jam • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Hapus kursus contoh';

  @override
  String coursesShownCount(String count) {
    return '$count ditampilkan';
  }

  @override
  String coursesSortOption(String label) {
    return 'Urutkan: $label';
  }

  @override
  String get dashboardAllDone => 'Semua selesai';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours jam tercatat (bonus)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count kursus';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count kursus · $upcoming mendatang tidak masuk kecepatan hari ini';
  }

  @override
  String get dashboardCoursesTitle => 'Kursus';

  @override
  String dashboardDeadline(String date) {
    return 'Tenggat $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Tenggat $date ($days hari lagi)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Tenggat $date (1 hari lagi)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Tenggat $date (terlambat)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Tenggat $date (hari ini)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Untuk hari ini — $hours jam tercatat';
  }

  @override
  String get dashboardEmptyHintAllDone => 'Semua kursus selesai — lihat tab Kursus untuk daftar lengkap.';

  @override
  String get dashboardEmptyHintNoCourses => 'Tambahkan kursus untuk mulai melacak progres ECTS Anda.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Tertinggal = mengerjakan $achieved/h, butuh $need/h';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Tertinggal = mengerjakan $achieved/h, butuh $need/h · mulai awal';
  }

  @override
  String get dashboardExplainerBehindNoPace => 'Tertinggal: tidak ada kecepatan terbatas yang bisa mengejar tenggat hari ini dengan sisa jam yang ada';

  @override
  String get dashboardExplainerOnTrackNoPace => 'Sesuai jalur: belum ada kecepatan — catat sesi pertama untuk memastikan';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Mulai dalam $days h · dihitung dari $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Mulai dalam $days h · dihitung dari $date · mulai awal aktif';
  }

  @override
  String get dashboardFreshStart => 'MULAI BARU';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · sisa $hours jam';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required jam';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours jam/hari';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes mnt/hari';
  }

  @override
  String get dashboardLogSessionAction => 'Catat sesi belajar';

  @override
  String get dashboardLogSessionTooltip => 'Catat sesi belajar';

  @override
  String get dashboardNewBadge => 'BARU';

  @override
  String get dashboardNoCourses => 'Belum ada kursus';

  @override
  String get dashboardNoDeadline => 'Tanpa tenggat';

  @override
  String get dashboardNoDeadlines => 'Belum ada tenggat terjadwal';

  @override
  String get dashboardNoPaceDue => 'Tidak ada kecepatan untuk hari ini';

  @override
  String get dashboardNothingDue => 'Tidak ada yang harus dikerjakan';

  @override
  String get dashboardNothingToTrack => 'Belum ada yang dilacak';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Untuk hari ini — sisa $hours jam';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Butuh $daily jam/hari untuk selesai';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return 'Butuh $daily mnt/hari untuk selesai';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Butuh $daily jam/hari · $weekly jam/minggu untuk selesai';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return 'Butuh $daily mnt/hari · $weekly mnt/minggu untuk selesai';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return 'Butuh $daily mnt/hari · $weekly jam/minggu untuk selesai';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Butuh $hours jam/hari mulai $date · tidak masuk kecepatan Hari Ini';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return 'Butuh $minutes mnt/hari mulai $date · tidak masuk kecepatan Hari Ini';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Tanpa tenggat — sisa $hours jam · tanpa tekanan harian';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Mulai $date · $hours jam harus dikerjakan';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · tidak realistis';
  }

  @override
  String get dashboardProgramBare => 'PROGRAM';

  @override
  String get dashboardProgramEmptyHint => 'Tambahkan kursus untuk mulai melacak';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required jam';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'PROGRAM $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days hari tersisa';
  }

  @override
  String get dashboardStartNotSet => 'Belum ditentukan';

  @override
  String dashboardStartsIn(String days) {
    return 'Mulai dalam ${days}h';
  }

  @override
  String get dashboardStartsSoon => 'Segera mulai';

  @override
  String get dashboardTipEmpty => 'Tambahkan kursus pertama Anda — kecepatan harian dan progres akan muncul di sini.';

  @override
  String get dashboardTipFirst => '25 menit pertama paling berarti — pilih kursus dengan tenggat terdekat.';

  @override
  String get dashboardTodayBare => 'HARI INI';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace jam';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'HARI INI $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'KECEPATAN HARI INI';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '$logged / $pace jam hari ini';
  }

  @override
  String get dashboardUpcomingSubtitle => 'Mulai di masa depan — tanpa tekanan hari ini, dikecualikan dari kecepatan Hari Ini.';

  @override
  String get dashboardUpcomingTitle => 'Mendatang';

  @override
  String get devToolsActivate => 'Aktifkan';

  @override
  String get devToolsActivateMessage => 'Ini membuka alat uji stres tersembunyi (menghasilkan data). Hanya untuk pengembangan.';

  @override
  String get devToolsActivateTitle => 'Aktifkan mode dev?';

  @override
  String get devToolsActivated => 'Mode dev diaktifkan.';

  @override
  String get devToolsClearPumped => 'Hapus data hasil generate';

  @override
  String get devToolsClearPumpedMessage => 'Menghapus kursus STRESS yang dihasilkan beserta sesinya. Data Anda tetap disimpan.';

  @override
  String get devToolsClearPumpedSubtitle => 'Hapus kursus STRESS dan sesi yang dihasilkan.';

  @override
  String get devToolsClearPumpedTitle => 'Hapus data hasil generate?';

  @override
  String devToolsCleared(String count) {
    return '$count kursus hasil generate dihapus.';
  }

  @override
  String get devToolsConfirmPumpMessage => 'Konfirmasi kedua: ini akan memperbanyak kursus, daftar, grafik, dan perhitungan kecepatan, dan mungkin butuh beberapa detik. Buat sekarang?';

  @override
  String get devToolsConfirmPumpTitle => 'Konfirmasi uji stres';

  @override
  String get devToolsContinue => 'Lanjutkan';

  @override
  String get devToolsExit => 'Keluar dari mode dev';

  @override
  String get devToolsExitSubtitle => 'Sembunyikan alat dev di perangkat ini.';

  @override
  String get devToolsPumpData => 'Buat data';

  @override
  String get devToolsPumpMessage => 'Ini menyisipkan satu semester buatan yang realistis (~10 kursus, ~800 sesi selama 12 minggu terakhir). Data Anda tetap disimpan. Lanjutkan?';

  @override
  String get devToolsPumpSubtitle => 'Sisipkan satu semester buatan (~10 kursus, ~800 sesi, 12 minggu). Data yang ada tetap disimpan.';

  @override
  String get devToolsPumpTile => 'Buat data uji';

  @override
  String get devToolsPumpTitle => 'Buat data uji?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Dibuat $courses kursus, $sessions sesi.';
  }

  @override
  String get devToolsPumping => 'Membuat data uji…';

  @override
  String get devToolsRemoveAll => 'Hapus semua data';

  @override
  String get devToolsRemoveAllMessage => 'Pintasan dev: menghapus permanen SEMUA kursus, sesi, dan pengaturan. Tidak dapat dibatalkan.';

  @override
  String get devToolsRemoveAllSubtitle => 'Pintasan dev: hapus SEMUA kursus, sesi, dan pengaturan.';

  @override
  String get devToolsRemoveAllTitle => 'Hapus semua data?';

  @override
  String get navCourses => 'Kursus';

  @override
  String get navDashboard => 'Dasbor';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String get navStatistics => 'Statistik';

  @override
  String get navStudyLog => 'Log Belajar';

  @override
  String get sampleBadge => 'Contoh';

  @override
  String get sessionFormCourseLabel => 'Kursus';

  @override
  String sessionFormDateButton(String date) {
    return 'Tanggal: $date';
  }

  @override
  String get sessionFormDurationError => 'Durasi harus lebih dari nol.';

  @override
  String get sessionFormHoursLabel => 'Jam';

  @override
  String get sessionFormLogAction => 'Catat sesi';

  @override
  String get sessionFormMinutesLabel => 'Menit';

  @override
  String get sessionFormNoCourseError => 'Pilih kursus.';

  @override
  String get sessionFormNoCoursesHint => 'Tambahkan kursus dulu untuk mencatat sesi.';

  @override
  String get sessionFormNotesLabel => 'Catatan (opsional)';

  @override
  String get sessionFormSaving => 'Menyimpan…';

  @override
  String get sessionFormTitleAdd => 'Catat sesi belajar';

  @override
  String get sessionFormTitleEdit => 'Edit sesi belajar';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Total: $hours jam';
  }

  @override
  String get settingsAccent => 'Warna tema';

  @override
  String get settingsAccentBerry => 'Beri';

  @override
  String get settingsAccentClay => 'Tanah liat';

  @override
  String get settingsAccentForest => 'Hutan';

  @override
  String get settingsAccentSlate => 'Batu tulis';

  @override
  String get settingsAccentTeal => 'Biru kehijauan';

  @override
  String get settingsAccentUpdated => 'Warna tema diperbarui.';

  @override
  String get settingsAllDataDeleted => 'Semua data dihapus.';

  @override
  String get settingsAppearance => 'Tampilan (gelap / terang)';

  @override
  String get settingsCheckingSample => 'Memeriksa data contoh…';

  @override
  String get settingsClear => 'Hapus';

  @override
  String get settingsClearSample => 'Hapus data contoh';

  @override
  String get settingsClearSampleMessage => 'Ini menghapus kursus dan sesi contoh. Kursus atau sesi yang Anda tambahkan tidak dihapus.';

  @override
  String get settingsClearSampleSubtitle => 'Hapus kursus dan sesi contoh bawaan. Data Anda tetap disimpan.';

  @override
  String get settingsClearSampleTitle => 'Hapus data contoh?';

  @override
  String get settingsCopy => 'Salin';

  @override
  String get settingsDailyError => 'Masukkan 0 atau jumlah menit positif.';

  @override
  String get settingsDailyLabel => 'Menit per hari (0 = tanpa target)';

  @override
  String get settingsDailyTarget => 'Target belajar harian';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes mnt/hari';
  }

  @override
  String get settingsDailyUpdated => 'Target harian diperbarui.';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDeleteEverything => 'Hapus semuanya';

  @override
  String get settingsDevMode => 'Mode dev';

  @override
  String get settingsDisplay => 'Layar';

  @override
  String get settingsDisplayComfortable => 'Nyaman';

  @override
  String get settingsDisplayCompact => 'Ringkas';

  @override
  String get settingsDisplayLarge => 'Besar';

  @override
  String get settingsDisplaySize => 'Ukuran teks & elemen';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Ukuran tampilan diperbarui.';

  @override
  String get settingsExport => 'Ekspor data';

  @override
  String get settingsExportCopied => 'Ekspor disalin ke papan klip.';

  @override
  String get settingsExportSubtitle => 'Salin semua kursus, sesi, dan pengaturan sebagai JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses kursus · $sessions sesi · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (dipotong — cadangan lengkap $kb KB, gunakan Salin untuk semuanya)';
  }

  @override
  String get settingsFirstWeekday => 'Hari pertama minggu';

  @override
  String get settingsFirstWeekdayUpdated => 'Hari pertama minggu diperbarui.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (tahan $seconds dtk)';
  }

  @override
  String get settingsHoldToReplace => 'Tahan untuk mengganti semuanya';

  @override
  String get settingsHoursError => 'Masukkan angka lebih dari nol.';

  @override
  String get settingsHoursHelper => 'Default 30. Perubahan menghitung ulang kebutuhan; catatan tetap disimpan.';

  @override
  String get settingsHoursLabel => 'Jam per SKS ECTS';

  @override
  String get settingsHoursPerEcts => 'Jam per ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value jam';
  }

  @override
  String get settingsHoursUpdated => 'Jam per ECTS diperbarui.';

  @override
  String get settingsImport => 'Impor data';

  @override
  String get settingsImportAppend => 'Tambahkan';

  @override
  String get settingsImportAppendAction => 'Impor (tambahkan)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Data ditambahkan: $courses kursus, $sessions sesi ditambahkan.';
  }

  @override
  String get settingsImportInfo => 'Penambahan menaruh cadangan berdampingan dengan data saat ini (pengaturan tetap). Penggantian menghapus SEMUA kursus, sesi, dan pengaturan terlebih dahulu.';

  @override
  String get settingsImportLabel => 'Tempel JSON hasil ekspor';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses kursus · $sessions sesi';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '· diekspor $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '· skema v$schema';
  }

  @override
  String get settingsImportReplace => 'Ganti';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Penggantian menghapus semuanya terlebih dahulu. Tekan dan TAHAN tombol di bawah selama $seconds detik untuk mengonfirmasi.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Data diganti: $courses kursus, $sessions sesi dipulihkan.';
  }

  @override
  String get settingsImportSubtitle => 'Ganti semua data dari cadangan JSON yang pernah diekspor.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Terus tahan… $remaining dtk';
  }

  @override
  String get settingsNoSample => 'Tidak ada data contoh';

  @override
  String get settingsNoSampleSubtitle => 'Data contoh bawaan sudah dihapus.';

  @override
  String get settingsNoTarget => 'Belum ada target';

  @override
  String get settingsOverloadError => 'Masukkan angka 5–100 jam/minggu.';

  @override
  String get settingsOverloadHelper => 'Minggu-minggu padat di atas ini ditandai merah. Studi penuh waktu ~35–40 jam/minggu.';

  @override
  String settingsOverloadHours(String value) {
    return '$value jam';
  }

  @override
  String get settingsOverloadLabel => 'Jam per minggu (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/minggu ditandai merah';
  }

  @override
  String get settingsOverloadThreshold => 'Batas beban mingguan';

  @override
  String get settingsOverloadUpdated => 'Batas beban diperbarui.';

  @override
  String get settingsPaceTolerance => 'Toleransi maju / tertinggal';

  @override
  String get settingsPasteValidBackup => 'Tempel cadangan yang valid dulu';

  @override
  String get settingsReset => 'Atur ulang';

  @override
  String get settingsResetAll => 'Atur ulang semua data';

  @override
  String get settingsResetAllMessage => 'Ini menghapus permanen SEMUA kursus, sesi, dan pengaturan. Tidak dapat dibatalkan. Ekspor cadangan dulu jika perlu.';

  @override
  String get settingsResetAllSubtitle => 'Hapus semua kursus, sesi, dan pengaturan.';

  @override
  String get settingsResetAllTitle => 'Atur ulang semua data?';

  @override
  String get settingsResetSettings => 'Atur ulang pengaturan';

  @override
  String get settingsResetSettingsDone => 'Pengaturan dikembalikan ke default.';

  @override
  String get settingsResetSettingsMessage => 'Mengembalikan jam-per-ECTS (30), target harian (tidak ada), hari pertama minggu (Senin), tema (sistem), toleransi (5 hari), beban berlebih (35 jam/minggu), ukuran (nyaman), warna (batu tulis).';

  @override
  String get settingsResetSettingsSubtitle => 'Kembalikan default: 30 jam/ECTS, tanpa target, Senin, tema sistem, toleransi 5 hari, beban berlebih 35 jam/minggu, ukuran nyaman, warna batu tulis.';

  @override
  String get settingsResetSettingsTitle => 'Atur ulang pengaturan?';

  @override
  String get settingsSampleData => 'Data contoh';

  @override
  String settingsSampleDataError(String error) {
    return 'Kesalahan: $error';
  }

  @override
  String get settingsStudySettings => 'Pengaturan belajar';

  @override
  String get settingsThemeDark => 'Gelap';

  @override
  String get settingsThemeLight => 'Terang';

  @override
  String get settingsThemeSystem => 'Default sistem';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeUpdated => 'Tema diperbarui.';

  @override
  String settingsToleranceDays(String value) {
    return '$value hari';
  }

  @override
  String get settingsToleranceError => 'Masukkan angka 0–30 hari.';

  @override
  String get settingsToleranceHelper => 'Maju butuh surplus +N hari, tertinggal −N hari. 5 = stabil, 0 = sensitif.';

  @override
  String get settingsToleranceLabel => 'Hari kerja (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance kerja';
  }

  @override
  String get settingsToleranceUpdated => 'Toleransi diperbarui.';

  @override
  String get settingsWeekdayFriday => 'Jumat';

  @override
  String get settingsWeekdayMonday => 'Senin';

  @override
  String get settingsWeekdaySaturday => 'Sabtu';

  @override
  String get settingsWeekdaySunday => 'Minggu';

  @override
  String get settingsWeekdayThursday => 'Kamis';

  @override
  String get settingsWeekdayTuesday => 'Selasa';

  @override
  String get settingsWeekdayWednesday => 'Rabu';

  @override
  String get sortDeadline => 'Tenggat';

  @override
  String get sortName => 'Nama';

  @override
  String get sortProgress => 'Progres';

  @override
  String get sortStatus => 'Status';

  @override
  String get startupTitle => 'Tidak dapat memulai ECTS Tracker';

  @override
  String get statsActiveDays => 'Hari aktif';

  @override
  String statsActiveDaysBadge(int days) {
    return '${days}h aktif';
  }

  @override
  String get statsAddDeadlines => 'Tambahkan tenggat untuk memprakirakan beban.';

  @override
  String get statsComingLoad => 'Beban mendatang';

  @override
  String get statsConsistency => 'Konsistensi';

  @override
  String get statsConsistencyHint => 'Hari belajar dalam 30 hari terakhir. Langkah kecil setiap hari mengalahkan kebut semalam.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% dari 30 hari terakhir';
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
  String get statsDidPerDay => 'Dikerjakan / hari (14h)';

  @override
  String get statsEmpty => 'Belum ada sesi';

  @override
  String get statsGap => 'Selisih';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value jam';
  }

  @override
  String statsHoursCompact(String hours) {
    return '${hours}jam';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours jam';
  }

  @override
  String get statsLast30Days => '30 hari terakhir';

  @override
  String get statsLast7Days => '7 hari terakhir';

  @override
  String get statsNeedPerDay => 'Butuh / hari';

  @override
  String get statsNext8Weeks => '8 minggu ke depan';

  @override
  String get statsOfLast30DaysVolume => 'dari volume 30 hari terakhir';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Minggu beban berlebih >$threshold jam ditandai merah — pindahkan tenggat atau kurangi cakupan.';
  }

  @override
  String get statsOverview => 'Ringkasan';

  @override
  String get statsPaceCovers => 'Kecepatan lalu menutupi yang dibutuhkan. Pertahankan rentetan.';

  @override
  String statsPaceShort(String gap) {
    return 'Kecepatan lalu kurang $gap jam/hari — tambah blok atau kurangi cakupan.';
  }

  @override
  String get statsPastVsNeeded => 'Lalu vs dibutuhkan';

  @override
  String statsPeakPerWeek(String peak) {
    return 'puncak $peak jam/mgg';
  }

  @override
  String get statsPerCourse => 'Per kursus';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done jam / $required jam · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Sesi';

  @override
  String statsSuggestedOrder(String order) {
    return 'Urutan disarankan: $order (tenggat terdekat dulu)';
  }

  @override
  String get statsTotal => 'Total';

  @override
  String get statsTotalVolume => 'volume total';

  @override
  String get statusAhead => 'Maju';

  @override
  String get statusBehind => 'Tertinggal';

  @override
  String get statusCompleted => 'Selesai';

  @override
  String get statusOnTrack => 'Sesuai jalur';

  @override
  String get statusOverdue => 'Terlambat';

  @override
  String get studyLogDeleteBody => 'Hapus sesi belajar ini? Tidak dapat dibatalkan.';

  @override
  String get studyLogDeleteTitle => 'Hapus sesi?';

  @override
  String get studyLogEmptyHint => 'Catat sesi untuk melacak waktu belajar Anda.';

  @override
  String get studyLogEmptyTitle => 'Belum ada sesi belajar';

  @override
  String get studyLogFabLabel => 'Catat sesi';

  @override
  String get studyLogFabTooltip => 'Catat sesi';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours jam';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Hapus sesi contoh';

  @override
  String get studyLogThisWeek => 'Minggu ini';

  @override
  String get studyLogToday => 'Hari ini';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Kursus $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'K$id';
  }

  @override
  String studyTimerActiveTitle(String course) {
    return 'Timing $course';
  }

  @override
  String get studyTimerAlreadyRunning => 'A timer is already running. Finish or discard it first.';

  @override
  String get studyTimerCourseLabel => 'Course';

  @override
  String get studyTimerDiscard => 'Discard';

  @override
  String get studyTimerDiscardBody => 'Throw away the current timer without logging? This cannot be undone.';

  @override
  String get studyTimerDiscardTitle => 'Discard timer?';

  @override
  String studyTimerFinishLog(String minutes) {
    return 'Finish & log $minutes min';
  }

  @override
  String get studyTimerNoCourseError => 'Select a course.';

  @override
  String get studyTimerNoCoursesHint => 'Add a course first to start a timer.';

  @override
  String get studyTimerPause => 'Pause';

  @override
  String get studyTimerResume => 'Resume';

  @override
  String get studyTimerStart => 'Start timer';

  @override
  String get studyTimerStartTitle => 'Start study timer';

  @override
  String get studyTimerTooShort => 'Timer has not run yet.';

  @override
  String get validationCourseEctsPositive => 'ECTS harus lebih dari nol';

  @override
  String get validationCourseEctsRequired => 'Masukkan kredit ECTS';

  @override
  String get validationCourseNameRequired => 'Nama wajib diisi';

  @override
  String get validationCourseNameTooLong => 'Nama terlalu panjang';

  @override
  String get validationSessionCourseRequired => 'Pilih kursus';

  @override
  String get validationSessionDurationRequired => 'Masukkan durasi';

  @override
  String get widgetNoProgress => 'Belum ada progres';

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get settingsLiquidGlass => 'Kaca cair';

  @override
  String get settingsLiquidGlassSubtitle => 'Kartu dan bilah kaca buram. Mati mempertahankan tampilan solid klasik.';

  @override
  String get settingsLiquidGlassOn => 'Aktif';

  @override
  String get settingsLiquidGlassOff => 'Mati';

  @override
  String get settingsLiquidGlassUpdated => 'Kaca cair diperbarui.';

  @override
  String get devToolsReminderPreview => 'Pratinjau pengingat';

  @override
  String get devToolsReminderPreviewSubtitle => 'Lihat apa yang akan memberitahu saat ini. Umpan uji yang aman di Windows.';

  @override
  String get reminderPreviewTitle => 'Pratinjau pengingat';

  @override
  String get reminderPreviewNow => 'Waktu pratinjau';

  @override
  String get reminderPreviewReset => 'Sekarang';

  @override
  String get reminderPreviewEmpty => 'Semua tenang — tidak ada yang akan memberitahu saat ini.';

  @override
  String get reminderPreviewCustom => 'Jadwal kustom (demo)';

  @override
  String get reminderPreviewNoFire => 'Tidak ada pemicu berikutnya.';

  @override
  String get reminderKindDaily => 'Harian';

  @override
  String get reminderKindBehind => 'Tertinggal';

  @override
  String get reminderKindDeadline => 'Tenggat';

  @override
  String get reminderKindOverdue => 'Terlambat';

  @override
  String get reminderKindStreak => 'Rentetan';

  @override
  String get reminderKindCustom => 'Kustom';

  @override
  String get settingsReminders => 'Pengingat belajar';

  @override
  String get settingsRemindersOff => 'Mati — aktifkan untuk pengingat harian.';

  @override
  String get settingsReminderTime => 'Waktu pengingat';

  @override
  String get settingsReminderDenied => 'Notifikasi diblokir — aktifkan di pengaturan sistem.';

  @override
  String notifDurationHours(String value) {
    return '$value jam';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value mnt';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 Malam ini: $duration agar tetap sesuai jalur';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course: $duration tersisa hari ini';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count lainnya)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. Catat sesi untuk menuntaskan hari ini.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course merosot ke Tertinggal';
  }

  @override
  String notifBehindBodyPace(String left, String days, String pace, String catchUp) {
    return '$left tersisa, $days hari lagi — $pace/hari dari sini. Catat $catchUp untuk kembali Sesuai jalur.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left tersisa, $days hari lagi — $pace/hari dari sini. Hanya menyelesaikan seluruh $left yang menghapus ini — mulai malam ini.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left masih terbuka dan tenggatnya sudah tiba. Semua yang Anda catat sekarang dihitung.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course jatuh tempo besok dan masih ada $left terbuka';
  }

  @override
  String get notifDeadlineTomorrowBody => 'Semua yang Anda catat hari ini dihitung ganda.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ Ujian $course dalam $days hari — $left tersisa';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return 'Itu $pace/hari. Bagi saja: 2 sesi sehari mengalahkan satu maraton.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => 'Setiap jam yang Anda catat sekarang dihitung.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course melewati tenggatnya dengan $left terbuka';
  }

  @override
  String get notifOverdueBody => 'Geser tenggatnya atau selesaikan jamnya — kursus tetap perlu perhatian sampai saat itu.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 Rentetan $days hari — $week minggu ini';
  }

  @override
  String get notifStreakBody => 'Semua kursus Sesuai jalur atau Maju. Rentetan yang bagus.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 Cek belajar: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 Saatnya memperbarui: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left terbuka · $pace/hari agar selesai tepat waktu. Catat sesi untuk memperbarui progres.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left masih terbuka — semua yang Anda catat sekarang dihitung.';
  }

  @override
  String reminderPreviewNext(String time) {
    return 'Berikutnya: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1h';

  @override
  String get reminderPreviewFwdDay => '+1h';

  @override
  String get reminderPreviewFake => '(palsu)';

  @override
  String get reminderPreviewDemoLabel => 'Cek demo';
}
