// To parse this JSON data, do
//
//     final userErrors = userErrorsFromJson(jsonString);

import 'dart:convert';

UserErrors userErrorsFromJson(String str) =>
    UserErrors.fromJson(json.decode(str));

String userErrorsToJson(UserErrors data) => json.encode(data.toJson());

class UserErrors {
  UserErrors({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  String? value;
  String? msg;
  String? param;
  String? location;

  factory UserErrors.fromJson(Map<String, dynamic> json) => UserErrors(
        value: json["value"] as String,
        msg: json["msg"] as String,
        param: json["param"] as String,
        location: json["location"] as String,
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "msg": msg,
        "param": param,
        "location": location,
      };
}
