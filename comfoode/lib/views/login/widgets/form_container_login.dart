import 'package:comfoode/controllers/auth_controller.dart';
import 'package:comfoode/data/remote/repository/auth_repo.dart';
import 'package:comfoode/utils/resources/strings_manager.dart';
import 'package:comfoode/utils/widgets/textfield_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/resources/color_manager.dart';
import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/resources/font_manager.dart';
import '../../../utils/resources/routes_manager.dart';
import '../../../utils/resources/style_manager.dart';
import 'bottom_buttons_login.dart';

class FormContainerLogin extends StatelessWidget {
  //  controller
  // final AuthController _authController = Get.find<AuthController>();
  final AuthRepository _authRepository = Get.put(AuthRepository());

  //  key
  final _formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyLogin,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          TextFieldContainer(
            controller: _authRepository.emailLoginController,
            title: ' Your Email',
            validator: (val) {
              if (GetUtils.isEmail(_authRepository.emailLoginController.text) ==
                  false) {
                return 'invalid email';
              }
              return null;
            },
          ),
          SizedBox(
            height: getHeight(20),
          ),
          TextFieldContainer(
            controller: _authRepository.passwordLoginController,
            title: 'Password',
            validator: (val) {
              if (val.toString().length < 6) {
                return 'Password should more than 6 characters';
              }
              return null;
            },
          ),
          SizedBox(
            height: getHeight(7),
          ),
          Center(
            child: TextButton(
              child: Text(
                'Create an Account',
                style: getMediumTextStyle(
                  color: ColorManager.lightBlue,
                  fontSize: FontSizeManager.s16,
                ),
              ),
              onPressed: () => Get.toNamed(
                RouteManager.goToSignUpRoute(),
              ),
            ),
          ),
          SizedBox(
            height: getHeight(37),
          ),
          BottomButtonLogin(
            onpressed: () {
              if (_formKeyLogin.currentState!.validate()) {
                _authRepository.SignIn();
              }
            },
          ),
        ],
      ),
    );
  }
}
