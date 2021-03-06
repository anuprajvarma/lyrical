import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lyrical/constant/toast.dart';
import 'package:lyrical/screens/mainAppNavigation%5C.dart';

final _auth = FirebaseAuth.instance;

Future<void> login(String email, String password, BuildContext context) async {
  try {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    toast(message: 'Login Successful');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainAppNavigation()));
  } catch (e) {
    toast(message: 'Invalid email or password');
  }
}
