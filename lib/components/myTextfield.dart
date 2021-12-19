import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';

// ignore: camel_case_types
class MyTextField extends StatelessWidget {
  final IconData? icon;
  final String hintString;
  final TextEditingController? controller;

  MyTextField({required this.hintString, this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColorSchemes.blue2,
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Icon(
              icon,
              color: Color(0xFF2C88B6),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Expanded(
              child: TextField(
                autofocus: false,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: AppColorSchemes.white.withOpacity(0.5),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
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
