import '../repository/shared_preference_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

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