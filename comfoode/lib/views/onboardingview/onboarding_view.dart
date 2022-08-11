import 'package:comfoode/views/onboardingview/widgets/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/resources/assets_manager.dart';
import '../../utils/resources/color_manager.dart';
import '../../utils/resources/dimension_manager.dart';
import '../../utils/resources/font_manager.dart';
import '../../utils/resources/routes_manager.dart';
import '../../utils/resources/style_manager.dart';
import '../../utils/resources/values_manager.dart';

class OnBoardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AssetManager.AppBackgroundImage,
            ),
          ),
        ),
        padding: EdgeInsets.only(
            left: getWidth(26.33),
            top: getHeight(84.33),
            right: getWidth(28.33)),
        height: getHeight(926),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getHeight(84.33),
              ),
              child: Container(
                width: getWidth(AppSize.s319_27),
                height: getHeight(78),
                child: Text(
                  'What kind of user are you?',
                  style: TextStyle(
                    fontSize: getHeight(FontSizeManager.s26_33),
                    color: ColorManager.textcolor,
                    fontWeight: FontWeightManager.medium,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getHeight(4.09),
            ),
            Container(
              width: getWidth(AppSize.s319_27),
              height: getHeight(78),
              child: Text(
                'We will adapt the app to suit your needs.',
                style: getLightTextStyle(
                  color: ColorManager.textcolor,
                  fontSize: FontSizeManager.s17,
                ),
              ),
            ),
            SizedBox(
              height: getHeight(48.04),
            ),
            ButtonContainer(
              title: 'Continue',
              buttonFunction: () {
                Get.toNamed(RouteManager.goToSignUpRoute());
              },
            ),
            SizedBox(
              height: getHeight(40.96),
            ),
          ],
        ),
      ),
    );
  }
}
