import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lyrical/auth/google_sign_in.dart';
import 'package:lyrical/SearchBox/myTextfield.dart';
import 'package:provider/provider.dart';

import 'lyricspage.dart';

class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  bool status = false;
  String title = '';
  String lytics = '';
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
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout(context);
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            MyTextField(
              'Artist',
            ),
            MyTextField('Title'),
            Expanded(
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        SizedBox(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Lyrics",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.grey[900],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LyricsPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Lyrics",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.grey[900],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LyricsPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Lyrics",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.grey[900],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LyricsPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Lyrics",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.grey[900],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LyricsPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Lyrics",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.grey[900],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LyricsPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Lyrics",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.grey[900],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LyricsPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Lyrics",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.grey[900],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LyricsPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: Colors.black,
    );
  }
}
