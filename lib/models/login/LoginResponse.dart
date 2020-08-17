class LoginResponse {
  Data data;
  int entityCode;
  int eventCode;
  String eventMessageId;

  LoginResponse(
      {this.data, this.entityCode, this.eventCode, this.eventMessageId});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    entityCode = json['entityCode'];
    eventCode = json['eventCode'];
    eventMessageId = json['eventMessageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['entityCode'] = this.entityCode;
    data['eventCode'] = this.eventCode;
    data['eventMessageId'] = this.eventMessageId;
    return data;
  }
}

class Data {
  String id;
  int expiresIn;
  int expiration;
  int tenantId;
  int propertyId;
  String accessToken;
  String refreshToken;

  Data(
      {this.id,
      this.expiresIn,
      this.expiration,
      this.tenantId,
      this.propertyId,
      this.accessToken,
      this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expiresIn = json['expires_in'];
    expiration = json['expiration'];
    tenantId = json['tenantId'];
    propertyId = json['propertyId'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['expires_in'] = this.expiresIn;
    data['expiration'] = this.expiration;
    data['tenantId'] = this.tenantId;
    data['propertyId'] = this.propertyId;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}