import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/dimension_manager.dart';
import '../resources/font_manager.dart';

class IconAndEvevatedButton extends StatelessWidget {
  final String title;
  final String iconAddresss;
  final onPressed;
  const IconAndEvevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.iconAddresss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            title,
            style: getMediumTextStyle(
              color: ColorManager.white,
              fontSize: FontSizeManager.s13,
            ),
          ),
          SizedBox(
            height: getHeight(15),
            child: SvgPicture.asset(iconAddresss),
          ),
          SizedBox(
            height: getHeight(15),
            child: SvgPicture.asset(iconAddresss),
          )
        ],
      ),
    );
  }
}
