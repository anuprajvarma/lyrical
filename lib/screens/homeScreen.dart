import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lyrical/components/myTextfield_for_artist.dart';
import 'package:lyrical/components/myTextfield_for_title.dart';
import 'package:lyrical/constant/colorSchemes.dart';
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

  get person => null;

  get headphones => null;

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
                Icons.search,
                color: AppColorSchemes.blue1,
                size: 40,
              ),
              Text(
                'Search Lyrics',
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
            GestureDetector(
              onTap: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.logout,
                  color: Color((0xFF0C1136)),
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50)),
              color: AppColorSchemes.blue1),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              MyTextField_artist(
                hintString: 'Artist',
                onChanged: (val) {
                  artist = val;
                },
              ),
              MyTextField_title(
                hintString: 'Title',
                onChanged: (val) {
                  title = val;
                },
              ),
              // SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  addHistory(artist, title);

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LyricsScreen(
                      artist: artist,
                      title: title,
                    );
                  }));
                },
                child: Container(
                  width: 180,
                  height: 55,
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
                      SizedBox(width: 10),
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
              ),
              //MyStatefulWidget(),
            ],
          ),
        ),
        // backgroundColor: Colors.black,
      ),
    );
  }
}
