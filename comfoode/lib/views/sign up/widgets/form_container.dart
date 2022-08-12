import 'package:comfoode/controllers/auth_controller.dart';
import 'package:comfoode/utils/resources/strings_manager.dart';
import 'package:comfoode/views/sign%20up/widgets/bottom_buttons.dart';
import 'package:comfoode/utils/widgets/textfield_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/resources/routes_manager.dart';
import '../../../utils/widgets/text&textbutton.dart';
import '../../../utils/widgets/textfield_container.dart';

class FormContainer extends StatelessWidget {
  //  controller

  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  //  key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFieldContainer(
            controller: _authController.nameSignUpController,
            title: 'Full Name',
            validator: (val) {
              if (val.toString().length < 4) {
                return 'name should more than 4 characters';
              }
              return null;
            },
          ),
          SizedBox(
            height: getHeight(8),
          ),
          TextFieldContainer(
            controller: _authController.emailSignUpController,
            title: ' Your Email',
            validator: (val) {
              bool correctMail =
                  RegExp(AppStringManager.regExpression).hasMatch(val);
              if (!correctMail) {
                return 'invalid email';
              }
              return null;
            },
          ),
          SizedBox(
            height: getHeight(8),
          ),
          TextFieldContainer(
            controller: _authController.passwordSignUpController,
            title: 'Password',
            validator: (val) {
              if (val.toString().length < 6) {
                return 'Password should more than 6 characters';
              }
              return null;
            },
          ),
          SizedBox(
            height: getHeight(8),
          ),
          TextFieldContainer(
            controller: _confirmpasswordController,
            title: 'Confirm Password',
            validator: (val) {
              if (val.trim() !=
                  _authController.passwordSignUpController.text.trim()) {
                return 'Password does not match';
              }
              return null;
            },
          ),
          SizedBox(
            height: getHeight(8),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getWidth(67),
            ),
            child: TextAndTextButton(
              text: 'Already have an account?',
              textButtonTitle: 'Log In',
              onPressed: () {
                Get.toNamed(
                  RouteManager.goToLoginRoute(),
                );
              },
            ),
          ),
          BottomButton(onPressed: () {
            if (_formKey.currentState!.validate()) {
              _authController.signUp();
            }
          }),
        ],
      ),
    );
  }
}
