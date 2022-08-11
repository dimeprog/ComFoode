import 'package:comfoode/views/Home/widgets/home_grid.dart';
import 'package:comfoode/views/Home/widgets/home_price_tag.dart';
import 'package:comfoode/views/Home/widgets/tracking_card.dart';
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
              Icons.notifications,
              color: ColorManager.white,
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: getHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(30),
              ),
              HomeTag(),
              SizedBox(
                height: getHeight(30),
              ),
              TrackingCard(),
              SizedBox(
                height: getHeight(30),
              ),
              Text(
                'Send a Package',
                style: getMediumTextStyle(
                  color: ColorManager.black,
                  fontSize: FontSizeManager.s24,
                ),
              ),
              SizedBox(
                height: getHeight(17),
              ),
              const HomeGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
