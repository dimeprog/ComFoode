import 'package:comfoode/utils/resources/dimension_manager.dart';
import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../resources/values_manager.dart';

class MiniButtonCard extends StatelessWidget {
  final String title;
  final Color textcolor;
  final Color backgroundColor;
  final onPressed;
  const MiniButtonCard({
    Key? key,
    required this.title,
    required this.textcolor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: getHeight(63),
        width: getWidth(136),
        child: Card(
            elevation: 1.5,
            shape: Theme.of(context).cardTheme.shape,
            color: backgroundColor,
            child: Center(
              child: Text(
                title,
                style: getMediumTextStyle(
                  color: textcolor,
                  fontSize: FontSizeManager.s24,
                ),
              ),
            )),
      ),
    );
  }
}
