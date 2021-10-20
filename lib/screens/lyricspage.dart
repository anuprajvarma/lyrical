import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class LyricsPage extends StatefulWidget {
  String artist;
  String title;

  LyricsPage({this.artist = '', this.title = ''});
  @override
  _LyricsPageState createState() =>
      _LyricsPageState(artist: artist, title: title);
}

class _LyricsPageState extends State<LyricsPage> {
  String artist;
  String title;

  _LyricsPageState({this.artist = '', this.title = ''});
  bool isLike = false;
  var hunt;
  String lyric = '';

  void Likes(bool isLike) {
    if (isLike == true) {
      hunt = Colors.green;
    } else {
      hunt = Colors.white;
    }
  }

  Future Apicall() async {
    http.Response response =
        await http.get(Uri.parse('https://api.lyrics.ovh/v1/$artist/$title'));

    if (response.statusCode == 200) {
      var getdata = json.decode(response.body);
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
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: hunt,
            ),
            onPressed: () {
              setState(() async {
                isLike = !isLike;

                if (isLike == true) {
                  var fetchofData = await _firestore
                      .collection('likes')
                      .doc('documents')
                      .get();

                  var mapOfdata = fetchofData.data();

                  var listOflike = mapOfdata!['like'];

                  listOflike.add({"artist": artist, "lyrics": title});

                  await FirebaseFirestore.instance
                      .collection('likes')
                      .doc('documents')
                      .set({'like': listOflike});
                } else {
                  var fetchofData = await _firestore
                      .collection('likes')
                      .doc('documents')
                      .get();

                  var mapOfdata = fetchofData.data();

                  var listOflike = mapOfdata!['like'];

                  listOflike.remove();
                }
              });
            },
          ),
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
