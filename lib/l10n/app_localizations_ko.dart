// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => '취소';

  @override
  String get commonClose => '닫기';

  @override
  String get commonDelete => '삭제';

  @override
  String get commonEdit => '편집';

  @override
  String get commonError => '오류';

  @override
  String get commonNone => '없음';

  @override
  String get commonSave => '저장';

  @override
  String courseFormAutoHoursValue(String value) {
    return '필요 시간(자동): $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => '마감일 지우기';

  @override
  String get courseFormClearStartTooltip => '시작일 지우기';

  @override
  String get courseFormColorLabel => '색상';

  @override
  String get courseFormDateNotSet => '미설정';

  @override
  String courseFormDeadlineButton(String date) {
    return '마감일: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS 학점';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value시간/ECTS';
  }

  @override
  String get courseFormNameLabel => '이름';

  @override
  String get courseFormNotesLabel => '메모(선택)';

  @override
  String get courseFormSaving => '저장 중…';

  @override
  String courseFormStartButton(String date) {
    return '시작: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return '꺼짐: $date까지 부담 없음. 오늘 페이스에서 제외.';
  }

  @override
  String get courseFormStartEarlyOn => '켜짐: 지금까지 시간을 나누어 오늘 페이스에 포함.';

  @override
  String get courseFormStartEarlyTitle => '시작일이 미래여도 지금 시작';

  @override
  String get courseFormTitleAdd => '과목 추가';

  @override
  String get courseFormTitleEdit => '과목 편집';

  @override
  String get coursesAddTooltip => '과목 추가';

  @override
  String coursesDeleteBody(String name) {
    return '\"$name\"과(와) 모든 학습 기록을 삭제할까요? 되돌릴 수 없습니다.';
  }

  @override
  String get coursesDeleteTitle => '과목을 삭제할까요?';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => '\"새 과목\"을 눌러 첫 과목을 만드세요.';

  @override
  String get coursesEmptyTitle => '아직 과목이 없습니다';

  @override
  String get coursesFilterAll => '모든 상태';

  @override
  String get coursesFilterEmpty => '이 필터에 맞는 과목이 없습니다';

  @override
  String get coursesNewCourse => '새 과목';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily시간/일 필요';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily분/일 필요';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily시간/일・$weekly시간/주 필요';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily분/일・$weekly분/주 필요';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily분/일・$weekly시간/주 필요';
  }

  @override
  String coursesProgressWithStatus(String done, String required, String status) {
    return '$done / $required시간・$status';
  }

  @override
  String get coursesRemoveSampleTooltip => '샘플 과목 삭제';

  @override
  String coursesShownCount(String count) {
    return '$count개 표시';
  }

  @override
  String coursesSortOption(String label) {
    return '정렬: $label';
  }

  @override
  String get dashboardAllDone => '모두 완료';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours시간 기록됨(보너스)';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count개 과목';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count개 과목・$upcoming개는 예정이라 오늘 페이스 제외';
  }

  @override
  String get dashboardCoursesTitle => '과목';

  @override
  String dashboardDeadline(String date) {
    return '마감일 $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return '마감일 $date($days일 남음)';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return '마감일 $date(1일 남음)';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return '마감일 $date(기한 초과)';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return '마감일 $date(오늘)';
  }

  @override
  String dashboardDueToday(String hours) {
    return '오늘 마감 — $hours시간 기록됨';
  }

  @override
  String get dashboardEmptyHintAllDone => '모든 과목이 완료되었습니다 — 전체 목록은 과목 탭에서 확인하세요.';

  @override
  String get dashboardEmptyHintNoCourses => '과목을 추가해 ECTS 진도 관리를 시작하세요.';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return '지연: $achieved/일 대비 $need/일 필요';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return '지연: $achieved/일 대비 $need/일 필요・조기 시작';
  }

  @override
  String get dashboardExplainerBehindNoPace => '지연: 오늘이 마감이고 남은 시간 있음, 유한 페이스 없음';

  @override
  String get dashboardExplainerOnTrackNoPace => '정상: 아직 페이스 없음 — 첫 기록 후 확정됩니다';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days일 후 시작・$date부터 계산';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days일 후 시작・$date부터 계산・조기 시작 켜짐';
  }

  @override
  String get dashboardFreshStart => '새 출발';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '・$pct%・$hours시간 남음';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required시간';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours시간/일';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes분/일';
  }

  @override
  String get dashboardLogSessionAction => '학습 기록하기';

  @override
  String get dashboardLogSessionTooltip => '학습 기록하기';

  @override
  String get dashboardNewBadge => 'NEW';

  @override
  String get dashboardNoCourses => '아직 과목이 없습니다';

  @override
  String get dashboardNoDeadline => '마감일 없음';

  @override
  String get dashboardNoDeadlines => '예정된 마감일이 없습니다';

  @override
  String get dashboardNoPaceDue => '오늘 페이스 없음';

  @override
  String get dashboardNothingDue => '마감 없음';

  @override
  String get dashboardNothingToTrack => '아직 추적할 항목이 없습니다';

  @override
  String dashboardPaceDueToday(String hours) {
    return '오늘 마감 — $hours시간 남음';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return '완료하려면 $daily시간/일 필요';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return '완료하려면 $daily분/일 필요';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return '완료하려면 $daily시간/일・$weekly시간/주 필요';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return '완료하려면 $daily분/일・$weekly분/주 필요';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return '완료하려면 $daily분/일・$weekly시간/주 필요';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$date부터 $hours시간/일 필요・오늘 페이스 제외';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return '$date부터 $minutes분/일 필요・오늘 페이스 제외';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return '마감일 없음 — $hours시간 남음・매일 부담 없음';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date 시작・$hours시간 남음';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace・비현실적';
  }

  @override
  String get dashboardProgramBare => '프로그램';

  @override
  String get dashboardProgramEmptyHint => '과목을 추가해 기록을 시작하세요';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required시간';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return '프로그램 $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '$days일분 남음';
  }

  @override
  String get dashboardStartNotSet => '미설정';

  @override
  String dashboardStartsIn(String days) {
    return '$days일 후 시작';
  }

  @override
  String get dashboardStartsSoon => '곧 시작';

  @override
  String get dashboardTipEmpty => '첫 과목을 추가하세요 — 일일 페이스와 진도가 여기에 표시됩니다.';

  @override
  String get dashboardTipFirst => '첫 25분이 가장 중요합니다 — 마감일이 가장 빠른 과목부터 하세요.';

  @override
  String get dashboardTodayBare => '오늘';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace시간';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return '오늘 $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => '오늘의 페이스';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '오늘 $logged / $pace시간';
  }

  @override
  String get dashboardUpcomingSubtitle => '예정된 시작 — 오늘은 부담 없음, 오늘 페이스에서 제외.';

  @override
  String get dashboardUpcomingTitle => '예정';

  @override
  String get devToolsActivate => '활성화';

  @override
  String get devToolsActivateMessage => '숨겨진 스트레스 테스트 도구(생성 데이터 주입)를 엽니다. 개발 전용입니다.';

  @override
  String get devToolsActivateTitle => '개발 모드를 활성화할까요?';

  @override
  String get devToolsActivated => '개발 모드가 활성화되었습니다.';

  @override
  String get devToolsClearPumped => '생성 데이터 지우기';

  @override
  String get devToolsClearPumpedMessage => '생성된 STRESS 과목과 기록을 삭제합니다. 내 데이터는 유지됩니다.';

  @override
  String get devToolsClearPumpedSubtitle => '생성된 STRESS 과목과 기록을 삭제합니다.';

  @override
  String get devToolsClearPumpedTitle => '생성 데이터를 지울까요?';

  @override
  String devToolsCleared(String count) {
    return '$count개의 생성 과목을 지웠습니다.';
  }

  @override
  String get devToolsConfirmPumpMessage => '최종 확인: 과목・목록・차트・페이스 계산이 부풀어 오르고 몇 초 걸릴 수 있습니다. 지금 주입할까요?';

  @override
  String get devToolsConfirmPumpTitle => '스트레스 주입 확인';

  @override
  String get devToolsContinue => '계속';

  @override
  String get devToolsExit => '개발 모드 종료';

  @override
  String get devToolsExitSubtitle => '이 기기에서 개발 도구를 숨깁니다.';

  @override
  String get devToolsPumpData => '데이터 주입';

  @override
  String get devToolsPumpMessage => '현실적인 생성 학기(약 10개 과목, 최근 12주간 약 800개 기록)를 삽입합니다. 기존 데이터는 유지됩니다. 계속할까요?';

  @override
  String get devToolsPumpSubtitle => '생성 학기 삽입(약 10개 과목・약 800개 기록・12주). 기존 데이터 유지.';

  @override
  String get devToolsPumpTile => '테스트 데이터 주입';

  @override
  String get devToolsPumpTitle => '테스트 데이터를 주입할까요?';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses개 과목, $sessions개 기록을 주입했습니다.';
  }

  @override
  String get devToolsPumping => '테스트 데이터 주입 중…';

  @override
  String get devToolsRemoveAll => '모든 데이터 삭제';

  @override
  String get devToolsRemoveAllMessage => '개발용 바로가기: 모든 과목・기록・설정을 완전히 삭제합니다. 되돌릴 수 없습니다.';

  @override
  String get devToolsRemoveAllSubtitle => '개발용 바로가기: 모든 과목・기록・설정을 삭제합니다.';

  @override
  String get devToolsRemoveAllTitle => '모든 데이터를 삭제할까요?';

  @override
  String get navCourses => '과목';

  @override
  String get navDashboard => '대시보드';

  @override
  String get navSettings => '설정';

  @override
  String get navStatistics => '통계';

  @override
  String get navStudyLog => '학습 기록';

  @override
  String get sampleBadge => '샘플';

  @override
  String get sessionFormCourseLabel => '과목';

  @override
  String sessionFormDateButton(String date) {
    return '날짜: $date';
  }

  @override
  String get sessionFormDurationError => '시간은 0보다 커야 합니다.';

  @override
  String get sessionFormHoursLabel => '시간';

  @override
  String get sessionFormLogAction => '기록하기';

  @override
  String get sessionFormMinutesLabel => '분';

  @override
  String get sessionFormModeManual => 'Manual';

  @override
  String get sessionFormModeTimer => 'Timer';

  @override
  String get sessionFormNoCourseError => '과목을 선택하세요.';

  @override
  String get sessionFormNoCoursesHint => '먼저 과목을 추가한 뒤 기록하세요.';

  @override
  String get sessionFormNotesLabel => '메모(선택)';

  @override
  String get sessionFormSaving => '저장 중…';

  @override
  String get sessionFormTitleAdd => '학습 기록하기';

  @override
  String get sessionFormTitleEdit => '학습 기록 편집';

  @override
  String sessionFormTotalHours(String hours) {
    return '합계: $hours시간';
  }

  @override
  String get settingsAccent => '테마 색상';

  @override
  String get settingsAccentBerry => '베리';

  @override
  String get settingsAccentClay => '클레이';

  @override
  String get settingsAccentForest => '포레스트';

  @override
  String get settingsAccentSlate => '슬레이트';

  @override
  String get settingsAccentTeal => '틸';

  @override
  String get settingsAccentUpdated => '테마 색상을 업데이트했습니다.';

  @override
  String get settingsAllDataDeleted => '모든 데이터를 삭제했습니다.';

  @override
  String get settingsAppearance => '외관(다크/라이트)';

  @override
  String get settingsCheckingSample => '샘플 데이터 확인 중…';

  @override
  String get settingsClear => '지우기';

  @override
  String get settingsClearSample => '샘플 데이터 지우기';

  @override
  String get settingsClearSampleMessage => '예제 과목과 기록을 삭제합니다. 직접 추가한 과목・기록은 삭제되지 않습니다.';

  @override
  String get settingsClearSampleSubtitle => '예제 과목과 기록을 삭제합니다. 내 데이터는 유지됩니다.';

  @override
  String get settingsClearSampleTitle => '샘플 데이터를 지울까요?';

  @override
  String get settingsCopy => '복사';

  @override
  String get settingsDailyError => '0 또는 양의 분 숫자를 입력하세요.';

  @override
  String get settingsDailyLabel => '하루 분(0=목표 없음)';

  @override
  String get settingsDailyTarget => '하루 학습 목표';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes분/일';
  }

  @override
  String get settingsDailyUpdated => '하루 목표를 업데이트했습니다.';

  @override
  String get settingsData => '데이터';

  @override
  String get settingsDeleteEverything => '모두 삭제';

  @override
  String get settingsDevMode => '개발 모드';

  @override
  String get settingsDisplay => '표시';

  @override
  String get settingsDisplayComfortable => '보통';

  @override
  String get settingsDisplayCompact => '컴팩트';

  @override
  String get settingsDisplayLarge => '크게';

  @override
  String get settingsDisplaySize => '글자 및 요소 크기';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label($percent%)';
  }

  @override
  String get settingsDisplaySizeUpdated => '표시 크기를 업데이트했습니다.';

  @override
  String get settingsExport => '데이터 내보내기';

  @override
  String get settingsExportCopied => '내보내기를 클립보드에 복사했습니다.';

  @override
  String get settingsExportSubtitle => '모든 과목・기록・설정을 JSON으로 복사합니다.';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses개 과목・$sessions개 기록・${kb}KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '…(생략 — 전체 백업은 ${kb}KB, 전체 복사는 복사 버튼 사용)';
  }

  @override
  String get settingsFirstWeekday => '주 시작 요일';

  @override
  String get settingsFirstWeekdayUpdated => '주 시작 요일을 업데이트했습니다.';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label($seconds초 홀드)';
  }

  @override
  String get settingsHoldToReplace => '홀드하여 모두 교체';

  @override
  String get settingsHoursError => '0보다 큰 숫자를 입력하세요.';

  @override
  String get settingsHoursHelper => '기본값 30. 변경하면 필요 시간이 다시 계산됩니다. 기록은 유지됩니다.';

  @override
  String get settingsHoursLabel => 'ECTS당 시간';

  @override
  String get settingsHoursPerEcts => 'ECTS당 시간';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value시간';
  }

  @override
  String get settingsHoursUpdated => 'ECTS당 시간을 업데이트했습니다.';

  @override
  String get settingsImport => '데이터 가져오기';

  @override
  String get settingsImportAppend => '추가';

  @override
  String get settingsImportAppendAction => '가져오기(추가)';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return '데이터를 추가했습니다: $courses개 과목, $sessions개 기록 추가됨.';
  }

  @override
  String get settingsImportInfo => '추가는 현재 데이터에 백업을 더합니다(설정 유지). 교체는 먼저 모든 과목・기록・설정을 지웁니다.';

  @override
  String get settingsImportLabel => '내보낸 JSON 붙여넣기';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses개 과목・$sessions개 기록';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '・내보냄 $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '・스키마 v$schema';
  }

  @override
  String get settingsImportReplace => '교체';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return '교체는 먼저 모두 삭제합니다. 아래 버튼을 $seconds초간 홀드하여 확인하세요.';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return '데이터를 교체했습니다: $courses개 과목, $sessions개 기록 복원됨.';
  }

  @override
  String get settingsImportSubtitle => '이전에 내보낸 JSON 백업에서 모든 데이터를 교체합니다.';

  @override
  String settingsKeepHolding(String remaining) {
    return '계속 홀드… $remaining초 남음';
  }

  @override
  String get settingsNoSample => '샘플 데이터 없음';

  @override
  String get settingsNoSampleSubtitle => '샘플 데이터가 이미 지워졌습니다.';

  @override
  String get settingsNoTarget => '목표 미설정';

  @override
  String get settingsOverloadError => '5–100시간/주의 숫자를 입력하세요.';

  @override
  String get settingsOverloadHelper => '이 값을 넘는 주는 빨간색으로 표시됩니다. 전일제 학습은 약 35–40시간/주입니다.';

  @override
  String settingsOverloadHours(String value) {
    return '$value시간';
  }

  @override
  String get settingsOverloadLabel => '주당 시간(5–100)';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/주 초과 시 빨간색 표시';
  }

  @override
  String get settingsOverloadThreshold => '주간 과부하 기준';

  @override
  String get settingsOverloadUpdated => '과부하 기준을 업데이트했습니다.';

  @override
  String get settingsPaceTolerance => '앞서감/지연 허용치';

  @override
  String get settingsPasteValidBackup => '먼저 유효한 백업을 붙여넣으세요';

  @override
  String get settingsReset => '초기화';

  @override
  String get settingsResetAll => '모든 데이터 초기화';

  @override
  String get settingsResetAllMessage => '모든 과목・기록・설정을 완전히 삭제합니다. 되돌릴 수 없습니다. 필요하면 먼저 백업을 내보내세요.';

  @override
  String get settingsResetAllSubtitle => '모든 과목・기록・설정을 삭제합니다.';

  @override
  String get settingsResetAllTitle => '모든 데이터를 초기화할까요?';

  @override
  String get settingsResetSettings => '설정 초기화';

  @override
  String get settingsResetSettingsDone => '설정을 기본값으로 되돌렸습니다.';

  @override
  String get settingsResetSettingsMessage => 'ECTS당 시간(30), 하루 목표(없음), 주 시작(월요일), 테마(시스템), 허용치(5일), 과부하(35시간/주), 크기(보통), 색상(슬레이트)으로 되돌립니다. 과목과 기록은 유지됩니다.';

  @override
  String get settingsResetSettingsSubtitle => '기본값으로 복원: 30시간/ECTS, 목표 없음, 월요일, 시스템 테마, 5일 허용치, 35시간/주, 보통 크기, 슬레이트 색상.';

  @override
  String get settingsResetSettingsTitle => '설정을 초기화할까요?';

  @override
  String get settingsSampleData => '샘플 데이터';

  @override
  String settingsSampleDataError(String error) {
    return '오류: $error';
  }

  @override
  String get settingsStudySettings => '학습 설정';

  @override
  String get settingsThemeDark => '다크';

  @override
  String get settingsThemeLight => '라이트';

  @override
  String get settingsThemeSystem => '시스템 기본값';

  @override
  String get settingsThemeTitle => '테마';

  @override
  String get settingsThemeUpdated => '테마를 업데이트했습니다.';

  @override
  String settingsToleranceDays(String value) {
    return '$value일';
  }

  @override
  String get settingsToleranceError => '0–30일의 숫자를 입력하세요.';

  @override
  String get settingsToleranceHelper => '앞서감은 +N일 여유, 지연은 −N일이 필요합니다. 5=안정, 0=민감.';

  @override
  String get settingsToleranceLabel => '작업 일수(0–30)';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '작업 $tolerance';
  }

  @override
  String get settingsToleranceUpdated => '허용치를 업데이트했습니다.';

  @override
  String get settingsWeekdayFriday => '금요일';

  @override
  String get settingsWeekdayMonday => '월요일';

  @override
  String get settingsWeekdaySaturday => '토요일';

  @override
  String get settingsWeekdaySunday => '일요일';

  @override
  String get settingsWeekdayThursday => '목요일';

  @override
  String get settingsWeekdayTuesday => '화요일';

  @override
  String get settingsWeekdayWednesday => '수요일';

  @override
  String get sortDeadline => '마감일';

  @override
  String get sortName => '이름';

  @override
  String get sortProgress => '진도';

  @override
  String get sortStatus => '상태';

  @override
  String get startupTitle => 'ECTS Tracker를 시작할 수 없습니다';

  @override
  String get statsActiveDays => '학습일';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days일 학습';
  }

  @override
  String get statsAddDeadlines => '마감일을 추가해 부담을 예측하세요.';

  @override
  String get statsComingLoad => '다가오는 부담';

  @override
  String get statsConsistency => '꾸준함';

  @override
  String get statsConsistencyHint => '최근 30일간의 학습일 수. 벼락치기보다 매일 조금씩이 효과적입니다.';

  @override
  String statsConsistencyScore(String percent) {
    return '최근 30일의 $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return '과목 $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => '실적/일(14일)';

  @override
  String get statsEmpty => '아직 기록이 없습니다';

  @override
  String get statsGap => '차이';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value시간';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours시간';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours시간';
  }

  @override
  String get statsLast30Days => '최근 30일';

  @override
  String get statsLast7Days => '최근 7일';

  @override
  String get statsNeedPerDay => '필요/일';

  @override
  String get statsNext8Weeks => '향후 8주';

  @override
  String get statsOfLast30DaysVolume => '최근 30일 양 중';

  @override
  String statsOverloadWarning(String threshold) {
    return '과부하 주(>$threshold시간)는 빨간색 표시 — 마감일을 옮기거나 범위를 줄이세요.';
  }

  @override
  String get statsOverview => '개요';

  @override
  String get statsPaceCovers => '지금까지의 페이스로 충분합니다. 계속 유지하세요.';

  @override
  String statsPaceShort(String gap) {
    return '지금까지의 페이스가 $gap시간/일 부족 — 시간을 확보하거나 범위를 조정하세요.';
  }

  @override
  String get statsPastVsNeeded => '실적 대 필요량';

  @override
  String statsPeakPerWeek(String peak) {
    return '최대 $peak시간/주';
  }

  @override
  String get statsPerCourse => '과목별';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done시간 / $required시간・$percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => '기록 수';

  @override
  String statsSuggestedOrder(String order) {
    return '추천 순서: $order(마감일 순)';
  }

  @override
  String get statsTotal => '합계';

  @override
  String get statsTotalVolume => '전체 양';

  @override
  String get statusAhead => '앞서감';

  @override
  String get statusBehind => '지연';

  @override
  String get statusCompleted => '완료';

  @override
  String get statusOnTrack => '정상';

  @override
  String get statusOverdue => '기한 초과';

  @override
  String get studyLogDeleteBody => '이 학습 기록을 삭제할까요? 되돌릴 수 없습니다.';

  @override
  String get studyLogDeleteTitle => '기록을 삭제할까요?';

  @override
  String get studyLogEmptyHint => '기록을 추가해 학습 시간을 관리하세요.';

  @override
  String get studyLogEmptyTitle => '아직 학습 기록이 없습니다';

  @override
  String get studyLogFabLabel => '기록하기';

  @override
  String get studyLogFabTooltip => '기록하기';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours시간';
  }

  @override
  String get studyLogRemoveSampleTooltip => '샘플 기록 삭제';

  @override
  String get studyLogThisWeek => '이번 주';

  @override
  String get studyLogToday => '오늘';

  @override
  String studyLogUnknownCourse(String id) {
    return '과목 $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
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
  String studyTimerNotifPaused(String elapsed) {
    return 'Paused · $elapsed';
  }

  @override
  String get studyTimerNotifRunning => 'Tap to open the timer';

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
  String get validationCourseEctsPositive => 'ECTS는 0보다 커야 합니다';

  @override
  String get validationCourseEctsRequired => 'ECTS 학점을 입력하세요';

  @override
  String get validationCourseNameRequired => '이름은 필수입니다';

  @override
  String get validationCourseNameTooLong => '이름이 너무 깁니다';

  @override
  String get validationSessionCourseRequired => '과목을 선택하세요';

  @override
  String get validationSessionDurationRequired => '시간을 입력하세요';

  @override
  String get widgetNoProgress => '아직 진도가 없습니다';

  @override
  String get settingsLanguage => '언어';

  @override
  String get settingsLiquidGlass => '리퀴드 글래스';

  @override
  String get settingsLiquidGlassSubtitle => '프로스티드 유리 카드와 바. 끄면 기존의 단단한 모양이 유지됩니다.';

  @override
  String get settingsLiquidGlassOn => '켜짐';

  @override
  String get settingsLiquidGlassOff => '꺼짐';

  @override
  String get settingsLiquidGlassUpdated => '리퀴드 글래스를 업데이트했습니다.';

  @override
  String get devToolsReminderPreview => '미리 알림 미리 보기';

  @override
  String get devToolsReminderPreviewSubtitle => '지금 알림될 내용을 확인하세요. Windows 안전 테스트 피드.';

  @override
  String get reminderPreviewTitle => '미리 알림 미리 보기';

  @override
  String get reminderPreviewNow => '미리 보기 시간';

  @override
  String get reminderPreviewReset => '지금';

  @override
  String get reminderPreviewEmpty => '조용합니다 — 이 시간에 알림이 없습니다.';

  @override
  String get reminderPreviewCustom => '사용자 지정 일정(데모)';

  @override
  String get reminderPreviewNoFire => '예정된 알림이 없습니다.';

  @override
  String get reminderKindDaily => '매일';

  @override
  String get reminderKindBehind => '지연';

  @override
  String get reminderKindDeadline => '마감일';

  @override
  String get reminderKindOverdue => '기한 초과';

  @override
  String get reminderKindStreak => '연속';

  @override
  String get reminderKindCustom => '사용자 지정';

  @override
  String get settingsReminders => '학습 알림';

  @override
  String get settingsRemindersOff => '꺼짐 — 하루 알림을 켜세요.';

  @override
  String get settingsReminderTime => '알림 시간';

  @override
  String get settingsReminderDenied => '알림이 차단되어 있습니다 — 시스템 설정에서 허용하세요.';

  @override
  String notifDurationHours(String value) {
    return '$value시간';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value분';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 오늘 밤: 정상을 유지하려면 $duration';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course 오늘 $duration 남음';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count개 더)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail. 오늘을 마치려면 기록하세요.';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $course이(가) 지연 상태가 되었습니다';
  }

  @override
  String notifBehindBodyPace(String left, String days, String pace, String catchUp) {
    return '$left 남음, $days일 남음 — 여기서부터 $pace/일. 정상으로 돌아가려면 $catchUp을(를) 기록하세요.';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '$left 남음, $days일 남음 — 여기서부터 $pace/일. $left 전체를 마쳐야 해결됩니다 — 오늘 밤 시작하세요.';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$left 아직 남았고 마감일이 오늘입니다. 지금 기록하는 모든 것이 반영됩니다.';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $course이(가) 내일 마감이며 $left 남았습니다';
  }

  @override
  String get notifDeadlineTomorrowBody => '오늘 기록하는 모든 것은 두 배가 됩니다.';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ $days일 후 $course 시험 — $left 남음';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return '$pace/일입니다. 나누세요: 하루 2번이 한 번의 마라톤보다 낫습니다.';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => '지금 기록하는 매 시간이 반영됩니다.';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $course이(가) 마감일을 넘겼고 $left 남았습니다';
  }

  @override
  String get notifOverdueBody => '마감일을 옮기거나 시간을 채우세요 — 그때까지 이 과목은 관심 필요 상태로 남습니다.';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days일 연속 — 이번 주 $week';
  }

  @override
  String get notifStreakBody => '모든 과목이 정상 또는 앞서감입니다. 잘하고 있어요.';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 학습 체크인: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 업데이트할 시간: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left 남음 · 제시간에 마치려면 $pace/일. 진도를 업데이트하려면 기록하세요.';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$left 아직 남음 — 지금 기록하는 모든 것이 반영됩니다.';
  }

  @override
  String reminderPreviewNext(String time) {
    return '다음: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1일';

  @override
  String get reminderPreviewFwdDay => '+1일';

  @override
  String get reminderPreviewFake => '(가상)';

  @override
  String get reminderPreviewDemoLabel => '데모 체크인';
}
