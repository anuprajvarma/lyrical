import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/constant/shimmerContainer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            Container(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF0F5C61),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Icon(
                      Icons.person,
                      color: Color(0xFF2C88B6),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Text(
                      'Search   title',
                      style: TextStyle(
                          color: Color(0xFF457585),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF0F5C61),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Icon(
                      Icons.headphones,
                      color: Color(0xFF2C88B6),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Text(
                      'Search  lyrics',
                      style: TextStyle(
                          color: Color(0xFF457585),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColorSchemes.blue4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.music,
                    size: 20,
                    color: AppColorSchemes.blue1,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text(
                    'Get Lyrics',
                    style: TextStyle(
                        color: AppColorSchemes.blue1,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
            )
          ],
        ),
      ),
    );
  }
}
