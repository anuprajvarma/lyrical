import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
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
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                'images/Appicon3.gif',
                fit: BoxFit.cover,
                height: 780,
                width: double.infinity,
                scale: 1,
              ),
              SafeArea(
                  child: Center(
                child: GlassmorphicContainer(
                  width: 300,
                  height: 400,
                  blur: 20,
                  border: 1,
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.5),
                      Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  borderRadius: 20,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.1),
                        Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                ),
              )),
              Positioned(
                left: 100,
                top: 300,
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF39A2DB),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    height: 50.0,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: AppColorSchemes.blue1,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 101,
                top: 380,
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF39A2DB),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    height: 50.0,
                    child: Text(
                      'Resister',
                      style: TextStyle(
                          color: AppColorSchemes.blue1,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
              ),
            ],
          )),
    ));
  }
}
