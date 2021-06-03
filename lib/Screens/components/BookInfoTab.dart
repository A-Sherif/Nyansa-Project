import 'package:flutter/material.dart';

import '../BookInfo.dart';

class BookInfoTab extends StatefulWidget {
  @override
  _BookInfoTabState createState() => _BookInfoTabState();
}

class _BookInfoTabState extends State<BookInfoTab> {
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
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(
              Icons.face,
              color: Colors.cyan,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            activeIcon: Icon(
              Icons.favorite_rounded,
              color: Colors.red[500],
            ),
            label: 'Favorites',
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
        children: [],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
