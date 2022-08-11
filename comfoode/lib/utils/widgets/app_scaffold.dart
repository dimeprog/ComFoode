import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../resources/assets_manager.dart';
import '../resources/dimension_manager.dart';

class AppScaffold extends StatelessWidget {
  final Widget widget;
  final EdgeInsets padding;
  const AppScaffold({
    Key? key,
    required this.widget,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AssetManager.AppBackgroundImage,
            ),
          ),
        ),
        padding: padding,
        height: getHeight(926),
        width: double.infinity,
        child: widget,
      ),
    );
  }
}
