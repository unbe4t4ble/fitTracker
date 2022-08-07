import 'package:fit_tracker/src/screens/details_screen/details_screen.dart';
import 'package:fit_tracker/src/screens/login_screen/login_screen.dart';
import 'package:fit_tracker/src/screens/main_screen/main_screen.dart';
import 'package:fit_tracker/src/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  // AboutUs.routeName: (context) => AboutUs(),
};