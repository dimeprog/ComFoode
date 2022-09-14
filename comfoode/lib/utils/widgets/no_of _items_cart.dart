import 'package:comfoode/data/remote/repository/cart_repo.dart';
import 'package:comfoode/models/cart_model.dart';
import 'package:comfoode/utils/resources/dimension_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class NoOfItemCartIcon extends StatelessWidget {
  final Color cartColor;
  final press;

  NoOfItemCartIcon({
    super.key,
    required this.cartColor,
    required this.press,
  });
  final CartRespository _cartRespository = Get.find<CartRespository>();

  @override
  Widget build(BuildContext context) {
    final no = _cartRespository.cartNumbers;
    print(no);
    return Container(
      // height: getHeight(12),
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            Icon(
              Icons.shopping_cart,
              color: cartColor,
            ),
            Obx(
              () => Positioned(
                right: getWidth(1) * 0,
                top: getHeight(1) * 0,
                child: Text(
                  _cartRespository.cartList.value.length.toString(),
                  style: TextStyle(
                    fontSize: getHeight(1.5) * 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Positioned(
          //   right: getWidth(3) * 0,
          //   top: getHeight(2) * 0,
          //   child: Icon(
          //     Icons.circle,
          //     size: getHeight(1) * 15,
          //     color: Colors.pinkAccent,
          //   ),
          // ),