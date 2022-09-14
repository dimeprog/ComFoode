import 'package:comfoode/data/remote/repository/product_repo.dart';
import 'package:comfoode/views/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/routes_manager.dart';
import '../../../utils/resources/style_manager.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    required this.product,
  });
  final Product product;

  final colorCode = Get.find<ProductReposistory>().getRndomColor();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailsScreen(
            product: product,
            colorCode: colorCode,
          )),
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colorCode,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 140,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: colorCode,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Center(
                child: Text(
                  product.name!,
                  style: getSemiBoldTextStyle(
                    color: Colors.white,
                    fontSize: FontSizeManager.s20,
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "\$" + product.price.toString(),
                      style: getSemiBoldTextStyle(
                        color: Colors.black54,
                        fontSize: FontSizeManager.s18,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      size: 28,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
