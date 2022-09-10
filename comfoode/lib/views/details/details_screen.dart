import 'dart:math';

import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/utils/resources/dimension_manager.dart';
import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../data/remote/repository/product_repo.dart';
import '../../models/product_model.dart';
import 'components/color_dot.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    // required this.colorCode,
    required this.product,
    Key? key,
  }) : super(key: key);
  final Product product;
  // final Color colorCode;
  final colorCode = Get.find<ProductReposistory>().getRndomColor();
//
  @override
  Widget build(BuildContext context) {
    // final containerColor = colorCode;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        // mainAxisAlignment:MainAxisAlignment.spaceBetween,
        backgroundColor: ColorManager.primary,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          CircleAvatar(
            radius: getHeight(32),
            backgroundColor: Colors.grey.shade50,
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.amber,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 10,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: getHeight(250),
          padding: EdgeInsets.all(getHeight(40)),
          // margin: EdgeInsets.all(getHeight(10)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getHeight(30),
            ),
            color: ColorManager.productColor,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // controller.setQuantity(false);
                      },
                      child: Icon(
                        size: getHeight(24),
                        Icons.remove,
                        color: ColorManager.productColor,
                      ),
                    ),
                    Text(
                      "\$ ${product.price!}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getHeight(26),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // controller.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        size: getHeight(24),
                        color: ColorManager.productColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: getHeight(70),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: getHeight(20),
                  bottom: getHeight(20),
                  left: getWidth(20),
                  right: getWidth(20),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getHeight(40)),
                    topRight: Radius.circular(getHeight(40)),
                  ),
                  color: ColorManager.primary,
                ),
                child: Row(
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
                      // height: Dimensions.height1 * 200,
                      // width: Dimensions.width1 * 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getHeight(20)),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: ColorManager.primary,
                      ),
                    ),

                    // Add Button
                    SizedBox(
                      width: getWidth(200),
                      height: getHeight(48),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: colorCode, shape: const StadiumBorder()),
                        child: Text(
                          "Add to Cart",
                          style: getSemiBoldTextStyle(
                            color: Colors.white,
                            fontSize: FontSizeManager.s18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// Widget _buildCustomScrollview() {
//   return CustomScrollView(
//     slivers: [
//       SliverAppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: const BackButton(color: Colors.black),
//         actions: [
//           CircleAvatar(
//             radius: getHeight(32),
//             backgroundColor: Colors.grey.shade50,
//             child: IconButton(
//               icon: const Icon(
//                 Icons.shopping_cart,
//                 color: Colors.amber,
//               ),
//               onPressed: () {},
//             ),
//           )
//         ],
//       ),
//       SliverToBoxAdapter(
//         child: Container(
//           child: Column(children: [
//             Card(
//               elevation: 10,
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
//                 height: getHeight(500),
//                 color: colorCode,
//                 child: Text(
//                   product.name!,
//                   style: TextStyle(
//                     fontFamily: 'ConcertOne',
//                     fontSize: getHeight(25),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: getHeight(30),
//             ),
//             Expanded(
//               child: Container(
//                 color: Colors.white,
//                 child: Row(children: [
//                   Text(
//                     product.price!.toString(),
//                     style: getBoldTextStyle(
//                       color: ColorManager.lightBlue,
//                       fontSize: FontSizeManager.s20,
//                     ),
//                   )
//                 ]),
//               ),
//             )
//           ]),
//         ),
//       )
//     ],
//   );
// }
//
