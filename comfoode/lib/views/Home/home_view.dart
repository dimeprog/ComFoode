import 'package:comfoode/views/Home/widgets/home_drawer.dart';
import 'package:comfoode/views/Home/widgets/home_grid.dart';
import 'package:comfoode/views/Home/widgets/home_price_tag.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../data/remote/repository/auth_repo.dart';
import '../../utils/resources/color_manager.dart';
import '../../utils/resources/dimension_manager.dart';
import '../../utils/resources/font_manager.dart';
import '../../utils/resources/style_manager.dart';

class HomeView extends StatelessWidget {
  final AuthRepository _authRepository = Get.put(AuthRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.primary,
        title: Text(
          'Comfoode',
          style: getMediumTextStyle(
            color: ColorManager.productColor,
            fontSize: FontSizeManager.s24,
          ),
        ),
        // leading: GestureDetector(
        //   onTap: () {},
        //   child: SizedBox(
        //     height: getHeight(32),
        //     width: getWidth(32),
        //     child: SvgPicture.asset(
        //       'assets/icons/menu.svg',
        //       width: getHeight(5),
        //       height: getHeight(5),
        //     ),
        //   ),
        // ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: ColorManager.amber,
            ),
          ),
          IconButton(
            onPressed: () async {
              await _authRepository.SignOut();
            },
            icon: Icon(
              Icons.logout_rounded,
              color: ColorManager.grey,
              size: 25,
            ),
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: HomeGridView(),
    );
  }
}
