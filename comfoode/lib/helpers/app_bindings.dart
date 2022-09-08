import 'package:comfoode/controllers/auth_controller.dart';
import 'package:comfoode/data/remote/repository/auth_repo.dart';
import 'package:comfoode/data/remote/repository/product_repo.dart';
import 'package:comfoode/data/remote/repository/signup_repo.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SignUpRepo>(() => SignUpRepo());
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
    Get.lazyPut<ProductReposistory>(
      () => ProductReposistory(),
    );
  }
}
