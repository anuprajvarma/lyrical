import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        color: Color(0xFFB71C1C),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, onPressed());
          },
          height: 42.0,
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
