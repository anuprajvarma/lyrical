import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyrical/screens/likes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LyricsPage extends StatefulWidget {
  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  bool isLike = false;
  var hunt;
  String fact = '';
  String title = '';

  void Likes() {
    if (isLike == true) {
      hunt = Colors.green;
    } else {
      hunt = Colors.white;
    }
  }

  Future Apicall() async {
    http.Response response = await http
        .get(Uri.parse('https://api.lyrics.ovh/v1/justin%20bieber/baby'));

    if (response.statusCode == 200) {
      var getdata = json.decode(response.body);
      setState(() {
        fact = getdata['lyrics'];
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
          'Lyrics',
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
              setState(() {
                isLike = !isLike;
              });
              child:
              Likes();
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
                        fact.toString(),
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
