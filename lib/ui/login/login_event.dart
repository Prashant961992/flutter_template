import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequestEvent extends LoginEvent {
   
  final String username;
  final String password;

  @override
  String toString() => 'LoadDataEvent';

  LoginRequestEvent(this.username,this.password);
}