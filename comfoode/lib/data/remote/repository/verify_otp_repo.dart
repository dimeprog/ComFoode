import 'dart:convert';

import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:comfoode/data/remote/Api%20Services/Api.dart';

import '../../../models/register_model.dart';

class VerifyOtpRepo {
  static Future<RegisterResponse> vertifyOtp(String email, String otp) async {
    Map<String, dynamic> load = {
      'email': email,
      'otp': otp,
    };
    var response = await ApiClient.postData(AppLinks.verifyMail, load);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Unable to load data');
    }
  }
}
