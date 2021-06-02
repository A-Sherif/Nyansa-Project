import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'FavoritesScreen.dart';
import 'ProfileScreen.dart';

class BottomTab extends StatefulWidget {
  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _selectedIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  void onTappedBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            activeIcon: Icon(
              Icons.favorite_rounded,
              color: Colors.red[500],
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_outlined),
            activeIcon: Icon(
              Icons.face,
              color: Colors.lightGreen,
            ),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          size: 50,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 16,
        ),
        onTap: onTappedBar,
      ),
      body: PageView(
        controller: _pageController,
        children: [FavoritesScreen(), HomeScreen(), ProfileScreen()],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
