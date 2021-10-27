import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/firebase/addLike.dart';
import 'package:lyrical/firebase/checkLike.dart';
import 'dart:convert';

import 'package:lyrical/firebase/deleteLike.dart';
import 'package:lyrical/screens/welcomeScreen.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class LyricsScreen extends StatefulWidget {
  final String artist;
  final String title;

  LyricsScreen({this.artist = '', this.title = ''});
  @override
  _LyricsScreenState createState() =>
      _LyricsScreenState(artist: artist, title: title);
}

class _LyricsScreenState extends State<LyricsScreen> {
  String artist;
  String title;
  final _auth = FirebaseAuth.instance;

  _LyricsScreenState({this.artist = '', this.title = ''});
  bool isLiked = false;
  var fillColor;
  String lyric = '';

  Future Apicall() async {
    http.Response response =
        await http.get(Uri.parse('https://api.lyrics.ovh/v1/$artist/$title'));

    if (response.statusCode == 200) {
      var getdata = json.decode(response.body);

      print(artist + " " + title);
      isLiked = await checkLike(artist, title);
      print(isLiked);
      setState(() {
        lyric = getdata['lyrics'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Apicall();
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
                FontAwesomeIcons.music,
                size: 25,
                color: AppColorSchemes.blue1,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Lyrics',
                style: TextStyle(
                  color: AppColorSchemes.blue1,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: AppColorSchemes.white,
          actions: [
            isLiked
                ? IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 30,
                    ),
                    onPressed: () {
                      deleteLike(artist, title);
                      setState(() {
                        isLiked = false;
                      });
                    },
                  )
                : IconButton(
                    onPressed: () async {
                      isLiked = await checkLike(artist, title);
                      if (isLiked == false) {
                        addLike(artist, title);
                      }
                      setState(() {
                        isLiked = true;
                      });
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color: Colors.pink,
                    ),
                  ),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColorSchemes.blue2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: AppColorSchemes.blue3,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          artist,
                          style: TextStyle(
                            color: AppColorSchemes.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColorSchemes.blue2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.headphones,
                          color: AppColorSchemes.blue3,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            color: AppColorSchemes.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                      width: 350,
                      height: 580,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColorSchemes.blue2,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.music,
                                  size: 25,
                                  color: AppColorSchemes.blue3,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Lyrics',
                                  style: TextStyle(
                                    color: AppColorSchemes.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                lyric.toString(),
                                style: TextStyle(
                                  color: AppColorSchemes.white,
                                  fontSize: 17.0,
                                  fontFamily: 'Poppins',
                                  wordSpacing: 3,
                                ),
                              ),
                            ),
                          ))
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
