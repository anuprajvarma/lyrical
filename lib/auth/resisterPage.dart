import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lyrical/firebase/addHistory.dart';

import 'package:lyrical/screens/mainAppNavigation%5C.dart';

final _auth = FirebaseAuth.instance;

Future<void> register(
    String email, String password, BuildContext context) async {
  try {
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final users = _auth.currentUser;
    print('current user addd');
    final uid = users!.uid;

    await firestore.collection('Users').doc(uid).set({'likedlyrics': []});

    await firestore.collection('Historys').doc(uid).set({'history': []});

    if (newUser != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MainAppNavigation()));
    }
  } catch (e) {
    print(e);
  }
}
