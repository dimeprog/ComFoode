import 'dart:convert';

import 'package:comfoode/data/local/shared_pref.dart';
import 'package:comfoode/data/remote/Api%20Services/Api.dart';
import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:comfoode/helpers/user_token_generator.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/product_model.dart';

class ProductReposistory extends GetxController {
  // variable and getter
  RxList<Product> _productList = <Product>[].obs;
  List<Product> get productList => _productList;
  final Rx<bool> _isLoading = Rx(false);
  Rx<bool> get isLoading => _isLoading;
  Sharepref? pref;

  void onInit() async {
    pref = Sharepref();
    await pref!.init();
    await fetchProduct();
  }

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

