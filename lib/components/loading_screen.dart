import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(
          color: AppColorSchemes.white,
        ),
      ),
    );
  }
}
