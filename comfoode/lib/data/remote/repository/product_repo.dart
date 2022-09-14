import 'dart:convert';
import 'dart:math';

import 'package:comfoode/data/local/shared_pref.dart';
import 'package:comfoode/data/remote/Api%20Services/Api.dart';
import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:comfoode/data/remote/repository/auth_repo.dart';
import 'package:comfoode/data/remote/repository/cart_repo.dart';
import 'package:comfoode/helpers/user_token_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/product_model.dart';

class ProductReposistory extends GetxController {
  final CartRespository _cartRepository = Get.put(CartRespository());

  // variable and getter
  RxList<Product> _productList = <Product>[].obs;
  List<Product> get productList => _productList;
  final Rx<bool> _isLoading = Rx(false);
  Rx<bool> get isLoading => _isLoading;
  Sharepref? pref;
  RxInt _quantity = 0.obs;
  int get quantity => _quantity.value;
  RxInt _inCartItems = 0.obs;
  int get inCartItems => _inCartItems.value + _quantity.value;
// color list
  List<Color> colorList = <Color>[
    Color(0xffc5cbd3),
    Color(0xffdda448),
    Color(0xffbb342f),
    Color(0xff8d6a9f),
    Color(0xffb5b081),
    Color(0xffcc6c3c),
  ];
  // contoller
  late CartRespository _cart;

// //////////////////////////// methods ///////////////////////////
  Color getRndomColor() {
    final int colorIndex = Random().nextInt(colorList.length.toInt());
    return colorList[colorIndex];
  }

  //
  void setQuantity(bool val) {
    if (val) {
      _quantity.value = checkQuantity(_quantity.value + 1);
    } else {
      _quantity.value = checkQuantity(_quantity.value - 1);
    }
  }

  int checkQuantity(int quantity) {
    if (quantity <= 0) {
      Get.snackbar(
        'Item count',
        'You can"t reduce more !',
        backgroundColor: Colors.amber,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity >= 20) {
      Get.snackbar(
        'Item count',
        'You can"t add more !',
        titleText: const Text(
          'Item count',
        ),
        messageText: const Text(
          'You can"t add more !',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.amber,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartRespository cart) {
    //  String userId = pref!.getuserId();
    _quantity.value = 0;
    _inCartItems.value = 0;
    _cart = cart;
    // if it exist
    //  getfrom storage
  }

  @override
  void onInit() async {
    pref = Sharepref();
    await pref!.init();
    await fetchProduct();
    await fetchCartList();
  }

//additem
  void addItemToCart(Product product) async {
    // String userId = pref!.getuserId();
    if (_quantity.value <= 0) return;
    await _cart.addProductTocart(product, _quantity.value);
    await _cart.fetchPendingCarts();
  }

  Future<void> fetchCartList() async {
    await _cart.fetchPendingCarts();
    print('fetch cart list');
    // update();
  }

//  a
  Future fetchProduct() async {
    String userId = pref!.getuserId();
    String token = pref!.read();

    print(userId);
    print(token);
    isLoading.value = true;
    final url = Uri.parse(AppLinks.BaseUrl + '/user/$userId/products');
    try {
      final response = await http.get(
        url,
        headers: {"Authorization": token, "Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        print(response.body);
        final Json = json.decode(response.body);
        _productList.value = (Json['products']['data'] as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList();
        _isLoading.value = false;
        return _productList;
      }
      if (response.statusCode == 401) {
        final json = jsonDecode(response.body);
        Get.snackbar("Error", json['products']['message']);
        _isLoading.value = false;
      }
    } catch (err) {
      print("error occurred ${err.toString()}");
      Get.snackbar("Error", 'An Error ocurred,try again');
      _isLoading.value = false;
    }
  }
}
// ////
