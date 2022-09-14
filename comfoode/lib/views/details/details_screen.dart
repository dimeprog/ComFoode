import 'dart:math';

import 'package:comfoode/data/remote/repository/cart_repo.dart';
import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/utils/resources/dimension_manager.dart';
import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:comfoode/utils/widgets/no_of%20_items_cart.dart';
import 'package:comfoode/views/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../data/remote/repository/product_repo.dart';
import '../../models/product_model.dart';
import 'components/color_dot.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    required this.colorCode,
    required this.product,
    Key? key,
  }) : super(key: key);
  final Product product;
  final Color colorCode;
  final ProductReposistory _productReposistory = Get.find<ProductReposistory>();
  final CartRespository _cartRespository = Get.put(CartRespository());
//
  @override
  Widget build(BuildContext context) {
    _productReposistory.initProduct(_cartRespository);
    // _cartRespository.intCart();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // mainAxisAlignment:MainAxisAlignment.spaceBetween,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.grey),
        actions: [
          CircleAvatar(
            radius: getHeight(32),
            backgroundColor: Colors.grey.shade50,
            child: Center(
              child: NoOfItemCartIcon(
                cartColor: Colors.amber,
                press: () => Get.to(() => CartPage()),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 6,
              color: colorCode,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
                height: getHeight(150),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    getHeight(20),
                  ),
                  color: colorCode,
                ),
                child: Center(
                  child: Text(
                    product.name!,
                    style: TextStyle(
                        fontFamily: 'ConcertOne',
                        fontSize: getHeight(50),
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: getHeight(600),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getHeight(120)),
                ),
                color: colorCode.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: colorCode.withOpacity(0.2),
        child: Padding(
          padding: EdgeInsets.only(
            left: getWidth(8),
            right: getWidth(8),
            bottom: getHeight(8),
          ),
          child: Container(
            height: getHeight(250),
            padding: EdgeInsets.all(getHeight(40)),
            // margin: EdgeInsets.all(getHeight(10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                getHeight(80),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: getWidth(20) * 2.5,
                    right: getWidth(20) * 2.5,
                    top: getHeight(20),
                  ),
                  child: Row(
                    children: [
                      Obx(() {
                        return Text(
                          "\$${product.price!} X ${_productReposistory.quantity}",
                          style: TextStyle(
                              color: ColorManager.black,
                              fontSize: getHeight(32),
                              fontWeight: FontWeight.w500),
                        );
                      }),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Minus, Plus and Counting of Food
                    Container(
                      padding: EdgeInsets.only(
                        top: getHeight(15),
                        bottom: getHeight(15),
                        left: getWidth(20),
                        right: getWidth(20),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getHeight(20)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _productReposistory.setQuantity(false);
                            },
                            child: Icon(
                              size: getHeight(32),
                              Icons.remove,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(
                            width: getWidth(2),
                          ),
                          Obx(() {
                            return Text(
                              _productReposistory.quantity.toString(),
                              style: getBoldTextStyle(
                                color: Colors.black,
                                fontSize: FontSizeManager.s18,
                              ),
                            );
                          }),
                          SizedBox(
                            width: getWidth(2),
                          ),
                          GestureDetector(
                            onTap: () {
                              _productReposistory.setQuantity(true);
                            },
                            child: Icon(
                              Icons.add,
                              size: getHeight(32),
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Add Button
                    SizedBox(
                      width: getWidth(200),
                      height: getHeight(100),
                      child: ElevatedButton(
                        onPressed: () {
                          _productReposistory.addItemToCart(product);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: colorCode, shape: const StadiumBorder()),
                        child: Text(
                          "Add to Cart",
                          style: getSemiBoldTextStyle(
                            color: Colors.white,
                            fontSize: FontSizeManager.s24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
//
