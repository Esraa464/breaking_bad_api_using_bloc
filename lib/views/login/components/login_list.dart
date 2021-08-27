import 'package:breaking_bad_api/views/homeView/view.dart';
import 'package:breaking_bad_api/views/login/cubits/login_controller.dart';
import 'package:breaking_bad_api/views/login/states/login_states.dart';
import 'package:breaking_bad_api/views/signUp/view.dart';
import 'package:breaking_bad_api/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginList extends StatelessWidget {
  final LoginController _loginController = LoginController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginController = LoginController().of(context);
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Icon(Icons.phone, size: 100),
          SizedBox(
            height: 30,
          ),
          DefaultTextFormField(
            controller: emailController,
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
            controller: passwordController,
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
          SizedBox(
            height: 30,
          ),
          BlocBuilder(
            bloc: loginController,
            builder: (context, state) => state is LoginLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState.validate()) return;

                      final message = await _loginController.login(
                          emailController.text, passwordController.text);
                      if (message != 'ok') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                      } else {
                        print(emailController.text * 9);
                        print(passwordController.text * 29);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ));
                      }
                    },
                    child: Text('Login')),
          ),
          TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => SignUp())),
              child: Text('Register'))
        ],
      ),
    );
  }
}
