import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lyrical/screens/welcomeScreen.dart';

Future main() async {
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
        scaffoldBackgroundColor: const Color(0xff000000),
        appBarTheme: AppBarTheme(color: const Color(0xFF000000)),
      ),
      home: WelcomeScreen(),
    );
  }
}
