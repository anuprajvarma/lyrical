import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lyrical/screens/welcomeScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff000000),
        appBarTheme: AppBarTheme(color: const Color(0xFF000000)),
      ),
      home: AnimatedSplashScreen(
          splash: Image.asset(
            'images/lyrics_logo.jpg',
          ),
          nextScreen: WelcomeScreen(),
          backgroundColor: Colors.black,
          splashIconSize: 200,
          splashTransition: SplashTransition.fadeTransition),
    );
  }
}
