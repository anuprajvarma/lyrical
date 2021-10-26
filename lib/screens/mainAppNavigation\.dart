import 'package:flutter/material.dart';
import 'package:lyrical/screens/historyScreen.dart';
import 'package:lyrical/screens/likesScreen.dart';
import 'package:lyrical/screens/homeScreen.dart';

/// This is the stateful widget that the main application instantiates.
class MainAppNavigation extends StatefulWidget {
  const MainAppNavigation({Key? key}) : super(key: key);

  @override
  State<MainAppNavigation> createState() => _MainAppNavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainAppNavigationState extends State<MainAppNavigation> {
  int currentIndex = 0;
  final Screen = [
    HomeScreen(),
    LikesScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF053742),
        selectedItemColor: Color((0xFF39A2DB)),
        unselectedItemColor: Color(0xFF2C88B6),
        iconSize: 35,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? Icon(Icons.home)
                : Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? Icon(Icons.history)
                : Icon(Icons.history_outlined),
            label: '',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
