import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/style_manager.dart';


class OtpCircleField extends StatelessWidget {
  final Controller;
  final validator;

  OtpCircleField({
    Key? key,
    required this.Controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(66.6),
      width: getWidth(57),
      child: Card(
        elevation: 1,
        shape: Theme.of(context).cardTheme.shape,
        color: ColorManager.white,
        child: TextFormField(
          style: getBoldTextStyle(
            color: ColorManager.textcolor,
            fontSize: FontSizeManager.s17,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: Controller,
          validator: validator,
          decoration: InputDecoration(
            fillColor: ColorManager.white,
            filled: true,
            border: Theme.of(context).inputDecorationTheme.border,
            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
            focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
            errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          ),
        ),
      ),
    );
  }
}
