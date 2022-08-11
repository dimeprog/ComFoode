import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/dimension_manager.dart';
import 'otp_circle_field.dart';

class OtpForm extends StatefulWidget {
  OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  // controller
  final TextEditingController _oneController = TextEditingController();

  final TextEditingController _twoController = TextEditingController();

  final TextEditingController _threeController = TextEditingController();

  final TextEditingController _fourController = TextEditingController();

  final TextEditingController _fiveController = TextEditingController();

  final TextEditingController _sixController = TextEditingController();

  //  keys
  final _otpFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _oneController.dispose();
    _twoController.dispose();
    _threeController.dispose();
    _fourController.dispose();
    _fiveController.dispose();
    _sixController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _otpFormKey,
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            OtpCircleField(
              Controller: _oneController,
              validator: (val) {},
            ),
            OtpCircleField(Controller: _twoController, validator: (val) {}),
            SizedBox(
              width: getWidth(6),
            ),
            OtpCircleField(Controller: _threeController, validator: (val) {}),
            SizedBox(
              width: getWidth(6),
            ),
            OtpCircleField(Controller: _fourController, validator: (val) {}),
            SizedBox(
              width: getWidth(6),
            ),
            OtpCircleField(
              Controller: _fiveController,
              validator: (val) {},
            ),
            SizedBox(
              width: getWidth(6),
            ),
            OtpCircleField(Controller: _sixController, validator: (val) {}),
          ],
        ),
      ),
    );
  }
}
