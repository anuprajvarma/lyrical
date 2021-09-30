import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lyrical/screens/lyricalpage.dart';
import 'package:lyrical/screens/loginPage.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  BuildContext? get context => null;

  Future googleLogin(BuildContext context) async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoggedInWidget();
    }));

    notifyListeners();
  }

  Future logout(BuildContext context) async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

    Navigator.pop(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
}
