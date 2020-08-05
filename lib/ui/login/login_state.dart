import 'package:equatable/equatable.dart';
import 'package:template/models/api_models/login/LoginResponse.dart';

abstract class LoginState extends Equatable {
  final List propss;
  
  LoginState([this.propss]);

  @override
  List<Object> get props => ([...propss] ?? []);
}

class InitialLoginState extends LoginState {
  InitialLoginState(int version) : super([0]);
}

class LoadingLoginState extends LoginState {
  
}

class SuccessLoginState extends LoginState {
  final LoginResponse response;

  SuccessLoginState(this.response) : super([response]);

  @override
  String toString() => 'Success $response';
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState(this.errorMessage): super([errorMessage]);
}


