import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(505),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: getHeight(10),
          crossAxisSpacing: getWidth(10),
        ),
        children: [
          Container(
            color: ColorManager.lightBlue,
            height: getHeight(242),
            width: getWidth(186),
          ),
          Container(
            color: ColorManager.lightBlue,
            height: getHeight(242),
            width: getWidth(186),
          ),
          Container(
            color: ColorManager.lightBlue,
            height: getHeight(242),
            width: getWidth(186),
          ),
          Container(
            color: ColorManager.lightBlue,
            height: getHeight(242),
            width: getWidth(186),
          ),
        ],
      ),
    );
  }
}
