import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Models/product_model.dart';
import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';

class HomeItem extends StatelessWidget {
  final Product product;
  const HomeItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              width: 0.75,
              color: Colors.blueGrey,
            )),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        color: ColorManager.productColor,
        child: ListTile(
          // leading: Icon(Icons.favorite_border_rounded,
          //     color: Colors.black, size: 45),
          leading: SvgPicture.asset(
            'assets/icons/Heart.svg',
            width: 50,
            height: 50,
          ),
          title: Text(
            product.name!,
            style: getSemiBoldTextStyle(
              color: Colors.white,
              fontSize: FontSizeManager.s20,
            ),
          ),
          subtitle: Text(
            '\$${product.price!.toString()}',
            style: getMediumTextStyle(
              color: Colors.white,
              fontSize: FontSizeManager.s17,
            ),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_rounded,
                size: 32,
                color: ColorManager.amber,
              )),
        ),
      ),
    );
  }
}
