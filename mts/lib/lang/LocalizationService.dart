import 'dart:ui';

import 'package:get/get.dart';

import 'ko_kr.dart';

class LocalizationService extends Translations {
  // Default locale (window.locale)
  static final locale = Locale('ko', 'KR');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('ko', 'KR');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'ko',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('ko', 'KR'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'ko_KR': koKR, // lang/ko_kr.dart
      };

  // Gets locale from language, and updates the locale
  static void changeLocale(String lang) async {
    final locale = _getLocaleFromLanguage(lang);
    await Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  static Locale _getLocaleFromLanguage(String lang) {
    Locale locale = locales[1];
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) {
        locale = locales[i];
        break;
      }
    }

    return locale;
  }
}
