import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/userModel.dart';

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
