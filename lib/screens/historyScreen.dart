import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lyrical/components/historyCard.dart';
import 'package:lyrical/firebase/getHistory.dart';

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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          children: [
            Icon(
              Icons.history_outlined,
              color: Color(
                0xFF053742,
              ),
              size: 35,
            ),
            SizedBox(width: 10),
            Text(
              'History',
              style: TextStyle(
                color: Color(0xFF053742),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color((0xFFE8F0F2)),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: readyLyrics(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (historys.length == 0) {
                return Center(
                    child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.frownOpen,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'No like lyrics',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ));
              } else {
                return ListView(
                  children: historyCards,
                );

                // return likeCard[0];
              }
            } else {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
          },
        ),
      ),
    );
  }
}
