import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/material.dart';

import '../resources/dimension_manager.dart';

class WalletContainer extends StatelessWidget {
  final int? balance;
  const WalletContainer({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: getWidth(150),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            color: Color(0xff102b3f),
            elevation: 8,
            margin: EdgeInsets.all(getWidth(10)),
            shadowColor: ColorManager.white,
            shape: const StadiumBorder(),
            child: Center(
              child: Text(
                '\$${balance.toString()}',
                style: getSemiBoldTextStyle(
                  color: Colors.white,
                  fontSize: FontSizeManager.s20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
