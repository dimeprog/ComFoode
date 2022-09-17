import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/material.dart';

import '../resources/dimension_manager.dart';

class WalletContainer extends StatelessWidget {
  final double balance;
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
        child: Card(
          color: Color(0xff102b3f),
          elevation: 8,
          shadowColor: ColorManager.white,
          shape: const StadiumBorder(),
          child: Center(
            child: Text(
              balance.toString(),
              style: getBoldTextStyle(
                color: Colors.white,
                fontSize: FontSizeManager.s38_4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
