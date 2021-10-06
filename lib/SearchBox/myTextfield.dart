import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTextField extends StatelessWidget {
  String hintString;
  var onchange;

  MyTextField(
    this.hintString,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey[900],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            FaIcon(
              FontAwesomeIcons.search,
              color: Colors.grey,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                onChanged: onchange,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.grey,
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
