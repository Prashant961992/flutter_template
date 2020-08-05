import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'custom_exception.dart';

class ApiProvider {
  final String _baseUrl = "competi1.wwwls7.a2hosted.com";

  Future<dynamic> get(String url, Map<String, dynamic> request) async {
    var responseJson;
    var uri;
    print("${_baseUrl + url}");

    //get request query parameters
    if (request != null) {
      print(request);
      request.removeWhere((String key, dynamic value) => value == null);
      print(request);
      uri = Uri.http(_baseUrl, url, request);
      print(uri);
    } else {
      uri = Uri.http(_baseUrl, url, null);
    }
    print(uri);

    try {
      final response = await http.get(uri, headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      responseJson = _validateResponse(response);
    } on SocketException {
      throw NotFoundException('Not_Found_Exception_Message');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, dynamic> request) async {
    var responseJson;
    var uri = Uri.http(_baseUrl, url);
    print(uri);
    try {
      final http.Response response = await http.post(
        uri,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(request),
      );
      responseJson = _validateResponse(response);
    } on SocketException {
      throw NotFoundException('Not_Found_Exception_Message');
    } catch (e) {
      print('Error : $e');
    }
    return responseJson;
  }

  dynamic _validateResponse(http.Response response) {
    print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        var apiResponse = json.decode(response.body);
        print(apiResponse);
        return apiResponse;
     case 400:
//        var apiResponse = json.decode(response.body);
//        print(apiResponse);
//        break;
       throw BadRequestException('Not_Found_Exception_Message');
      case 404:
        throw NotFoundException('Not_Found_Exception_Message');
      case -1:
        throw NotFoundException('Not_Found_Exception_Message');
//      case 401:
//        throw UnauthorizedException('Unauthorized_Exception_Message');
      default:
        throw DefaultException('Default_Exception_Message');
    }
  }
}
