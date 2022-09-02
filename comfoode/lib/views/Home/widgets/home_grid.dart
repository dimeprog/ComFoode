// ignore_for_file: unnecessary_null_comparison

import 'package:comfoode/data/remote/repository/product_repo.dart';
import 'package:comfoode/models/product_model.dart';
import 'package:comfoode/utils/resources/values_manager.dart';
import 'package:comfoode/views/Home/widgets/home_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';

class HomeGridView extends StatelessWidget {
  final ProductReposistory _productReposistory = Get.put(ProductReposistory());

  @override
  Widget build(BuildContext context) {
    final _productList = _productReposistory.productList;
    return Padding(
      padding: const EdgeInsets.all(AppSize.s10),
      child: Obx(
        () => _productList.isEmpty
            ? const Center(
                child: Text(
                  'No product yet',
                  style: TextStyle(
                    fontFamily: 'ConcertOne',
                    fontSize: 16,
                  ),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) => HomeItem(
                  product: _productReposistory.productList[index],
                ),
                itemCount: 100,
              ),
      ),
    );
  }
}
