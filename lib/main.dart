import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lyrical/auth/google_sign_in.dart';
import 'package:lyrical/screens/loginPage.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          home: LoginPage(),
        ),
      );
}
