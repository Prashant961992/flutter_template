import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:template/models/api_models/login/LoginRequest.dart';
import 'package:template/repository/login_repository.dart';
import 'index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(InitialLoginState(0));

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginRequestEvent) {
      yield* _mapLoginStartedToState(event);
    }
  }

  Stream<LoginState> _mapLoginStartedToState(LoginRequestEvent event) async* {
    var request = LoginRequest();
    request.username = event.username;
    request.password = event.password;

    try {
      final LoginRepository loginRepository = LoginRepository();
      final response = await loginRepository.login(request);
      yield SuccessLoginState(response);
    } catch (e) {
      yield ErrorLoginState("no data");
    }
  }
}
