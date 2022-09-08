import 'dart:convert';
import 'dart:io';

import 'package:comfoode/data/remote/Api%20Services/api_responses.dart';
import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:comfoode/helpers/dialog_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<dynamic> get(
    String path, [
    Map<String, String>? headers,
  ]) async {
    var url = Uri.parse(AppLinks.BaseUrl + path);

    try {
      final response = await http.get(url, headers: headers);
    } catch (e) {}
  }

  Future post(
    String path,
    dynamic body,
    Map<String, String> headers,
  ) async {
    final url = Uri.parse(AppLinks.BaseUrl + path);
    final encodedBody = json.encode(body);
    try {
      final response = await http.post(
        url,
        body: encodedBody,
        headers: headers,
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Success(
          response: data,
        );
      } else {
        return Failure(code: 100, errorResponse: 'Invalid Response');
      }
    } on HttpException {
      return Failure(code: 101, errorResponse: ' No Internet ');
    } on FormatException {
      return Failure(code: 102, errorResponse: ' Invalid Format');
    } catch (e) {
      return Failure(code: 103, errorResponse: ' unknown Error');
    }
  }
}
