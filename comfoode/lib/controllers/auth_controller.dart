import 'package:comfoode/models/login_model.dart';
import '../Models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/remote/repository/login_repo.dart';
import '../data/remote/repository/signup_repo.dart';
import '../data/remote/repository/verify_otp_repo.dart';
import '../utils/resources/color_manager.dart';
import '../utils/resources/routes_manager.dart';
import '../views/Home/home_view.dart';
import '../views/verification/verification.dart';

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
      LoginResponse response = await LoginRepo.signIn(LoginRequest(
        email: emailLoginController.text,
        password: passwordLoginController.text,
      ));
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
    RegisterRequest _registerResquest = RegisterRequest(
      email: emailSignUpController.text.trim(),
      name: nameSignUpController.text.trim(),
      password: passwordSignUpController.text.trim(),
    );
    try {
      var response = await SignUpRepo.signUp(RegisterRequest(
        email: emailSignUpController.text,
        name: nameSignUpController.text,
        password: passwordSignUpController.text,
      ));
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
