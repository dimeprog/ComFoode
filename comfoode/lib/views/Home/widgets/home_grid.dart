import 'package:comfoode/utils/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: getHeight(10),
          crossAxisSpacing: getWidth(10),
        ),
        itemBuilder: (context, index) => Container(
          color: ColorManager.lightBlue,
          height: getHeight(242),
          width: getWidth(186),
        ),
        itemCount: 100,
      ),
    );
  }
}
