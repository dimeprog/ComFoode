import 'package:comfoode/controllers/auth_controller.dart';
import 'package:comfoode/data/remote/repository/auth_repo.dart';
import 'package:comfoode/data/remote/repository/cart_repo.dart';
import 'package:comfoode/data/remote/repository/product_repo.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthRepository>(() => AuthRepository(), fenix: true);
    Get.lazyPut<ProductReposistory>(
      () => ProductReposistory(),
    );
    Get.lazyPut<CartRespository>(
      () => CartRespository(),
    );
  }
}
