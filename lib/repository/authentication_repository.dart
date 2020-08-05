import '../network/api_provider.dart';

import '../models/api_models/login/LoginRequest.dart';
import '../models/api_models/login/LoginResponse.dart';

class AuthenticationRepository {
  final baseApiProvider = ApiProvider();

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await baseApiProvider.get("/stats/web_service/checklogin.php", request.toJson());
    LoginResponse loginResponse = new LoginResponse.fromJson(response);
    return loginResponse;
  }

}
