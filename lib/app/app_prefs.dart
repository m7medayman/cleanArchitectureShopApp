import 'package:mvvm_shop/presentation/resources/language_maneger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  getFirstTimeUseApp() async {
    bool? firstTimeUseApp = _sharedPreferences.getBool("FIRST_TIME");
    if (firstTimeUseApp == null) {
      await _sharedPreferences.setBool("FIRST_TIME", true);
      return firstTimeUseApp;
    } else {
      return firstTimeUseApp;
    }
  }

  setFirstTimeUseAppFalse() async {
    await _sharedPreferences.setBool("FIRST_TIME", false);
  }

  getAppLanguage() async {
    String? language = _sharedPreferences.getString("PEF_LANGUAGE");
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return Language.english.getLanguage();
    }
  }
}
