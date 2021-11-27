import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyrical/auth/loginPage.dart';
import 'package:lyrical/components/loading_screen.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/components/myButton.dart';
import 'package:lyrical/constant/textStyle.dart';
import 'package:lyrical/screens/resisterScreen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String email = '';
  late String password = '';
  bool isLoading = false;
  bool isHidden = true;
  bool isVisible = true;
  final User = _auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                            validator: (key) {
                              if (key == null) {
                                return 'Please Enter your email';
                              } else if (!key.contains('@')) {
                                return 'Please Use @ character';
                              }
                              return null;
                            },
                            //textAlign: TextAlign.center,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                size: 29,
                              ),
                              filled: true,
                              fillColor: Color(0xFF0F5C61),
                              constraints:
                                  BoxConstraints(maxHeight: 100, maxWidth: 300),
                              border: OutlineInputBorder(),
                              hintText: 'Enter your Email',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 20.0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: AppColorSchemes.blue1)),
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
                            // textAlign: TextAlign.center,
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
                                //color: AppColorSchemes.blue2,
                              ),
                              suffixIcon: IconButton(
                                icon: isHidden
                                    ? Icon(Icons.visibility_off_outlined)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    if (isHidden == true) {
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
                              constraints:
                                  BoxConstraints(maxHeight: 100, maxWidth: 300),
                              border: OutlineInputBorder(),
                              hintText: 'Enter your password',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 20.0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: AppColorSchemes.blue1)),
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
                                title: 'Log In',
                                colour: Colors.lightBlueAccent,
                                onPressed: () async {
                                  //final userEmail = await _auth.currentUser!.email;
                                  //final userPassword=await _auth.currentUser.
                                  //print(_formKey.currentState!.validate());
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                  } else {
                                    isLoading = false;
                                  }
                                  loginPage(email, password, context);
                                }),
                        Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.18),
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
                                            builder: (context) =>
                                                RegisterScreen()),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
