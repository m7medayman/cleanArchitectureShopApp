String English = 'en';
String Arabic = 'ar';

enum Language { english, arabic }

extension LanguageManger on Language {
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
}
