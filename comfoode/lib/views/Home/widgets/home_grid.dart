// ignore_for_file: unnecessary_null_comparison

import 'package:comfoode/models/product_model.dart';
import 'package:comfoode/data/remote/repository/product_repo.dart';

import 'package:comfoode/utils/resources/values_manager.dart';

import 'package:comfoode/views/Home/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeGridView extends StatelessWidget {
  final ProductReposistory _productReposistory = Get.put(ProductReposistory());

  @override
  Widget build(BuildContext context) {
    final List<Product> productList = _productReposistory.productList;
    return Padding(
        padding: const EdgeInsets.all(AppSize.s10),
        child: Obx(
          () => productList.isEmpty
              ? const Center(
                  child: Text(
                    'No product yet',
                    style: TextStyle(
                      fontFamily: 'ConcertOne',
                      fontSize: 16,
                    ),
                  ),
                )
              :
              // ListView.builder(
              //     itemBuilder: (context, index) => HomeItem(
              //       product: _productList[index],
              //     ),
              //     itemCount: _productList.length,
              //   ),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => ProductCard(
                    product: productList[index],
                  ),
                  itemCount: productList.length,
                ),
        ));
  }
}
