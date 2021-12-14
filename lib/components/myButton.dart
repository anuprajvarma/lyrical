import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';

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
        width: MediaQuery.of(context).size.width * 0.76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFF39A2DB),
        ),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, onPressed());
          },
          height: 50.0,
          child: Text(
            title,
            style: TextStyle(
                color: AppColorSchemes.blue1,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }
}
