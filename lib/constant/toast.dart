import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast({String message = 'toast'}) => Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      fontSize: 18,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blueAccent,
    );
