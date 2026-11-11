// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => '取消';

  @override
  String get commonClose => '关闭';

  @override
  String get commonDelete => '删除';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonError => '错误';

  @override
  String get commonNone => '无';

  @override
  String get commonSave => '保存';

  @override
  String courseFormAutoHoursValue(String value) {
    return '所需学时（自动）：$value';
  }

  @override
  String get courseFormClearDeadlineTooltip => '清除截止日期';

  @override
  String get courseFormClearStartTooltip => '清除开始日期';

  @override
  String get courseFormColorLabel => '颜色';

  @override
  String get courseFormDateNotSet => '未设置';

  @override
  String courseFormDeadlineButton(String date) {
    return '截止日期：$date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS 学分';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value 小时/ECTS';
  }

  @override
  String get courseFormNameLabel => '名称';

  @override
  String get courseFormNotesLabel => '备注（可选）';

  @override
  String get courseFormSaving => '保存中…';

  @override
  String courseFormStartButton(String date) {
    return '开始日期：$date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return '关闭：在 $date 之前无压力；不计入今日进度。';
  }

  @override
  String get courseFormStartEarlyOn => '开启：时间分摊至现在，并计入今日进度。';

  @override
  String get courseFormStartEarlyTitle => '尽管开始日期在未来，仍立即开始';

  @override
  String get courseFormTitleAdd => '添加课程';

  @override
  String get courseFormTitleEdit => '编辑课程';

  @override
  String get coursesAddTooltip => '添加课程';

  @override
  String coursesDeleteBody(String name) {
    return '删除“$name”及其所有学习记录？此操作无法撤销。';
  }

  @override
  String get coursesDeleteTitle => '删除课程？';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => '点击“新建课程”创建第一门课程。';

  @override
  String get coursesEmptyTitle => '暂无课程';

  @override
  String get coursesFilterAll => '全部状态';

  @override
  String get coursesFilterEmpty => '没有符合此筛选条件的课程';

  @override
  String get coursesNewCourse => '新建课程';

  @override
  String coursesPaceNeeded(String daily) {
    return '需要 $daily 小时/天';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '需要 $daily 小时/天 • $weekly 小时/周';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required 小时 • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => '删除示例课程';

  @override
  String coursesShownCount(String count) {
    return '已显示 $count 门';
  }

  @override
  String coursesSortOption(String label) {
    return '排序：$label';
  }

  @override
  String get dashboardAllDone => '全部完成';

  @override
  String dashboardBonusLogged(String hours) {
    return '已记录 $hours 小时（额外）';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count 门课程';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count 门课程 · $upcoming 门即将开始，未计入今日进度';
  }

  @override
  String get dashboardCoursesTitle => '课程';

  @override
  String dashboardDeadline(String date) {
    return '截止日期 $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return '截止日期 $date（还剩 $days 天）';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return '截止日期 $date（还剩 1 天）';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return '截止日期 $date（已逾期）';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return '截止日期 $date（今天）';
  }

  @override
  String dashboardDueToday(String hours) {
    return '今日到期 — 已记录 $hours 小时';
  }

  @override
  String get dashboardEmptyHintAllDone => '所有课程均已完成——完整列表请见“课程”选项卡。';

  @override
  String get dashboardEmptyHintNoCourses => '添加课程以开始跟踪 ECTS 进度。';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return '落后 = 实际 $achieved/天，需要 $need/天';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return '落后 = 实际 $achieved/天，需要 $need/天 · 提前开始';
  }

  @override
  String get dashboardExplainerBehindNoPace => '落后：截止今天仍有剩余学时，无法算出有限的每日进度';

  @override
  String get dashboardExplainerOnTrackNoPace => '进度正常：暂无每日进度——记录第一次学习后确认';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days 天后开始 · 从 $date 起计算';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days 天后开始 · 从 $date 起计算 · 已提前开始';
  }

  @override
  String get dashboardFreshStart => '重新开始';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · 还剩 $hours 小时';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required 小时';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours 小时/天';
  }

  @override
  String get dashboardLogSessionAction => '记录学习会话';

  @override
  String get dashboardLogSessionTooltip => '记录学习会话';

  @override
  String get dashboardNewBadge => '新建';

  @override
  String get dashboardNoCourses => '暂无课程';

  @override
  String get dashboardNoDeadline => '无截止日期';

  @override
  String get dashboardNoDeadlines => '未安排截止日期';

  @override
  String get dashboardNoPaceDue => '今日无到期进度';

  @override
  String get dashboardNothingDue => '暂无到期';

  @override
  String get dashboardNothingToTrack => '暂无可跟踪内容';

  @override
  String dashboardPaceDueToday(String hours) {
    return '今日到期 — 还剩 $hours 小时';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return '需要 $daily 小时/天才能完成';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return '需要 $daily 小时/天 · $weekly 小时/周才能完成';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '自 $date 起需要 $hours 小时/天 · 未计入今日进度';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return '无截止日期 — 还剩 $hours 小时 · 无每日压力';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date 开始 · 待完成 $hours 小时';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · 不切实际';
  }

  @override
  String get dashboardProgramBare => '学习计划';

  @override
  String get dashboardProgramEmptyHint => '添加课程以开始跟踪';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required 小时';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return '学习计划 $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '还剩 $days 天缓冲期';
  }

  @override
  String get dashboardStartNotSet => '未设置';

  @override
  String dashboardStartsIn(String days) {
    return '$days 天后开始';
  }

  @override
  String get dashboardStartsSoon => '即将开始';

  @override
  String get dashboardTipEmpty => '添加第一门课程——每日进度和进展将显示在这里。';

  @override
  String get dashboardTipFirst => '最初的 25 分钟最重要——先选最先到期的课程。';

  @override
  String get dashboardTodayBare => '今日';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace 小时';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return '今日 $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => '今日进度';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '今日 $logged / $pace 小时';
  }

  @override
  String get dashboardUpcomingSubtitle => '未来开始——今日无压力，未计入今日进度。';

  @override
  String get dashboardUpcomingTitle => '即将开始';

  @override
  String get devToolsActivate => '激活';

  @override
  String get devToolsActivateMessage => '这将解锁隐藏的压力测试工具（生成模拟数据）。仅用于开发。';

  @override
  String get devToolsActivateTitle => '激活开发者模式？';

  @override
  String get devToolsActivated => '开发者模式已激活。';

  @override
  String get devToolsClearPumped => '清除生成的数据';

  @override
  String get devToolsClearPumpedMessage => '删除生成的 STRESS 课程及其学习记录。您自己的数据会被保留。';

  @override
  String get devToolsClearPumpedSubtitle => '删除生成的 STRESS 课程和学习记录。';

  @override
  String get devToolsClearPumpedTitle => '清除生成的数据？';

  @override
  String devToolsCleared(String count) {
    return '已清除 $count 门生成课程。';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      '二次确认：这将增加课程、列表、图表和进度计算的数据量，可能需要几秒钟。现在生成吗？';

  @override
  String get devToolsConfirmPumpTitle => '确认压力测试数据生成';

  @override
  String get devToolsContinue => '继续';

  @override
  String get devToolsExit => '退出开发者模式';

  @override
  String get devToolsExitSubtitle => '在此设备上隐藏开发者工具。';

  @override
  String get devToolsPumpData => '生成数据';

  @override
  String get devToolsPumpMessage =>
      '这将插入一个逼真的模拟学期（约 10 门课程、过去 12 周约 800 条记录）。现有数据会被保留。继续吗？';

  @override
  String get devToolsPumpSubtitle => '插入模拟学期（约 10 门课程、约 800 条记录、12 周）。保留现有数据。';

  @override
  String get devToolsPumpTile => '生成测试数据';

  @override
  String get devToolsPumpTitle => '生成测试数据？';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '已生成 $courses 门课程、$sessions 条记录。';
  }

  @override
  String get devToolsPumping => '正在生成测试数据…';

  @override
  String get devToolsRemoveAll => '删除所有数据';

  @override
  String get devToolsRemoveAllMessage => '开发者快捷操作：这将永久删除所有课程、学习记录和设置。此操作无法撤销。';

  @override
  String get devToolsRemoveAllSubtitle => '开发者快捷操作：删除所有课程、学习记录和设置。';

  @override
  String get devToolsRemoveAllTitle => '删除所有数据？';

  @override
  String get navCourses => '课程';

  @override
  String get navDashboard => '仪表盘';

  @override
  String get navSettings => '设置';

  @override
  String get navStatistics => '统计';

  @override
  String get navStudyLog => '学习记录';

  @override
  String get sampleBadge => '示例';

  @override
  String get sessionFormCourseLabel => '课程';

  @override
  String sessionFormDateButton(String date) {
    return '日期：$date';
  }

  @override
  String get sessionFormDurationError => '时长必须大于零。';

  @override
  String get sessionFormHoursLabel => '小时';

  @override
  String get sessionFormLogAction => '记录会话';

  @override
  String get sessionFormMinutesLabel => '分钟';

  @override
  String get sessionFormNoCourseError => '请选择课程。';

  @override
  String get sessionFormNoCoursesHint => '请先添加课程，再记录学习会话。';

  @override
  String get sessionFormNotesLabel => '备注（可选）';

  @override
  String get sessionFormSaving => '保存中…';

  @override
  String get sessionFormTitleAdd => '记录学习会话';

  @override
  String get sessionFormTitleEdit => '编辑学习会话';

  @override
  String sessionFormTotalHours(String hours) {
    return '总计：$hours 小时';
  }

  @override
  String get settingsAccent => '主题颜色';

  @override
  String get settingsAccentBerry => '浆果色';

  @override
  String get settingsAccentClay => '陶土色';

  @override
  String get settingsAccentForest => '森林绿';

  @override
  String get settingsAccentSlate => '石板灰';

  @override
  String get settingsAccentTeal => '青色';

  @override
  String get settingsAccentUpdated => '主题颜色已更新。';

  @override
  String get settingsAllDataDeleted => '所有数据已删除。';

  @override
  String get settingsAppearance => '外观（深色 / 浅色）';

  @override
  String get settingsCheckingSample => '正在检查示例数据…';

  @override
  String get settingsClear => '清除';

  @override
  String get settingsClearSample => '清除示例数据';

  @override
  String get settingsClearSampleMessage => '这将删除示例课程和学习记录。您自己添加的课程或记录不会被删除。';

  @override
  String get settingsClearSampleSubtitle => '删除预置的示例课程和学习记录。保留您自己的数据。';

  @override
  String get settingsClearSampleTitle => '清除示例数据？';

  @override
  String get settingsCopy => '复制';

  @override
  String get settingsDailyError => '请输入 0 或正数的分钟数。';

  @override
  String get settingsDailyLabel => '每天分钟数（0 = 无目标）';

  @override
  String get settingsDailyTarget => '每日学习目标';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes 分钟/天';
  }

  @override
  String get settingsDailyUpdated => '每日目标已更新。';

  @override
  String get settingsData => '数据';

  @override
  String get settingsDeleteEverything => '删除全部';

  @override
  String get settingsDevMode => '开发者模式';

  @override
  String get settingsDisplay => '显示';

  @override
  String get settingsDisplayComfortable => '舒适';

  @override
  String get settingsDisplayCompact => '紧凑';

  @override
  String get settingsDisplayLarge => '大';

  @override
  String get settingsDisplaySize => '文字与元素大小';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label（$percent%）';
  }

  @override
  String get settingsDisplaySizeUpdated => '显示大小已更新。';

  @override
  String get settingsExport => '导出数据';

  @override
  String get settingsExportCopied => '导出内容已复制到剪贴板。';

  @override
  String get settingsExportSubtitle => '将所有课程、学习记录和设置复制为 JSON。';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses 门课程 · $sessions 条记录 · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '…（已截断——完整备份为 $kb KB，请用“复制”获取全部内容）';
  }

  @override
  String get settingsFirstWeekday => '每周起始日';

  @override
  String get settingsFirstWeekdayUpdated => '每周起始日已更新。';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label（按住 $seconds 秒）';
  }

  @override
  String get settingsHoldToReplace => '按住以替换全部内容';

  @override
  String get settingsHoursError => '请输入大于零的数字。';

  @override
  String get settingsHoursHelper => '默认为 30。修改后会重新计算所需学时；学习记录保留。';

  @override
  String get settingsHoursLabel => '每 ECTS 学分学时数';

  @override
  String get settingsHoursPerEcts => '每 ECTS 学时数';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value 小时';
  }

  @override
  String get settingsHoursUpdated => '每 ECTS 学时数已更新。';

  @override
  String get settingsImport => '导入数据';

  @override
  String get settingsImportAppend => '追加';

  @override
  String get settingsImportAppendAction => '导入（追加）';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return '数据已追加：新增 $courses 门课程、$sessions 条记录。';
  }

  @override
  String get settingsImportInfo => '追加是指将备份添加到当前数据旁（保留设置）。替换会先清空所有课程、学习记录和设置。';

  @override
  String get settingsImportLabel => '粘贴导出的 JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses 门课程 · $sessions 条记录';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · 导出于 $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · 架构 v$schema';
  }

  @override
  String get settingsImportReplace => '替换';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return '替换会先删除所有内容。请按住下方按钮 $seconds 秒以确认。';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return '数据已替换：恢复了 $courses 门课程、$sessions 条记录。';
  }

  @override
  String get settingsImportSubtitle => '从之前导出的 JSON 备份替换所有数据。';

  @override
  String settingsKeepHolding(String remaining) {
    return '继续按住… $remaining 秒';
  }

  @override
  String get settingsNoSample => '无示例数据';

  @override
  String get settingsNoSampleSubtitle => '预置示例数据已清除。';

  @override
  String get settingsNoTarget => '未设置目标';

  @override
  String get settingsOverloadError => '请输入 5–100 小时/周的数字。';

  @override
  String get settingsOverloadHelper => '超过此值的未来负荷周将标红。全日制学习约为 35–40 小时/周。';

  @override
  String settingsOverloadHours(String value) {
    return '$value 小时';
  }

  @override
  String get settingsOverloadLabel => '每周小时数（5–100）';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/周标红';
  }

  @override
  String get settingsOverloadThreshold => '每周过载阈值';

  @override
  String get settingsOverloadUpdated => '过载阈值已更新。';

  @override
  String get settingsPaceTolerance => '领先 / 落后容差';

  @override
  String get settingsPasteValidBackup => '请先粘贴有效的备份';

  @override
  String get settingsReset => '重置';

  @override
  String get settingsResetAll => '重置所有数据';

  @override
  String get settingsResetAllMessage =>
      '这将永久删除所有课程、学习记录和设置。此操作无法撤销。如有需要，请先导出备份。';

  @override
  String get settingsResetAllSubtitle => '删除所有课程、学习记录和设置。';

  @override
  String get settingsResetAllTitle => '重置所有数据？';

  @override
  String get settingsResetSettings => '重置设置';

  @override
  String get settingsResetSettingsDone => '设置已恢复为默认值。';

  @override
  String get settingsResetSettingsMessage =>
      '恢复每 ECTS 30 学时、无每日目标、周一起始、跟随系统主题、5 天容差、每周 35 小时过载、舒适大小、石板灰。课程和学习记录保留。';

  @override
  String get settingsResetSettingsSubtitle =>
      '恢复默认值：30 小时/ECTS、无目标、周一、系统主题、5 天容差、每周 35 小时过载、舒适大小、石板灰。';

  @override
  String get settingsResetSettingsTitle => '重置设置？';

  @override
  String get settingsSampleData => '示例数据';

  @override
  String settingsSampleDataError(String error) {
    return '错误：$error';
  }

  @override
  String get settingsStudySettings => '学习设置';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsThemeLight => '浅色';

  @override
  String get settingsThemeSystem => '跟随系统';

  @override
  String get settingsThemeTitle => '主题';

  @override
  String get settingsThemeUpdated => '主题已更新。';

  @override
  String settingsToleranceDays(String value) {
    return '$value 天';
  }

  @override
  String get settingsToleranceError => '请输入 0–30 天的数字。';

  @override
  String get settingsToleranceHelper => '领先需要 +N 天盈余，落后为 −N 天。5 = 稳定，0 = 敏感。';

  @override
  String get settingsToleranceLabel => '工作天数（0–30）';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance的工作量';
  }

  @override
  String get settingsToleranceUpdated => '容差已更新。';

  @override
  String get settingsWeekdayFriday => '星期五';

  @override
  String get settingsWeekdayMonday => '星期一';

  @override
  String get settingsWeekdaySaturday => '星期六';

  @override
  String get settingsWeekdaySunday => '星期日';

  @override
  String get settingsWeekdayThursday => '星期四';

  @override
  String get settingsWeekdayTuesday => '星期二';

  @override
  String get settingsWeekdayWednesday => '星期三';

  @override
  String get sortDeadline => '截止日期';

  @override
  String get sortName => '名称';

  @override
  String get sortProgress => '进度';

  @override
  String get sortStatus => '状态';

  @override
  String get startupTitle => '无法启动 ECTS Tracker';

  @override
  String get statsActiveDays => '活跃天数';

  @override
  String statsActiveDaysBadge(int days) {
    return '活跃 $days 天';
  }

  @override
  String get statsAddDeadlines => '添加截止日期以预测负荷。';

  @override
  String get statsComingLoad => '未来负荷';

  @override
  String get statsConsistency => '坚持情况';

  @override
  String get statsConsistencyHint => '过去 30 天的学习天数。每天一小步胜过临时抱佛脚。';

  @override
  String statsConsistencyScore(String percent) {
    return '过去 30 天的 $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return '课程 $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return '课$id';
  }

  @override
  String get statsDidPerDay => '已完成 / 天（14 天）';

  @override
  String get statsEmpty => '暂无学习记录';

  @override
  String get statsGap => '差距';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value 小时';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours小时';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours 小时';
  }

  @override
  String get statsLast30Days => '过去 30 天';

  @override
  String get statsLast7Days => '过去 7 天';

  @override
  String get statsNeedPerDay => '需要 / 天';

  @override
  String get statsNext8Weeks => '未来 8 周';

  @override
  String get statsOfLast30DaysVolume => '占过去 30 天总量的比例';

  @override
  String statsOverloadWarning(String threshold) {
    return '超过 $threshold 小时的过载周将标红——请调整截止日期或削减范围。';
  }

  @override
  String get statsOverview => '概览';

  @override
  String get statsPaceCovers => '过去的进度足以满足需求。保持下去。';

  @override
  String statsPaceShort(String gap) {
    return '过去进度差 $gap 小时/天——请增加学习时间或缩小范围。';
  }

  @override
  String get statsPastVsNeeded => '过去与需求对比';

  @override
  String statsPeakPerWeek(String peak) {
    return '峰值 $peak 小时/周';
  }

  @override
  String get statsPerCourse => '按课程';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done 小时 / $required 小时 · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => '学习次数';

  @override
  String statsSuggestedOrder(String order) {
    return '建议顺序：$order（按截止日期从早到晚）';
  }

  @override
  String get statsTotal => '总计';

  @override
  String get statsTotalVolume => '总量';

  @override
  String get statusAhead => '领先';

  @override
  String get statusBehind => '落后';

  @override
  String get statusCompleted => '已完成';

  @override
  String get statusOnTrack => '正常';

  @override
  String get statusOverdue => '已逾期';

  @override
  String get studyLogDeleteBody => '删除这条学习记录？此操作无法撤销。';

  @override
  String get studyLogDeleteTitle => '删除记录？';

  @override
  String get studyLogEmptyHint => '记录一次学习以跟踪学习时间。';

  @override
  String get studyLogEmptyTitle => '暂无学习记录';

  @override
  String get studyLogFabLabel => '记录会话';

  @override
  String get studyLogFabTooltip => '记录会话';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours 小时';
  }

  @override
  String get studyLogRemoveSampleTooltip => '删除示例记录';

  @override
  String get studyLogThisWeek => '本周';

  @override
  String get studyLogToday => '今天';

  @override
  String studyLogUnknownCourse(String id) {
    return '课程 $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return '课$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS 必须大于零';

  @override
  String get validationCourseEctsRequired => '请输入 ECTS 学分';

  @override
  String get validationCourseNameRequired => '名称为必填项';

  @override
  String get validationCourseNameTooLong => '名称过长';

  @override
  String get validationSessionCourseRequired => '请选择课程';

  @override
  String get validationSessionDurationRequired => '请输入时长';

  @override
  String get widgetNoProgress => '暂无进展';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsLiquidGlass => '液态玻璃';

  @override
  String get settingsLiquidGlassSubtitle => '磨砂玻璃卡片和栏。关闭则保持经典纯色外观。';

  @override
  String get settingsLiquidGlassOn => '开';

  @override
  String get settingsLiquidGlassOff => '关';

  @override
  String get settingsLiquidGlassUpdated => '液态玻璃已更新。';

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
  String get settingsReminders => 'Study reminders';

  @override
  String get settingsRemindersOff => 'Off — turn on for a daily nudge.';

  @override
  String get settingsReminderTime => 'Reminder time';

  @override
  String get settingsReminderDenied =>
      'Notifications are blocked — enable them in system settings.';
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => '取消';

  @override
  String get commonClose => '关闭';

  @override
  String get commonDelete => '删除';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonError => '错误';

  @override
  String get commonNone => '无';

  @override
  String get commonSave => '保存';

  @override
  String courseFormAutoHoursValue(String value) {
    return '所需学时（自动）：$value';
  }

  @override
  String get courseFormClearDeadlineTooltip => '清除截止日期';

  @override
  String get courseFormClearStartTooltip => '清除开始日期';

  @override
  String get courseFormColorLabel => '颜色';

  @override
  String get courseFormDateNotSet => '未设置';

  @override
  String courseFormDeadlineButton(String date) {
    return '截止日期：$date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS 学分';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value 小时/ECTS';
  }

  @override
  String get courseFormNameLabel => '名称';

  @override
  String get courseFormNotesLabel => '备注（可选）';

  @override
  String get courseFormSaving => '保存中…';

  @override
  String courseFormStartButton(String date) {
    return '开始日期：$date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return '关闭：在 $date 之前无压力；不计入今日进度。';
  }

  @override
  String get courseFormStartEarlyOn => '开启：时间分摊至现在，并计入今日进度。';

  @override
  String get courseFormStartEarlyTitle => '尽管开始日期在未来，仍立即开始';

  @override
  String get courseFormTitleAdd => '添加课程';

  @override
  String get courseFormTitleEdit => '编辑课程';

  @override
  String get coursesAddTooltip => '添加课程';

  @override
  String coursesDeleteBody(String name) {
    return '删除“$name”及其所有学习记录？此操作无法撤销。';
  }

  @override
  String get coursesDeleteTitle => '删除课程？';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => '点击“新建课程”创建第一门课程。';

  @override
  String get coursesEmptyTitle => '暂无课程';

  @override
  String get coursesFilterAll => '全部状态';

  @override
  String get coursesFilterEmpty => '没有符合此筛选条件的课程';

  @override
  String get coursesNewCourse => '新建课程';

  @override
  String coursesPaceNeeded(String daily) {
    return '需要 $daily 小时/天';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '需要 $daily 小时/天 • $weekly 小时/周';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required 小时 • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => '删除示例课程';

  @override
  String coursesShownCount(String count) {
    return '已显示 $count 门';
  }

  @override
  String coursesSortOption(String label) {
    return '排序：$label';
  }

  @override
  String get dashboardAllDone => '全部完成';

  @override
  String dashboardBonusLogged(String hours) {
    return '已记录 $hours 小时（额外）';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count 门课程';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count 门课程 · $upcoming 门即将开始，未计入今日进度';
  }

  @override
  String get dashboardCoursesTitle => '课程';

  @override
  String dashboardDeadline(String date) {
    return '截止日期 $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return '截止日期 $date（还剩 $days 天）';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return '截止日期 $date（还剩 1 天）';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return '截止日期 $date（已逾期）';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return '截止日期 $date（今天）';
  }

  @override
  String dashboardDueToday(String hours) {
    return '今日到期 — 已记录 $hours 小时';
  }

  @override
  String get dashboardEmptyHintAllDone => '所有课程均已完成——完整列表请见“课程”选项卡。';

  @override
  String get dashboardEmptyHintNoCourses => '添加课程以开始跟踪 ECTS 进度。';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return '落后 = 实际 $achieved/天，需要 $need/天';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return '落后 = 实际 $achieved/天，需要 $need/天 · 提前开始';
  }

  @override
  String get dashboardExplainerBehindNoPace => '落后：截止今天仍有剩余学时，无法算出有限的每日进度';

  @override
  String get dashboardExplainerOnTrackNoPace => '进度正常：暂无每日进度——记录第一次学习后确认';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days 天后开始 · 从 $date 起计算';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days 天后开始 · 从 $date 起计算 · 已提前开始';
  }

  @override
  String get dashboardFreshStart => '重新开始';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · 还剩 $hours 小时';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required 小时';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours 小时/天';
  }

  @override
  String get dashboardLogSessionAction => '记录学习会话';

  @override
  String get dashboardLogSessionTooltip => '记录学习会话';

  @override
  String get dashboardNewBadge => '新建';

  @override
  String get dashboardNoCourses => '暂无课程';

  @override
  String get dashboardNoDeadline => '无截止日期';

  @override
  String get dashboardNoDeadlines => '未安排截止日期';

  @override
  String get dashboardNoPaceDue => '今日无到期进度';

  @override
  String get dashboardNothingDue => '暂无到期';

  @override
  String get dashboardNothingToTrack => '暂无可跟踪内容';

  @override
  String dashboardPaceDueToday(String hours) {
    return '今日到期 — 还剩 $hours 小时';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return '需要 $daily 小时/天才能完成';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return '需要 $daily 小时/天 · $weekly 小时/周才能完成';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '自 $date 起需要 $hours 小时/天 · 未计入今日进度';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return '无截止日期 — 还剩 $hours 小时 · 无每日压力';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date 开始 · 待完成 $hours 小时';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · 不切实际';
  }

  @override
  String get dashboardProgramBare => '学习计划';

  @override
  String get dashboardProgramEmptyHint => '添加课程以开始跟踪';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required 小时';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return '学习计划 $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '还剩 $days 天缓冲期';
  }

  @override
  String get dashboardStartNotSet => '未设置';

  @override
  String dashboardStartsIn(String days) {
    return '$days 天后开始';
  }

  @override
  String get dashboardStartsSoon => '即将开始';

  @override
  String get dashboardTipEmpty => '添加第一门课程——每日进度和进展将显示在这里。';

  @override
  String get dashboardTipFirst => '最初的 25 分钟最重要——先选最先到期的课程。';

  @override
  String get dashboardTodayBare => '今日';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace 小时';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return '今日 $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => '今日进度';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '今日 $logged / $pace 小时';
  }

  @override
  String get dashboardUpcomingSubtitle => '未来开始——今日无压力，未计入今日进度。';

  @override
  String get dashboardUpcomingTitle => '即将开始';

  @override
  String get devToolsActivate => '激活';

  @override
  String get devToolsActivateMessage => '这将解锁隐藏的压力测试工具（生成模拟数据）。仅用于开发。';

  @override
  String get devToolsActivateTitle => '激活开发者模式？';

  @override
  String get devToolsActivated => '开发者模式已激活。';

  @override
  String get devToolsClearPumped => '清除生成的数据';

  @override
  String get devToolsClearPumpedMessage => '删除生成的 STRESS 课程及其学习记录。您自己的数据会被保留。';

  @override
  String get devToolsClearPumpedSubtitle => '删除生成的 STRESS 课程和学习记录。';

  @override
  String get devToolsClearPumpedTitle => '清除生成的数据？';

  @override
  String devToolsCleared(String count) {
    return '已清除 $count 门生成课程。';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      '二次确认：这将增加课程、列表、图表和进度计算的数据量，可能需要几秒钟。现在生成吗？';

  @override
  String get devToolsConfirmPumpTitle => '确认压力测试数据生成';

  @override
  String get devToolsContinue => '继续';

  @override
  String get devToolsExit => '退出开发者模式';

  @override
  String get devToolsExitSubtitle => '在此设备上隐藏开发者工具。';

  @override
  String get devToolsPumpData => '生成数据';

  @override
  String get devToolsPumpMessage =>
      '这将插入一个逼真的模拟学期（约 10 门课程、过去 12 周约 800 条记录）。现有数据会被保留。继续吗？';

  @override
  String get devToolsPumpSubtitle => '插入模拟学期（约 10 门课程、约 800 条记录、12 周）。保留现有数据。';

  @override
  String get devToolsPumpTile => '生成测试数据';

  @override
  String get devToolsPumpTitle => '生成测试数据？';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '已生成 $courses 门课程、$sessions 条记录。';
  }

  @override
  String get devToolsPumping => '正在生成测试数据…';

  @override
  String get devToolsRemoveAll => '删除所有数据';

  @override
  String get devToolsRemoveAllMessage => '开发者快捷操作：这将永久删除所有课程、学习记录和设置。此操作无法撤销。';

  @override
  String get devToolsRemoveAllSubtitle => '开发者快捷操作：删除所有课程、学习记录和设置。';

  @override
  String get devToolsRemoveAllTitle => '删除所有数据？';

  @override
  String get navCourses => '课程';

  @override
  String get navDashboard => '仪表盘';

  @override
  String get navSettings => '设置';

  @override
  String get navStatistics => '统计';

  @override
  String get navStudyLog => '学习记录';

  @override
  String get sampleBadge => '示例';

  @override
  String get sessionFormCourseLabel => '课程';

  @override
  String sessionFormDateButton(String date) {
    return '日期：$date';
  }

  @override
  String get sessionFormDurationError => '时长必须大于零。';

  @override
  String get sessionFormHoursLabel => '小时';

  @override
  String get sessionFormLogAction => '记录会话';

  @override
  String get sessionFormMinutesLabel => '分钟';

  @override
  String get sessionFormNoCourseError => '请选择课程。';

  @override
  String get sessionFormNoCoursesHint => '请先添加课程，再记录学习会话。';

  @override
  String get sessionFormNotesLabel => '备注（可选）';

  @override
  String get sessionFormSaving => '保存中…';

  @override
  String get sessionFormTitleAdd => '记录学习会话';

  @override
  String get sessionFormTitleEdit => '编辑学习会话';

  @override
  String sessionFormTotalHours(String hours) {
    return '总计：$hours 小时';
  }

  @override
  String get settingsAccent => '主题颜色';

  @override
  String get settingsAccentBerry => '浆果色';

  @override
  String get settingsAccentClay => '陶土色';

  @override
  String get settingsAccentForest => '森林绿';

  @override
  String get settingsAccentSlate => '石板灰';

  @override
  String get settingsAccentTeal => '青色';

  @override
  String get settingsAccentUpdated => '主题颜色已更新。';

  @override
  String get settingsAllDataDeleted => '所有数据已删除。';

  @override
  String get settingsAppearance => '外观（深色 / 浅色）';

  @override
  String get settingsCheckingSample => '正在检查示例数据…';

  @override
  String get settingsClear => '清除';

  @override
  String get settingsClearSample => '清除示例数据';

  @override
  String get settingsClearSampleMessage => '这将删除示例课程和学习记录。您自己添加的课程或记录不会被删除。';

  @override
  String get settingsClearSampleSubtitle => '删除预置的示例课程和学习记录。保留您自己的数据。';

  @override
  String get settingsClearSampleTitle => '清除示例数据？';

  @override
  String get settingsCopy => '复制';

  @override
  String get settingsDailyError => '请输入 0 或正数的分钟数。';

  @override
  String get settingsDailyLabel => '每天分钟数（0 = 无目标）';

  @override
  String get settingsDailyTarget => '每日学习目标';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes 分钟/天';
  }

  @override
  String get settingsDailyUpdated => '每日目标已更新。';

  @override
  String get settingsData => '数据';

  @override
  String get settingsDeleteEverything => '删除全部';

  @override
  String get settingsDevMode => '开发者模式';

  @override
  String get settingsDisplay => '显示';

  @override
  String get settingsDisplayComfortable => '舒适';

  @override
  String get settingsDisplayCompact => '紧凑';

  @override
  String get settingsDisplayLarge => '大';

  @override
  String get settingsDisplaySize => '文字与元素大小';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label（$percent%）';
  }

  @override
  String get settingsDisplaySizeUpdated => '显示大小已更新。';

  @override
  String get settingsExport => '导出数据';

  @override
  String get settingsExportCopied => '导出内容已复制到剪贴板。';

  @override
  String get settingsExportSubtitle => '将所有课程、学习记录和设置复制为 JSON。';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses 门课程 · $sessions 条记录 · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '…（已截断——完整备份为 $kb KB，请用“复制”获取全部内容）';
  }

  @override
  String get settingsFirstWeekday => '每周起始日';

  @override
  String get settingsFirstWeekdayUpdated => '每周起始日已更新。';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label（按住 $seconds 秒）';
  }

  @override
  String get settingsHoldToReplace => '按住以替换全部内容';

  @override
  String get settingsHoursError => '请输入大于零的数字。';

  @override
  String get settingsHoursHelper => '默认为 30。修改后会重新计算所需学时；学习记录保留。';

  @override
  String get settingsHoursLabel => '每 ECTS 学分学时数';

  @override
  String get settingsHoursPerEcts => '每 ECTS 学时数';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value 小时';
  }

  @override
  String get settingsHoursUpdated => '每 ECTS 学时数已更新。';

  @override
  String get settingsImport => '导入数据';

  @override
  String get settingsImportAppend => '追加';

  @override
  String get settingsImportAppendAction => '导入（追加）';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return '数据已追加：新增 $courses 门课程、$sessions 条记录。';
  }

  @override
  String get settingsImportInfo => '追加是指将备份添加到当前数据旁（保留设置）。替换会先清空所有课程、学习记录和设置。';

  @override
  String get settingsImportLabel => '粘贴导出的 JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses 门课程 · $sessions 条记录';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · 导出于 $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · 架构 v$schema';
  }

  @override
  String get settingsImportReplace => '替换';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return '替换会先删除所有内容。请按住下方按钮 $seconds 秒以确认。';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return '数据已替换：恢复了 $courses 门课程、$sessions 条记录。';
  }

  @override
  String get settingsImportSubtitle => '从之前导出的 JSON 备份替换所有数据。';

  @override
  String settingsKeepHolding(String remaining) {
    return '继续按住… $remaining 秒';
  }

  @override
  String get settingsNoSample => '无示例数据';

  @override
  String get settingsNoSampleSubtitle => '预置示例数据已清除。';

  @override
  String get settingsNoTarget => '未设置目标';

  @override
  String get settingsOverloadError => '请输入 5–100 小时/周的数字。';

  @override
  String get settingsOverloadHelper => '超过此值的未来负荷周将标红。全日制学习约为 35–40 小时/周。';

  @override
  String settingsOverloadHours(String value) {
    return '$value 小时';
  }

  @override
  String get settingsOverloadLabel => '每周小时数（5–100）';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/周标红';
  }

  @override
  String get settingsOverloadThreshold => '每周过载阈值';

  @override
  String get settingsOverloadUpdated => '过载阈值已更新。';

  @override
  String get settingsPaceTolerance => '领先 / 落后容差';

  @override
  String get settingsPasteValidBackup => '请先粘贴有效的备份';

  @override
  String get settingsReset => '重置';

  @override
  String get settingsResetAll => '重置所有数据';

  @override
  String get settingsResetAllMessage =>
      '这将永久删除所有课程、学习记录和设置。此操作无法撤销。如有需要，请先导出备份。';

  @override
  String get settingsResetAllSubtitle => '删除所有课程、学习记录和设置。';

  @override
  String get settingsResetAllTitle => '重置所有数据？';

  @override
  String get settingsResetSettings => '重置设置';

  @override
  String get settingsResetSettingsDone => '设置已恢复为默认值。';

  @override
  String get settingsResetSettingsMessage =>
      '恢复每 ECTS 30 学时、无每日目标、周一起始、跟随系统主题、5 天容差、每周 35 小时过载、舒适大小、石板灰。课程和学习记录保留。';

  @override
  String get settingsResetSettingsSubtitle =>
      '恢复默认值：30 小时/ECTS、无目标、周一、系统主题、5 天容差、每周 35 小时过载、舒适大小、石板灰。';

  @override
  String get settingsResetSettingsTitle => '重置设置？';

  @override
  String get settingsSampleData => '示例数据';

  @override
  String settingsSampleDataError(String error) {
    return '错误：$error';
  }

  @override
  String get settingsStudySettings => '学习设置';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsThemeLight => '浅色';

  @override
  String get settingsThemeSystem => '跟随系统';

  @override
  String get settingsThemeTitle => '主题';

  @override
  String get settingsThemeUpdated => '主题已更新。';

  @override
  String settingsToleranceDays(String value) {
    return '$value 天';
  }

  @override
  String get settingsToleranceError => '请输入 0–30 天的数字。';

  @override
  String get settingsToleranceHelper => '领先需要 +N 天盈余，落后为 −N 天。5 = 稳定，0 = 敏感。';

  @override
  String get settingsToleranceLabel => '工作天数（0–30）';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance的工作量';
  }

  @override
  String get settingsToleranceUpdated => '容差已更新。';

  @override
  String get settingsWeekdayFriday => '星期五';

  @override
  String get settingsWeekdayMonday => '星期一';

  @override
  String get settingsWeekdaySaturday => '星期六';

  @override
  String get settingsWeekdaySunday => '星期日';

  @override
  String get settingsWeekdayThursday => '星期四';

  @override
  String get settingsWeekdayTuesday => '星期二';

  @override
  String get settingsWeekdayWednesday => '星期三';

  @override
  String get sortDeadline => '截止日期';

  @override
  String get sortName => '名称';

  @override
  String get sortProgress => '进度';

  @override
  String get sortStatus => '状态';

  @override
  String get startupTitle => '无法启动 ECTS Tracker';

  @override
  String get statsActiveDays => '活跃天数';

  @override
  String statsActiveDaysBadge(int days) {
    return '活跃 $days 天';
  }

  @override
  String get statsAddDeadlines => '添加截止日期以预测负荷。';

  @override
  String get statsComingLoad => '未来负荷';

  @override
  String get statsConsistency => '坚持情况';

  @override
  String get statsConsistencyHint => '过去 30 天的学习天数。每天一小步胜过临时抱佛脚。';

  @override
  String statsConsistencyScore(String percent) {
    return '过去 30 天的 $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return '课程 $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return '课$id';
  }

  @override
  String get statsDidPerDay => '已完成 / 天（14 天）';

  @override
  String get statsEmpty => '暂无学习记录';

  @override
  String get statsGap => '差距';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value 小时';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours小时';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours 小时';
  }

  @override
  String get statsLast30Days => '过去 30 天';

  @override
  String get statsLast7Days => '过去 7 天';

  @override
  String get statsNeedPerDay => '需要 / 天';

  @override
  String get statsNext8Weeks => '未来 8 周';

  @override
  String get statsOfLast30DaysVolume => '占过去 30 天总量的比例';

  @override
  String statsOverloadWarning(String threshold) {
    return '超过 $threshold 小时的过载周将标红——请调整截止日期或削减范围。';
  }

  @override
  String get statsOverview => '概览';

  @override
  String get statsPaceCovers => '过去的进度足以满足需求。保持下去。';

  @override
  String statsPaceShort(String gap) {
    return '过去进度差 $gap 小时/天——请增加学习时间或缩小范围。';
  }

  @override
  String get statsPastVsNeeded => '过去与需求对比';

  @override
  String statsPeakPerWeek(String peak) {
    return '峰值 $peak 小时/周';
  }

  @override
  String get statsPerCourse => '按课程';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done 小时 / $required 小时 · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => '学习次数';

  @override
  String statsSuggestedOrder(String order) {
    return '建议顺序：$order（按截止日期从早到晚）';
  }

  @override
  String get statsTotal => '总计';

  @override
  String get statsTotalVolume => '总量';

  @override
  String get statusAhead => '领先';

  @override
  String get statusBehind => '落后';

  @override
  String get statusCompleted => '已完成';

  @override
  String get statusOnTrack => '正常';

  @override
  String get statusOverdue => '已逾期';

  @override
  String get studyLogDeleteBody => '删除这条学习记录？此操作无法撤销。';

  @override
  String get studyLogDeleteTitle => '删除记录？';

  @override
  String get studyLogEmptyHint => '记录一次学习以跟踪学习时间。';

  @override
  String get studyLogEmptyTitle => '暂无学习记录';

  @override
  String get studyLogFabLabel => '记录会话';

  @override
  String get studyLogFabTooltip => '记录会话';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours 小时';
  }

  @override
  String get studyLogRemoveSampleTooltip => '删除示例记录';

  @override
  String get studyLogThisWeek => '本周';

  @override
  String get studyLogToday => '今天';

  @override
  String studyLogUnknownCourse(String id) {
    return '课程 $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return '课$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS 必须大于零';

  @override
  String get validationCourseEctsRequired => '请输入 ECTS 学分';

  @override
  String get validationCourseNameRequired => '名称为必填项';

  @override
  String get validationCourseNameTooLong => '名称过长';

  @override
  String get validationSessionCourseRequired => '请选择课程';

  @override
  String get validationSessionDurationRequired => '请输入时长';

  @override
  String get widgetNoProgress => '暂无进展';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsLiquidGlass => '液态玻璃';

  @override
  String get settingsLiquidGlassSubtitle => '磨砂玻璃卡片和栏。关闭则保持经典纯色外观。';

  @override
  String get settingsLiquidGlassOn => '开';

  @override
  String get settingsLiquidGlassOff => '关';

  @override
  String get settingsLiquidGlassUpdated => '液态玻璃已更新。';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => '取消';

  @override
  String get commonClose => '關閉';

  @override
  String get commonDelete => '刪除';

  @override
  String get commonEdit => '編輯';

  @override
  String get commonError => '錯誤';

  @override
  String get commonNone => '無';

  @override
  String get commonSave => '儲存';

  @override
  String courseFormAutoHoursValue(String value) {
    return '所需學時（自動）：$value';
  }

  @override
  String get courseFormClearDeadlineTooltip => '清除截止日期';

  @override
  String get courseFormClearStartTooltip => '清除開始日期';

  @override
  String get courseFormColorLabel => '顏色';

  @override
  String get courseFormDateNotSet => '未設定';

  @override
  String courseFormDeadlineButton(String date) {
    return '截止日期：$date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS 學分';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value 小時/ECTS';
  }

  @override
  String get courseFormNameLabel => '名稱';

  @override
  String get courseFormNotesLabel => '備註（選填）';

  @override
  String get courseFormSaving => '儲存中…';

  @override
  String courseFormStartButton(String date) {
    return '開始日期：$date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return '關閉：在 $date 之前無壓力；不計入今日進度。';
  }

  @override
  String get courseFormStartEarlyOn => '開啟：時間分攤至現在，並計入今日進度。';

  @override
  String get courseFormStartEarlyTitle => '儘管開始日期在未來，仍立即開始';

  @override
  String get courseFormTitleAdd => '新增課程';

  @override
  String get courseFormTitleEdit => '編輯課程';

  @override
  String get coursesAddTooltip => '新增課程';

  @override
  String coursesDeleteBody(String name) {
    return '刪除「$name」及其所有學習紀錄？此操作無法復原。';
  }

  @override
  String get coursesDeleteTitle => '刪除課程？';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => '點選「新增課程」建立第一門課程。';

  @override
  String get coursesEmptyTitle => '尚無課程';

  @override
  String get coursesFilterAll => '全部狀態';

  @override
  String get coursesFilterEmpty => '沒有符合此篩選條件的課程';

  @override
  String get coursesNewCourse => '新增課程';

  @override
  String coursesPaceNeeded(String daily) {
    return '需要 $daily 小時/天';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '需要 $daily 小時/天 • $weekly 小時/週';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required 小時 • $status';
  }

  @override
  String get coursesRemoveSampleTooltip => '刪除範例課程';

  @override
  String coursesShownCount(String count) {
    return '已顯示 $count 門';
  }

  @override
  String coursesSortOption(String label) {
    return '排序：$label';
  }

  @override
  String get dashboardAllDone => '全部完成';

  @override
  String dashboardBonusLogged(String hours) {
    return '已記錄 $hours 小時（額外）';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count 門課程';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count 門課程 · $upcoming 門即將開始，未計入今日進度';
  }

  @override
  String get dashboardCoursesTitle => '課程';

  @override
  String dashboardDeadline(String date) {
    return '截止日期 $date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return '截止日期 $date（還剩 $days 天）';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return '截止日期 $date（還剩 1 天）';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return '截止日期 $date（已逾期）';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return '截止日期 $date（今天）';
  }

  @override
  String dashboardDueToday(String hours) {
    return '今日到期 — 已記錄 $hours 小時';
  }

  @override
  String get dashboardEmptyHintAllDone => '所有課程均已完成——完整清單請見「課程」分頁。';

  @override
  String get dashboardEmptyHintNoCourses => '新增課程以開始追蹤 ECTS 進度。';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return '落後 = 實際 $achieved/天，需要 $need/天';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return '落後 = 實際 $achieved/天，需要 $need/天 · 提早開始';
  }

  @override
  String get dashboardExplainerBehindNoPace => '落後：截至今天仍有剩餘學時，無法算出有限的每日進度';

  @override
  String get dashboardExplainerOnTrackNoPace => '進度正常：尚無每日進度——記錄第一次學習後確認';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '$days 天後開始 · 從 $date 起計算';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '$days 天後開始 · 從 $date 起計算 · 已提早開始';
  }

  @override
  String get dashboardFreshStart => '重新開始';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '· $pct% · 還剩 $hours 小時';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required 小時';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours 小時/天';
  }

  @override
  String get dashboardLogSessionAction => '記錄學習時段';

  @override
  String get dashboardLogSessionTooltip => '記錄學習時段';

  @override
  String get dashboardNewBadge => '新增';

  @override
  String get dashboardNoCourses => '尚無課程';

  @override
  String get dashboardNoDeadline => '無截止日期';

  @override
  String get dashboardNoDeadlines => '未安排截止日期';

  @override
  String get dashboardNoPaceDue => '今日無到期進度';

  @override
  String get dashboardNothingDue => '暫無到期';

  @override
  String get dashboardNothingToTrack => '暫無可追蹤內容';

  @override
  String dashboardPaceDueToday(String hours) {
    return '今日到期 — 還剩 $hours 小時';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return '需要 $daily 小時/天才能完成';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return '需要 $daily 小時/天 · $weekly 小時/週才能完成';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '自 $date 起需要 $hours 小時/天 · 未計入今日進度';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return '無截止日期 — 還剩 $hours 小時 · 無每日壓力';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date 開始 · 待完成 $hours 小時';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace · 不切實際';
  }

  @override
  String get dashboardProgramBare => '學習計畫';

  @override
  String get dashboardProgramEmptyHint => '新增課程以開始追蹤';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required 小時';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return '學習計畫 $pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '還剩 $days 天緩衝期';
  }

  @override
  String get dashboardStartNotSet => '未設定';

  @override
  String dashboardStartsIn(String days) {
    return '$days 天後開始';
  }

  @override
  String get dashboardStartsSoon => '即將開始';

  @override
  String get dashboardTipEmpty => '新增第一門課程——每日進度和進展將顯示在這裡。';

  @override
  String get dashboardTipFirst => '最初的 25 分鐘最重要——先選最先到期的課程。';

  @override
  String get dashboardTodayBare => '今日';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace 小時';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return '今日 $pct%';
  }

  @override
  String get dashboardTodayPaceLabel => '今日進度';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '今日 $logged / $pace 小時';
  }

  @override
  String get dashboardUpcomingSubtitle => '未來開始——今日無壓力，未計入今日進度。';

  @override
  String get dashboardUpcomingTitle => '即將開始';

  @override
  String get devToolsActivate => '啟用';

  @override
  String get devToolsActivateMessage => '這將解鎖隱藏的壓力測試工具（產生模擬資料）。僅供開發使用。';

  @override
  String get devToolsActivateTitle => '啟用開發人員模式？';

  @override
  String get devToolsActivated => '開發人員模式已啟用。';

  @override
  String get devToolsClearPumped => '清除產生的資料';

  @override
  String get devToolsClearPumpedMessage => '刪除產生的 STRESS 課程及其學習紀錄。您自己的資料會被保留。';

  @override
  String get devToolsClearPumpedSubtitle => '刪除產生的 STRESS 課程和學習紀錄。';

  @override
  String get devToolsClearPumpedTitle => '清除產生的資料？';

  @override
  String devToolsCleared(String count) {
    return '已清除 $count 門產生課程。';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      '二次確認：這將增加課程、清單、圖表和進度計算的資料量，可能需要幾秒鐘。現在產生嗎？';

  @override
  String get devToolsConfirmPumpTitle => '確認壓力測試資料產生';

  @override
  String get devToolsContinue => '繼續';

  @override
  String get devToolsExit => '離開開發人員模式';

  @override
  String get devToolsExitSubtitle => '在此裝置上隱藏開發人員工具。';

  @override
  String get devToolsPumpData => '產生資料';

  @override
  String get devToolsPumpMessage =>
      '這將插入一個寫實的模擬學期（約 10 門課程、過去 12 週約 800 筆紀錄）。現有資料會被保留。要繼續嗎？';

  @override
  String get devToolsPumpSubtitle => '插入模擬學期（約 10 門課程、約 800 筆紀錄、12 週）。保留現有資料。';

  @override
  String get devToolsPumpTile => '產生測試資料';

  @override
  String get devToolsPumpTitle => '產生測試資料？';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '已產生 $courses 門課程、$sessions 筆紀錄。';
  }

  @override
  String get devToolsPumping => '正在產生測試資料…';

  @override
  String get devToolsRemoveAll => '刪除所有資料';

  @override
  String get devToolsRemoveAllMessage => '開發人員捷徑：這將永久刪除所有課程、學習紀錄和設定。此操作無法復原。';

  @override
  String get devToolsRemoveAllSubtitle => '開發人員捷徑：刪除所有課程、學習紀錄和設定。';

  @override
  String get devToolsRemoveAllTitle => '刪除所有資料？';

  @override
  String get navCourses => '課程';

  @override
  String get navDashboard => '儀表板';

  @override
  String get navSettings => '設定';

  @override
  String get navStatistics => '統計';

  @override
  String get navStudyLog => '學習紀錄';

  @override
  String get sampleBadge => '範例';

  @override
  String get sessionFormCourseLabel => '課程';

  @override
  String sessionFormDateButton(String date) {
    return '日期：$date';
  }

  @override
  String get sessionFormDurationError => '時長必須大於零。';

  @override
  String get sessionFormHoursLabel => '小時';

  @override
  String get sessionFormLogAction => '記錄時段';

  @override
  String get sessionFormMinutesLabel => '分鐘';

  @override
  String get sessionFormNoCourseError => '請選擇課程。';

  @override
  String get sessionFormNoCoursesHint => '請先新增課程，再記錄學習時段。';

  @override
  String get sessionFormNotesLabel => '備註（選填）';

  @override
  String get sessionFormSaving => '儲存中…';

  @override
  String get sessionFormTitleAdd => '記錄學習時段';

  @override
  String get sessionFormTitleEdit => '編輯學習時段';

  @override
  String sessionFormTotalHours(String hours) {
    return '總計：$hours 小時';
  }

  @override
  String get settingsAccent => '主題色彩';

  @override
  String get settingsAccentBerry => '莓果色';

  @override
  String get settingsAccentClay => '陶土色';

  @override
  String get settingsAccentForest => '森林綠';

  @override
  String get settingsAccentSlate => '石板灰';

  @override
  String get settingsAccentTeal => '青色';

  @override
  String get settingsAccentUpdated => '主題色彩已更新。';

  @override
  String get settingsAllDataDeleted => '所有資料已刪除。';

  @override
  String get settingsAppearance => '外觀（深色 / 淺色）';

  @override
  String get settingsCheckingSample => '正在檢查範例資料…';

  @override
  String get settingsClear => '清除';

  @override
  String get settingsClearSample => '清除範例資料';

  @override
  String get settingsClearSampleMessage => '這將刪除範例課程和學習紀錄。您自行新增的課程或紀錄不會被刪除。';

  @override
  String get settingsClearSampleSubtitle => '刪除預設的範例課程和學習紀錄。保留您自己的資料。';

  @override
  String get settingsClearSampleTitle => '清除範例資料？';

  @override
  String get settingsCopy => '複製';

  @override
  String get settingsDailyError => '請輸入 0 或正數的分鐘數。';

  @override
  String get settingsDailyLabel => '每天分鐘數（0 = 無目標）';

  @override
  String get settingsDailyTarget => '每日學習目標';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes 分鐘/天';
  }

  @override
  String get settingsDailyUpdated => '每日目標已更新。';

  @override
  String get settingsData => '資料';

  @override
  String get settingsDeleteEverything => '刪除全部';

  @override
  String get settingsDevMode => '開發人員模式';

  @override
  String get settingsDisplay => '顯示';

  @override
  String get settingsDisplayComfortable => '舒適';

  @override
  String get settingsDisplayCompact => '緊湊';

  @override
  String get settingsDisplayLarge => '大';

  @override
  String get settingsDisplaySize => '文字與元素大小';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label（$percent%）';
  }

  @override
  String get settingsDisplaySizeUpdated => '顯示大小已更新。';

  @override
  String get settingsExport => '匯出資料';

  @override
  String get settingsExportCopied => '匯出內容已複製到剪貼簿。';

  @override
  String get settingsExportSubtitle => '將所有課程、學習紀錄和設定複製為 JSON。';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses 門課程 · $sessions 筆紀錄 · $kb KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '…（已截斷——完整備份為 $kb KB，請用「複製」取得全部內容）';
  }

  @override
  String get settingsFirstWeekday => '每週起始日';

  @override
  String get settingsFirstWeekdayUpdated => '每週起始日已更新。';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label（按住 $seconds 秒）';
  }

  @override
  String get settingsHoldToReplace => '按住以取代全部內容';

  @override
  String get settingsHoursError => '請輸入大於零的數字。';

  @override
  String get settingsHoursHelper => '預設為 30。修改後會重新計算所需學時；學習紀錄保留。';

  @override
  String get settingsHoursLabel => '每 ECTS 學分學時數';

  @override
  String get settingsHoursPerEcts => '每 ECTS 學時數';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value 小時';
  }

  @override
  String get settingsHoursUpdated => '每 ECTS 學時數已更新。';

  @override
  String get settingsImport => '匯入資料';

  @override
  String get settingsImportAppend => '附加';

  @override
  String get settingsImportAppendAction => '匯入（附加）';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return '資料已附加：新增 $courses 門課程、$sessions 筆紀錄。';
  }

  @override
  String get settingsImportInfo => '附加是指將備份加到目前資料旁（保留設定）。取代會先清空所有課程、學習紀錄和設定。';

  @override
  String get settingsImportLabel => '貼上匯出的 JSON';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses 門課程 · $sessions 筆紀錄';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return ' · 匯出於 $exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return ' · 結構描述 v$schema';
  }

  @override
  String get settingsImportReplace => '取代';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return '取代會先刪除所有內容。請按住下方按鈕 $seconds 秒以確認。';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return '資料已取代：還原了 $courses 門課程、$sessions 筆紀錄。';
  }

  @override
  String get settingsImportSubtitle => '從先前匯出的 JSON 備份取代所有資料。';

  @override
  String settingsKeepHolding(String remaining) {
    return '繼續按住… $remaining 秒';
  }

  @override
  String get settingsNoSample => '無範例資料';

  @override
  String get settingsNoSampleSubtitle => '預設範例資料已清除。';

  @override
  String get settingsNoTarget => '未設定目標';

  @override
  String get settingsOverloadError => '請輸入 5–100 小時/週的數字。';

  @override
  String get settingsOverloadHelper => '超過此值的未來負荷週將標紅。全職學習約為 35–40 小時/週。';

  @override
  String settingsOverloadHours(String value) {
    return '$value 小時';
  }

  @override
  String get settingsOverloadLabel => '每週小時數（5–100）';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/週標紅';
  }

  @override
  String get settingsOverloadThreshold => '每週過載閾值';

  @override
  String get settingsOverloadUpdated => '過載閾值已更新。';

  @override
  String get settingsPaceTolerance => '領先 / 落後容差';

  @override
  String get settingsPasteValidBackup => '請先貼上有效的備份';

  @override
  String get settingsReset => '重設';

  @override
  String get settingsResetAll => '重設所有資料';

  @override
  String get settingsResetAllMessage =>
      '這將永久刪除所有課程、學習紀錄和設定。此操作無法復原。如有需要，請先匯出備份。';

  @override
  String get settingsResetAllSubtitle => '刪除所有課程、學習紀錄和設定。';

  @override
  String get settingsResetAllTitle => '重設所有資料？';

  @override
  String get settingsResetSettings => '重設設定';

  @override
  String get settingsResetSettingsDone => '設定已恢復為預設值。';

  @override
  String get settingsResetSettingsMessage =>
      '恢復每 ECTS 30 學時、無每日目標、週一開始、跟隨系統主題、5 天容差、每週 35 小時過載、舒適大小、石板灰。課程和學習紀錄保留。';

  @override
  String get settingsResetSettingsSubtitle =>
      '恢復預設值：30 小時/ECTS、無目標、週一、系統主題、5 天容差、每週 35 小時過載、舒適大小、石板灰。';

  @override
  String get settingsResetSettingsTitle => '重設設定？';

  @override
  String get settingsSampleData => '範例資料';

  @override
  String settingsSampleDataError(String error) {
    return '錯誤：$error';
  }

  @override
  String get settingsStudySettings => '學習設定';

  @override
  String get settingsThemeDark => '深色';

  @override
  String get settingsThemeLight => '淺色';

  @override
  String get settingsThemeSystem => '跟隨系統';

  @override
  String get settingsThemeTitle => '主題';

  @override
  String get settingsThemeUpdated => '主題已更新。';

  @override
  String settingsToleranceDays(String value) {
    return '$value 天';
  }

  @override
  String get settingsToleranceError => '請輸入 0–30 天的數字。';

  @override
  String get settingsToleranceHelper => '領先需要 +N 天盈餘，落後為 −N 天。5 = 穩定，0 = 敏感。';

  @override
  String get settingsToleranceLabel => '工作天數（0–30）';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '$tolerance的工作量';
  }

  @override
  String get settingsToleranceUpdated => '容差已更新。';

  @override
  String get settingsWeekdayFriday => '星期五';

  @override
  String get settingsWeekdayMonday => '星期一';

  @override
  String get settingsWeekdaySaturday => '星期六';

  @override
  String get settingsWeekdaySunday => '星期日';

  @override
  String get settingsWeekdayThursday => '星期四';

  @override
  String get settingsWeekdayTuesday => '星期二';

  @override
  String get settingsWeekdayWednesday => '星期三';

  @override
  String get sortDeadline => '截止日期';

  @override
  String get sortName => '名稱';

  @override
  String get sortProgress => '進度';

  @override
  String get sortStatus => '狀態';

  @override
  String get startupTitle => '無法啟動 ECTS Tracker';

  @override
  String get statsActiveDays => '活躍天數';

  @override
  String statsActiveDaysBadge(int days) {
    return '活躍 $days 天';
  }

  @override
  String get statsAddDeadlines => '新增截止日期以預測負荷。';

  @override
  String get statsComingLoad => '未來負荷';

  @override
  String get statsConsistency => '堅持情況';

  @override
  String get statsConsistencyHint => '過去 30 天的學習天數。每天一小步勝過臨時抱佛腳。';

  @override
  String statsConsistencyScore(String percent) {
    return '過去 30 天的 $percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return '課程 $id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return '課$id';
  }

  @override
  String get statsDidPerDay => '已完成 / 天（14 天）';

  @override
  String get statsEmpty => '暫無學習紀錄';

  @override
  String get statsGap => '差距';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value 小時';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours小時';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours 小時';
  }

  @override
  String get statsLast30Days => '過去 30 天';

  @override
  String get statsLast7Days => '過去 7 天';

  @override
  String get statsNeedPerDay => '需要 / 天';

  @override
  String get statsNext8Weeks => '未來 8 週';

  @override
  String get statsOfLast30DaysVolume => '佔過去 30 天總量的比例';

  @override
  String statsOverloadWarning(String threshold) {
    return '超過 $threshold 小時的過載週將標紅——請調整截止日期或縮減範圍。';
  }

  @override
  String get statsOverview => '總覽';

  @override
  String get statsPaceCovers => '過去的進度足以滿足需求。保持下去。';

  @override
  String statsPaceShort(String gap) {
    return '過去進度差 $gap 小時/天——請增加學習時間或縮小範圍。';
  }

  @override
  String get statsPastVsNeeded => '過去與需求對比';

  @override
  String statsPeakPerWeek(String peak) {
    return '峰值 $peak 小時/週';
  }

  @override
  String get statsPerCourse => '按課程';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done 小時 / $required 小時 · $percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => '學習次數';

  @override
  String statsSuggestedOrder(String order) {
    return '建議順序：$order（按截止日期從早到晚）';
  }

  @override
  String get statsTotal => '總計';

  @override
  String get statsTotalVolume => '總量';

  @override
  String get statusAhead => '領先';

  @override
  String get statusBehind => '落後';

  @override
  String get statusCompleted => '已完成';

  @override
  String get statusOnTrack => '正常';

  @override
  String get statusOverdue => '已逾期';

  @override
  String get studyLogDeleteBody => '刪除這筆學習紀錄？此操作無法復原。';

  @override
  String get studyLogDeleteTitle => '刪除紀錄？';

  @override
  String get studyLogEmptyHint => '記錄一次學習以追蹤學習時間。';

  @override
  String get studyLogEmptyTitle => '尚無學習紀錄';

  @override
  String get studyLogFabLabel => '記錄時段';

  @override
  String get studyLogFabTooltip => '記錄時段';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours 小時';
  }

  @override
  String get studyLogRemoveSampleTooltip => '刪除範例紀錄';

  @override
  String get studyLogThisWeek => '本週';

  @override
  String get studyLogToday => '今天';

  @override
  String studyLogUnknownCourse(String id) {
    return '課程 $id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return '課$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTS 必須大於零';

  @override
  String get validationCourseEctsRequired => '請輸入 ECTS 學分';

  @override
  String get validationCourseNameRequired => '名稱為必填項目';

  @override
  String get validationCourseNameTooLong => '名稱過長';

  @override
  String get validationSessionCourseRequired => '請選擇課程';

  @override
  String get validationSessionDurationRequired => '請輸入時長';

  @override
  String get widgetNoProgress => '尚無進展';

  @override
  String get settingsLanguage => '語言';

  @override
  String get settingsLiquidGlass => '液態玻璃';

  @override
  String get settingsLiquidGlassSubtitle => '磨砂玻璃卡片和欄。關閉則保持經典純色外觀。';

  @override
  String get settingsLiquidGlassOn => '開';

  @override
  String get settingsLiquidGlassOff => '關';

  @override
  String get settingsLiquidGlassUpdated => '液態玻璃已更新。';
}
