import 'package:rxdart/rxdart.dart';
import '../index.dart';

class HomeBloc {
  AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();
  BehaviorSubject behaviorSubject = BehaviorSubject<ApiState>();

  dispose() {
    behaviorSubject.close();
  }
}