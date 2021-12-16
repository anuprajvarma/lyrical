import 'package:flutter/material.dart';

class ImageLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Image.asset(
      'images/landingPage.png',
      height: 100,
    )));
  }
}
