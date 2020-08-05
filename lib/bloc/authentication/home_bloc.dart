import 'package:rxdart/rxdart.dart';
import 'package:template/repository/authentication_repository.dart';
import 'package:template/states/api_state.dart';

class HomeBloc {
  AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();
  BehaviorSubject behaviorSubject = BehaviorSubject<ApiState>();

  dispose() {
    behaviorSubject.close();
  }
}