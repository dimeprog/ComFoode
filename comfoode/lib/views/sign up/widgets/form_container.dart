import 'package:comfoode/controllers/auth_controller.dart';
import 'package:comfoode/data/remote/repository/auth_repo.dart';
import 'package:comfoode/data/remote/repository/signup_repo.dart';
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
  // final AuthController _authController = Get.put(AuthController());
  // final AuthRepository _authRepository = Get.put(AuthRepository());
  final SignUpRepo _signUpRepo = Get.put(SignUpRepo());
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
            controller: _signUpRepo.nameSignUpController,
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
            controller: _signUpRepo.emailSignUpController,
            title: ' Your Email',
            validator: (val) {
              // bool correctMail =
              //     RegExp(AppStringManager.regExpression).hasMatch(val);
              if (GetUtils.isEmail(_signUpRepo.emailSignUpController.text) ==
                  false) {
                return 'invalid email';
              }
              return null;
            },
          ),
          SizedBox(
            height: getHeight(8),
          ),
          TextFieldContainer(
            controller: _signUpRepo.passwordSignUpController,
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
            controller: _signUpRepo.comfirmPasswordController,
            title: 'Confirm Password',
            validator: (val) {
              if (val.trim() !=
                  _signUpRepo.passwordSignUpController.text.trim()) {
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
          BottomButton(onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await _signUpRepo.signUpUser();
            }
          }),
        ],
      ),
    );
  }
}
