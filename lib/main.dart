import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lyrical/auth/checkLogin.dart';
import 'package:lyrical/screens/mainAppNavigation%5C.dart';
import 'package:lyrical/screens/welcomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF053742),
        appBarTheme: AppBarTheme(color: const Color(0xFF0C1136)),
      ),
      home: checkLogin() ? MainAppNavigation() : WelcomeScreen(),
    );
  }
}
