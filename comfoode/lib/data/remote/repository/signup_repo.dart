import 'dart:convert';

import 'package:comfoode/data/remote/Api%20Services/Api.dart';

import '../../../Models/register_model.dart';
import '../Api Services/constant.dart';

class SignUpRepo {
  static Future<RegisterResponse> signUp(RegisterRequest reqModel) async {
    final response = await ApiClient.postData(AppLinks.signup, reqModel);
    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Unable to load data');
    }
  }
}
