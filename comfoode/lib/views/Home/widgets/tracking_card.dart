import 'package:comfoode/views/Home/widgets/textfield_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/style_manager.dart';

class TrackingCard extends StatelessWidget {
  TrackingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(136),
      width: getWidth(388),
      child: Card(
        // margin: EdgeInsets.only(
        //   top: getHeight(23),
        // ),
        child: Column(
          children: [
            Text(
              'Track your waybill',
              style: getSemiBoldTextStyle(
                color: ColorManager.black,
                fontSize: FontSizeManager.s20,
              ),
            ),
            SizedBox(
              height: getHeight(16),
            ),
            TextFieldCard()
          ],
        ),
      ),
    );
  }
}
