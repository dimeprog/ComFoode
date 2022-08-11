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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 8,
              child: Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  color: ColorManager.amber,
                  borderRadius: BorderRadius.circular(
                    getHeight(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    'ComFoode',
                    style: TextStyle(
                      color: ColorManager.lightBlue,
                      fontSize: 60,
                      fontFamily: 'ConcertOne',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: getWidth(22)),
              height: getHeight(152),
              child: Text(
                ' The Best food you can order is waiting for you, just in there and feast',
                style: getBoldTextStyle(
                  color: ColorManager.textcolor,
                  fontSize: FontSizeManager.s20,
                ),
              ),
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
