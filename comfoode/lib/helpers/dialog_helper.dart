import 'package:comfoode/utils/resources/font_manager.dart';
import 'package:comfoode/utils/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/resources/color_manager.dart';
import '../utils/resources/dimension_manager.dart';

class DialogHelper {
  //  show dialog
  static void showDialog(
      {String message = 'Error', String content = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        elevation: getHeight(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getHeight(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: getSemiBoldTextStyle(
                  color: ColorManager.lightBlue,
                  fontSize: FontSizeManager.s20,
                ),
              ),
              Text(content,
                  style: getMediumTextStyle(
                    color: ColorManager.white,
                    fontSize: FontSizeManager.s16,
                  )),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text('Okay',
                    style: getMediumTextStyle(
                      color: ColorManager.lightBlue,
                      fontSize: FontSizeManager.s15,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // show snackbar
  //  show bottomsheet
  // ...

}
