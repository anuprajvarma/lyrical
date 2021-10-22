import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:lyrical/components/historyBubble.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
var loggedInUser;

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List User_history = [];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'History',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey[900],
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Streambuilder(),
          ],
        )));
  }
}

class Streambuilder extends StatefulWidget {
  @override
  _StreambuilderState createState() => _StreambuilderState();
}

class _StreambuilderState extends State<Streambuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('History').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final storeData = snapshot.data!.docs, reversed;
          List<HistoryBubble> massageBubbles = [];
          for (var massage in storeData) {
            final massageText = massage['artist'];
            final massageSender = massage['lyrics'];

            final currentUser = loggedInUser.email;

            final massageBubble = HistoryBubble(
              artist: massageSender,
              lyrics: massageText,
            );
            massageBubbles.add(massageBubble);
          }

          return Expanded(
              child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: massageBubbles,
          ));
        });
  }
}
