import 'package:comfoode/utils/widgets/app_scaffold.dart';
import 'package:comfoode/views/login/widgets/bottom_buttons_login.dart';
import 'package:comfoode/views/login/widgets/form_container_login.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';

import '../../utils/resources/color_manager.dart';
import '../../utils/resources/dimension_manager.dart';
import '../../utils/resources/font_manager.dart';
import '../../utils/resources/routes_manager.dart';
import '../../utils/resources/style_manager.dart';
import '../../utils/widgets/text&textbutton.dart';
import '../sign up/widgets/bottom_buttons.dart';
import '../sign up/widgets/form_container.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.only(
        top: getHeight(84.33),
      ),
      widget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: getWidth(22), top: getHeight(84.04)),
              child: Text(
                'Sign In',
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
                'Create an account to get started with ConFoode',
                style: getLightTextStyle(
                  color: ColorManager.textcolor,
                  fontSize: FontSizeManager.s17,
                ),
              ),
            ),
            SizedBox(
              height: getHeight(22.44),
            ),
            FormContainerLogin(),
          ],
        ),
      ),
    );
  }
}
