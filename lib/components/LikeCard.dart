import 'package:flutter/material.dart';
import 'package:lyrical/screens/lyricsScreen.dart';

class LikeCard extends StatelessWidget {
  final String artist;
  final String title;

  LikeCard(
      {this.artist =
          'My note.kjadfgegfilasfnfvkjasklvbliaslkljdafvbadfi;vjlksfbvjliulfvjhafsbvkjlb',
      this.title = 'Note title'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Container(
          height: 200,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF0F4C61)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.headphones,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LyricsScreen(artist: artist, title: title);
        }));
      },
    );
  }
}
