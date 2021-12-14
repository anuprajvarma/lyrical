import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';

// ignore: camel_case_types
class MyTextField_artist extends StatefulWidget {
  final String hintString;
  void Function(String)? onChanged;

  MyTextField_artist({required this.hintString, this.onChanged});

  @override
  State<MyTextField_artist> createState() => _MyTextField_artistState();
}

// ignore: camel_case_types
class _MyTextField_artistState extends State<MyTextField_artist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.88,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF0F5C61),
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Icon(
              Icons.person,
              color: Color(0xFF2C88B6),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Expanded(
              child: TextField(
                autofocus: false,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Color(0xFF457585),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  fillColor: AppColorSchemes.white,
                  hintText: widget.hintString,
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
