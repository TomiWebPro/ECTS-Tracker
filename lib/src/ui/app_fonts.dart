import 'package:flutter/widgets.dart';

/// CJK font fallback (system fonts, no bundling).
///
/// Flutter desktop has no opinionated CJK fallback: on Windows it often
/// resolves to serif legacy fonts (SimSun / PMingLiU / MS Mincho / Batang)
/// which look mismatched next to the sans Latin UI. These lists force the
/// modern sans equivalents first:
///
/// - SC: Microsoft YaHei (Win) / PingFang SC (Apple) / Noto Sans SC (Android)
/// - TC: Microsoft JhengHei / PingFang TC / Noto Sans TC
/// - JP: Yu Gothic UI + Meiryo (Win) / Hiragino (Apple) / Noto Sans JP
/// - KR: Malgun Gothic (Win) / Apple SD Gothic Neo / Noto Sans KR
///
/// Order matters for Han unification (same codepoint, different glyph per
/// locale), so the caller must pick the list matching the active locale via
/// [fontFallbackForLocale] — never a single global order.
class AppFonts {
  const AppFonts._();

  static const List<String> simplified = [
    'Microsoft YaHei',
    'PingFang SC',
    'Hiragino Sans GB',
    'Noto Sans SC',
    'Source Han Sans SC',
    'DengXian',
    'sans-serif',
  ];

  static const List<String> traditional = [
    'Microsoft JhengHei',
    'PingFang TC',
    'Hiragino Sans TC',
    'Noto Sans TC',
    'Source Han Sans TC',
    'sans-serif',
  ];

  static const List<String> japanese = [
    'Yu Gothic UI',
    'Meiryo',
    'Hiragino Kaku Gothic ProN',
    'Hiragino Sans',
    'Noto Sans JP',
    'Source Han Sans JP',
    'sans-serif',
  ];

  static const List<String> korean = [
    'Malgun Gothic',
    'Apple SD Gothic Neo',
    'Noto Sans KR',
    'Source Han Sans KR',
    'sans-serif',
  ];

  /// Generic fallback when locale is unknown: SC-first union. Fixes the
  /// SimSun-vs-YaHei complaint for the majority case (Simplified UI) while
  /// still covering TC/JP/KR with modern sans instead of serif legacy.
  static const List<String> general = [
    'Microsoft YaHei',
    'PingFang SC',
    'Microsoft JhengHei',
    'PingFang TC',
    'Yu Gothic UI',
    'Meiryo',
    'Malgun Gothic',
    'Apple SD Gothic Neo',
    'Hiragino Sans GB',
    'Noto Sans SC',
    'Noto Sans TC',
    'Noto Sans JP',
    'Noto Sans KR',
    'Source Han Sans SC',
    'sans-serif',
  ];
}

/// Picks the sans-first fallback matching [locale] (language + script).
/// `zh-Hans` (incl. bare `zh`) → simplified, `zh-Hant` → traditional,
/// `ja` → japanese, `ko` → korean, everything else → [AppFonts.general].
List<String> fontFallbackForLocale(Locale? locale) {
  if (locale == null) return AppFonts.general;
  if (locale.languageCode == 'zh') {
    if (locale.scriptCode?.toLowerCase() == 'hant') {
      return AppFonts.traditional;
    }
    // Hans explicitly, or bare zh (most deployments are Simplified-first).
    return AppFonts.simplified;
  }
  if (locale.languageCode == 'ja') return AppFonts.japanese;
  if (locale.languageCode == 'ko') return AppFonts.korean;
  return AppFonts.general;
}

/// Convenience for settings codes (`zh_Hans`, `zh_Hant`, `ja`, `ko`, …).
/// Null/unknown → [AppFonts.general]; caller should prefer
/// [fontFallbackForLocale] with the resolved system locale when possible.
List<String> fontFallbackForCode(String? code) {
  if (code == null || code.isEmpty) return AppFonts.general;
  if (code == 'zh_Hant') return AppFonts.traditional;
  if (code == 'zh_Hans' || code == 'zh') return AppFonts.simplified;
  if (code == 'ja') return AppFonts.japanese;
  if (code == 'ko') return AppFonts.korean;
  return AppFonts.general;
}
