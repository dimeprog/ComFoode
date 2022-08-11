import 'package:comfoode/views/Home/widgets/home_drawer.dart';
import 'package:comfoode/views/Home/widgets/home_grid.dart';
import 'package:comfoode/views/Home/widgets/home_price_tag.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/resources/color_manager.dart';
import '../../utils/resources/dimension_manager.dart';
import '../../utils/resources/font_manager.dart';
import '../../utils/resources/style_manager.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.primary,
        title: Text(
          'Home, John',
          style: getSemiBoldTextStyle(
            color: ColorManager.black,
            fontSize: FontSizeManager.s24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: ColorManager.amber,
            ),
          )
        ],
      ),
      drawer: const HomeDrawer(),
      body: const HomeGridView(),
    );
  }
}
