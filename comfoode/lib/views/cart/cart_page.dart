import 'package:comfoode/data/remote/repository/auth_repo.dart';
import 'package:comfoode/data/remote/repository/cart_repo.dart';
import 'package:comfoode/data/remote/repository/product_repo.dart';
import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:comfoode/views/Home/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';
import 'widget/cart_card.dart';

class CartPage extends StatelessWidget {
  // final ProductReposistory _productRespository = Get.put(ProductReposistory());
  // final AuthRepository _authRespository = Get.put(AuthRepository());
  final CartRespository _cartRespository = Get.put(CartRespository());
  @override
  Widget build(BuildContext context) {
    // _productRespository.initProduct(Get.find<CartRespository>());
    _cartRespository.fetchPendingCarts();
    final List<Cart> _cartList = _cartRespository.cartListGetter;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: ColorManager.primary,
        body: RefreshIndicator(
          onRefresh: () async {
            await _cartRespository.fetchPendingCarts();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) => CartCard(
                cartSmaple: _cartList[index],
              ),
              itemCount: _cartList.length,
            ),
          ),
        ));
  }
}
