import 'package:flutter/material.dart';

class HistoryBubble extends StatelessWidget {
  final String artist;

  final String lyrics;

  HistoryBubble({this.artist = '', this.lyrics = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('artist:   $lyrics ',
              style: TextStyle(fontSize: 23.0, color: Colors.white)),
          SizedBox(height: 10),
          Text('lyrics:         $artist',
              style: TextStyle(fontSize: 15.0, color: Colors.white)),
        ],
      ),
    );
  }
}
