import 'package:breaking_bad_api/views/login/components/login_button.dart';
import 'package:breaking_bad_api/views/login/components/login_fields.dart';
import 'package:breaking_bad_api/views/signUp/view.dart';
import 'package:flutter/material.dart';

class LoginList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Icon(Icons.phone, size: 100),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: LoginFields(),
        ),
        LoginButton(),
        TextButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => SignUp())),
            child: Text('Register'))
      ],
    );
  }
}
