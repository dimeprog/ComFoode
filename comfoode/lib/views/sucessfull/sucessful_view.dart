import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

import '../../utils/widgets/app_scaffold.dart';
import '../../utils/resources/color_manager.dart';
import '../../utils/resources/dimension_manager.dart';
import '../../utils/resources/font_manager.dart';
import '../../utils/resources/style_manager.dart';
import '../Home/home_view.dart';

class SucessfulView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.only(
        top: getHeight(84.04),
      ),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: getWidth(22), top: getHeight(84.04)),
            child: Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: getHeight(FontSizeManager.s26_33),
                color: ColorManager.textcolor,
                fontWeight: FontWeightManager.medium,
              ),
            ),
          ),
          SizedBox(
            height: getHeight(4.09),
          ),
          Container(
            padding: EdgeInsets.only(left: getWidth(22)),
            height: getHeight(52),
            child: Text(
              'Your account has been successfully created.',
              style: getLightTextStyle(
                color: ColorManager.textcolor,
                fontSize: FontSizeManager.s17,
              ),
            ),
          ),
          SizedBox(
            height: getHeight(37),
          ),
          Center(
            child: SizedBox(
              height: getHeight(306),
              width: getWidth(308),
              child: Image.asset(
                'assets/images/congratulation.png',
                alignment: Alignment.center,
              ),
            ),
          ),
          SizedBox(
            height: getHeight(70),
          ),
          Center(
            child: SizedBox(
              width: getWidth(193),
              height: getHeight(63),
              child: ElevatedButton(
                onPressed: () => Get.offAll(() => HomeView()),
                child: Text(
                  'Continue',
                  style: getMediumTextStyle(
                    color: ColorManager.white,
                    fontSize: FontSizeManager.s24,
                  ),
                ),
                style: Theme.of(context).elevatedButtonTheme.style,
              ),
            ),
          )
        ],
      ),
    );
  }
}
