import '../index.dart';

class LoginRepository {
  final baseApiProvider = ApiProvider();

  Future<LoginResponse> login(LoginRequest request) async{
    final response = await baseApiProvider.get("/stats/web_service/checklogin.php", request.toJson());
    LoginResponse loginResponse = new LoginResponse.fromJson(response);
    return loginResponse;
  }

}
