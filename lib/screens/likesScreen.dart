import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/firebase/getLyrics.dart';
import 'package:lyrical/components/Card.dart';
import 'package:lyrical/screens/welcomeScreen.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class LikesScreen extends StatefulWidget {
  const LikesScreen({Key? key}) : super(key: key);

  @override
  _LikesScreenState createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  List likes = [];
  List<Widget> likeCards = [];

  readyLyrics() async {
    likeCards = [];
    likes = await getlyrics();

    for (int i = 0; i < likes.length; i++) {
      likeCards.add(
          CardScreen(artist: likes[i]['artist'], title: likes[i]['title']));
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
                Icons.favorite,
                color: AppColorSchemes.blue1,
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Liked Lyrics',
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
              future: readyLyrics(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (likes.length == 0) {
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
                          width: 10.0,
                        ),
                        Text(
                          'No like lyrics',
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
                              children: likeCards,
                              // crossAxisSpacing: 10,
                              // mainAxisSpacing: 15,
                              childAspectRatio: 1.5,
                            ),
                          ),
                        ],
                      ),
                    );

                    // return likeCard[0];
                  }
                } else {
                  return Center(
                    child:
                        CircularProgressIndicator(color: AppColorSchemes.white),
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
