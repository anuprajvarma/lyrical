import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyrical/screens/getLyrics.dart';
import 'package:lyrical/screens/lyricsCard.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class Likes extends StatefulWidget {
  const Likes({Key? key}) : super(key: key);

  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  List like = [];

  List<Widget> likeCard = [];

  readyLyrics() async {
    likeCard = [];
    like = await getlyrics();
    for (int i = 0; i < like.length; i++) {
      likeCard.add(NoteCard(
        artist: like[i]['artist'],
        title: like[i]['lyrics'],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Likes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[900],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (like.length == 0) {
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
                  children: likeCard,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
          },
          future: readyLyrics(),
        ),
      ),
    );
  }
}
