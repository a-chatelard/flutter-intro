import 'package:flutter/cupertino.dart';
import 'package:projects/app/screens/auth/login_screen.dart';
import 'package:projects/app/screens/calcul_history/calcul_history_details_screen.dart';
import 'package:projects/app/screens/calcul_history/calcul_history_screen.dart';
import 'package:projects/app/screens/calculator/calculator_screen.dart';
import 'package:projects/app/screens/splash/splash_screen.dart';

const splashScreen = '/';
const loginScreen = '/login';
const homeScreen = '/home';
const calculHistoryScreen = 'history';
const calculHistoryDetailsScreen = '/history-details';

Map<String, WidgetBuilder> appRoutes = {
  splashScreen: (context) => SplashScreen(),
  loginScreen: (context) => LoginScreen(),
  homeScreen: (context) => CalculatorScreen(),
  calculHistoryScreen: (context) => CalculHistoryScreen(),
  calculHistoryDetailsScreen: ((context) => const CalculHistoryDetailsScreen())
};
