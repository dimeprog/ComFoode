import 'package:get/get.dart';

import '../../../models/cart_model.dart';
import '../../../models/item.dart';

class CartRespository extends GetxController {
  // getters and variable
  Rx<List<Cart>> _cart = Rx<List<Cart>>([]);
  List<Cart> get cart => _cart.value;
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  // methods
  addProductTocart(Item item) {}
  removeProductFromCart() {}
  fetchCartItems() {}
  checkOutCart() {}
}
