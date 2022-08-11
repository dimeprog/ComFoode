import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/widgets/mini_button_card.dart';
import '../../../utils/resources/routes_manager.dart';

class BottomButtonLogin extends StatelessWidget {
  const BottomButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(42)),
      child: Center(
        child: MiniButtonCard(
          title: 'Login',
          textcolor: ColorManager.white,
          backgroundColor: ColorManager.lightBlue,
          onPressed: () => Get.toNamed(RouteManager.goToHomeRoute()),
        ),
      ),
    );
  }
}
