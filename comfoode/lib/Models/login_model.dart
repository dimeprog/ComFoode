class LoginRequest {
  String? email;
  String? password;
  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email,
      'password': password,
    };
    return map;
  }
}

// login request

class LoginResponse {
  String? token;
  String? msg;
  String? userId;
  LoginResponse({
    required this.token,
    required this.msg,
    required this.userId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['user']['data']['email'] ?? '',
      msg: json['user']['message'] ?? 'érror',
      userId: json['user']['data']['userId'],
    );
  }
}
