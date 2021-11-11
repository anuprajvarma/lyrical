import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lyrical/screens/mainAppNavigation%5C.dart';

final _auth = FirebaseAuth.instance;

Future<void> loginPage(
    String email, String password, BuildContext context) async {
  try {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (user != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MainAppNavigation()));
    }
  } catch (e) {
    print(e);
  }
}
