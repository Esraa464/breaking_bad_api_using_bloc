import 'package:breaking_bad_api/views/login/cubits/login_controller.dart';
import 'package:breaking_bad_api/views/login/view.dart';
import 'package:flutter/material.dart';

Widget appBar(context) {
  return AppBar(
    actions: [
      InkWell(
        child: Icon(
          Icons.logout,
        ),
        onTap: () async {
          LoginController().logout();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => LoginView()));
        },
      )
    ],
  );
}
