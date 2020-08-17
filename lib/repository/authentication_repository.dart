import '../index.dart';

class AuthenticationRepository {
  final baseApiProvider = ApiProvider();

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await baseApiProvider.call(
      url: "/api/v1/Auth/login",
      method: HTTPMethod.POST,
      request: request.toJson());
    // final response = await baseApiProvider.get("/stats/web_service/checklogin.php", request.toJson());
    LoginResponse loginResponse = new LoginResponse.fromJson(response);
    return loginResponse;
  }

}
