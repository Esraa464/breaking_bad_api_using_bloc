import 'package:breaking_bad_api/views/signUp/cubits/sign-up_controller.dart';
import 'package:breaking_bad_api/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpFields extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SignUpController _signUpController=SignUpController().of(context);
    return
      Form(
        key: _signUpController.formKey,
        child:
        Column(children: [
      DefaultTextFormField(
        controller:_signUpController.emailController,
        hintText: 'Email',
        type: TextInputType.emailAddress,
        validate: (String value) {
          if (value.isEmpty)
            return 'Empty field!';
          else if (!value.contains('@'))
            return 'missing @!';
          else
            return null;
        },
      ),
      DefaultTextFormField(
        controller: _signUpController.passwordController,
        hintText: 'Password',
        type: TextInputType.visiblePassword,
        validate: (String value) {
          if (value.isEmpty)
            return 'Empty field!';
          else if (value.length < 6)
            return 'Length';
          else
            return null;
        },
      ),
    ],));
  }
}
