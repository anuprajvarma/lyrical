import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:lyrical/components/Card.dart';
import 'package:lyrical/components/shimmerLoading_screen.dart';
import 'package:lyrical/components/loading_screen.dart';

import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/screens/homeScreen.dart';
import 'package:lyrical/screens/welcomeScreen.dart';
import 'dart:convert';

final _auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class HomeScreen3 extends StatefulWidget {
  String lyrics_name;

  HomeScreen3({this.lyrics_name = ''});

  @override
  _HomeScreenState3 createState() =>
      _HomeScreenState3(lyrics_name: lyrics_name);
}

class _HomeScreenState3 extends State<HomeScreen3> {
  var fc53f4361ba7e110bac6bca264924af0;
  var title;
  var artist;
  List<Widget> card = [];
  String lyrics_name;

  _HomeScreenState3({this.lyrics_name = ''});

  Future getUserdata() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.musixmatch.com/ws/1.1/track.search?q_lyrics=$lyrics_name&page_size=10&page=1&s_track_rating=desc&apikey=163e1abd7bbc2378eb53f8df62d7478a'));

    if (response.statusCode == 200) {
      var getdata = json.decode(response.body);

      card = [];

      for (int i = 0; i < 10; i++) {
        card.add(CardScreen(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
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
                              height: MediaQuery.of(context).size.width * 0.09,
                            ),
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 2,
                                children: card,
                                // crossAxisSpacing: 10,
                                // mainAxisSpacing: 15,
                                childAspectRatio: 1.5,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Center(child: ShimmerLoading());
                    }
                  }),
            ),
          )),
    );
  }
}
