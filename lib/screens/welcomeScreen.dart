import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lyrical/components/myButton.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/screens/loginScreen.dart';
import 'package:lyrical/screens/resisterScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/landingPage.png',
                width: MediaQuery.of(context).size.width * 0.34,
              ),
              Image.asset(
                'images/landingPage2.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              MyButton(
                  title: 'Get started',
                  colour: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  }),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.19),
                    child: Text(
                      '_____________________________________',
                      style: TextStyle(
                        color: AppColorSchemes.white,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColorSchemes.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: AppColorSchemes.blue3,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.042,
                              fontFamily: 'Poppins'),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
