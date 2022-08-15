import 'package:comfoode/data/remote/repository/auth_repo.dart';
import 'package:comfoode/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/resources/dimension_manager.dart';
import 'otp_circle_field.dart';

class OtpForm extends StatefulWidget {
  OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  // controller
  final AuthRepository _authRepository = Get.put(AuthRepository());
  //  keys
  final _otpFormKey = GlobalKey<FormState>();

  var errorController;
  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _otpFormKey,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: PinCodeTextField(
          controller: _authRepository.otpController,
          length: 6,
          obscureText: true,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.emailAddress,
          pinTheme: PinTheme(
            inactiveColor: ColorManager.lightBlue,
            activeColor: ColorManager.white,
            selectedColor: ColorManager.amber,
            selectedFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(getHeight(15)),
            fieldHeight: 50,
            fieldWidth: 50,
            activeFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          errorAnimationController: errorController,
          // controller: textEditingController,
          onCompleted: (v) {
            // ignore: avoid_print
            print("Completed");
          },
          onChanged: (value) {
            // ignore: avoid_print
            print(value);
            // setState(() {
            //   currentText = value;
            // });
          },
          beforeTextPaste: (text) {
            // ignore: avoid_print
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
          appContext: context,
        ),
      ),
    );
  }
}
