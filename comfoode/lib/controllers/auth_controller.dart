import 'dart:convert';

import 'package:comfoode/Models/login_model.dart';
import 'package:comfoode/Models/register_model.dart';
import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:comfoode/data/remote/Api%20Services/Api.dart';
import 'package:comfoode/data/remote/repository/login_repo.dart';
import 'package:comfoode/data/remote/repository/signup_repo.dart';
import 'package:comfoode/data/remote/repository/verify_otp_repo.dart';
import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/views/Home/home_view.dart';
import 'package:comfoode/views/verification/verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utils/resources/routes_manager.dart';

class AuthController extends GetxController {
  //  text controller
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController nameSignUpController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  // login method
  void login() async {
    try {
      LoginResponse response = await LoginRepo.signIn(
        LoginRequest(
          email: emailLoginController.text.trim(),
          password: passwordLoginController.text.trim(),
        ),
      );
      if (response.token != null || response.token != '') {
        Get.toNamed(
          RouteManager.goToHomeRoute(),
        );
      } else {
        Get.defaultDialog(
          backgroundColor: Colors.blueGrey,
          title: 'Error!',
          titleStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          middleText:
              ' wrong details supplied ... check email and password again ',
          middleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          onCancel: () {},
          onConfirm: () {},
          textCancel: 'NO',
          textConfirm: 'Yes',
          buttonColor: Colors.pink,
        );
      }
      clearTextControllerValue();
    } catch (err) {
      Get.defaultDialog(
        backgroundColor: Colors.blueGrey,
        title: 'Error!',
        titleStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        middleText: err.toString(),
        middleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        onCancel: () {
          clearTextControllerValue();
        },
        onConfirm: () {},
        textCancel: 'NO',
        textConfirm: 'Yes',
        buttonColor: ColorManager.white,
      );
      // Get.snackbar(
      //   'Error!',
      //   err.toString(),
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.green,
      //   colorText: Colors.white,
      // );
    }
  }

  //  sign up method
  void signUp() async {
    try {
      RegisterResponse response = await SignUpRepo.signUp(
        RegisterRequest(
          email: emailSignUpController.text.trim(),
          name: nameSignUpController.text.trim(),
          password: passwordSignUpController.text.trim(),
        ),
      );
      if (response.verified == false) {
        Get.offAll(VerificationView());
      } else {
        Get.offAll(HomeView());
      }
      clearTextControllerValue();
    } catch (err) {
      Get.snackbar(
        'Error!',
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  // verify otp
  void verifyOtp() async {
    try {
      RegisterResponse response = await VerifyOtpRepo.vertifyOtp(
        emailSignUpController.text,
        otpController.text,
      );
    } catch (err) {
      Get.snackbar(
        'Error!',
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  //  dispose controller
  void clearTextControllerValue() {
    nameSignUpController.clear();
    passwordLoginController.clear();
    passwordSignUpController.clear();
    emailLoginController.clear();
    emailSignUpController.clear();
  }
}
