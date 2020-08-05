import '../index.dart';

//Application level singleton class
class AppManager {
  AppManager._(); //private constructor
  static final AppManager instance = AppManager._();

  static SharedPreferences sharedPreferences;

  /// Initializes shared preference instance
  static Future initSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  final SharedPreferenceRepository sharedPreferenceRepository = new SharedPreferenceRepository();
}