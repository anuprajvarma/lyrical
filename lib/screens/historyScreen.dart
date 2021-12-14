import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyrical/components/historyCard.dart';
import 'package:lyrical/components/shimmerForBox.dart';
import 'package:lyrical/components/shimmerLoading_screen.dart';
import 'package:lyrical/components/loading_screen.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/firebase/getHistory.dart';
import 'package:lyrical/screens/homeScreen.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
var loggedInUser;

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List historys = [];
  List<Widget> historyCards = [];

  readyLyrics() async {
    historyCards = [];
    historys = await gethistory();

    for (int i = 0; i < historys.length; i++) {
      historyCards.add(HistoryCard(
          artist: historys[i]['artist'], title: historys[i]['title']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorSchemes.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          title: Row(
            children: [
              Icon(
                Icons.history_outlined,
                color: AppColorSchemes.blue1,
                size: 40,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.009),
              Text(
                'History',
                style: TextStyle(
                  color: AppColorSchemes.blue1,
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: AppColorSchemes.white,
          automaticallyImplyLeading: false,
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(color: AppColorSchemes.blue1)),
              child: PopupMenuButton<int>(
                  padding: EdgeInsets.all(20),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                        PopupMenuItem<int>(
                            value: 0,
                            child: Row(
                              children: [
                                Icon(Icons.logout,
                                    color: AppColorSchemes.white),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.005),
                                Text(
                                  'Sign Out',
                                  style: TextStyle(
                                    color: AppColorSchemes.white,
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ))
                      ]),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50)),
              color: AppColorSchemes.blue1),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
              future: readyLyrics(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (historys.length == 0) {
                    return Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.frownOpen,
                          color: AppColorSchemes.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.009,
                        ),
                        Text(
                          'No history ',
                          style: TextStyle(
                            color: AppColorSchemes.white,
                            fontFamily: 'Poppins',
                          ),
                        )
                      ],
                    ));
                  } else {
                    return Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                              childAspectRatio: 1.5,
                              children: historyCards,
                            ),
                          ),
                        ],
                      ),
                    );
                    // return likeCard[0];
                  }
                } else {
                  return Center(
                    child: ShimmerBox(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
