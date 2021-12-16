import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:lyrical/components/Card.dart';
import 'package:lyrical/components/shimmerLoading_screen.dart';
import 'package:lyrical/components/myTextfield_for_artist.dart';
import 'package:lyrical/components/myTextfield_for_title.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/screens/searchLyricsScreen.dart';
import 'package:lyrical/screens/searchTitleScreen.dart';
import 'dart:convert';
import 'package:lyrical/screens/welcomeScreen.dart';

// ignore: unused_element
final _auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var fc53f4361ba7e110bac6bca264924af0;

  var title;
  var artist;
  List<Widget> card = [];
  // ignore: non_constant_identifier_names
  late String title_name = '';
  // ignore: non_constant_identifier_names
  late String lyrics_name = '';

  Future getUserdata() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?chart_name=top&page=1&page_size=5&country=us&f_has_lyrics=1&apikey=163e1abd7bbc2378eb53f8df62d7478a'));

    if (response.statusCode == 200) {
      var getdata = json.decode(response.body);
      card = [];

      for (int i = 0; i < 5; i++) {
        card.add(CardScreen(
          artist: getdata['message']['body']['track_list'][i]['track']
              ['artist_name'],
          title: getdata['message']['body']['track_list'][i]['track']
              ['track_name'],
        ));
      }
    } else {
      print('401');
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
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                            MyTextField_artist(
                              hintString: 'Search   title',
                              onChanged: (value) {
                                title_name = value;
                              },
                            ),
                            MyTextField_title(
                              hintString: 'Search  lyrics ',
                              onChanged: (val) {
                                lyrics_name = val;
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                if (title_name != '') {
                                  if (lyrics_name == '') {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomeScreen2(
                                          title_name: title_name);
                                    }));
                                  }
                                } else if (lyrics_name != '') {
                                  if (title_name == '') {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomeScreen3(
                                          lyrics_name: lyrics_name);
                                    }));
                                  }
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.width * 0.14,
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
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Top Lyrics',
                                  style: TextStyle(
                                    color: AppColorSchemes.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: GridView.count(
                                crossAxisCount: 2,
                                children: card,
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

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));

      break;
  }
}
