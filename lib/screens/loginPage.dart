import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyrical/appColorScheme/contant.dart';
import 'package:lyrical/screens/navigationBar.dart';
import 'package:lyrical/screens/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 87),
                Text(
                  'Lyrical',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                )
              ],
            ),
            SizedBox(height: 48.0),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  color: Colors.white),
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                  style: kSendButtonTextStyle.copyWith(color: Colors.black)),
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  color: Colors.white),
              child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                  style: kSendButtonTextStyle.copyWith(color: Colors.black)),
              //color: Colors.blueAccent,
            ),
            SizedBox(height: 20),
            MyButton(
                title: 'Log In',
                colour: Colors.lightBlueAccent,
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyStatefulWidget()));
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
