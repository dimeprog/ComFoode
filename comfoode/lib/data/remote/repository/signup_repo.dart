import 'dart:convert';

import 'package:comfoode/data/remote/Api%20Services/Api.dart';
import 'package:comfoode/data/remote/Api%20Services/services.dart';
import 'package:comfoode/helpers/dialog_helper.dart';
import 'package:comfoode/models/Api_models.dart';
import 'package:comfoode/views/verification/verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../Models/register_model.dart';
import '../Api Services/constant.dart';

class SignUpRepo extends GetxController {
  final Service service = Service();
  // textediting controller

  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController nameSignUpController = TextEditingController();

  // body
  Future signUpUser() async {
    Map body = {
      'name': nameSignUpController.text,
      'email': emailSignUpController.text,
      'password': passwordSignUpController.text,
    };
    print('Signing up');
    final response = await service.post(
      AppLinks.signup,
      body,
      {"Content-Type": "application/json"},
    );
    print('Signing up loading ');
    Get.snackbar('loadiing', 'you are trying to sign up');
    if (response is Success) {
      DialogHelper.showDialog(
        message: response.response['user']['message'],
        content: 'welcome to comfoode',
      );
      Get.offAll(VerificationView());
    }
    if (response is Failure) {
      DialogHelper.showDialog(
        message: response.errorResponse.toString(),
        content: 'Error occured ${response.errorResponse}',
      );
    }
  }
}
