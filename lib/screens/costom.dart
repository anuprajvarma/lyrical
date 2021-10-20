import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyrical/screens/lyricspage.dart';

class Costom extends StatefulWidget {
  const Costom({Key? key}) : super(key: key);

  @override
  _CostomState createState() => _CostomState();
}

class _CostomState extends State<Costom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
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
    );
  }
}
