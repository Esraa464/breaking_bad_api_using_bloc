import 'package:breaking_bad_api/views/home/view.dart';
import 'package:breaking_bad_api/views/login/cubits/login_controller.dart';
import 'package:breaking_bad_api/views/login/states/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = LoginController.of(context);
    return
      BlocBuilder(
        bloc: loginController,
        builder: (context, state)
    =>
    state is LoginLoading
        ? CircularProgressIndicator()
        :
    ElevatedButton(
        onPressed: () async {
          if (!loginController.formKey.currentState.validate()) return;

          final message = await loginController.login(
              loginController.emailController.text,
              loginController.passwordController.text);
          if (message != 'ok') {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(message)));
          } else {
            print(loginController.emailController.text * 9);
            print(loginController.passwordController.text * 29);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeView(),
                ));
          }
        },
        child: Text('Login')

    )
    );
  }
}
