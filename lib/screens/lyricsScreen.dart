import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lyrical/firebase/addLike.dart';
import 'package:lyrical/firebase/checkLike.dart';
import 'dart:convert';

import 'package:lyrical/firebase/deleteLike.dart';

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

  _LyricsScreenState({this.artist = '', this.title = ''});
  bool isLiked = false;
  var fillColor;
  String lyric = '';

  void Likes() {
    if (isLiked == true) {
      fillColor = Colors.green;
    } else {
      fillColor = Colors.white;
    }
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          isLiked
              ? IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    //  print('yuvraj is bhadwa');
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
                    Icons.favorite,
                  ),
                )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    child: InkWell(
                      child: Text(
                        lyric.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
