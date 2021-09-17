import 'package:breaking_bad_api/views/signUp/components/signUp_button.dart';
import 'package:breaking_bad_api/views/signUp/components/signUp_fields.dart';

import 'package:flutter/material.dart';

class SignUpList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        SignUpFields(),
        SizedBox(
          height: 30,
        ),
        SignUpButton()
      ],
    );
  }
}
