import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';
import 'components/color_dot.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments as Product;
    return Scaffold(
      backgroundColor: ColorManager.productColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Image.asset(
          //   product.image,
          //   height: MediaQuery.of(context).size.height * 0.4,
          //   fit: BoxFit.cover,
          // ),
          // const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name!,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "\$" + product.price.toString(),
                        style: getMediumTextStyle(
                          color: Colors.white,
                          fontSize: FontSizeManager.s17,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 17),
                    child: Text(
                      "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
                    ),
                  ),
                  Text(
                    "Colors",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      ColorDot(
                        color: Color(0xFFBEE8EA),
                        isActive: false,
                      ),
                      ColorDot(
                        color: Color(0xFF141B4A),
                        isActive: true,
                      ),
                      ColorDot(
                        color: Color(0xFFF4E5C3),
                        isActive: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary,
                            shape: const StadiumBorder()),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
