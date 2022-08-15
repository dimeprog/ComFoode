import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../Models/product_model.dart';
import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';

class HomeItem extends StatelessWidget {
  final Product product;
  const HomeItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.lightBlue,
      child: ListTile(),
    );
  }
}
