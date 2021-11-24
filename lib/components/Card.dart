import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';
import 'package:lyrical/firebase/addHistory.dart';
import 'package:lyrical/screens/lyricsScreen.dart';

class CardScreen extends StatelessWidget {
  final String artist;
  final String title;

  CardScreen(
      {this.artist =
          'My note.kjadfgegfilasfnfvkjasklvbliaslkljdafvbadfi;vjlksfbvjliulfvjhafsbvkjlb',
      this.title = 'Note title'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColorSchemes.blue2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: AppColorSchemes.blue3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        artist,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColorSchemes.white,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
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
                      color: AppColorSchemes.blue3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColorSchemes.white,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        print(artist);
        addHistory(artist, title);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LyricsScreen(artist: artist, title: title);
        }));
      },
    );
  }
}
