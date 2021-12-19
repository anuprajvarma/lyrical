import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lyrical/components/Card.dart';
import 'package:lyrical/components/myTextfield.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/constant/toast.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var fc53f4361ba7e110bac6bca264924af0;

  var title;
  var artist;
  List<Widget> card = [];

  TextEditingController titleController = TextEditingController(),
      lyricsController = TextEditingController();

  Future getTopLyrics() async {
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

  void searchByLyrics() {
    if (lyricsController.text.trim() == "") {
      toast(message: "Lyrics should not be empty");
      return;
    }
    // if (title_name != '') {
    //   if (lyrics_name == '') {
    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
    //       return HomeScreen2(title_name: title_name);
    //     }));
    //   }
    // } else

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchLyricScreen(lyrics_name: lyricsController.text.trim());
    }));
  }

  void searchByTitle() {
    if (titleController.text.trim() == "") {
      toast(message: "Title should not be empty");
      return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchTitleScreen(title_name: titleController.text.trim());
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.transparent,
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
            height: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
                color: AppColorSchemes.blue1),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  children: [
                    Text(
                      'Search by title',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: AppColorSchemes.white.withOpacity(0.6)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        icon: Icons.person,
                        hintString: 'Title',
                        controller: titleController,
                      ),
                    ),
                    SearchButton(
                      onPressed: () {
                        searchByTitle();
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'or',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: AppColorSchemes.white.withOpacity(0.4)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Search by lyrics',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: AppColorSchemes.white.withOpacity(0.6)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        icon: Icons.music_note,
                        hintString: 'Lyrics',
                        controller: lyricsController,
                      ),
                    ),
                    SearchButton(
                      onPressed: () {
                        searchByLyrics();
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                    indent: 100,
                    endIndent: 100,
                    color: AppColorSchemes.white.withOpacity(0.4)),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Expanded(
                      child: Text(
                        'Top Lyrics',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColorSchemes.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FutureBuilder(
                    future: getTopLyrics(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Expanded(
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            children: card,
                            childAspectRatio: 1.5,
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            )));
  }
}

class SearchButton extends StatelessWidget {
  final void Function()? onPressed;

  SearchButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColorSchemes.blue4,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.search),
      ),
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
