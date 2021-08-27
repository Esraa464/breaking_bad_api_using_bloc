import 'package:breaking_bad_api/views/homeView/components/appBar.dart';
import 'package:breaking_bad_api/views/homeView/components/characters_list.dart';
import 'package:breaking_bad_api/views/homeView/cubits/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeController()..getData(),
      child: Scaffold(
        appBar: appBar(context),
        body: HomeCharactersList(),
      ),
    );
  }
}
