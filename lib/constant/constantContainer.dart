import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';

class ConstantContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Flexible(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColorSchemes.blue2,
          ),
        ),
      ),
    );
  }
}
