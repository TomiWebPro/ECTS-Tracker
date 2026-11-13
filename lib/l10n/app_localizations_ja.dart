// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'ECTS Tracker';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonClose => '閉じる';

  @override
  String get commonDelete => '削除';

  @override
  String get commonEdit => '編集';

  @override
  String get commonError => 'エラー';

  @override
  String get commonNone => 'なし';

  @override
  String get commonSave => '保存';

  @override
  String courseFormAutoHoursValue(String value) {
    return '必要な時間（自動）: $value';
  }

  @override
  String get courseFormClearDeadlineTooltip => '期限をクリア';

  @override
  String get courseFormClearStartTooltip => '開始日をクリア';

  @override
  String get courseFormColorLabel => '色';

  @override
  String get courseFormDateNotSet => '未設定';

  @override
  String courseFormDeadlineButton(String date) {
    return '期限: $date';
  }

  @override
  String get courseFormEctsLabel => 'ECTS単位';

  @override
  String courseFormHoursPerEctsValue(String value) {
    return '$value時間/ECTS';
  }

  @override
  String get courseFormNameLabel => '名前';

  @override
  String get courseFormNotesLabel => 'メモ（任意）';

  @override
  String get courseFormSaving => '保存中…';

  @override
  String courseFormStartButton(String date) {
    return '開始: $date';
  }

  @override
  String courseFormStartEarlyOff(String date) {
    return 'オフ: $dateまで負担なし。今日のペースから除外。';
  }

  @override
  String get courseFormStartEarlyOn => 'オン: 今までの時間を分割し、今日のペースに含める。';

  @override
  String get courseFormStartEarlyTitle => '開始日が先でも今始める';

  @override
  String get courseFormTitleAdd => '科目を追加';

  @override
  String get courseFormTitleEdit => '科目を編集';

  @override
  String get coursesAddTooltip => '科目を追加';

  @override
  String coursesDeleteBody(String name) {
    return '「$name」とすべての学習記録を削除しますか？元に戻せません。';
  }

  @override
  String get coursesDeleteTitle => '科目を削除しますか？';

  @override
  String coursesEctsValue(double credits) {
    return '$credits ECTS';
  }

  @override
  String get coursesEmptyHint => '「新規科目」をタップして最初の科目を作成しましょう。';

  @override
  String get coursesEmptyTitle => '科目がまだありません';

  @override
  String get coursesFilterAll => 'すべてのステータス';

  @override
  String get coursesFilterEmpty => 'このフィルターに合う科目がありません';

  @override
  String get coursesNewCourse => '新規科目';

  @override
  String coursesPaceNeeded(String daily) {
    return '$daily時間/日が必要';
  }

  @override
  String coursesPaceNeededMinutes(String daily) {
    return '$daily分/日が必要';
  }

  @override
  String coursesPaceNeededWeekly(String daily, String weekly) {
    return '$daily時間/日・$weekly時間/週が必要';
  }

  @override
  String coursesPaceNeededWeeklyMinutes(String daily, String weekly) {
    return '$daily分/日・$weekly分/週が必要';
  }

  @override
  String coursesPaceNeededWeeklyMinutesHours(String daily, String weekly) {
    return '$daily分/日・$weekly時間/週が必要';
  }

  @override
  String coursesProgressWithStatus(
    String done,
    String required,
    String status,
  ) {
    return '$done / $required時間・$status';
  }

  @override
  String get coursesRemoveSampleTooltip => 'サンプル科目を削除';

  @override
  String coursesShownCount(String count) {
    return '$count件表示';
  }

  @override
  String coursesSortOption(String label) {
    return '並べ替え: $label';
  }

  @override
  String get dashboardAllDone => 'すべて完了';

  @override
  String dashboardBonusLogged(String hours) {
    return '$hours時間記録（ボーナス）';
  }

  @override
  String dashboardCourseCount(String count) {
    return '$count科目';
  }

  @override
  String dashboardCourseCountWithUpcoming(String count, String upcoming) {
    return '$count科目・$upcoming件は今後のため今日のペース除外';
  }

  @override
  String get dashboardCoursesTitle => '科目';

  @override
  String dashboardDeadline(String date) {
    return '期限$date';
  }

  @override
  String dashboardDeadlineDaysLeft(String date, String days) {
    return '期限$date（残り$days日）';
  }

  @override
  String dashboardDeadlineOneDayLeft(String date) {
    return '期限$date（残り1日）';
  }

  @override
  String dashboardDeadlineOverdue(String date) {
    return '期限$date（期限切れ）';
  }

  @override
  String dashboardDeadlineToday(String date) {
    return '期限$date（今日）';
  }

  @override
  String dashboardDueToday(String hours) {
    return '今日が期限 — $hours時間記録済み';
  }

  @override
  String get dashboardEmptyHintAllDone => 'すべての科目が完了です — 一覧は「科目」タブで確認できます。';

  @override
  String get dashboardEmptyHintNoCourses => '科目を追加してECTSの進捗管理を始めましょう。';

  @override
  String dashboardExplainerBehind(String achieved, String need) {
    return '遅れ: $achieved/日に対して$need/日が必要';
  }

  @override
  String dashboardExplainerBehindEarly(String achieved, String need) {
    return '遅れ: $achieved/日に対して$need/日が必要・先行開始';
  }

  @override
  String get dashboardExplainerBehindNoPace => '遅れ: 今日が期限で残り時間あり、有限のペースなし';

  @override
  String get dashboardExplainerOnTrackNoPace => '順調: まだペースなし — 最初の記録で確定します';

  @override
  String dashboardExplainerStartsIn(String days, String date) {
    return '開始まで$days日・$dateから計算';
  }

  @override
  String dashboardExplainerStartsInEarly(String days, String date) {
    return '開始まで$days日・$dateから計算・先行開始オン';
  }

  @override
  String get dashboardFreshStart => 'フレッシュスタート';

  @override
  String dashboardHoursDetail(String pct, String hours) {
    return '・$pct%・残り$hours時間';
  }

  @override
  String dashboardHoursFraction(String done, String required) {
    return '$done / $required時間';
  }

  @override
  String dashboardHoursPerDay(String hours) {
    return '$hours時間/日';
  }

  @override
  String dashboardMinutesPerDay(String minutes) {
    return '$minutes分/日';
  }

  @override
  String get dashboardLogSessionAction => '学習を記録';

  @override
  String get dashboardLogSessionTooltip => '学習を記録';

  @override
  String get dashboardNewBadge => 'NEW';

  @override
  String get dashboardNoCourses => '科目がまだありません';

  @override
  String get dashboardNoDeadline => '期限なし';

  @override
  String get dashboardNoDeadlines => '予定された期限がありません';

  @override
  String get dashboardNoPaceDue => '今日のペースなし';

  @override
  String get dashboardNothingDue => '期限なし';

  @override
  String get dashboardNothingToTrack => 'まだ記録対象がありません';

  @override
  String dashboardPaceDueToday(String hours) {
    return '今日が期限 — 残り$hours時間';
  }

  @override
  String dashboardPaceNeedDaily(String daily) {
    return '完了には$daily時間/日が必要';
  }

  @override
  String dashboardPaceNeedDailyMinutes(String daily) {
    return '完了には$daily分/日が必要';
  }

  @override
  String dashboardPaceNeedDailyWeekly(String daily, String weekly) {
    return '完了には$daily時間/日・$weekly時間/週が必要';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutes(String daily, String weekly) {
    return '完了には$daily分/日・$weekly分/週が必要';
  }

  @override
  String dashboardPaceNeedDailyWeeklyMinutesHours(String daily, String weekly) {
    return '完了には$daily分/日・$weekly時間/週が必要';
  }

  @override
  String dashboardPaceNeedFrom(String hours, String date) {
    return '$dateから$hours時間/日が必要・今日のペース対象外';
  }

  @override
  String dashboardPaceNeedFromMinutes(String minutes, String date) {
    return '$dateから$minutes分/日が必要・今日のペース対象外';
  }

  @override
  String dashboardPaceNoDeadline(String hours) {
    return '期限なし — 残り$hours時間・毎日の負担なし';
  }

  @override
  String dashboardPaceStarts(String date, String hours) {
    return '$date開始・$hours時間あり';
  }

  @override
  String dashboardPaceUnrealistic(String pace) {
    return '$pace・非現実的';
  }

  @override
  String get dashboardProgramBare => 'プログラム';

  @override
  String get dashboardProgramEmptyHint => '科目を追加して記録を始めましょう';

  @override
  String dashboardProgramHours(String done, String required) {
    return '$done / $required時間';
  }

  @override
  String dashboardProgramLabel(String pct) {
    return 'プログラム$pct%';
  }

  @override
  String dashboardRunwayDays(int days) {
    return '残り$days日分';
  }

  @override
  String get dashboardStartNotSet => '未設定';

  @override
  String dashboardStartsIn(String days) {
    return '$days日後に開始';
  }

  @override
  String get dashboardStartsSoon => 'まもなく開始';

  @override
  String get dashboardTipEmpty => '最初の科目を追加しましょう — 毎日のペースと進捗がここに表示されます。';

  @override
  String get dashboardTipFirst => '最初の25分が最も重要 — 期限が近い科目から取り組みましょう。';

  @override
  String get dashboardTodayBare => '今日';

  @override
  String dashboardTodayHours(String logged, String pace) {
    return '$logged / $pace時間';
  }

  @override
  String dashboardTodayLabel(String pct) {
    return '今日$pct%';
  }

  @override
  String get dashboardTodayPaceLabel => '今日のペース';

  @override
  String dashboardTodayProgress(String logged, String pace) {
    return '今日$logged / $pace時間';
  }

  @override
  String get dashboardUpcomingSubtitle => '今後の開始 — 今日は負担なし、今日のペースから除外。';

  @override
  String get dashboardUpcomingTitle => '今後の予定';

  @override
  String get devToolsActivate => '有効化';

  @override
  String get devToolsActivateMessage => '隠しストレステストツール（生成データの投入）を解除します。開発専用です。';

  @override
  String get devToolsActivateTitle => '開発モードを有効にしますか？';

  @override
  String get devToolsActivated => '開発モードを有効にしました。';

  @override
  String get devToolsClearPumped => '生成データをクリア';

  @override
  String get devToolsClearPumpedMessage =>
      '生成されたSTRESS科目と記録を削除します。自分のデータは保持されます。';

  @override
  String get devToolsClearPumpedSubtitle => '生成されたSTRESS科目と記録を削除します。';

  @override
  String get devToolsClearPumpedTitle => '生成データをクリアしますか？';

  @override
  String devToolsCleared(String count) {
    return '$count件の生成科目をクリアしました。';
  }

  @override
  String get devToolsConfirmPumpMessage =>
      '最終確認: 科目・リスト・グラフ・ペース計算が膨張し、数秒かかる場合があります。今投入しますか？';

  @override
  String get devToolsConfirmPumpTitle => 'ストレステスト投入の確認';

  @override
  String get devToolsContinue => '続ける';

  @override
  String get devToolsExit => '開発モードを終了';

  @override
  String get devToolsExitSubtitle => 'この端末で開発ツールを非表示にします。';

  @override
  String get devToolsPumpData => 'データを投入';

  @override
  String get devToolsPumpMessage =>
      '現実的な生成学期（約10科目、過去12週間で約800記録）を挿入します。既存データは保持されます。続けますか？';

  @override
  String get devToolsPumpSubtitle => '生成学期を挿入（約10科目・約800記録・12週間）。既存データは保持。';

  @override
  String get devToolsPumpTile => 'テストデータを投入';

  @override
  String get devToolsPumpTitle => 'テストデータを投入しますか？';

  @override
  String devToolsPumped(String courses, String sessions) {
    return '$courses科目、$sessions記録を投入しました。';
  }

  @override
  String get devToolsPumping => 'テストデータを投入中…';

  @override
  String get devToolsRemoveAll => 'すべてのデータを削除';

  @override
  String get devToolsRemoveAllMessage =>
      '開発用ショートカット: すべての科目・記録・設定を完全に削除します。元に戻せません。';

  @override
  String get devToolsRemoveAllSubtitle => '開発用ショートカット: すべての科目・記録・設定を削除。';

  @override
  String get devToolsRemoveAllTitle => 'すべてのデータを削除しますか？';

  @override
  String get navCourses => '科目';

  @override
  String get navDashboard => 'ダッシュボード';

  @override
  String get navSettings => '設定';

  @override
  String get navStatistics => '統計';

  @override
  String get navStudyLog => '学習記録';

  @override
  String get sampleBadge => 'サンプル';

  @override
  String get sessionFormCourseLabel => '科目';

  @override
  String sessionFormDateButton(String date) {
    return '日付: $date';
  }

  @override
  String get sessionFormDurationError => '時間は0より大きくしてください。';

  @override
  String get sessionFormHoursLabel => '時間';

  @override
  String get sessionFormLogAction => '記録する';

  @override
  String get sessionFormMinutesLabel => '分';

  @override
  String get sessionFormNoCourseError => '科目を選択してください。';

  @override
  String get sessionFormNoCoursesHint => '先に科目を追加してから記録しましょう。';

  @override
  String get sessionFormNotesLabel => 'メモ（任意）';

  @override
  String get sessionFormSaving => '保存中…';

  @override
  String get sessionFormTitleAdd => '学習を記録';

  @override
  String get sessionFormTitleEdit => '学習記録を編集';

  @override
  String sessionFormTotalHours(String hours) {
    return '合計: $hours時間';
  }

  @override
  String get settingsAccent => 'テーマカラー';

  @override
  String get settingsAccentBerry => 'ベリー';

  @override
  String get settingsAccentClay => 'クレイ';

  @override
  String get settingsAccentForest => 'フォレスト';

  @override
  String get settingsAccentSlate => 'スレート';

  @override
  String get settingsAccentTeal => 'ティール';

  @override
  String get settingsAccentUpdated => 'テーマカラーを更新しました。';

  @override
  String get settingsAllDataDeleted => 'すべてのデータを削除しました。';

  @override
  String get settingsAppearance => '外観（ダーク/ライト）';

  @override
  String get settingsCheckingSample => 'サンプルデータを確認中…';

  @override
  String get settingsClear => 'クリア';

  @override
  String get settingsClearSample => 'サンプルデータをクリア';

  @override
  String get settingsClearSampleMessage =>
      'サンプルの科目と記録を削除します。自分で追加した科目・記録は削除されません。';

  @override
  String get settingsClearSampleSubtitle => 'サンプルの科目と記録を削除します。自分のデータは保持されます。';

  @override
  String get settingsClearSampleTitle => 'サンプルデータをクリアしますか？';

  @override
  String get settingsCopy => 'コピー';

  @override
  String get settingsDailyError => '0または正の分数値を入力してください。';

  @override
  String get settingsDailyLabel => '1日あたりの分数（0=目標なし）';

  @override
  String get settingsDailyTarget => '毎日の学習目標';

  @override
  String settingsDailyTargetValue(String minutes) {
    return '$minutes分/日';
  }

  @override
  String get settingsDailyUpdated => '毎日の目標を更新しました。';

  @override
  String get settingsData => 'データ';

  @override
  String get settingsDeleteEverything => 'すべて削除';

  @override
  String get settingsDevMode => '開発モード';

  @override
  String get settingsDisplay => '表示';

  @override
  String get settingsDisplayComfortable => '標準';

  @override
  String get settingsDisplayCompact => 'コンパクト';

  @override
  String get settingsDisplayLarge => '大';

  @override
  String get settingsDisplaySize => '文字と要素のサイズ';

  @override
  String settingsDisplaySizeOption(String label, String percent) {
    return '$label（$percent%）';
  }

  @override
  String get settingsDisplaySizeUpdated => '表示サイズを更新しました。';

  @override
  String get settingsExport => 'データをエクスポート';

  @override
  String get settingsExportCopied => 'エクスポートをクリップボードにコピーしました。';

  @override
  String get settingsExportSubtitle => 'すべての科目・記録・設定をJSONとしてコピーします。';

  @override
  String settingsExportSummary(String courses, String sessions, String kb) {
    return '$courses科目・$sessions記録・${kb}KB';
  }

  @override
  String settingsExportTruncated(String kb) {
    return '…（省略 — フルバックアップは${kb}KB、すべてコピーを使用）';
  }

  @override
  String get settingsFirstWeekday => '週の開始曜日';

  @override
  String get settingsFirstWeekdayUpdated => '週の開始曜日を更新しました。';

  @override
  String settingsHoldLabel(String label, String seconds) {
    return '$label（$seconds秒長押し）';
  }

  @override
  String get settingsHoldToReplace => '長押しですべて置き換え';

  @override
  String get settingsHoursError => '0より大きい数値を入力してください。';

  @override
  String get settingsHoursHelper => '既定は30。変更すると必要時間が再計算されます。記録は保持されます。';

  @override
  String get settingsHoursLabel => 'ECTSあたりの時間';

  @override
  String get settingsHoursPerEcts => 'ECTSあたり時間';

  @override
  String settingsHoursPerEctsValue(String value) {
    return '$value時間';
  }

  @override
  String get settingsHoursUpdated => 'ECTSあたり時間を更新しました。';

  @override
  String get settingsImport => 'データをインポート';

  @override
  String get settingsImportAppend => '追加';

  @override
  String get settingsImportAppendAction => 'インポート（追加）';

  @override
  String settingsImportAppended(String courses, String sessions) {
    return 'データを追加しました: $courses科目、$sessions記録を追加。';
  }

  @override
  String get settingsImportInfo =>
      '追加は現在のデータにバックアップを加えます（設定は保持）。置き換えは先にすべての科目・記録・設定を消去します。';

  @override
  String get settingsImportLabel => 'エクスポートしたJSONを貼り付け';

  @override
  String settingsImportPreview(String courses, String sessions) {
    return '$courses科目・$sessions記録';
  }

  @override
  String settingsImportPreviewExported(String exportedAt) {
    return '・エクスポート$exportedAt';
  }

  @override
  String settingsImportPreviewSchema(String schema) {
    return '・スキーマv$schema';
  }

  @override
  String get settingsImportReplace => '置き換え';

  @override
  String settingsImportReplaceWarning(String seconds) {
    return '置き換えは先にすべて削除します。下のボタンを$seconds秒間長押しして確定してください。';
  }

  @override
  String settingsImportReplaced(String courses, String sessions) {
    return 'データを置き換えました: $courses科目、$sessions記録を復元。';
  }

  @override
  String get settingsImportSubtitle => '以前エクスポートしたJSONバックアップからすべてのデータを置き換えます。';

  @override
  String settingsKeepHolding(String remaining) {
    return '押し続けてください…残り$remaining秒';
  }

  @override
  String get settingsNoSample => 'サンプルデータなし';

  @override
  String get settingsNoSampleSubtitle => 'サンプルデータはすでにクリアされています。';

  @override
  String get settingsNoTarget => '目標未設定';

  @override
  String get settingsOverloadError => '5〜100時間/週の数値を入力してください。';

  @override
  String get settingsOverloadHelper =>
      'この値を超える週は赤く警告されます。フルタイム学習は約35〜40時間/週です。';

  @override
  String settingsOverloadHours(String value) {
    return '$value時間';
  }

  @override
  String get settingsOverloadLabel => '週あたり時間（5〜100）';

  @override
  String settingsOverloadSubtitle(String value) {
    return '$value/週で赤く警告';
  }

  @override
  String get settingsOverloadThreshold => '週の過負荷しきい値';

  @override
  String get settingsOverloadUpdated => '過負荷しきい値を更新しました。';

  @override
  String get settingsPaceTolerance => '先行/遅れの許容';

  @override
  String get settingsPasteValidBackup => '先に有効なバックアップを貼り付けてください';

  @override
  String get settingsReset => 'リセット';

  @override
  String get settingsResetAll => 'すべてのデータをリセット';

  @override
  String get settingsResetAllMessage =>
      'すべての科目・記録・設定を完全に削除します。元に戻せません。必要なら先にバックアップをエクスポートしてください。';

  @override
  String get settingsResetAllSubtitle => 'すべての科目・記録・設定を削除します。';

  @override
  String get settingsResetAllTitle => 'すべてのデータをリセットしますか？';

  @override
  String get settingsResetSettings => '設定をリセット';

  @override
  String get settingsResetSettingsDone => '設定を既定値に戻しました。';

  @override
  String get settingsResetSettingsMessage =>
      'ECTSあたり時間（30）、毎日目標（なし）、週開始（月曜）、テーマ（システム）、許容（5日）、過負荷（35時間/週）、サイズ（標準）、色（スレート）に戻します。科目と記録は保持されます。';

  @override
  String get settingsResetSettingsSubtitle =>
      '既定値に戻す: 30時間/ECTS、目標なし、月曜、システムテーマ、5日許容、35時間/週、標準サイズ、スレート。';

  @override
  String get settingsResetSettingsTitle => '設定をリセットしますか？';

  @override
  String get settingsSampleData => 'サンプルデータ';

  @override
  String settingsSampleDataError(String error) {
    return 'エラー: $error';
  }

  @override
  String get settingsStudySettings => '学習設定';

  @override
  String get settingsThemeDark => 'ダーク';

  @override
  String get settingsThemeLight => 'ライト';

  @override
  String get settingsThemeSystem => 'システム既定';

  @override
  String get settingsThemeTitle => 'テーマ';

  @override
  String get settingsThemeUpdated => 'テーマを更新しました。';

  @override
  String settingsToleranceDays(String value) {
    return '$value日';
  }

  @override
  String get settingsToleranceError => '0〜30日の数値を入力してください。';

  @override
  String get settingsToleranceHelper => '先行は+N日の余裕、遅れは−N日が必要です。5=安定、0=敏感。';

  @override
  String get settingsToleranceLabel => '作業日数（0〜30）';

  @override
  String settingsToleranceOfWork(String tolerance) {
    return '作業の$tolerance';
  }

  @override
  String get settingsToleranceUpdated => '許容を更新しました。';

  @override
  String get settingsWeekdayFriday => '金曜日';

  @override
  String get settingsWeekdayMonday => '月曜日';

  @override
  String get settingsWeekdaySaturday => '土曜日';

  @override
  String get settingsWeekdaySunday => '日曜日';

  @override
  String get settingsWeekdayThursday => '木曜日';

  @override
  String get settingsWeekdayTuesday => '火曜日';

  @override
  String get settingsWeekdayWednesday => '水曜日';

  @override
  String get sortDeadline => '期限';

  @override
  String get sortName => '名前';

  @override
  String get sortProgress => '進捗';

  @override
  String get sortStatus => 'ステータス';

  @override
  String get startupTitle => 'ECTS Trackerを起動できませんでした';

  @override
  String get statsActiveDays => '学習日数';

  @override
  String statsActiveDaysBadge(int days) {
    return '$days日学習';
  }

  @override
  String get statsAddDeadlines => '期限を追加して負担を予測しましょう。';

  @override
  String get statsComingLoad => '今後の負担';

  @override
  String get statsConsistency => '継続性';

  @override
  String get statsConsistencyHint => '過去30日間の学習日数。詰め込みより毎日の小さな一歩が効果的です。';

  @override
  String statsConsistencyScore(String percent) {
    return '過去30日間の$percent%';
  }

  @override
  String statsCourseFallback(int id) {
    return '科目$id';
  }

  @override
  String statsCourseShortFallback(int id) {
    return 'C$id';
  }

  @override
  String get statsDidPerDay => '実績/日（14日）';

  @override
  String get statsEmpty => '記録がまだありません';

  @override
  String get statsGap => '差';

  @override
  String statsGapValue(String sign, String value) {
    return '$sign$value時間';
  }

  @override
  String statsHoursCompact(String hours) {
    return '$hours時間';
  }

  @override
  String statsHoursValue(String hours) {
    return '$hours時間';
  }

  @override
  String get statsLast30Days => '過去30日';

  @override
  String get statsLast7Days => '過去7日';

  @override
  String get statsNeedPerDay => '必要/日';

  @override
  String get statsNext8Weeks => '今後8週間';

  @override
  String get statsOfLast30DaysVolume => '過去30日間の量のうち';

  @override
  String statsOverloadWarning(String threshold) {
    return '過負荷の週（>$threshold時間）は赤表示 — 期限をずらすか範囲を減らしましょう。';
  }

  @override
  String get statsOverview => '概要';

  @override
  String get statsPaceCovers => 'これまでのペースで十分です。その調子を続けましょう。';

  @override
  String statsPaceShort(String gap) {
    return 'これまでのペースは$gap時間/日不足 — 時間を確保するか範囲を調整しましょう。';
  }

  @override
  String get statsPastVsNeeded => '実績と必要量';

  @override
  String statsPeakPerWeek(String peak) {
    return 'ピーク$peak時間/週';
  }

  @override
  String get statsPerCourse => '科目別';

  @override
  String statsPerCourseProgress(String done, String required, String percent) {
    return '$done時間 / $required時間・$percent%';
  }

  @override
  String statsPercentValue(String percent) {
    return '$percent%';
  }

  @override
  String get statsSessions => '記録数';

  @override
  String statsSuggestedOrder(String order) {
    return 'おすすめ順: $order（期限が近い順）';
  }

  @override
  String get statsTotal => '合計';

  @override
  String get statsTotalVolume => '合計量';

  @override
  String get statusAhead => '先行';

  @override
  String get statusBehind => '遅れ';

  @override
  String get statusCompleted => '完了';

  @override
  String get statusOnTrack => '順調';

  @override
  String get statusOverdue => '期限切れ';

  @override
  String get studyLogDeleteBody => 'この学習記録を削除しますか？元に戻せません。';

  @override
  String get studyLogDeleteTitle => '記録を削除しますか？';

  @override
  String get studyLogEmptyHint => '記録を追加して学習時間を管理しましょう。';

  @override
  String get studyLogEmptyTitle => '学習記録がまだありません';

  @override
  String get studyLogFabLabel => '記録する';

  @override
  String get studyLogFabTooltip => '記録する';

  @override
  String studyLogHoursValue(String hours) {
    return '$hours時間';
  }

  @override
  String get studyLogRemoveSampleTooltip => 'サンプル記録を削除';

  @override
  String get studyLogThisWeek => '今週';

  @override
  String get studyLogToday => '今日';

  @override
  String studyLogUnknownCourse(String id) {
    return '科目$id';
  }

  @override
  String studyLogUnknownCourseShort(String id) {
    return 'C$id';
  }

  @override
  String get validationCourseEctsPositive => 'ECTSは0より大きくしてください';

  @override
  String get validationCourseEctsRequired => 'ECTS単位を入力してください';

  @override
  String get validationCourseNameRequired => '名前は必須です';

  @override
  String get validationCourseNameTooLong => '名前が長すぎます';

  @override
  String get validationSessionCourseRequired => '科目を選択してください';

  @override
  String get validationSessionDurationRequired => '時間を入力してください';

  @override
  String get widgetNoProgress => 'まだ進捗がありません';

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsLiquidGlass => 'リキッドガラス';

  @override
  String get settingsLiquidGlassSubtitle =>
      'すりガラス風のカードとバー。オフでは従来のソリッドな見た目になります。';

  @override
  String get settingsLiquidGlassOn => 'オン';

  @override
  String get settingsLiquidGlassOff => 'オフ';

  @override
  String get settingsLiquidGlassUpdated => 'リキッドガラスを更新しました。';

  @override
  String get devToolsReminderPreview => 'リマインダープレビュー';

  @override
  String get devToolsReminderPreviewSubtitle =>
      '今通知される内容を確認。Windowsでも安全なテストフィード。';

  @override
  String get reminderPreviewTitle => 'リマインダープレビュー';

  @override
  String get reminderPreviewNow => 'プレビュー時刻';

  @override
  String get reminderPreviewReset => '今';

  @override
  String get reminderPreviewEmpty => '静かです — この時刻に通知はありません。';

  @override
  String get reminderPreviewCustom => 'カスタムスケジュール（デモ）';

  @override
  String get reminderPreviewNoFire => '予定された通知はありません。';

  @override
  String get reminderKindDaily => '毎日';

  @override
  String get reminderKindBehind => '遅れ';

  @override
  String get reminderKindDeadline => '期限';

  @override
  String get reminderKindOverdue => '期限切れ';

  @override
  String get reminderKindStreak => '連続';

  @override
  String get reminderKindCustom => 'カスタム';

  @override
  String get settingsReminders => '学習リマインダー';

  @override
  String get settingsRemindersOff => 'オフ — 毎日の通知をオンにしましょう。';

  @override
  String get settingsReminderTime => 'リマインダー時刻';

  @override
  String get settingsReminderDenied => '通知がブロックされています — システム設定で有効にしてください。';

  @override
  String notifDurationHours(String value) {
    return '$value時間';
  }

  @override
  String notifDurationMinutes(String value) {
    return '$value分';
  }

  @override
  String notifDailyTitle(String duration) {
    return '📚 今夜: 順調を保つには$duration';
  }

  @override
  String notifDailyCourseNeed(String course, String duration) {
    return '$course 今日残り$duration';
  }

  @override
  String notifDailyMore(String count) {
    return '(+$count件ほか)';
  }

  @override
  String notifDailyBody(String detail) {
    return '$detail。今日をクリアするために記録しましょう。';
  }

  @override
  String notifBehindTitle(String course) {
    return '🔻 $courseが遅れになりました';
  }

  @override
  String notifBehindBodyPace(
    String left,
    String days,
    String pace,
    String catchUp,
  ) {
    return '残り$left、あと$days日 — ここからは$pace/日。$catchUpを記録して順調に戻しましょう。';
  }

  @override
  String notifBehindBodyFull(String left, String days, String pace) {
    return '残り$left、あと$days日 — ここからは$pace/日。$leftを全部終わらせるしかありません — 今夜から始めましょう。';
  }

  @override
  String notifBehindBodyDeadlineDay(String left) {
    return '$leftが残っていて期限は今日です。今記録するものはすべて反映されます。';
  }

  @override
  String notifDeadlineTomorrowTitle(String course, String left) {
    return '🚨 $courseは明日が期限で、まだ$left残っています';
  }

  @override
  String get notifDeadlineTomorrowBody => '今日記録するものは2倍になります。';

  @override
  String notifDeadlineSoonTitle(String course, String days, String left) {
    return '⏳ $courseの試験まであと$days日 — 残り$left';
  }

  @override
  String notifDeadlineSoonBody(String pace) {
    return '$pace/日が必要です。分割しましょう: 1日2回は1回のマラソンより効果的です。';
  }

  @override
  String get notifDeadlineSoonBodyNoPace => '今記録する1時間1時間が反映されます。';

  @override
  String notifOverdueTitle(String course, String left) {
    return '❌ $courseは期限を過ぎ、$left残っています';
  }

  @override
  String get notifOverdueBody => '期限を延ばすか時間を終わらせましょう — それまでこの科目は要対応のままです。';

  @override
  String notifStreakTitle(String days, String week) {
    return '🔥 $days日連続 — 今週$week';
  }

  @override
  String get notifStreakBody => 'すべての科目が順調か先行です。いい調子です。';

  @override
  String notifCustomTitleAuto(String course) {
    return '📚 学習チェックイン: $course';
  }

  @override
  String notifCustomTitleCourse(String course) {
    return '📚 更新の時間: $course';
  }

  @override
  String notifCustomBodyPace(String left, String pace) {
    return '$left残っています · 時間通りに終えるには$pace/日。進捗を更新するために記録しましょう。';
  }

  @override
  String notifCustomBodyNoPace(String left) {
    return '$leftが残っています — 今記録するものはすべて反映されます。';
  }

  @override
  String reminderPreviewNext(String time) {
    return '次: $time';
  }

  @override
  String get reminderPreviewBackDay => '-1日';

  @override
  String get reminderPreviewFwdDay => '+1日';

  @override
  String get reminderPreviewFake => '(仮)';

  @override
  String get reminderPreviewDemoLabel => 'デモチェックイン';
}
