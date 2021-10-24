import 'package:flutter/material.dart';
import 'package:lyrical/screens/lyricsScreen.dart';

class HistoryCard extends StatelessWidget {
  final String artist;
  final String title;

  HistoryCard(
      {this.artist =
          'My note.kjadfgegfilasfnfvkjasklvbliaslkljdafvbadfi;vjlksfbvjliulfvjhafsbvkjlb',
      this.title = 'Note title'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'artist:     $artist',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'title:       $title',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
