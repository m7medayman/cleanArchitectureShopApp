import 'dart:ui';

String English = 'en';
String Arabic = 'ar';
const Locale ARABIC_LOCAL = Locale("ar", "SA");
const Locale ENGLISH_LOCAL = Locale("en", "US");

enum Language { english, arabic }

extension LanguageManager on Language {
  getLanguage() {
    switch (this) {
      case Language.english:
        return English;
      case Language.arabic:
        return Arabic;
      default:
        return English;
    }
  }

  getLocal() {}
}
