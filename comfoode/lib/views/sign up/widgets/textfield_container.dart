import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/style_manager.dart';

class TextFieldContainer extends StatelessWidget {
  final String title;
  final validator;
  final controller;
  final bool obsecureText;
  TextFieldContainer({
    Key? key,
    required this.controller,
    required this.title,
    required this.validator,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: getRegularTextStyle(
              color: ColorManager.textcolor,
              fontSize: FontSizeManager.s16,
            ),
          ),
          SizedBox(
            height: getHeight(44),
            child: TextFormField(
              obscureText: obsecureText,
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                border: Theme.of(context).inputDecorationTheme.border,
                enabledBorder:
                    Theme.of(context).inputDecorationTheme.enabledBorder,
                focusedErrorBorder:
                    Theme.of(context).inputDecorationTheme.focusedErrorBorder,
                errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
                focusedBorder:
                    Theme.of(context).inputDecorationTheme.focusedBorder,
                fillColor: ColorManager.white,
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
