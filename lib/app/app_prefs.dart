import 'package:mvvm_shop/presentation/resources/language_maneger.dart';
import 'package:shared_preferences/shared_preferences.dart';

String languageKey = "PEF_LANGUAGE";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  getFirstTimeUseApp() async {
    bool? firstTimeUseApp = _sharedPreferences.getBool("FIRST_TIME");
    if (firstTimeUseApp == null) {
      await _sharedPreferences.setBool("FIRST_TIME", true);
      firstTimeUseApp = _sharedPreferences.getBool("FIRST_TIME");
      return firstTimeUseApp;
    } else {
      return firstTimeUseApp;
    }
  }

  setAppLanguage(value) async {
    await _sharedPreferences.setString(languageKey, value);
  }

  Future getLocal() async {
    String language = await getAppLanguage();
    if (language == Language.arabic.getLanguage()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  changeLanguage() async {
    String language = await getAppLanguage();
    if (language == Language.arabic.getLanguage()) {
      setAppLanguage(Language.english.getLanguage());
    } else {
      setAppLanguage(Language.arabic.getLanguage());
    }
  }

  setFirstTimeUseAppFalse() async {
    await _sharedPreferences.setBool("FIRST_TIME", false);
  }

  getAppLanguage() async {
    String? language = _sharedPreferences.getString(languageKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      setAppLanguage(Language.arabic.getLanguage());
      return Language.arabic.getLanguage();
    }
  }
}
