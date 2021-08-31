import 'package:breaking_bad_api/views/login/view.dart';
import 'package:breaking_bad_api/views/signUp/view.dart';
import 'package:breaking_bad_api/views/splash/cubits/splash_controller.dart';
import 'package:breaking_bad_api/views/splash/view.dart';
import 'package:breaking_bad_api/views/terms/view.dart';
import 'package:breaking_bad_api/views/timer/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Route<dynamic> onGenerateRoute(RouteSettings settings) => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'BreakingBad',
      home:LoginView(),
    );
  }
}
