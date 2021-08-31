import 'package:breaking_bad_api/views/signUp/components/signUp_list.dart';
import 'package:breaking_bad_api/views/signUp/cubits/sign-up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpController(),
      child: Scaffold(
          appBar: AppBar(title: Text('Sign Up With Email')),
          body: SignUpList()),
    );
  }
}
