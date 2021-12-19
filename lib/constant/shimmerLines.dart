import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Shimmer.fromColors(
          baseColor: Colors.white70,
          highlightColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: AppColorSchemes.white.withOpacity(0.5),
            ),
          ),
        ),
        SizedBox(height: 10),
        Shimmer.fromColors(
          baseColor: Colors.white70,
          highlightColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: AppColorSchemes.white.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
