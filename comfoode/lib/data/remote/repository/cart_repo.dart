import 'dart:convert';

import 'package:comfoode/data/remote/Api%20Services/Api.dart';
import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:comfoode/data/remote/repository/auth_repo.dart';
import 'package:comfoode/data/remote/repository/product_repo.dart';
import 'package:comfoode/helpers/dialog_helper.dart';
import 'package:comfoode/helpers/user_token_generator.dart';
import 'package:comfoode/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/cart_model.dart';
import '../../../models/item.dart';
import '../../local/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum Status {
  Pending,
  Completed,
}

class CartRespository extends GetxController {
  // late ProductReposistory _productReposistory;
  // final ProductReposistory _productReposistory = Get.put(ProductReposistory());
// getters and variable
  Cart? _cart;
  Cart get cart => _cart!;
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  Map<String, Cart> _items = {};
  Sharepref? pref;
  RxInt _cartNumber = 0.obs;
  int get cartNumbers => _cartNumber.value;
  Rx<List<Cart>> cartList = Rx([]);
  List<Cart> get cartListGetter => cartList.value;

  Rx<Status> _status = Rx(Status.Pending);
  Status get status => _status.value;
// methods
  @override
  void onInit() async {
    pref = Sharepref();
    await pref!.init();
    await fetchPendingCarts();
  }

  // Product getProduct(String id) {
  //   final products = _productReposistory.productList;
  //   final Product selectedProduct =
  //       products.firstWhere((prod) => prod.id == id);
  //   return selectedProduct;
  // }

  int getCartItems() {
    final List<Item> items = _cart!.items ?? [];
    return items.length;
  }

  Future addProductTocart(Product product, int quantity) async {
    final int amount = product.price! * quantity;
    // await fetchCartItems(product, quantity);
    final String userId = pref!.getuserId();
    final String token = pref!.read();
    try {
      final response = await ApiClient.postData(AppLinks.addToCart, {
        "userId": userId,
        "productId": product.id,
        "quantity": quantity,
      }, headers: {
        "Authorization": token,
        "Content-Type": "application/json"
      });

      if (response.statusCode == 200) {
        Get.snackbar(
          'Added Item',
          'You Just added an Item to cart successfully ',
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
        final json = jsonDecode(response.body);
        print(json);

        final cartData = json['cart']['data'] as Map<String, dynamic>;
        if (cartData.containsKey("modifiedCount")) {
          print('cart list modified');
        } else {
          _cart = Cart.fromJson(cartData);
          _cartNumber.value = _cart!.items!.length;
          pref!.saveOrderId(cartData["orderId"]);
          print(pref!.getOrderId());
          await getCartItems();
          _cart!.status == 'pending'
              ? _status(Status.Pending)
              : _status(Status.Completed);
        }
      } else {
        final json = jsonDecode(response.body);
        Get.snackbar(
          'Error',
          json['message'],
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
      }
    } catch (err) {
      DialogHelper.showDialog(content: err.toString());
    }
  }

  removeProductFromCart() async {}
  // fetch data from server
  Future fetchPendingCarts() async {
    final String userId = pref!.getuserId();
    print(userId);
    final String orderId = pref!.getOrderId();
    print(orderId);
    final String token = pref!.read();
    print(token);
    // /user/62f5a02c9e3395c632a8ab75/cart?status=pending
    final url = Uri.parse(
      AppLinks.BaseUrl + '/user/$userId/cart?status=pending',
    );
    try {
      final res = await http.get(
        url,
        headers: {"Authorization": token, "Content-Type": "application/json"},
      );
      print('loading');
      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        print(json);

        final data = json['cart']['data'] as List;
        Get.snackbar(
          'Fetch Cart',
          ' fetch data was success',
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
        if (data.isNotEmpty) {
          cartList.value = data.map((e) => Cart.fromJson(e)).toList();
        } else {
          print('data is empty');
        }
        print(cartList);
      } else {
        final json = jsonDecode(res.body);
        Get.snackbar(
          'Error',
          json['message'],
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
      }
    } catch (err) {
      DialogHelper.showDialog(content: err.toString());
    }
  }

  checkOutCart() {}

  // new logic

}
