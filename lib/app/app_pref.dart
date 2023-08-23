import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_app/presentation/resources/language_manager.dart';

const String PREF_KEY_LANG = "PREF_KEY_LANG";
class AppPreferences{
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    return _sharedPreferences.getString(PREF_KEY_LANG) ?? LanguageType.ENGLISH.getValue();
  }


}