import 'package:flutter/material.dart';
import 'package:lyrical/constant/constantContainer.dart';
import 'package:lyrical/constant/shimmerContainer.dart';

class ShimmerBox extends StatelessWidget {
  static var use;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              children: [
                Flexible(child: Shimmercontainer()),
                //SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Flexible(child: Shimmercontainer()),
              ],
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Flexible(child: Shimmercontainer()),
                //SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Flexible(child: Shimmercontainer()),
              ],
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Flexible(child: Shimmercontainer()),
                //SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Flexible(child: Shimmercontainer()),
              ],
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Flexible(child: Shimmercontainer()),
                //SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Flexible(child: Shimmercontainer()),
              ],
            ),
            //SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Flexible(child: Shimmercontainer()),
                //SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Flexible(child: Shimmercontainer()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
