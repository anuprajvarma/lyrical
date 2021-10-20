import 'package:flutter/material.dart';
import 'package:lyrical/screens/history.dart';
import 'package:lyrical/screens/likes.dart';
import 'package:lyrical/screens/lyricalpage.dart';

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int currentIndex = 0;
  final Screen = [
    LoggedInWidget(),
    Likes(),
    History(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? Icon(Icons.home)
                : Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_outline),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? Icon(Icons.history)
                : Icon(Icons.history_outlined),
            label: 'History',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
