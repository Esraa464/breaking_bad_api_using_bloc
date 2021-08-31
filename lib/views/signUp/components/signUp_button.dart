import 'package:breaking_bad_api/views/login/view.dart';
import 'package:breaking_bad_api/views/signUp/cubits/sign-up_controller.dart';
import 'package:breaking_bad_api/views/signUp/states/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = SignUpController();
    return BlocBuilder(
      bloc: signUpController,
      builder: (context, state) => state is SignUpLoading
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () async {
                if (!signUpController.formKey.currentState.validate()) return;

                final message = await SignUpController().signUp(
                    signUpController.emailController.text,
                    signUpController.passwordController.text);
                if (message != 'ok') {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(message)));
                } else {
                  print(signUpController.emailController.text * 9);
                  print(signUpController.passwordController.text * 29);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginView(),
                      ));
                }
              },
              child: Text('Register')),
    );
  }
}
