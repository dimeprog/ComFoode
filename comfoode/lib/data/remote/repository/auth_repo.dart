import 'dart:convert';

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

  final Rx<String> _Mtoken = Rx('');
  Rx<String> get Mtoken => _Mtoken;
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
          Mtoken(pref!.read());

          _status(AuthState.Authenticated);
          if (Mtoken.value == "0") {
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
          "name": nameSignUpController.text,
          "email": emailSignUpController.text,
          "password": passwordSignUpController.text,
        }),
        headers: {"Content-Type": "application/json"},
      );

      print("response is ${response.body} ${response.statusCode}");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Sign up Successful");
        final json = jsonDecode(response.body);
        clearTextControllerValue();
        _status(AuthState.Success);
        Get.offAll(VerificationView());
      } else if (response.statusCode == 400) {
        final json = jsonDecode(response.body);
        Get.snackbar("Error", json['user']['message']);
        _status(AuthState.Error);
      } else {
        final json = jsonDecode(response.body);
        String error = json['user']['message'].toString();
        Get.snackbar("Error", error);
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
      final response = await http.post(
          Uri.parse(AppLinks.BaseUrl + AppLinks.login),
          body: jsonEncode({
            "email": emailLoginController.text,
            "password": passwordLoginController.text
          }),
          headers: {"Content-Type": "application/json"});
      print("login response ${response.body}");
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final token = json['user']['data']['token'];
        print(token);
        userId = json['user']['data']['userId'];
        print(userId);
        Mtoken(token);
        pref!.saveToken(token);

        DateTime date = DateTime.now();
        DateTime expireToken = DateTime(date.year, date.month, date.day + 1);
        pref!.setDateTokenExpired(expireToken);
        _status(AuthState.Authenticated);
        Get.offAll(HomeView());
      } else {
        final json = jsonDecode(response.body);
        Get.snackbar("Error", json['user']['message']);
        _status(AuthState.Error);
      }
    } catch (ex) {
      _status(AuthState.Error);
      print("error occurred ${ex.toString()}");
      Get.snackbar("Error", 'An Error ocurred,try again');
    }
  }

  // Future sendOtp({bool isResend = false}) async {
  //   try {
  //     final response = await http.post(Uri.parse(AppLinks.sendOtp),
  //         headers: {"Authorization": "Bearer $userId $pendingToken"});

  //     print("response is ${response.body}");
  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body);

  //       pinVerificationId = json['data']['pinId'];
  //       Get.snackbar("Success", "Otp is sent");
  //     }
  //   } catch (ex) {
  //     print(ex);
  //   }
  //   if (!isResend) {
  //     Get.to(VerificationView());
  //   }
  // }

  Future verifyOtp(String code) async {
    try {
      _status(AuthState.Loading);
      print("code is $code");
      final response =
          await http.post(Uri.parse(AppLinks.BaseUrl + AppLinks.verifyMail),
              body: jsonEncode({
                "email": emailSignUpController.text,
                "otp": otpController.text,
              }));

      print("response is pin verify ${response.body} ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Otp verified succesfully",
          backgroundColor: ColorManager.amber,
          colorText: ColorManager.error,
          duration: const Duration(seconds: 3),
        );
        _status(AuthState.Success);
        Get.to(SucessfulView());
      } else {
        final json = jsonDecode(response.body);
        Get.snackbar("Error", "${json['user']['message']}");
        _status(AuthState.Error);
      }
    } catch (ex) {
      Get.snackbar("Error", "Verification cannot be completed");
      _status(AuthState.Error);
    }
  }

  // Future getAccount(String id) async {
  //   final response = await http.get(
  //       Uri.parse(
  //         "${AppLinks.createAcount}?_id=$id",
  //       ),
  //       headers: {"Authorization": "Bearer $token"});
  //   print("get user detail response ${response.body}");
  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     final user = User.fromJson(json['data']);
  //     _user(user);
  //     pref!.setUser(user);
  //   }
  // }

  Future SignOut() async {
    _status(AuthState.UnAuthenticated);
    pref!.logout();
    Get.offAll(HomeView());
  }
}
