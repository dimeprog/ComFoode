import 'package:get/get.dart';

import '../data/remote/repository/auth_repo.dart';

class Authorization {
  static final _authController = Get.find<AuthRepository>();
  static Map<String, String> getAuthorization() => {
        "Authorization": "Bearer ${_authController.Mtoken}",
        "Content-Type": "application/json"
      };
}
