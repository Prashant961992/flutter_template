import '../states/base_state.dart';

enum ApiStatus { LOADING, SUCCESS, FAIL }

class ApiState extends BaseState {
  String messageId;
  dynamic response;
  ApiStatus status;

  ApiState.loading() : status = ApiStatus.LOADING;

  ApiState.error(this.messageId) : status = ApiStatus.FAIL;

  ApiState.success(this.response) : status = ApiStatus.SUCCESS;
}
