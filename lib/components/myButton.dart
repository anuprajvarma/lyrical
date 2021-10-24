import 'package:flutter/material.dart';
import 'package:lyrical/constant/boxShadow.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {this.title = '',
      this.colour = Colors.redAccent,
      required this.onPressed()});

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.pink[900],
            boxShadow: customshadow),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, onPressed());
          },
          height: 16.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
