import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrical/screens/loginScreen.dart';
import 'package:lyrical/screens/resisterScreen.dart';
import 'package:lyrical/components/myButton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  textStyle: TextStyle(
                    color: Color(0xFF457585),
                    fontSize: 50,
                    fontFamily: 'Poppins',
                  ),
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
            SizedBox(height: 20),
            MyButton(
                title: 'Registration',
                colour: Color(0xFFB71C1C),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
