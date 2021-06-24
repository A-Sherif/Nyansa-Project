import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'HomePage.dart';
import 'FavoritesScreen.dart';
import 'ProfileScreen.dart';
import 'SearchScreen.dart';

class BottomTab extends StatefulWidget {
  @override
  const BottomTab({Key key, @required this.initialPage}) : super(key: key);

  final int initialPage;

  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab>
    with SingleTickerProviderStateMixin {
  int _selectedIndex;

  List pages = [
    HomeScreen(),
    SearchScreen(),
    FavoritesScreen(),
    ProfileScreen()
  ];

  @override
  void initState() {
    _selectedIndex = widget.initialPage;
    super.initState();
  }

  void onTappedBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(
              Icons.home_rounded,
              semanticLabel: 'Home',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            activeIcon: Icon(
              Icons.search_rounded,
              semanticLabel: 'Search',
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_rounded),
            activeIcon: Icon(
              Icons.favorite_rounded,
              semanticLabel: 'Favorites',
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_outlined),
            activeIcon: Icon(
              Icons.face,
              semanticLabel: 'Profile',
            ),
            label: 'Profile',
          ),
        ],
        selectedIconTheme: IconThemeData(
          size: 50,
          color: Colors.black,
        ),
        selectedLabelStyle:
            TextStyle(fontSize: 16, color: Colors.black, shadows: [
          Shadow(
            color: Colors.black45,
            offset: Offset(0, 10),
            blurRadius: 10,
          )
        ]),
        selectedItemColor: Colors.black,
        onTap: onTappedBar,
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pages[_selectedIndex],
      ),
    );
  }
}
