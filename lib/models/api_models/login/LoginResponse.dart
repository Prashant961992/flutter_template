import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.playerID,
    this.teamId,
    this.firstName,
    this.lastName,
    this.grade,
    this.position,
    this.mode,
    this.sport,
    this.pEmail,
    this.userName,
    this.password,
    this.userLevel,
    this.userState,
    this.auth,
    this.teams,
  });

  String playerID;
  String teamId;
  String firstName;
  String lastName;
  String grade;
  String position;
  String mode;
  String sport;
  String pEmail;
  String userName;
  String password;
  int userLevel;
  String userState;
  String auth;
  String teams;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    playerID: json["PlayerID"],
    teamId: json["TeamID"],
    firstName: json["FirstName"],
    lastName: json["LastName"],
    grade: json["Grade"],
    position: json["Position"],
    mode: json["Mode"],
    sport: json["Sport"],
    pEmail: json["PEmail"],
    userName: json["UserName"],
    password: json["Password"],
    userLevel: json["UserLevel"],
    userState: json["UserState"],
    auth: json["auth"],
    teams: json["teams"],
  );

  Map<String, dynamic> toJson() => {
    "PlayerID": playerID,
    "TeamID": teamId,
    "FirstName": firstName,
    "LastName": lastName,
    "Grade": grade,
    "Position": position,
    "Mode": mode,
    "Sport": sport,
    "PEmail": pEmail,
    "UserName": userName,
    "Password": password,
    "UserLevel": userLevel,
    "UserState": userState,
    "auth": auth,
    "teams": teams,
  };
}
