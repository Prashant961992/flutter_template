import '../index.dart';

class LoginRepository {
  final baseApiProvider = ApiProvider();

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await baseApiProvider.call(
      url: "/api/v1/Auth/login",
      method: HTTPMethod.POST, 
      request: request.toJson()
    );
    LoginResponse loginResponse = new LoginResponse.fromJson(response);
    return loginResponse;
  }

}
