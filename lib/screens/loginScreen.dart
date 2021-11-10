import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyrical/components/loading_screen.dart';
import 'package:lyrical/constant/colorSchemes.dart';

import 'package:lyrical/screens/mainAppNavigation%5C.dart';
import 'package:lyrical/components/myButton.dart';
import 'package:lyrical/constant/textStyle.dart';
import 'package:lyrical/screens/resisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email = '';
  late String password = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorSchemes.white,
      body: Column(
        children: [
          Container(
            height: 200,
            width: 500,
            decoration: BoxDecoration(color: AppColorSchemes.white),
            padding: EdgeInsets.only(left: 20, top: 50),
            child: Text(
              'Lets start with\nLogin!',
              style: TextStyle(
                color: AppColorSchemes.blue1,
                fontSize: 33,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColorSchemes.blue1,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                padding: EdgeInsets.only(top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFF0F5C61),
                      ),
                      child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Enter your email'),
                          style: kSendButtonTextStyle.copyWith(
                              color: Colors.white)),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xFF0F5C61),
                      ),

                      child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password',
                          ),
                          style: kSendButtonTextStyle.copyWith(
                              color: Colors.white)),
                      //color: Colors.blueAccent,
                    ),
                    SizedBox(height: 20),
                    isLoading
                        ? LoadingScreen()
                        : MyButton(
                            title: 'Log In',
                            colour: Colors.lightBlueAccent,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (user != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MainAppNavigation()));
                                }
                              } catch (e) {
                                print(e);
                              }
                            }),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 15, left: 42),
                          child: Text(
                            '______________________________________',
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
                              'I dont have an account?',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: AppColorSchemes.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterScreen()),
                                    (route) => false);
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: AppColorSchemes.blue3,
                                    fontSize: 16,
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
          )
        ],
      ),
    );
  }
}
