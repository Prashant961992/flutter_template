// import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

enum HTTPMethod { GET, POST, PUT, DELETE }

class ApiProvider {
  final String _baseUrlhttps = "https://pmsapi.confidosoftsolutions.com";
  final String token = "";
  // final String token = AppData.sharedInstance.logindata?.data?.accessToken ?? "";

  Future<BaseOptions> getoptions(HTTPMethod httpMethod) async {
    var method = 'GET';
    if (httpMethod == HTTPMethod.GET) {
      method = 'GET';
    } else if (httpMethod == HTTPMethod.POST) {
      method = 'POST';
    } else if (httpMethod == HTTPMethod.PUT) {
      method = 'PUT';
    } else if (httpMethod == HTTPMethod.DELETE) {
      method = 'DELETE';
    }
    return BaseOptions(
      method: method,
      baseUrl: _baseUrlhttps,
      contentType: "application/json",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
  }

  Future<dynamic> call(
      {String url, HTTPMethod method, Map<String, dynamic> request}) async {
    var responseJson;

    var options = await getoptions(method);
    Dio dio = new Dio(options);

    try {
      final response =
          await dio.request(url, data: request != null ? request : null);
      responseJson = response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        print("DioErrorType Connect Timeout");
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
        throw ConnectionTimeoutException(e.message);
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        ///It occurs when receiving timeout.
        print("DioErrorType Received Timeout");
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
        throw ReceiveTimeoutException(e.message);
      } else if (e.type == DioErrorType.RESPONSE) {
        /// When the server response, but with a incorrect status, such as 404, 503...
        print("DioErrorType Response");
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
        throw BadRequestException(e.message);
      } else if (e.type == DioErrorType.CANCEL) {
        /// When the request is cancelled, dio will throw a error with this type.
        print("DioErrorType Cancel");
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
        throw CancelException('Request is cancelled');
      } else {
        /// Default error type, Some other Error. In this case, you can
        /// read the DioError.error if it is not null.
        print("DioErrorType Default");
        print(e.request);
        print(e.message);
        if (e.response == null) {
          throw DefaultException('No Internet connection');
        } else {
          throw DefaultException('Default_Exception_Message');
        }
      }
    }
    return responseJson;
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class DefaultException extends CustomException {
  DefaultException(id) : super(id);
}

class CancelException extends CustomException {
  CancelException(id) : super(id);
}

class BadRequestException extends CustomException {
  BadRequestException(id) : super(id);
}

class ConnectionTimeoutException extends CustomException {
  ConnectionTimeoutException(id) : super(id);
}

class ReceiveTimeoutException extends CustomException {
  ReceiveTimeoutException(id) : super(id);
}

// class ApiProvider {
//   final String _baseUrl = "competi1.wwwls7.a2hosted.com";

//   Future<dynamic> get(String url, Map<String, dynamic> request) async {
//     var responseJson;
//     var uri;
//     print("${_baseUrl + url}");

//     //get request query parameters
//     if (request != null) {
//       print(request);
//       request.removeWhere((String key, dynamic value) => value == null);
//       print(request);
//       uri = Uri.http(_baseUrl, url, request);
//       print(uri);
//     } else {
//       uri = Uri.http(_baseUrl, url, null);
//     }
//     print(uri);

//     try {
//       final response = await http.get(uri, headers: <String, String>{
//         HttpHeaders.contentTypeHeader: 'application/json',
//       });
//       responseJson = _validateResponse(response);
//     } on SocketException {
//       throw NotFoundException('Not_Found_Exception_Message');
//     }
//     return responseJson;
//   }

//   Future<dynamic> post(String url, Map<String, dynamic> request) async {
//     var responseJson;
//     var uri = Uri.http(_baseUrl, url);
//     print(uri);
//     try {
//       final http.Response response = await http.post(
//         uri,
//         headers: <String, String>{
//           HttpHeaders.contentTypeHeader: 'application/json',
//         },
//         body: jsonEncode(request),
//       );
//       responseJson = _validateResponse(response);
//     } on SocketException {
//       throw NotFoundException('Not_Found_Exception_Message');
//     } catch (e) {
//       print('Error : $e');
//     }
//     return responseJson;
//   }

//   dynamic _validateResponse(http.Response response) {
//     print(response.statusCode);

//     switch (response.statusCode) {
//       case 200:
//         var apiResponse = json.decode(response.body);
//         print(apiResponse);
//         return apiResponse;
//      case 400:
// //        var apiResponse = json.decode(response.body);
// //        print(apiResponse);
// //        break;
//        throw BadRequestException('Not_Found_Exception_Message');
//       case 404:
//         throw NotFoundException('Not_Found_Exception_Message');
//       case -1:
//         throw NotFoundException('Not_Found_Exception_Message');
// //      case 401:
// //        throw UnauthorizedException('Unauthorized_Exception_Message');
//       default:
//         throw DefaultException('Default_Exception_Message');
//     }
//   }
// }
