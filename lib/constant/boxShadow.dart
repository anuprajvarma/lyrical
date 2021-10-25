import 'package:flutter/material.dart';

List<BoxShadow> customshadow = [
  BoxShadow(
    color: Colors.pink[900]!.withOpacity(0.5),
    spreadRadius: -5,
    offset: Offset(-5, -5),
    blurRadius: 30,
  ),
  BoxShadow(
    color: Colors.pink[200]!.withOpacity(0.2),
    spreadRadius: 7,
    offset: Offset(7, 7),
    blurRadius: 20,
  )
];
