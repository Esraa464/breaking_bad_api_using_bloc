// import 'dart:async';
// import 'package:breaking_bad_api/views/homeView/view.dart';
// import 'package:breaking_bad_api/views/login/view.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Splash extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<Splash> {
//   Future<void> getData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final idToken = prefs.getString('idToken');
//     if (idToken == null)
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (ctx) => LoginView()));
//     else
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (ctx) => HomeView()));
//   }
//
//   @override
//   void initState() {
//     // Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>LoginView())));
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Loading..'),
//       ),
//     );
//   }
// }
import 'package:breaking_bad_api/views/splash/cubits/splash_controller.dart';
import 'package:breaking_bad_api/views/splash/states/splash_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // lazy: false,
      create: (BuildContext context)=> SplashController()..getData(context),
      child: Scaffold(
        body: BlocListener<SplashController , SplashStates>(
          listener: (context, state) {},
            child: Center(child: Text('Loading...'))),
      ),
    );
  }
}
