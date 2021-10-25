import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lyrical/components/myTextfield.dart';
import 'package:lyrical/firebase/addHistory.dart';

import 'package:lyrical/screens/lyricsScreen.dart';
import 'package:lyrical/screens/welcomeScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool status = false;
  late String title;
  late String artist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'Search Lyrics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF0C1136),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              _auth.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            child: Container(
              margin: EdgeInsets.all(15),
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color((0xFFE4CAE6))),
              child: Icon(
                Icons.logout,
                color: Color((0xFF0C1136)),
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            MyTextField(
              hintString: 'Artist',
              onChanged: (val) {
                artist = val;
              },
            ),
            MyTextField(
              hintString: 'Title',
              onChanged: (val) {
                title = val;
              },
            ),
            // SizedBox(height: 5),
            MaterialButton(
              onPressed: () {
                addHistory(artist, title);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LyricsScreen(
                    artist: artist,
                    title: title,
                  );
                }));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFFE4CAE6),
                ),
                child: Center(
                  child: Text(
                    'Get Lyrics',
                    style: TextStyle(
                      color: Color((0xFF0C1136)),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            //MyStatefulWidget(),
          ],
        ),
      ),
      // backgroundColor: Colors.black,
    );
  }
}
