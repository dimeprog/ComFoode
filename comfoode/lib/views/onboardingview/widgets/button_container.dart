import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/style_manager.dart';

class ButtonContainer extends StatelessWidget {
  final String title;
  final buttonFunction;
  ButtonContainer({
    Key? key,
    required this.title,
    required this.buttonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: SizedBox(
        width: getWidth(373.03),
        height: getHeight(136),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getHeight(24.87),
            ),
          ),
          color: ColorManager.lightBlue,
          child: Center(
            child: Text(
              title,
              style: getBoldTextStyle(
                color: ColorManager.white,
                fontSize: FontSizeManager.s38_4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
