import '../index.dart';

final _preferenceKeyLoggedIn = "keyLoggedIn";
final _preferenceKeyLoginResponse = "keyLoginResponse";

class SharedPreferenceRepository {

  /// Gets shared preference instance
  Future<SharedPreferences> getSharedPrefInstance() async {
    SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance().then((value) => value);
    return sharedPreferences;
  }

  /// Saves LoggedIn status in shared preference
  saveLoggedIn(bool value) {
    AppManager.sharedPreferences.setBool(_preferenceKeyLoggedIn, value);
  }

  /// Gets LoggedIn status from shared preference
  bool isLoggedIn() {
    return AppManager.sharedPreferences.getBool(_preferenceKeyLoggedIn) ?? false;
  }

  /// Saves LoginResponse in shared preference
  saveLoginResponse(LoginResponse value) {
    AppManager.sharedPreferences
        .setString(_preferenceKeyLoginResponse, json.encode(value));
  }

  /// Gets LoginResponse from shared preference
  LoginResponse getLoginResponse() {
    return json.decode(
        AppManager.sharedPreferences.getString(_preferenceKeyLoginResponse));
  }

  clearSharedPrefData(){
    AppManager.sharedPreferences.remove(_preferenceKeyLoggedIn);
  }
}
