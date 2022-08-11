import 'package:comfoode/Models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> _productList = [];
  List<Product> get productList => _productList;
}
