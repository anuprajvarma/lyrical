import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:shimmer/shimmer.dart';

class Shimmercontainer extends StatelessWidget {
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.white70,
                  highlightColor: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: AppColorSchemes.white.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Shimmer.fromColors(
                  baseColor: Colors.white70,
                  highlightColor: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: AppColorSchemes.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
