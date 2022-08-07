import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_tracker/provider/get_it.dart';
import 'package:fit_tracker/routes/routes.dart';
import 'package:fit_tracker/service/navigation_service.dart';
import 'package:fit_tracker/src/screens/main_screen/main_screen.dart';
import 'package:fit_tracker/src/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit Tracker',
      debugShowCheckedModeBanner: false,
      navigatorKey: getIt<NavigationService>().navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const MainScreen();
          }
          return const SplashScreen();
        },
      ),
    );
  }
}