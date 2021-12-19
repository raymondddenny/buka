import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'app_exception.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int TIME_OUT_DURATION = 5;

  //* GET
  Future<dynamic> get({required String baseUrl, required String api}) async {
    Uri uri = Uri.parse(baseUrl + api);

    try {
      http.Response response = await http.get(uri).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  Future<dynamic> getWithHeaders({required String baseUrl, required String api, required String emailHeader}) async {
    Uri uri = Uri.parse(baseUrl + api);

    try {
      http.Response response =
          await http.get(uri, headers: {'email': emailHeader}).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  //* POST
  Future<dynamic> post(
      {required String baseUrl,
      required String api,
      dynamic payloadObj,
      String headerEmail = '',
      String uid = ''}) async {
    Uri uri = Uri.parse(baseUrl + api);
    var payload = jsonEncode(payloadObj);
    var emailHeader = headerEmail;
    print(payload);
    print('api -> $api');

    try {
      if (emailHeader.isEmpty) {
        http.Response response = await http.post(uri,
            body: payload,
            headers: {'Content-Type': 'application/json'}).timeout(const Duration(seconds: TIME_OUT_DURATION));
        return _processResponse(response);
      } else if (payloadObj == null) {
        http.Response response = await http.post(uri, headers: {
          'Content-Type': 'application/json',
          'email': emailHeader
        }).timeout(const Duration(seconds: TIME_OUT_DURATION));
        return _processResponse(response);
      } else {
        http.Response response = await http.post(uri, body: payloadObj, headers: {
          'uid': uid.isEmpty ? '' : uid, // ini dipakai ketika sent otp after create user
          'email': emailHeader,

          // ! buat add edit delete trolley ga pakai ini
          // 'Content-Type': 'application/json'
        }).timeout(const Duration(seconds: TIME_OUT_DURATION));
        return _processResponse(response);
      }
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  // DELETE
  Future<dynamic> delete({
    required String baseUrl,
    required String api,
    required String headerEmail,
  }) async {
    Uri uri = Uri.parse(baseUrl + api);
    var emailHeader = headerEmail;

    try {
      http.Response response = await http.delete(uri, headers: {
        'Content-Type': 'application/json',
        'email': emailHeader,
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  // OTHER
  Future<dynamic> patch({
    required String baseUrl,
    required String api,
    dynamic payloadObj,
    required String headerEmail,
  }) async {
    Uri uri = Uri.parse(baseUrl + api);
    var emailHeader = headerEmail;
    var payload = jsonEncode(payloadObj);

    try {
      http.Response response = await http.patch(uri, body: payloadObj, headers: {
        // 'Content-Type': 'application/json',
        'email': emailHeader,
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 404:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      case 502:
        throw ApiNotRespondingException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      default:
        throw FetchDataException('Error occured with code : ${response.statusCode}', response.request!.url.toString());
    }
  }
}
