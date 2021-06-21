import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_first_bank/models/business_exception.dart';
import 'package:my_first_bank/models/result.dart';
import 'package:my_first_bank/utils/connectivity/my_connectivity.dart';

class ApiSource {
  final String baseUrl;
  final http.Client client;
  final MyConnectivity connectivity;

  final Duration timeout = Duration(seconds: 30);

  ApiSource(
    this.baseUrl,
    this.client,
    this.connectivity,
  );

  Future<Result<T>> getApi<T>(
      String url, T Function(dynamic value) mapperFunction,
      {Map<String, String> headers}) async {
    try {
      if (!await connectivity.isConnected()) {
        return Result<T>.error(message: 'Error');
      }
      headers = await getHeaders(headers);
      headers[HttpHeaders.contentTypeHeader] = 'application/json';
      headers[HttpHeaders.acceptHeader] = 'application/json';
      var response = await client.get(url, headers: headers).timeout(timeout);
      return await _manageResponse(response, mapperFunction);
    } on BusinessException catch (ex) {
      return Result<T>.error(message: ex.message);
    } catch (ex) {
      return Result<T>.error(message: 'Error');
    }
  }

  Future<Result<T>> postApi<T>(String url, Map<String, dynamic> body,
      T Function(dynamic value) mapperFunction,
      {Map<String, String> headers}) async {
    try {
      if (!await connectivity.isConnected()) {
        return Result<T>.error(message: 'Error');
      }
      headers = await getHeaders(headers);
      headers[HttpHeaders.contentTypeHeader] = 'application/json';
      headers[HttpHeaders.acceptHeader] = 'application/json';
      var response = await client
          .post(url, body: json.encode(body), headers: headers)
          .timeout(timeout);
      return await _manageResponse(response, mapperFunction);
    } catch (ex) {
      return Result<T>.error(message: 'Error');
    }
  }

  Map<String, String> getTraceability() {
    var traceability = <String, String>{};
    traceability['appId'] = '3449cef5-0762-4d73-bd55-31978f31e543';
    traceability['appName'] = Platform.isAndroid ? 'android' : 'ios';
    traceability['source'] = Platform.isAndroid ? 'android' : 'ios';
    return traceability;
  }

  Future<Result<T>> _manageResponse<T>(
      http.Response response, T Function(dynamic value) mapperFunction) async {
    if (response.statusCode == 200) {
      return Result<T>.success(mapperFunction(_getBody(response.bodyBytes)));
    } else {
      return _manageError<T>(response);
    }
  }

  Result<T> _manageError<T>(http.Response response) {
    if (response.statusCode >= 500) {
      try {
        Map<String, dynamic> body = jsonDecode(response.body);
        var message = body['message'] ?? '';
        if (message == 'CART_OUT_OF_TIME') {
          return Result<T>.error(message: message);
        }
        return Result<T>.error(message: 'Error');
      } catch (ex) {
        return Result<T>.error(message: 'Error');
      }
    } else if (response.statusCode == 401) {
      return Result<T>.error(message: 'Error');
    } else {
      return _errorFromMap(response);
    }
  }

  Result<T> _errorFromMap<T>(http.Response response) {
    try {
      Map<String, dynamic> body = jsonDecode(response.body);
      String description = body['description'];
      description = description ?? 'Error';
      int code = body.containsKey('code') ? body['code'] : 0;
      return Result<T>.error(message: description, code: code);
    } catch (ex) {
      return Result<T>.error(message: 'Error', code: response.statusCode);
    }
  }

  dynamic _getBody(body) {
    var bodyString = utf8.decode(body);
    try {
      return json.decode(bodyString);
    } catch (ex) {
      return bodyString;
    }
  }

  Future<Map<String, String>> getHeaders(Map<String, String> headers) async {
    headers = headers ?? {};
    headers = await loadToken(headers);
    return headers;
  }

  Future<Map<String, String>> loadToken(Map<String, String> headers) async {
    return headers;
  }
}
