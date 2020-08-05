import 'package:template/models/api_models/login/LoginRequest.dart';
import 'package:template/models/api_models/login/LoginResponse.dart';
import 'package:template/repository/authentication_repository.dart';
import 'package:template/states/api_state.dart';

import 'package:rxdart/rxdart.dart';

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
