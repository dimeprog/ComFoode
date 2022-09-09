import 'dart:convert';

import 'package:comfoode/models/userErrors.dart';
import 'package:comfoode/data/remote/Api%20Services/app_execption.dart';
import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/views/Home/home_view.dart';
import 'package:comfoode/views/login/login_view.dart';
import 'package:comfoode/views/sucessfull/sucessful_view.dart';
import 'package:comfoode/views/verification/verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../local/shared_pref.dart';
import 'package:http/http.dart' as http;

enum AuthState {
  Loading,
  Empty,
  Error,
  Success,
  IsFirstTime,
  UnAuthenticated,
  Authenticated
}

class AuthRepository extends GetxController {
  //  text edit controllers
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController passwordSignUpController = TextEditingController();
  TextEditingController nameSignUpController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  //  variables and getters
  final Rx<AuthState> _status = Rx(AuthState.Empty);
  Rx<AuthState> get status => _status;

  Rx<String> _Mtoken = ''.obs;
  String get Mtoken => _Mtoken.value;
  final Rx<User?> _user = Rx(null);
  User? get user => _user.value;
  Sharepref? pref;
  bool? isVerified;
  String? userId;
  String? pinVerificationId;

  @override
  Future<void> onInit() async {
    super.onInit();
    pref = Sharepref();
    await pref!.init();
    if (pref!.getFirstTimeOpen()) {
      if (pref!.getFirstTimeOpen()) {
        print("My First Time Using this app");
        _status(AuthState.IsFirstTime);
      } else {
        print("Not my First Time Using this app");

// print("object")
        if (pref!.getUser() != null &&
            !DateTime.now().isAfter(pref!.getDateTokenExpired())) {
          print("gotten here is value");
          final user = pref!.getUser()!;
          _user(user);
          _Mtoken(pref!.read());

          _status(AuthState.Authenticated);
          if (_Mtoken.value == "0") {
            _status(AuthState.UnAuthenticated);
          }
        } else {
          _status(AuthState.UnAuthenticated);
        }
      }
    }
  }

  Future SignUp() async {
    try {
      _status(AuthState.Loading);
      final response = await http.post(
        Uri.parse(AppLinks.BaseUrl + AppLinks.signup),
        body: jsonEncode({
          "name": nameSignUpController.text.trim(),
          "email": emailSignUpController.text.trim(),
          "password": passwordSignUpController.text.trim(),
        }),
        headers: {"Content-Type": "application/json"},
      );

      print("response is ${response.body} ${response.statusCode}");
      print('signing up');
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Sign up Successful");
        final json = jsonDecode(response.body);
        clearTextControllerValue();
        _status(AuthState.Success);
        pref!.saveUserId(json['user']['data']["userId"]);
        print(pref!.getuserId());
        Get.offAll(VerificationView());
      } else if (response.statusCode == 400) {
        final json = jsonDecode(response.body);
        // final errorList = UserErrors.fromJson(json);
        final List<UserErrors> errorList = (json['errors'] as List)
            .map((e) => UserErrors.fromJson(e))
            .toList();

        Get.snackbar("Error", errorList[0].msg.toString());
        _status(AuthState.Error);
      } else {
        final json = jsonDecode(response.body);
        print('it me');
        final List<UserErrors> errorList = (json['errors'] as List)
            .map((e) => UserErrors.fromJson(e))
            .toList();
        print(errorList);
        Get.snackbar("Error", errorList[0].msg.toString());
        _status(AuthState.Error);
      }
    } catch (ex) {
      _status(AuthState.Error);
      print("error occurred ${ex.toString()}");
    }
  }

  Future reSendOtp() async {}
  void clearTextControllerValue() {
    nameSignUpController.clear();
    emailSignUpController.clear();
    passwordSignUpController.clear();
  }

  Future SignIn() async {
    _status(AuthState.Loading);
    try {
      final response =
          await http.post(Uri.parse(AppLinks.BaseUrl + AppLinks.login),
              body: jsonEncode({
                "email": emailLoginController.text.trim(),
                "password": passwordLoginController.text.trim()
              }),
              headers: {"Content-Type": "application/json"});
      print("login response ${response.body}");
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final token = json['user']['data']['token'];
        userId = json['user']['data']['userId'];
        pref!.saveUserId(userId!);
        _Mtoken.value = token;
        pref!.saveToken(token);
        print(Mtoken);
        print(pref!.getuserId());
        DateTime date = DateTime.now();
        DateTime expireToken = DateTime(date.year, date.month, date.day + 1);
        pref!.setDateTokenExpired(expireToken);
        final String message = json['user']['message'];
        Get.snackbar('Success', message);
        _status(AuthState.Authenticated);
        Get.offAll(HomeView());
      }
      if (response.statusCode == 401) {
        final json = jsonDecode(response.body);
        final String message = json['user']['message'];
        Get.snackbar("Error", message);
        _status(AuthState.Error);
      } else {
        final json = jsonDecode(response.body);
        Get.snackbar("Error", json['user']['message']);
        _status(AuthState.Error);
      }
    } on UnauthorizedExecption {
      Get.snackbar('Error', 'Unable to login');
    } catch (ex) {
      _status(AuthState.Error);
      print("error occurred ${ex.toString()}");
      Get.snackbar("Error", ex.toString());
    }
  }

  Future verifyOtp() async {
    try {
      _status(AuthState.Loading);
      // print("code is $code");
      final response =
          await http.post(Uri.parse(AppLinks.BaseUrl + AppLinks.verifyMail),
              body: jsonEncode({
                "email": emailSignUpController.text.trim(),
                "otp": otpController.text.trim(),
              }));

      print(
          "response is pin verify ${response.body} ${response.statusCode} ${emailSignUpController.text} ${otpController.text}");
      if (response.statusCode == 200) {
        _status(AuthState.Success);
        Get.snackbar(
          "Success",
          "Otp verified succesfully",
          backgroundColor: ColorManager.amber,
          colorText: ColorManager.error,
          duration: const Duration(seconds: 3),
        );
        Get.to(SucessfulView());
      }
      if (response.statusCode == 400) {
        final json = jsonDecode(response.body);
        Get.snackbar("Error", "${json['user']['message']}");
        _status(AuthState.Error);
      }
    } catch (ex) {
      Get.snackbar("Error", "Verification cannot be completed");
      _status(AuthState.Error);
    }
  }

  Future SignOut() async {
    _status(AuthState.UnAuthenticated);
    // pref!.logout();
    Get.offAll(LoginView());
  }
}
