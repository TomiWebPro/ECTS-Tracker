import 'package:ects_tracker/src/i18n/app_locales.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Locale registry contract (M8 wiring): persisted codes resolve to the
/// exact [Locale] shapes the generated localizations serve.
void main() {
  group('app locales', () {
    test('covers every supported locale', () {
      expect(kAppLocales.map((o) => o.code).toSet(), hasLength(53));
      for (final option in kAppLocales) {
        expect(isAppLocaleCode(option.code), isTrue,
            reason: 'pickable code must validate: ${option.code}');
        expect(option.nativeName, isNotEmpty);
      }
    });

    test('codes are unique', () {
      final codes = kAppLocales.map((o) => o.code).toList();
      expect(codes.toSet(), hasLength(codes.length));
    });

    test('script codes resolve to script locales', () {
      expect(
        appLocaleFromCode('zh_Hans'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      );
      expect(
        appLocaleFromCode('zh_Hant'),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      );
      expect(appLocaleFromCode('de'), const Locale('de'));
      expect(appLocaleFromCode('pcm'), const Locale('pcm'));
    });

    test('null, empty and unknown codes fall back to system', () {
      expect(appLocaleFromCode(null), isNull);
      expect(appLocaleFromCode(''), isNull);
      expect(appLocaleFromCode('xx'), isNull);
      expect(isAppLocaleCode(null), isFalse);
      expect(isAppLocaleCode('xx'), isFalse);
      expect(appLocaleNativeName(null), isNull);
      expect(appLocaleNativeName('xx'), isNull);
      expect(appLocaleNativeName('de'), 'Deutsch');
      expect(appLocaleNativeName('zh_Hans'), '中文（简体）');
    });
  });
}
