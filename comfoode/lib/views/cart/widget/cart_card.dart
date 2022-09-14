import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/dimension_manager.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
        height: getHeight(150),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getHeight(20),
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            '',
            style: TextStyle(
                fontFamily: 'ConcertOne',
                fontSize: getHeight(50),
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
