import 'package:breaking_bad_api/views/login/view.dart';
import 'package:breaking_bad_api/views/signUp/cubits/sign-up_controller.dart';
import 'package:breaking_bad_api/views/signUp/states/sign_up_states.dart';
import 'package:breaking_bad_api/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpList extends StatelessWidget {
  final SignUpController _signUpController = SignUpController();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DefaultTextFormField(
            controller: _emailController,
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
            controller: _passwordController,
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
            bloc: _signUpController,
            builder: (context, state) => state is SignUpLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState.validate()) return;

                      final message = await SignUpController().signUp(
                          _emailController.text, _passwordController.text);
                      if (message != 'ok') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                      } else {
                        print(_emailController.text * 9);
                        print(_passwordController.text * 29);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ));
                      }
                    },
                    child: Text('Register')),
          ),
        ],
      ),
    );
  }
}
