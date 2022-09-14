import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../models/cart_model.dart';
import '../../../utils/resources/dimension_manager.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.cartSmaple,
  });
  final Cart cartSmaple;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 3,
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.only(
              left: getWidth(20),
              right: getWidth(20),
              top: getHeight(30),
            ),
            height: getHeight(150),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                getHeight(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${cartSmaple.total.toString()}',
                      style: TextStyle(
                        fontFamily: 'ConcertOne',
                        fontSize: getHeight(30),
                        fontWeight: FontWeight.w500,
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(
                      width: getWidth(170),
                      height: 50,
                      child: Card(
                        color: const Color(0xff102b3f),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            getHeight(30),
                          ),
                        ),
                        shadowColor: Colors.grey,
                        child: Center(
                          child: Text(
                            cartSmaple.status!,
                            style: getSemiBoldTextStyle(
                              color: Colors.white,
                              fontSize: FontSizeManager.s18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(8),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: getHeight(5),
                  ),
                  child: Text(
                    ' Number of items ${cartSmaple.items![0].quantity}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontSize: FontSizeManager.s20,
                      fontWeight: FontWeightManager.medium,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
