import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartDetailScreen extends StatelessWidget {
  final String cartId;

  const CartDetailScreen({
    super.key,
    required this.cartId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
    );
  }
}
