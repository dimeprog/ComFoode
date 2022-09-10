import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:comfoode/views/Home/widgets/home_item.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart List',
            style: getBoldTextStyle(
              color: Colors.black54,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: ColorManager.primary,
        body: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) => const CartCard(),
          itemCount: 15,
        ));
  }
}

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.black12,
      margin: const EdgeInsets.all(16),
    );
  }
}
