import 'dart:convert';
import 'dart:io';

import 'package:comfoode/controllers/baseExecptionController.dart';
import 'package:comfoode/data/remote/Api%20Services/Api.dart';
import 'package:comfoode/data/remote/Api%20Services/app_execption.dart';

import '../../../models/login_model.dart';
import '../Api Services/constant.dart';

class LoginRepo extends BaseExecptionController {
  static Future<LoginResponse> signIn(LoginRequest reqModel) async {
    final response = await ApiClient.postData(AppLinks.login, reqModel);
    print(json.decode(response.body));
    return LoginResponse.fromJson(json.decode(response.body));
  }
}
