import 'dart:convert';
import 'dart:io';

import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:http/http.dart' as http;

import 'app_execption.dart';

class ApiClient {
  static const TIMEOUT = 60;
  // Get
  static Future<http.Response> getData(
    String apiPath, {
    Map<String, String>? headers,
  }) async {
    var url = Uri.parse(AppLinks.BaseUrl + apiPath);
    final reponse = await http
        .get(
          url,
          headers: headers,
        )
        .timeout(const Duration(seconds: TIMEOUT));
    return processResponse(reponse);
  }

// Post
  static Future<http.Response> postData(
    String apiPath,
    dynamic load, {
    Map<String, String>? headers,
  }) async {
    var url = Uri.parse(AppLinks.BaseUrl + apiPath);
    var response = await http
        .post(
          url,
          body: jsonEncode(load),
          headers: headers,
        )
        .timeout(const Duration(seconds: TIMEOUT));
    return processResponse(response);
  }

  // error checker method
  static http.Response processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestExecption(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 402:
      case 403:
      case 404:
        throw UnauthorizedExecption(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataExecption(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
    }
  }
}
