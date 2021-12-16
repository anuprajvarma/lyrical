import 'package:firebase_auth/firebase_auth.dart';

bool checkLogin() {
  final auth = FirebaseAuth.instance;

  return auth.currentUser != null;
}
