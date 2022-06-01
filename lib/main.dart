import 'package:flutter/material.dart';
import 'package:projects/app/screens/app_routes.dart';
import 'package:projects/app/screens/auth/login_screen.dart';
import 'package:projects/app/screens/calcul_history/calcul_history_screen.dart';
import 'package:projects/app/screens/calculator/calculator_screen.dart';
import 'package:projects/app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(255, 255, 255, .1),
  100: Color.fromRGBO(255, 255, 255, .2),
  200: Color.fromRGBO(255, 255, 255, .3),
  300: Color.fromRGBO(255, 255, 255, .4),
  400: Color.fromRGBO(255, 255, 255, .5),
  500: Color.fromRGBO(255, 255, 255, .6),
  600: Color.fromRGBO(255, 255, 255, .7),
  700: Color.fromRGBO(255, 255, 255, .8),
  800: Color.fromRGBO(255, 255, 255, .9),
  900: Color.fromRGBO(255, 255, 255, 1),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(0xFF000000, color),
      ),
      initialRoute: splashScreen,
      routes: appRoutes,
    );
  }
}
