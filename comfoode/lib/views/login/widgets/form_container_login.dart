import 'package:comfoode/views/sign%20up/widgets/textfield_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../utils/resources/dimension_manager.dart';

class FormContainerLogin extends StatelessWidget {
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
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
