// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'Hủy';

  @override
  String get commonClose => 'Đóng';

  @override
  String get commonDelete => 'Xóa';

  @override
  String get commonEdit => 'Sửa';

  @override
  String get commonError => 'Lỗi';

  @override
  String get commonNone => 'Không có';

  @override
  String get commonSave => 'Lưu';

  @override
  String courseFormAutoHoursValue(String value) {
    return 'Số giờ cần thiết (tự động): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => 'Xóa hạn chót';

  @override
  String get courseFormClearStartTooltip => 'Xóa ngày bắt đầu';

  @override
  String get courseFormColorLabel => 'Màu sắc';

  @override
  String get courseFormDateNotSet => 'Chưa đặt';

  @override
  String courseFormDeadlineButton(String date) {
    return 'Hạn chót: $date';
  }

  @override
  String get courseFormEctsLabel => 'Tín chỉ ECTS';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value giờ/ECTS';
  }

  @override
  String get courseFormNameLabel => 'Tên';

  @override
  String get courseFormNotesLabel => 'Ghi chú (tùy chọn)';

  @override
  String get courseFormSaving => 'Đang lưu…';

  @override
  String courseFormStartButton(String date) {
    return 'Bắt đầu: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'Tắt: không áp lực đến $date; loại khỏi nhịp Hôm nay.';
  }

  @override
  String get courseFormStartEarlyOn =>
      'Bật: chia thời gian đến nay và tính vào nhịp Hôm nay.';

  @override
  String get courseFormStartEarlyTitle =>
      'Bắt đầu ngay dù ngày bắt đầu ở tương lai';

  @override
  String get courseFormTitleAdd => 'Thêm môn học';

  @override
  String get courseFormTitleEdit => 'Sửa môn học';

  @override
  String get coursesAddTooltip => 'Thêm môn học';

  @override
  String coursesDeleteBody(String name) {
    return 'Xóa \"$name\" và mọi buổi học? Không thể hoàn tác.';
  }

  @override
  String get coursesDeleteTitle => 'Xóa môn học?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => 'Nhấn \"Môn mới\" để tạo môn học đầu tiên.';

  @override
  String get coursesEmptyTitle => 'Chưa có môn học';

  @override
  String get coursesFilterAll => 'Mọi trạng thái';

  @override
  String get coursesFilterEmpty => 'Không có môn nào khớp bộ lọc';

  @override
  String get coursesNewCourse => 'Môn mới';

  @override
  String coursesPaceNeeded(String daily) {
    return 'Cần $daily giờ/ngày';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return 'Cần $daily giờ/ngày • $weekly giờ/tuần';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required giờ • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'Xóa môn mẫu';

  @override
  String coursesShownCount(String count) {
    return 'Hiển thị $count';
  }

  @override
  String coursesSortOption(String label) {
    return 'Sắp xếp: $label';
  }

  @override
  String get dashboardAllDone => 'Hoàn tất';

  @override
  String dashboardBonusLogged(String hours) {
    return 'Đã ghi $hours giờ (thưởng)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count môn';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count môn • $upcoming môn sắp tới không tính vào nhịp hôm nay';
  }

  @override
  String get dashboardCoursesTitle => 'Môn học';

  @override
  String dashboardDeadline(String date) {
    return 'Hạn $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return 'Hạn $date (còn $days ngày)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return 'Hạn $date (còn 1 ngày)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return 'Hạn $date (quá hạn)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return 'Hạn $date (hôm nay)';
  }

  @override
  String dashboardDueToday(String hours) {
    return 'Đến hạn hôm nay — đã ghi $hours giờ';
  }

  @override
  String get dashboardEmptyHintAllDone =>
      'Mọi môn đều hoàn thành — xem danh sách đầy đủ ở tab Môn học.';

  @override
  String get dashboardEmptyHintNoCourses =>
      'Thêm môn học để bắt đầu theo dõi tiến độ ECTS.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return 'Trễ: đạt $achieved/ngày, cần $need/ngày';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return 'Trễ: đạt $achieved/ngày, cần $need/ngày • bắt đầu sớm';
  }

  @override
  String get dashboardExplainerBehindNoPace =>
      'Trễ: không có nhịp hữu hạn mà hạn là hôm nay và còn giờ';

  @override
  String get dashboardExplainerOnTrackNoPace =>
      'Đúng tiến độ: chưa có nhịp — ghi buổi đầu để xác nhận';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return 'Bắt đầu sau $days ngày • tính từ $date';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return 'Bắt đầu sau $days ngày • tính từ $date • đã bật bắt đầu sớm';
  }

  @override
  String get dashboardFreshStart => 'KHỞI ĐẦU MỚI';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '• $pct% • còn $hours giờ';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required giờ';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours giờ/ngày';
  }

  @override
  String get dashboardLogSessionAction => 'Ghi buổi học';

  @override
  String get dashboardLogSessionTooltip => 'Ghi buổi học';

  @override
  String get dashboardNewBadge => 'MỚI';

  @override
  String get dashboardNoCourses => 'Chưa có môn học';

  @override
  String get dashboardNoDeadline => 'Không có hạn';

  @override
  String get dashboardNoDeadlines => 'Chưa có hạn nào';

  @override
  String get dashboardNoPaceDue => 'Hôm nay không có nhịp';

  @override
  String get dashboardNothingDue => 'Không có gì đến hạn';

  @override
  String get dashboardNothingToTrack => 'Chưa có gì để theo dõi';

  @override
  String dashboardPaceDueToday(String hours) {
    return 'Đến hạn hôm nay — còn $hours giờ';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return 'Cần $daily giờ/ngày để hoàn thành';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return 'Cần $daily giờ/ngày • $weekly giờ/tuần để hoàn thành';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return 'Cần $hours giờ/ngày từ $date • không tính vào nhịp Hôm nay';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return 'Không hạn — còn $hours giờ • không áp lực hằng ngày';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return 'Bắt đầu $date • còn $hours giờ';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace • phi thực tế';
  }

  @override
  String get dashboardProgramBare => 'CHƯƠNG TRÌNH';

  @override
  String get dashboardProgramEmptyHint => 'Thêm môn học để bắt đầu theo dõi';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required giờ';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'CHƯƠNG TRÌNH $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return 'Còn $days ngày';
  }

  @override
  String get dashboardStartNotSet => 'Chưa đặt';

  @override
  String dashboardStartsIn(String days) {
    return 'Bắt đầu sau $days ngày';
  }

  @override
  String get dashboardStartsSoon => 'Sắp bắt đầu';

  @override
  String get dashboardTipEmpty =>
      'Thêm môn đầu tiên — nhịp hằng ngày và tiến độ sẽ hiện ở đây.';

  @override
  String get dashboardTipFirst =>
      '25 phút đầu quan trọng nhất — hãy chọn môn đến hạn trước.';

  @override
  String get dashboardTodayBare => 'HÔM NAY';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace giờ';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return 'HÔM NAY $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => 'NHỊP HÔM NAY';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return 'Hôm nay $logged / $pace giờ';
  }

  @override
  String get dashboardUpcomingSubtitle =>
      'Các môn bắt đầu sau — hôm nay không áp lực, loại khỏi nhịp Hôm nay.';

  @override
  String get dashboardUpcomingTitle => 'Sắp tới';

  @override
  String get devToolsActivate => 'Kích hoạt';

  @override
  String get devToolsActivateMessage =>
      'Mở công cụ kiểm tra tải ẩn (nạp dữ liệu tạo sẵn). Chỉ dành cho phát triển.';

  @override
  String get devToolsActivateTitle => 'Kích hoạt chế độ dev?';

  @override
  String get devToolsActivated => 'Đã kích hoạt chế độ dev.';

  @override
  String get devToolsClearPumped => 'Xóa dữ liệu đã nạp';

  @override
  String get devToolsClearPumpedMessage =>
      'Xóa các môn STRESS được tạo và buổi học của chúng. Dữ liệu của bạn được giữ lại.';

  @override
  String get devToolsClearPumpedSubtitle =>
      'Xóa các môn STRESS và buổi học được tạo.';

  @override
  String get devToolsClearPumpedTitle => 'Xóa dữ liệu đã nạp?';

  @override
  String devToolsCleared(String count) {
    return 'Đã xóa $count môn được nạp.';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      'Xác nhận lần hai: thao tác sẽ phình môn học, danh sách, biểu đồ và tính nhịp, có thể mất vài giây. Nạp ngay?';

  @override
  String get devToolsConfirmPumpTitle => 'Xác nhận nạp kiểm tra tải';

  @override
  String get devToolsContinue => 'Tiếp tục';

  @override
  String get devToolsExit => 'Thoát chế độ dev';

  @override
  String get devToolsExitSubtitle => 'Ẩn công cụ dev trên thiết bị này.';

  @override
  String get devToolsPumpData => 'Nạp dữ liệu';

  @override
  String get devToolsPumpMessage =>
      'Chèn một học kỳ tạo sẵn thực tế (~10 môn, ~800 buổi trong 12 tuần qua). Dữ liệu hiện có được giữ lại. Tiếp tục?';

  @override
  String get devToolsPumpSubtitle =>
      'Chèn học kỳ tạo sẵn (~10 môn, ~800 buổi, 12 tuần). Giữ dữ liệu hiện có.';

  @override
  String get devToolsPumpTile => 'Nạp dữ liệu kiểm tra';

  @override
  String get devToolsPumpTitle => 'Nạp dữ liệu kiểm tra?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return 'Đã nạp $courses môn, $sessions buổi.';
  }

  @override
  String get devToolsPumping => 'Đang nạp dữ liệu kiểm tra…';

  @override
  String get devToolsRemoveAll => 'Xóa mọi dữ liệu';

  @override
  String get devToolsRemoveAllMessage =>
      'Phím tắt dev: xóa vĩnh viễn MỌI môn học, buổi học và cài đặt. Không thể hoàn tác.';

  @override
  String get devToolsRemoveAllSubtitle =>
      'Phím tắt dev: xóa MỌI môn học, buổi học và cài đặt.';

  @override
  String get devToolsRemoveAllTitle => 'Xóa mọi dữ liệu?';

  @override
  String get navCourses => 'Môn học';

  @override
  String get navDashboard => 'Tổng quan';

  @override
  String get navSettings => 'Cài đặt';

  @override
  String get navStatistics => 'Thống kê';

  @override
  String get navStudyLog => 'Nhật ký học';

  @override
  String get sampleBadge => 'Mẫu';

  @override
  String get sessionFormCourseLabel => 'Môn học';

  @override
  String sessionFormDateButton(String date) {
    return 'Ngày: $date';
  }

  @override
  String get sessionFormDurationError => 'Thời lượng phải lớn hơn 0.';

  @override
  String get sessionFormHoursLabel => 'Giờ';

  @override
  String get sessionFormLogAction => 'Ghi buổi học';

  @override
  String get sessionFormMinutesLabel => 'Phút';

  @override
  String get sessionFormNoCourseError => 'Hãy chọn môn học.';

  @override
  String get sessionFormNoCoursesHint =>
      'Hãy thêm môn học trước để ghi buổi học.';

  @override
  String get sessionFormNotesLabel => 'Ghi chú (tùy chọn)';

  @override
  String get sessionFormSaving => 'Đang lưu…';

  @override
  String get sessionFormTitleAdd => 'Ghi buổi học';

  @override
  String get sessionFormTitleEdit => 'Sửa buổi học';

  @override
  String sessionFormTotalHours(String hours) {
    return 'Tổng: $hours giờ';
  }

  @override
  String get settingsAccent => 'Màu chủ đạo';

  @override
  String get settingsAccentBerry => 'Dâu';

  @override
  String get settingsAccentClay => 'Đất nung';

  @override
  String get settingsAccentForest => 'Rừng';

  @override
  String get settingsAccentSlate => 'Đá phiến';

  @override
  String get settingsAccentTeal => 'Xanh mòng két';

  @override
  String get settingsAccentUpdated => 'Đã cập nhật màu chủ đạo.';

  @override
  String get settingsAllDataDeleted => 'Đã xóa mọi dữ liệu.';

  @override
  String get settingsAppearance => 'Giao diện (tối / sáng)';

  @override
  String get settingsCheckingSample => 'Đang kiểm tra dữ liệu mẫu…';

  @override
  String get settingsClear => 'Xóa';

  @override
  String get settingsClearSample => 'Xóa dữ liệu mẫu';

  @override
  String get settingsClearSampleMessage =>
      'Xóa các môn và buổi học ví dụ. Các môn hoặc buổi bạn tự thêm sẽ không bị xóa.';

  @override
  String get settingsClearSampleSubtitle =>
      'Xóa các môn và buổi học ví dụ. Dữ liệu của bạn được giữ lại.';

  @override
  String get settingsClearSampleTitle => 'Xóa dữ liệu mẫu?';

  @override
  String get settingsCopy => 'Sao chép';

  @override
  String get settingsDailyError => 'Nhập 0 hoặc số phút dương.';

  @override
  String get settingsDailyLabel => 'Số phút mỗi ngày (0 = không mục tiêu)';

  @override
  String get settingsDailyTarget => 'Mục tiêu học hằng ngày';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes phút/ngày';
  }

  @override
  String get settingsDailyUpdated => 'Đã cập nhật mục tiêu hằng ngày.';

  @override
  String get settingsData => 'Dữ liệu';

  @override
  String get settingsDeleteEverything => 'Xóa tất cả';

  @override
  String get settingsDevMode => 'Chế độ dev';

  @override
  String get settingsDisplay => 'Hiển thị';

  @override
  String get settingsDisplayComfortable => 'Thoải mái';

  @override
  String get settingsDisplayCompact => 'Gọn';

  @override
  String get settingsDisplayLarge => 'Lớn';

  @override
  String get settingsDisplaySize => 'Cỡ chữ & thành phần';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label ($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => 'Đã cập nhật cỡ hiển thị.';

  @override
  String get settingsExport => 'Xuất dữ liệu';

  @override
  String get settingsExportCopied => 'Đã sao chép bản xuất vào clipboard.';

  @override
  String get settingsExportSubtitle =>
      'Sao chép mọi môn học, buổi học và cài đặt dưới dạng JSON.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses môn • $sessions buổi • $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '… (rút gọn — bản sao lưu đầy đủ là $kb KB, dùng Sao chép để lấy tất cả)';
  }

  @override
  String get settingsFirstWeekday => 'Ngày đầu tuần';

  @override
  String get settingsFirstWeekdayUpdated => 'Đã cập nhật ngày đầu tuần.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label (giữ $seconds giây)';
  }

  @override
  String get settingsHoldToReplace => 'Giữ để thay thế tất cả';

  @override
  String get settingsHoursError => 'Nhập số lớn hơn 0.';

  @override
  String get settingsHoursHelper =>
      'Mặc định 30. Thay đổi sẽ tính lại yêu cầu; nhật ký được giữ.';

  @override
  String get settingsHoursLabel => 'Số giờ mỗi tín chỉ ECTS';

  @override
  String get settingsHoursPerEcts => 'Số giờ mỗi ECTS';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value giờ';
  }

  @override
  String get settingsHoursUpdated => 'Đã cập nhật số giờ mỗi ECTS.';

  @override
  String get settingsImport => 'Nhập dữ liệu';

  @override
  String get settingsImportAppend => 'Thêm vào';

  @override
  String get settingsImportAppendAction => 'Nhập (thêm vào)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'Đã thêm dữ liệu: thêm $courses môn, $sessions buổi.';
  }

  @override
  String get settingsImportInfo =>
      'Thêm vào sẽ cộng bản sao lưu vào dữ liệu hiện tại (giữ cài đặt). Thay thế sẽ xóa MỌI môn học, buổi học và cài đặt trước.';

  @override
  String get settingsImportLabel => 'Dán JSON đã xuất';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses môn • $sessions buổi';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' • xuất lúc $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' • lược đồ v$schema';
  }

  @override
  String get settingsImportReplace => 'Thay thế';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return 'Thay thế sẽ xóa mọi thứ trước. NHẤN GIỮ nút bên dưới trong $seconds giây để xác nhận.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'Đã thay thế dữ liệu: khôi phục $courses môn, $sessions buổi.';
  }

  @override
  String get settingsImportSubtitle =>
      'Thay thế toàn bộ dữ liệu từ bản sao lưu JSON đã xuất trước đó.';

  @override
  String settingsKeepHolding(String remaining) {
    return 'Giữ tiếp… $remaining giây';
  }

  @override
  String get settingsNoSample => 'Không có dữ liệu mẫu';

  @override
  String get settingsNoSampleSubtitle => 'Dữ liệu ví dụ đã được xóa.';

  @override
  String get settingsNoTarget => 'Chưa đặt mục tiêu';

  @override
  String get settingsOverloadError => 'Nhập số 5–100 giờ/tuần.';

  @override
  String get settingsOverloadHelper =>
      'Các tuần vượt mức này sẽ bị đánh dấu đỏ. Học toàn thời gian khoảng 35–40 giờ/tuần.';

  @override
  String settingsOverloadHours(String value) {
    return '$value giờ';
  }

  @override
  String get settingsOverloadLabel => 'Số giờ mỗi tuần (5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/tuần sẽ đánh dấu đỏ';
  }

  @override
  String get settingsOverloadThreshold => 'Ngưỡng quá tải hằng tuần';

  @override
  String get settingsOverloadUpdated => 'Đã cập nhật ngưỡng quá tải.';

  @override
  String get settingsPaceTolerance => 'Dung sai nhanh / trễ';

  @override
  String get settingsPasteValidBackup => 'Hãy dán bản sao lưu hợp lệ trước';

  @override
  String get settingsReset => 'Đặt lại';

  @override
  String get settingsResetAll => 'Đặt lại mọi dữ liệu';

  @override
  String get settingsResetAllMessage =>
      'Xóa vĩnh viễn MỌI môn học, buổi học và cài đặt. Không thể hoàn tác. Hãy xuất bản sao lưu trước nếu cần.';

  @override
  String get settingsResetAllSubtitle =>
      'Xóa mọi môn học, buổi học và cài đặt.';

  @override
  String get settingsResetAllTitle => 'Đặt lại mọi dữ liệu?';

  @override
  String get settingsResetSettings => 'Đặt lại cài đặt';

  @override
  String get settingsResetSettingsDone => 'Đã đặt lại cài đặt về mặc định.';

  @override
  String get settingsResetSettingsMessage =>
      'Khôi phục giờ mỗi ECTS (30), mục tiêu ngày (không), ngày đầu tuần (Thứ Hai), giao diện (hệ thống), dung sai (5 ngày), quá tải (35 giờ/tuần), cỡ (thoải mái), màu (đá phiến). Môn học và buổi học được giữ lại.';

  @override
  String get settingsResetSettingsSubtitle =>
      'Khôi phục mặc định: 30 giờ/ECTS, không mục tiêu, Thứ Hai, giao diện hệ thống, dung sai 5 ngày, quá tải 35 giờ/tuần, cỡ thoải mái, màu đá phiến.';

  @override
  String get settingsResetSettingsTitle => 'Đặt lại cài đặt?';

  @override
  String get settingsSampleData => 'Dữ liệu mẫu';

  @override
  String settingsSampleDataError(String error) {
    return 'Lỗi: $error';
  }

  @override
  String get settingsStudySettings => 'Cài đặt học tập';

  @override
  String get settingsThemeDark => 'Tối';

  @override
  String get settingsThemeLight => 'Sáng';

  @override
  String get settingsThemeSystem => 'Theo hệ thống';

  @override
  String get settingsThemeTitle => 'Giao diện';

  @override
  String get settingsThemeUpdated => 'Đã cập nhật giao diện.';

  @override
  String settingsToleranceDays(String value) {
    return '$value ngày';
  }

  @override
  String get settingsToleranceError => 'Nhập số 0–30 ngày.';

  @override
  String get settingsToleranceHelper =>
      'Nhanh cần dư +N ngày, trễ −N ngày. 5 = ổn định, 0 = nhạy.';

  @override
  String get settingsToleranceLabel => 'Số ngày công (0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance công việc';
  }

  @override
  String get settingsToleranceUpdated => 'Đã cập nhật dung sai.';

  @override
  String get settingsWeekdayFriday => 'Thứ Sáu';

  @override
  String get settingsWeekdayMonday => 'Thứ Hai';

  @override
  String get settingsWeekdaySaturday => 'Thứ Bảy';

  @override
  String get settingsWeekdaySunday => 'Chủ Nhật';

  @override
  String get settingsWeekdayThursday => 'Thứ Năm';

  @override
  String get settingsWeekdayTuesday => 'Thứ Ba';

  @override
  String get settingsWeekdayWednesday => 'Thứ Tư';

  @override
  String get sortDeadline => 'Hạn chót';

  @override
  String get sortName => 'Tên';

  @override
  String get sortProgress => 'Tiến độ';

  @override
  String get sortStatus => 'Trạng thái';

  @override
  String get startupTitle => 'Không thể khởi động ECTS Tracker';

  @override
  String get statsActiveDays => 'Ngày học';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days ngày học';
  }

  @override
  String get statsAddDeadlines => 'Thêm hạn chót để dự báo khối lượng.';

  @override
  String get statsComingLoad => 'Khối lượng sắp tới';

  @override
  String get statsConsistency => 'Đều đặn';

  @override
  String get statsConsistencyHint =>
      'Số ngày học trong 30 ngày qua. Mỗi ngày một ít tốt hơn nhồi nhét.';

  @override
  String statsConsistencyScore(String percent) {
    return '$percent% của 30 ngày qua';
  }

  @override
  String statsCourseFallback(int id) {
    return 'Môn $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => 'Đã học/ngày (14 ngày)';

  @override
  String get statsEmpty => 'Chưa có buổi nào';

  @override
  String get statsGap => 'Chênh lệch';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value giờ';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours giờ';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours giờ';
  }

  @override
  String get statsLast30Days => '30 ngày qua';

  @override
  String get statsLast7Days => '7 ngày qua';

  @override
  String get statsNeedPerDay => 'Cần/ngày';

  @override
  String get statsNext8Weeks => '8 tuần tới';

  @override
  String get statsOfLast30DaysVolume => 'trên khối lượng 30 ngày qua';

  @override
  String statsOverloadWarning(String threshold) {
    return 'Các tuần quá tải >$threshold giờ bị đánh dấu đỏ — hãy dời hạn hoặc giảm phạm vi.';
  }

  @override
  String get statsOverview => 'Tổng quan';

  @override
  String get statsPaceCovers => 'Nhịp vừa qua đã đủ. Hãy giữ streak.';

  @override
  String statsPaceShort(String gap) {
    return 'Nhịp vừa qua thiếu $gap giờ/ngày — hãy thêm buổi học hoặc giảm phạm vi.';
  }

  @override
  String get statsPastVsNeeded => 'Đã học so với cần';

  @override
  String statsPeakPerWeek(String peak) {
    return 'đỉnh $peak giờ/tuần';
  }

  @override
  String get statsPerCourse => 'Theo môn';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done giờ / $required giờ • $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => 'Buổi học';

  @override
  String statsSuggestedOrder(String order) {
    return 'Thứ tự gợi ý: $order (hạn gần nhất trước)';
  }

  @override
  String get statsTotal => 'Tổng';

  @override
  String get statsTotalVolume => 'tổng khối lượng';

  @override
  String get statusAhead => 'Vượt tiến độ';

  @override
  String get statusBehind => 'Trễ';

  @override
  String get statusCompleted => 'Hoàn thành';

  @override
  String get statusOnTrack => 'Đúng tiến độ';

  @override
  String get statusOverdue => 'Quá hạn';

  @override
  String get studyLogDeleteBody => 'Xóa buổi học này? Không thể hoàn tác.';

  @override
  String get studyLogDeleteTitle => 'Xóa buổi học?';

  @override
  String get studyLogEmptyHint => 'Ghi buổi học để theo dõi thời gian học.';

  @override
  String get studyLogEmptyTitle => 'Chưa có buổi học nào';

  @override
  String get studyLogFabLabel => 'Ghi buổi học';

  @override
  String get studyLogFabTooltip => 'Ghi buổi học';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours giờ';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'Xóa buổi mẫu';

  @override
  String get studyLogThisWeek => 'Tuần này';

  @override
  String get studyLogToday => 'Hôm nay';

  @override
  String studyLogUnknownCourse(String id) {
    return 'Môn $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS phải lớn hơn 0';

  @override
  String get validationCourseEctsRequired => 'Nhập tín chỉ ECTS';

  @override
  String get validationCourseNameRequired => 'Tên là bắt buộc';

  @override
  String get validationCourseNameTooLong => 'Tên quá dài';

  @override
  String get validationSessionCourseRequired => 'Hãy chọn môn học';

  @override
  String get validationSessionDurationRequired => 'Nhập thời lượng';

  @override
  String get widgetNoProgress => 'Chưa có tiến độ';

  @override
  String get settingsLanguage => 'Ngôn ngữ';
}
