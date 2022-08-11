import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/color_manager.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: double.infinity,
        color: ColorManager.white,
        child: Column(
          children: [
            Text(
              'Menu',
              style: TextStyle(
                color: ColorManager.lightBlue,
                fontSize: 30,
                fontFamily: 'ConcertOne',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Cart',
                style: getSemiBoldTextStyle(
                  color: ColorManager.black,
                  fontSize: FontSizeManager.s20,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Order',
                style: getSemiBoldTextStyle(
                  color: ColorManager.black,
                  fontSize: FontSizeManager.s20,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'History',
                style: getSemiBoldTextStyle(
                  color: ColorManager.black,
                  fontSize: FontSizeManager.s20,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
