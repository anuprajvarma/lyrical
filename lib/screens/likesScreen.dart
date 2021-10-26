import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyrical/firebase/getLyrics.dart';
import 'package:lyrical/components/LikeCard.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

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
      likeCards
          .add(LikeCard(artist: likes[i]['artist'], title: likes[i]['title']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE8F0F2),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          title: Row(
            children: [
              Icon(
                Icons.favorite,
                color: Color(0xFF053742),
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Liked Lyrics',
                style: TextStyle(
                  color: Color(0xFF053742),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xFFE8F0F2),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50)),
              color: Color(0xFF053742)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
              future: readyLyrics(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (likes.length == 0) {
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
                    return GridView.count(
                      crossAxisCount: 2,
                      children: likeCards,
                      // crossAxisSpacing: 10,
                      // mainAxisSpacing: 15,
                      childAspectRatio: 1.5,
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
        ),
      ),
    );
  }
}
