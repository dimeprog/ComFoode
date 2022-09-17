import 'package:comfoode/data/remote/repository/product_repo.dart';
import 'package:comfoode/utils/resources/dimension_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:comfoode/utils/widgets/wallet_container.dart';
import 'package:comfoode/views/payment/payment_paystack_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/cart_model.dart';
import '../../models/product_model.dart';

class CartDetailScreen extends StatelessWidget {
  final Cart cart;
  final ProductReposistory _productReposistory = Get.find<ProductReposistory>();

  CartDetailScreen({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final itemList = cart.items;
    print(itemList!.length.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: Column(children: [
            Container(
              height: getHeight(90),
              child: Row(children: [
                CircleAvatar(
                  radius: getWidth(28),
                  child: Center(
                    child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.pink,
                          size: getWidth(38),
                        )),
                  ),
                ),
                SizedBox(
                  width: getWidth(60),
                ),
                GestureDetector(
                    onTap: () => Get.to(() => PaymentPayStack()),
                    child: const WalletContainer(balance: 0.0)),
              ]),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ItemContainer(
                  product: _productReposistory
                      .getProductFromId(itemList[index].productId!),
                ),
                itemCount: itemList.length,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  final Product product;
  const ItemContainer({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(120),
      margin: EdgeInsets.symmetric(
        vertical: getHeight(15),
      ),
      color: Colors.green,
      child: Text(
        product.name!,
        style: getMediumTextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
