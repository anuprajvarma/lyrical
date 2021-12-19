import 'package:flutter/material.dart';
import 'package:lyrical/constant/shimmerContainer.dart';

class ShimmerBox extends StatelessWidget {
  static var use;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Container(
        child: GridView.count(
          childAspectRatio: 1.5,
          crossAxisCount: 2,
          addAutomaticKeepAlives: true,
          cacheExtent: double.infinity,
          children: [
            Shimmercontainer(),
            Shimmercontainer(),
            Shimmercontainer(),
            Shimmercontainer(),
            Shimmercontainer(),
            Shimmercontainer(),
            Shimmercontainer(),
            Shimmercontainer(),
            Shimmercontainer()
          ],
        ),
      ),
    );
  }
}
