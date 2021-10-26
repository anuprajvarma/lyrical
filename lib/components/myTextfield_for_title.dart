import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField_title extends StatelessWidget {
  String hintString;

  void Function(String)? onChanged;

  MyTextField_title({this.hintString = '', this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF0F5C61),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.headphones,
              color: Color(0xFF2C88B6),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                autofocus: false,
                onChanged: onChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Color(0xFF457585),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  fillColor: Colors.white,
                  hintText: hintString,
                ),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
