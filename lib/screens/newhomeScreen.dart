import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:lyrical/components/Card.dart';
import 'package:lyrical/components/myTextfield_for_artist.dart';

import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/firebase/addHistory.dart';

import 'package:lyrical/screens/welcomeScreen.dart';

import 'dart:convert';

final _auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreenState1 createState() => _HomeScreenState1();
}

class _HomeScreenState1 extends State<HomeScreen1> {
  var fc53f4361ba7e110bac6bca264924af0;
  var title;
  var artist;
  List<Widget> likecard = [];

  Future getUserdata() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?chart_name=top&page=1&page_size=5&country=&f_has_lyrics=1&apikey=fc53f4361ba7e110bac6bca264924af0'));

    if (response.statusCode == 200) {
      var getdata = json.decode(response.body);

      likecard = [];

      for (int i = 0; i < 5; i++) {
        likecard.add(CardScreen(
          artist: getdata['message']['body']['track_list'][i]['track']
              ['artist_name'],
          title: getdata['message']['body']['track_list'][i]['track']
              ['track_name'],
        ));
      }
    }
    //return artist;
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
                  Icons.search,
                  color: AppColorSchemes.blue1,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
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
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
                color: AppColorSchemes.blue1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                  future: getUserdata(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            MyTextField_artist(
                              hintString: 'Search any lyrics or title',
                              onChanged: (val) {
                                artist = val;
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                addHistory(artist, title);
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
                            SizedBox(height: 10),
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 2,
                                children: likecard,
                                // crossAxisSpacing: 10,
                                // mainAxisSpacing: 15,
                                childAspectRatio: 1.5,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                          child: Container(child: CircularProgressIndicator()));
                    }
                  }),
            ),
          )),
    );
  }
}
