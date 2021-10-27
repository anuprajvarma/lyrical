import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';

class MyTextField_artist extends StatelessWidget {
  String hintString;

  void Function(String)? onChanged;

  MyTextField_artist({this.hintString = '', this.onChanged});

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
              Icons.person,
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
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  fillColor: AppColorSchemes.white,
                  hintText: hintString,
                ),
                style: TextStyle(
                    color: AppColorSchemes.white,
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
