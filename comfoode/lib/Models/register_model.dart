// register response model
class RegisterResponse {
  String? id;
  String? name;
  String? email;
  String? otp;
  bool? verified;
  // ignore: non_constant_identifier_names
  RegisterResponse({
    required this.email,
    required this.name,
    required this.id,
    required this.otp,
    required this.verified,
  });
  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      email: json['user']['data']['email'],
      name: json['user']['data']['name'],
      id: json['user']['data']['_id'],
      otp: json['user']['data']['otp'],
      verified: json['user']['data']['verified'],
    );
  }
}

//  register request model
class RegisterRequest {
  String? email;
  String? password;
  String? name;
  RegisterRequest({
    required this.email,
    required this.name,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email?.trim(),
      'name': name!.trim(),
      'password': password!.trim(),
    };
    return map;
  }
}
