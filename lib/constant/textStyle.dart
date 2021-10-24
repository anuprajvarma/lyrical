import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 17.0,
);

const KMessageTextFieldDecoration = InputDecoration(
    border: InputBorder.none,
    hintText: '',
    hintStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.w500));

const kMessageContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(32)),
    color: Color(0xFFB71C1C));

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
  hintStyle: TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
);
