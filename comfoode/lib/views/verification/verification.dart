import 'package:comfoode/views/verification/widgets/otp_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';

import '../../utils/widgets/app_scaffold.dart';
import '../../utils/resources/color_manager.dart';
import '../../utils/resources/dimension_manager.dart';
import '../../utils/resources/font_manager.dart';
import '../../utils/resources/routes_manager.dart';
import '../../utils/resources/style_manager.dart';
import '../../utils/resources/values_manager.dart';

class VerificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.only(
        top: getHeight(84.04),
        left: getWidth(22),
        right: getWidth(22),
      ),
      widget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getHeight(84.04),
                left: getWidth(22),
              ),
              child: Text(
                'Verification!',
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
                'We sent you an SMS code on number +2348108960610',
                style: getLightTextStyle(
                  color: ColorManager.textcolor,
                  fontSize: FontSizeManager.s17,
                ),
              ),
            ),
            SizedBox(
              height: getHeight(28),
            ),
            OtpForm(),
            SizedBox(
              height: getHeight(15),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '00: 55',
                style: getRegularTextStyle(
                    color: ColorManager.error, fontSize: FontSizeManager.s16),
              ),
            ),
            SizedBox(
              height: getHeight(22),
            ),
            Center(
              child: Text(
                'Resend code',
                style: getSemiBoldTextStyle(
                    color: ColorManager.black, fontSize: FontSizeManager.s18),
              ),
            ),
            SizedBox(
              height: getHeight(36),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(getHeight(AppSize.s30)),
                child: SizedBox(
                  height: getHeight(59),
                  width: getWidth(59),
                  child: ElevatedButton(
                    onPressed: () =>
                        Get.toNamed(RouteManager.goToRegSuccesRoute()),
                    child: Icon(
                      Icons.arrow_forward,
                      color: ColorManager.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: ColorManager.lightBlue, elevation: 8),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
