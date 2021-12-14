import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/constant/constantContainer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  static var use;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Shimmer.fromColors(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  children: [
                    ConstantContainer(),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    ConstantContainer(),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    ConstantContainer(),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    ConstantContainer(),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    ConstantContainer(),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    ConstantContainer(),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    ConstantContainer(),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    ConstantContainer(),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    ConstantContainer(),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    ConstantContainer(),
                  ],
                ),
              ],
            ),
            baseColor: AppColorSchemes.white,
            highlightColor: AppColorSchemes.blue4,
          ),
        ),
      ),
    );
  }
}
