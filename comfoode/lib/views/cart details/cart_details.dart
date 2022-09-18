import 'package:comfoode/data/remote/repository/payment_repo.dart';
import 'package:comfoode/data/remote/repository/product_repo.dart';
import 'package:comfoode/utils/resources/dimension_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:comfoode/utils/widgets/wallet_container.dart';
import 'package:comfoode/views/payment/payment_paystack_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/cart_model.dart';
import '../../models/product_model.dart';
import '../../utils/widgets/test_screen.dart';

class CartDetailScreen extends StatefulWidget {
  final Cart cart;

  CartDetailScreen({
    super.key,
    required this.cart,
  });

  @override
  State<CartDetailScreen> createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  final ProductReposistory _productReposistory = Get.find<ProductReposistory>();
  int? balance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    balance = _productReposistory.getBalance();
  }

  @override
  Widget build(BuildContext context) {
    // final balance = _productReposistory.getBalance();
    final itemList = widget.cart.items;
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
                GetBuilder<ProductReposistory>(builder: (controller) {
                  return GestureDetector(
                    onTap: () => Get.to(() => PaymentPayStack()),
                    child: WalletContainer(
                      balance: balance,
                    ),
                  );
                }),
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
      floatingActionButton: Container(
        height: getHeight(90),
        width: getWidth(200),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Colors.amber,
          ),
          child: const Text(
            'CheckOut',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
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
