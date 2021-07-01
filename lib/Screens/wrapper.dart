import 'package:flutter/material.dart';

import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Screens/NavBar.dart';
import 'package:nyansa/Screens/WelcomeScreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Person>(context);

   

    //return either Welcome or Home widget
    if (user == null) {
      return WelcomeScreen();
    } else {
      return BottomTab(initialPage: 0);
    }
  }
}
