import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyrical/auth/resisterPage.dart';
import 'package:lyrical/components/loading_screen.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/screens/loginScreen.dart';

import 'package:lyrical/components/myButton.dart';
import 'package:lyrical/constant/textStyle.dart';

final firestore = FirebaseFirestore.instance;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;
  bool isLoading = false;
  bool isHidden = true;
  bool isVisible = true;

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
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              //textAlign: TextAlign.center,
                              validator: (key) {
                                if (key == null || !key.contains('@')) {
                                  return 'Please Enter your email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 29,
                                ),
                                fillColor: Color(0xFF0F5C61),
                                constraints: BoxConstraints(
                                    maxHeight: 100, maxWidth: 300),
                                border: OutlineInputBorder(),
                                hintText: 'Enter your Email',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 20.0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: AppColorSchemes.blue1)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: AppColorSchemes.blue4, width: 1.5),
                                ),
                                hintStyle: TextStyle(
                                  color: Color(0xFF457585),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: kSendButtonTextStyle.copyWith(
                                  color: Colors.white)),
                          SizedBox(height: 20.0),
                          TextFormField(
                              //textAlign: TextAlign.center,
                              obscureText: isVisible,
                              validator: (key) {
                                if (key!.length < 4) {
                                  return 'Enter at least 4 character';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 29,
                                ),
                                suffixIcon: IconButton(
                                  icon: isHidden
                                      ? Icon(Icons.visibility_off_outlined)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      if (isHidden == true) {
                                        //print();
                                        isHidden = false;
                                        isVisible = false;
                                      } else {
                                        isHidden = true;
                                        isVisible = true;
                                      }
                                    });
                                  },
                                ),
                                fillColor: Color(0xFF0F5C61),
                                constraints: BoxConstraints(
                                    maxHeight: 100, maxWidth: 300),
                                border: OutlineInputBorder(),
                                hintText: 'Enter your password',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 20.0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: AppColorSchemes.blue1)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: AppColorSchemes.blue4, width: 1.5),
                                ),
                                hintStyle: TextStyle(
                                  color: Color(0xFF457585),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: kSendButtonTextStyle.copyWith(
                                  color: Colors.white)),
                          SizedBox(height: 20),
                          isLoading
                              ? LoadingScreen()
                              : MyButton(
                                  title: 'Register',
                                  colour: Colors.lightBlueAccent,
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                    }
                                    register(email, password, context);
                                  }),
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                    left: MediaQuery.of(context).size.width *
                                        0.19),
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
                                              builder: (context) =>
                                                  LoginScreen()),
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
