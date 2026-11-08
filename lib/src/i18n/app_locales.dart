import 'package:flutter/widgets.dart';

/// Canonical locale registry for ECTS Tracker (M8: full localization).
///
/// [code] is the persisted settings value and matches the ARB `@@locale`
/// tag (and file suffix): simple language codes (`de`), plus `zh`,
/// `zh_Hans` and `zh_Hant` for Chinese. `null` means "system default".
///
/// One selectable app language: persisted [code] + endonym shown in the
/// picker (never localized — a German user finds "Deutsch" anywhere).
class AppLocaleOption {
  const AppLocaleOption(this.code, this.nativeName);

  /// Persisted value (`@@locale` tag). `zh_Hans`/`zh_Hant` select the
  /// script-specific Chinese translations.
  final String code;

  /// Language name in its own language.
  final String nativeName;
}

/// All selectable languages, English first, then alphabetical by code.
/// The bare `zh` fallback exists only for locale resolution; the picker
/// offers the two script-specific variants instead.
const List<AppLocaleOption> kAppLocales = [
  AppLocaleOption('en', 'English'),
  AppLocaleOption('az', 'Azərbaycan dili'),
  AppLocaleOption('be', 'Беларуская'),
  AppLocaleOption('bg', 'Български'),
  AppLocaleOption('bn', 'বাংলা'),
  AppLocaleOption('ca', 'Català'),
  AppLocaleOption('cs', 'Čeština'),
  AppLocaleOption('cy', 'Cymraeg'),
  AppLocaleOption('da', 'Dansk'),
  AppLocaleOption('de', 'Deutsch'),
  AppLocaleOption('el', 'Ελληνικά'),
  AppLocaleOption('es', 'Español'),
  AppLocaleOption('et', 'Eesti'),
  AppLocaleOption('eu', 'Euskara'),
  AppLocaleOption('fi', 'Suomi'),
  AppLocaleOption('fo', 'Føroyskt'),
  AppLocaleOption('fr', 'Français'),
  AppLocaleOption('ga', 'Gaeilge'),
  AppLocaleOption('gd', 'Gàidhlig'),
  AppLocaleOption('hi', 'हिन्दी'),
  AppLocaleOption('hu', 'Magyar'),
  AppLocaleOption('hy', 'Հայերեն'),
  AppLocaleOption('id', 'Bahasa Indonesia'),
  AppLocaleOption('is', 'Íslenska'),
  AppLocaleOption('it', 'Italiano'),
  AppLocaleOption('ja', '日本語'),
  AppLocaleOption('ka', 'ქართული'),
  AppLocaleOption('ko', '한국어'),
  AppLocaleOption('lb', 'Lëtzebuergesch'),
  AppLocaleOption('lt', 'Lietuvių'),
  AppLocaleOption('lv', 'Latviešu'),
  AppLocaleOption('mk', 'Македонски'),
  AppLocaleOption('mr', 'मराठी'),
  AppLocaleOption('mt', 'Malti'),
  AppLocaleOption('nb', 'Norsk bokmål'),
  AppLocaleOption('nl', 'Nederlands'),
  AppLocaleOption('pcm', 'Naijá (Nigerian Pidgin)'),
  AppLocaleOption('pl', 'Polski'),
  AppLocaleOption('pt', 'Português'),
  AppLocaleOption('rm', 'Rumantsch'),
  AppLocaleOption('ro', 'Română'),
  AppLocaleOption('ru', 'Русский'),
  AppLocaleOption('sh', 'Srpskohrvatski'),
  AppLocaleOption('sk', 'Slovenčina'),
  AppLocaleOption('sl', 'Slovenščina'),
  AppLocaleOption('sq', 'Shqip'),
  AppLocaleOption('sv', 'Svenska'),
  AppLocaleOption('te', 'తెలుగు'),
  AppLocaleOption('tr', 'Türkçe'),
  AppLocaleOption('uk', 'Українська'),
  AppLocaleOption('vi', 'Tiếng Việt'),
  AppLocaleOption('zh_Hans', '中文（简体）'),
  AppLocaleOption('zh_Hant', '中文（繁體）'),
];

/// Every code accepted by [SettingsRepository.setLocaleCode], including the
/// `zh` fallback that ships for locale resolution but is not pickable.
const Set<String> kAppLocaleCodes = {
  'en',
  'az',
  'be',
  'bg',
  'bn',
  'ca',
  'cs',
  'cy',
  'da',
  'de',
  'el',
  'es',
  'et',
  'eu',
  'fi',
  'fo',
  'fr',
  'ga',
  'gd',
  'hi',
  'hu',
  'hy',
  'id',
  'is',
  'it',
  'ja',
  'ka',
  'ko',
  'lb',
  'lt',
  'lv',
  'mk',
  'mr',
  'mt',
  'nb',
  'nl',
  'pcm',
  'pl',
  'pt',
  'rm',
  'ro',
  'ru',
  'sh',
  'sk',
  'sl',
  'sq',
  'sv',
  'te',
  'tr',
  'uk',
  'vi',
  'zh',
  'zh_Hans',
  'zh_Hant',
};

/// True for codes the generated localizations can serve.
bool isAppLocaleCode(String? code) => code != null && kAppLocaleCodes.contains(code);

/// Maps a persisted [code] to the [Locale] for `MaterialApp.locale`.
/// Returns null for null/empty/unknown codes (system default).
Locale? appLocaleFromCode(String? code) {
  if (code == null || code.isEmpty || !kAppLocaleCodes.contains(code)) {
    return null;
  }
  return switch (code) {
    'zh_Hans' => Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    'zh_Hant' => Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    _ => Locale(code),
  };
}

/// Endonym for a persisted [code], or null when unset/unknown (caller shows
/// the "system default" label instead).
String? appLocaleNativeName(String? code) {
  if (code == null) return null;
  if (code == 'zh') return '中文';
  for (final option in kAppLocales) {
    if (option.code == code) return option.nativeName;
  }
  return null;
}
