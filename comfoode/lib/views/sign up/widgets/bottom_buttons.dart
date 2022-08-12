import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/widgets/mini_button_card.dart';
import '../../../utils/resources/routes_manager.dart';

class BottomButton extends StatelessWidget {
  final onPressed;
  const BottomButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(42)),
      height: 100,
      width: 150,
      child: Center(
        child: MiniButtonCard(
          title: 'SignUp',
          textcolor: ColorManager.white,
          backgroundColor: ColorManager.lightBlue,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
