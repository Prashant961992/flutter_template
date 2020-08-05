import 'package:rxdart/rxdart.dart';
import '../index.dart';

class LoginBloc {
  AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();
  BehaviorSubject behaviorSubject = BehaviorSubject<ApiState>();

  void login(String username, String base64Password) async {
    behaviorSubject.add(ApiState.loading());

    try {
      LoginRequest request = LoginRequest();
      request.username = username;
      request.password = base64Password;

      LoginResponse loginResponse =
          await _authenticationRepository.login(request);

      behaviorSubject.add(ApiState.success(loginResponse));
    } catch (e) {
      behaviorSubject.add(ApiState.error(e.toString()));
    }
  }

  dispose() {
    behaviorSubject.close();
  }
}
