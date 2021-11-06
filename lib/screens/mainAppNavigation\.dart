import 'package:flutter/material.dart';
import 'package:lyrical/constant/colorSchemes.dart';
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
  PageController _pageController = PageController(
    initialPage: 0,
  );

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        children: [
          HomeScreen(),
          LikesScreen(),
          HistoryScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColorSchemes.blue1,
          selectedItemColor: AppColorSchemes.blue4,
          unselectedItemColor: AppColorSchemes.blue3,
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
          onTap: (index) {
            currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 100), curve: Curves.linear);
          }),
    );
  }
}
