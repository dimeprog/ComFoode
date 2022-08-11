import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/resources/routes_manager.dart';
import '../utils/resources/theme_manager.dart';
import '../views/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ComFoode',
      theme: getApplicationTheme(),
      getPages: RouteManager.routes,
      home: SplashView(),
    );
  }
}
