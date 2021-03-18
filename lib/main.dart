import 'package:efarm/screens/forgetPassword.dart';
import 'package:efarm/screens/homepageScreen.dart';
import 'package:efarm/screens/signupScreen.dart';
import 'package:efarm/screens/tabsScreenView.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/loginScreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Farm',
      theme: ThemeData(
        primaryColor: Colors.green,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'JameelNooriNastalerq',
            fontSize: 30.0,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontFamily: 'JameelNooriNastalerq',
            fontSize: 20.0,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontFamily: 'JameelNooriNastalerq',
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.white,
      ),
      // home: LoginScreen(),
        initialRoute: TabsScreenView.routeName,
        routes: {
          '/': (ctx) => LoginScreen(),
          TabsScreenView.routeName: (ctx)=> TabsScreenView(),
          SignupScreen.routeName: (ctx) => SignupScreen(),
          HomePageScreen.routeName: (ctx) => HomePageScreen(),
          ForgetPasswordScreen.routeName: (ctx)=> ForgetPasswordScreen(),
        }
    );
  }
}