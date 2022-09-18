import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class Sharepref {
  static String isLogin = "App is Login";
  static String firstTimeAppOpen = " First Time  app open";
  static String dateTokenExpired = " Time when token expired";
  SharedPreferences? _preferences;
  SharePref() {
    //print("sharepref init");
    init();
  }

  Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void setUser(User user) {
    _preferences!.setString(isLogin, jsonEncode(user.toJson()));
  }

  void logout() {
    _preferences!.setString(isLogin, "");
  }

  String read() {
    final key = 'token';
    String value = _preferences!.getString(key)!;
    print('read: $value');
    return value.isEmpty ? "0" : value;
  }

  saveUserId(String userId) {
    _preferences!.setString('userId', userId);
  }

  String getuserId() {
    String? value = _preferences!.getString("userId");
    print('userId: $value');
    return value ?? '';
  }

  //  set sign up Email
  void saveEmail(String email) {
    _preferences!.setString('signupemail', email);
  }

  // save otp
  void saveOtp(String otp) {
    _preferences!.setString('otp', otp);
  }

  // save wallet balance
  void saveWalletBalance(int balance) {
    _preferences!.setInt('balance', balance);
  }

  //  get sign up email
  String getEmail() {
    final String? email = _preferences!.getString('signupemail');
    return email ?? '';
  }

  //  get otp
  String getOtp() {
    final String? otp = _preferences!.getString('otp');
    return otp ?? '';
  }

  // get wallet balance
  int getWalletBalance() {
    final int? balance = _preferences!.getInt('balance');
    final bal = balance;
    return bal ?? 0;
  }

  // Save orderid
  void saveOrderId(String orderId) {
    _preferences!.setString('orderId', orderId);
  }

  // get orderId
  String getOrderId() {
    final String? orderId = _preferences!.getString('orderId');
    return orderId ?? 'not yet avaiable ';
  }

// ////////////////////////////
  saveToken(String value) {
    _preferences!.setString("token", value);
  }

  User? getUser() {
    var user = _preferences!.getString(isLogin);
    print("user value $user");
    if (user != null && user.isNotEmpty) {
      var json = jsonDecode(user);
      User uservalue = User.fromJson(json);
      return uservalue;
    } else {
      return null;
    }
  }

  void setFirstTimeOpen(bool value) {
    _preferences!.setBool(firstTimeAppOpen, value);
  }

  bool getFirstTimeOpen() {
    var value = _preferences!.getBool(firstTimeAppOpen);
    print("Am I a new User?  $value");
    return value ?? true;
  }

  void setDateTokenExpired(DateTime time) {
    _preferences!.setString(dateTokenExpired, time.toIso8601String());
  }

  DateTime getDateTokenExpired() {
    var expireTime = _preferences!.getString(dateTokenExpired);
    return expireTime == null ? DateTime.now() : DateTime.parse(expireTime);
  }
}
