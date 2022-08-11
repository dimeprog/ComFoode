import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/style_manager.dart';

class TextFieldCard extends StatefulWidget {
  @override
  State<TextFieldCard> createState() => _TextFieldCardState();
}

class _TextFieldCardState extends State<TextFieldCard> {
  final TextEditingController controller = TextEditingController();

  final _formSearchHomeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(44),
      width: getWidth(323),
      child: Form(
        key: _formSearchHomeKey,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Waybill Number",
            hintStyle: getLightTextStyle(
              color: ColorManager.textcolor,
              fontSize: FontSizeManager.s15,
            ),
            fillColor: ColorManager.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHeight(17),
              ),
              borderSide: BorderSide(
                color: ColorManager.lightBlue,
                width: 0.8,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHeight(17),
              ),
              borderSide: BorderSide(
                color: ColorManager.grey,
                width: 0.8,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                getHeight(17),
              ),
              borderSide: BorderSide(
                color: ColorManager.lightBlue,
                width: 2,
              ),
            ),
            prefix: Icon(
              Icons.search,
              color: ColorManager.grey,
            ),
            suffix: suffixButtron(),
          ),
        ),
      ),
    );
  }
}

class suffixButtron extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(38),
      width: getWidth(81),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Track',
          style: getRegularTextStyle(
            color: ColorManager.white,
            fontSize: FontSizeManager.s14,
          ),
        ),
      ),
    );
  }
}
