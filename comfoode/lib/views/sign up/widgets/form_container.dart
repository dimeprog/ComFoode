import 'package:comfoode/views/sign%20up/widgets/bottom_buttons.dart';
import 'package:comfoode/utils/widgets/textfield_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';

import '../../../utils/resources/dimension_manager.dart';
import '../../../utils/resources/routes_manager.dart';
import '../../../utils/widgets/text&textbutton.dart';
import '../../../utils/widgets/textfield_container.dart';

class FormContainer extends StatelessWidget {
  //  controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

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
            controller: _nameController,
            title: 'Full Name',
            validator: (val) {},
          ),
          SizedBox(
            height: getHeight(20),
          ),
          TextFieldContainer(
            controller: _emailController,
            title: ' Your Email',
            validator: (val) {},
          ),
          SizedBox(
            height: getHeight(20),
          ),
          TextFieldContainer(
            controller: _passwordController,
            title: 'Password',
            validator: (val) {},
          ),
          SizedBox(
            height: getHeight(20),
          ),
          TextFieldContainer(
            controller: _confirmpasswordController,
            title: 'Confirm Password',
            validator: (val) {},
          ),
          SizedBox(
            height: getHeight(20),
          ),
          SizedBox(
            height: getHeight(7),
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
          const BottomButton(),
        ],
      ),
    );
  }
}
