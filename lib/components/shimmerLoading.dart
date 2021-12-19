import 'package:flutter/material.dart';
import 'package:lyrical/constant/shimmerLines.dart';

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 8),
          child: Column(
            children: [
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
              ShimmerLines(),
            ],
          ),
        ),
      ),
    );
  }
}
