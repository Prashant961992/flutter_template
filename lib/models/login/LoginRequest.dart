class LoginRequest {
  String email;
  String password;
  int clientType;
  String deviceId;
  bool rememberMe;

  LoginRequest(
      {this.email,
      this.password,
      this.clientType,
      this.deviceId,
      this.rememberMe});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    clientType = json['clientType'];
    deviceId = json['deviceId'];
    rememberMe = json['rememberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['clientType'] = this.clientType;
    data['deviceId'] = this.deviceId;
    data['rememberMe'] = this.rememberMe;
    return data;
  }
}