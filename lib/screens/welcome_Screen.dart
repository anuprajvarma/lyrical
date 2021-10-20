import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrical/screens/loginPage.dart';
import 'package:lyrical/screens/resister.dart';
import 'package:lyrical/screens/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SizedBox(width: 95),
                TypewriterAnimatedTextKit(
                  text: ['Lyrical'],
                  textStyle: TextStyle(color: Colors.white, fontSize: 50),
                  speed: const Duration(milliseconds: 100),
                  totalRepeatCount: 1,
                ),
              ],
            ),
            SizedBox(height: 40),
            MyButton(
                title: 'Log In',
                colour: Color(0xFFB71C1C),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }),
            SizedBox(height: 2),
            MyButton(
                title: 'Resistration',
                colour: Color(0xFFB71C1C),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
