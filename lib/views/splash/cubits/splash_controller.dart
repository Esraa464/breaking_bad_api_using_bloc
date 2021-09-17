import 'package:breaking_bad_api/views/home/view.dart';
import 'package:breaking_bad_api/views/login/view.dart';
import 'package:breaking_bad_api/views/splash/states/splash_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends Cubit <SplashStates>{
  SplashController() : super(SplashInitial());

  Future<void> getData(context) async {
    final prefs = await SharedPreferences.getInstance();
    final idToken = prefs.getString('idToken');
    if (idToken == null)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => LoginView()));
    else
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => HomeView()));

  }

  // TextEditingController _controller = TextEditingController();
  //
  // @override
  // Future<void> close() {
  //   print('Closed!');
  //   _controller.dispose();
  //   return super.close();
  // }

}
