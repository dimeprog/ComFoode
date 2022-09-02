import 'dart:convert';

import 'package:comfoode/data/local/shared_pref.dart';
import 'package:comfoode/data/remote/Api%20Services/Api.dart';
import 'package:comfoode/data/remote/Api%20Services/constant.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../../../Models/product_model.dart';

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
    isLoading.value = true;
    try {
      final response =
          await ApiClient.getData(AppLinks.BaseUrl + '/user/$userId/products');
      if (response.statusCode == 200) {
        print(response.body);
        final Json = json.decode(response.body);
        _productList.value = Json['products']['data'];
        return _productList;
      } else {
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

