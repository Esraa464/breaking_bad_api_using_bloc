import 'package:breaking_bad_api/views/login/components/login_list.dart';
import 'package:breaking_bad_api/views/login/cubits/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginController(),
      child: Scaffold(
        appBar: AppBar(),
        body: LoginList(),
      ),
    );
  }
}
