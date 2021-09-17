import 'package:breaking_bad_api/views/splash/view.dart';
import 'package:flutter/material.dart';

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
      home: SplashView(),
    );
  }
}
