import 'dart:convert';

import 'package:comfoode/controllers/constant.dart';
import 'package:comfoode/views/Home/home_view.dart';
import 'package:comfoode/views/login/login_view.dart';
import 'package:comfoode/views/verification/verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/userModel.dart';
import '../data/local/shared_pref.dart';

enum AuthState {
  Loading,
  Empty,
  Error,
  Success,
  IsFirstTime,
  UnAuthenticated,
  Authenticated
}

class AuthController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  final Rx<AuthState> _status = Rx(AuthState.Empty);
  AuthState get status => _status.value;

  Rx<String> Mtoken = Rx("");
  String get token => Mtoken.value;
  final Rx<User?> _user = Rx(null);
  User? get user => _user.value;
  Sharepref? pref;
  String countryCode = "+234";
  String? pendingToken;
  String? userId;
  String? pinVerificationId;
  Rx<bool> isSubscription = Rx(false);
  @override
  void onInit() async {
    super.onInit();

    pref = Sharepref();
    await pref!.init();
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

  Future SignUp() async {
    try {
      _status(AuthState.Loading);
      final response = await http.post(Uri.parse(AppLinks.signup),
          body: jsonEncode({
            "email": emailController.text,
            "phone": countryCode + phoneNumberController.text,
            "first_name": firstNameController.text,
            "last_name": lastNameController.text,
            "password": passwordController.text
          }),
          headers: {"Content-Type": "application/json"});

      print("response is ${response.body} ${response.statusCode}");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Sign up Successful");
        final json = jsonDecode(response.body);
        pendingToken = json['data']['token'];
        userId = json['data']['account_id'];

        sendOtp();
        clearTextControllerValue();
        _status(AuthState.Success);
      } else if (response.statusCode == 400) {
        final json = jsonDecode(response.body);

        Get.snackbar("Error", json['message']);
        _status(AuthState.Error);
      } else {
        final json = jsonDecode(response.body);
        String error = List.from(json['error_fields'])[0].toString();
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
    firstNameController.clear();
    lastNameController.clear();
    passwordController.clear();
    emailController.clear();
    phoneNumberController.clear();
    sendOtp();
  }

  Future SignIn() async {
    _status(AuthState.Loading);
    try {
      final response = await http.post(Uri.parse(AppLinks.signin),
          body: jsonEncode({
            "email": emailController.text,
            "password": passwordController.text
          }),
          headers: {"Content-Type": "application/json"});
      print("login response ${response.body}");
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final token = json['data']['token'];
        final accountId = json['data']['account_id'];
        final user = User.fromJson(json['data']);
        _user(user);
        pref!.setUser(user);
        Mtoken(token);
        pref!.saveToken(token);

        DateTime date = DateTime.now();
        DateTime expireToken = DateTime(date.year, date.month, date.day + 1);
        pref!.setDateTokenExpired(expireToken);
        _status(AuthState.Authenticated);
        Get.offAll(HomeView());
      } else {
        final json = jsonDecode(response.body);
        Get.snackbar("Error", json['message']);
        _status(AuthState.Error);
      }
    } catch (ex) {
      _status(AuthState.Error);
      print("error occurred ${ex.toString()}");
      Get.snackbar("Error", "Error have occurred. try again later");
    }
  }

  Future sendOtp({bool isResend = false}) async {
    try {
      final response = await http.post(Uri.parse(AppLinks.verifyMail),
          headers: {"Authorization": "Bearer $userId $pendingToken"});

      print("response is ${response.body}");
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        pinVerificationId = json['data']['pinId'];
        Get.snackbar("Success", "Otp is sent");
      }
    } catch (ex) {
      print(ex);
    }
    if (!isResend) {
      Get.to(VerificationView());
    }
  }

  Future verifyOtp(String code) async {
    try {
      _status(AuthState.Loading);
      print("code is $code");
      final response = await http.post(Uri.parse(AppLinks.verifyMail),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $userId $pendingToken"
          },
          body: jsonEncode({"pin": code, "pinId": pinVerificationId}));

      print("response is pin verify ${response.body} ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Otp verified succesfully");
        _status(AuthState.Success);
        Get.to(LoginView());
      } else {
        final json = jsonDecode(response.body);
        Get.snackbar("Error", "${json['message']}");
        _status(AuthState.Error);
      }
    } catch (ex) {
      Get.snackbar("Error", "Verification cannot be completed");
      _status(AuthState.Error);
    }
  }

  Future SignOut() async {
    _status(AuthState.UnAuthenticated);
    pref!.logout();
    Get.offAll(LoginView());
  }
}
