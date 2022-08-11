import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/widgets/icon&elevatedbutton.dart';
import '../../../utils/resources/style_manager.dart';

class HomeTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: getWidth(28),
        top: getHeight(14),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: getWidth(20),
      ),
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/home_tag.png'),
        ),
      ),
      child: Row(
        children: [
          Container(
            // ),
            child: Column(
              children: [
                Text(
                  'Total Balance',
                  style: getRegularTextStyle(
                    color: ColorManager.black,
                    fontSize: FontSizeManager.s15,
                  ),
                ),
                SizedBox(
                  height: getHeight(4),
                ),
                Text(
                  'N50000',
                  style: getSemiBoldTextStyle(
                    color: ColorManager.black,
                    fontSize: FontSizeManager.s24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: getWidth(90),
          ),
          SizedBox(
            height: getHeight(34),
            child: IconAndEvevatedButton(
              iconAddresss: 'assets/images/big_forword_arrow.svg',
              onPressed: () {},
              title: 'Top up',
            ),
          )
        ],
      ),
    );
  }
}
