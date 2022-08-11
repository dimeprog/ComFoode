import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';

import '../../utils/resources/color_manager.dart';
import '../../utils/resources/font_manager.dart';
import '../onboardingview/onboarding_view.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  // methods
  onStart() {
    _timer = Timer(const Duration(seconds: 5), _goNext);
  }

  _goNext() {
    Get.off(() => OnBoardingView());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onStart();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            'ComFoode',
            style: TextStyle(
              color: ColorManager.lightBlue,
              fontFamily: 'ConcertOne',
              fontSize: FontSizeManager.s75,
            ),
          ),
        ),
      ),
    );
  }
}
