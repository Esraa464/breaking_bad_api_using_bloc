import 'package:breaking_bad_api/views/login/cubits/login_controller.dart';
import 'package:breaking_bad_api/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginController.of(context).formKey,
      child: Column(children: [
        DefaultTextFormField(
          controller: LoginController.of(context).emailController,
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
          controller: LoginController.of(context).passwordController,
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
        )
      ],),
    );
  }
}
