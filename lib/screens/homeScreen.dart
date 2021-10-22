import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrical/components/myTextfield.dart';

import 'package:lyrical/screens/lyricsScreen.dart';

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
        title: Text(
          'Lyrical',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[900],
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
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
                _firestore.collection('History').add({
                  'artist': artist,
                  'lyrics': title,
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LyricsScreen(
                    artist: artist,
                    title: title,
                  );
                }));
              },
              child: Text(
                'Get Lyrics',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              color: Color(0xFF221F1F),
              textColor: Colors.white,
            ),
            //MyStatefulWidget(),
          ],
        ),
      ),
      // backgroundColor: Colors.black,
    );
  }
}
