import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyrical/components/loading_screen.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/screens/loginScreen.dart';
import 'package:lyrical/screens/mainAppNavigation%5C.dart';
import 'package:lyrical/components/myButton.dart';
import 'package:lyrical/constant/textStyle.dart';

final firestore = FirebaseFirestore.instance;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;
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
              'Lets start with\nRegister!',
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
                width: 500,
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
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password',
                          ),
                          style: kSendButtonTextStyle.copyWith(
                              color: Colors.white)),
                    ),
                    SizedBox(height: 20),
                    isLoading
                        ? LoadingScreen()
                        : MyButton(
                            title: 'Register',
                            colour: Colors.lightBlueAccent,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);

                                final users = _auth.currentUser;
                                print('current user addd');
                                final uid = users!.uid;
                                print(uid);

                                await firestore
                                    .collection('Users')
                                    .doc(uid)
                                    .set({'likedlyrics': []});

                                await firestore
                                    .collection('Historys')
                                    .doc(uid)
                                    .set({'history': []});

                                if (newUser != null) {
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
                          padding: EdgeInsets.only(top: 15, left: 46),
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
