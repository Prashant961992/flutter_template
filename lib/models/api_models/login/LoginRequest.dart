import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    this.username,
    this.password,
  });

  String username;
  String password;

  factory LoginRequest.fromJson(Map<String, String> json) => LoginRequest(
        username: json["username"],
        password: json["password"],
      );

  Map<String, String> toJson() => {
        "username": username,
        "password": password,
      };
}
