import 'package:flutter/material.dart';

import 'Screens/WelcomeScreen.dart';
import 'Screens/CreateAccount/CreateScreen.dart';
import 'Screens/CreateAccount/ProficiencyScreen.dart';
import 'Screens/CreateAccount/RestrictionScreen.dart';
import 'Screens/CreateAccount/TimerScreen.dart';
import 'Screens/CreateAccount/FinalCreateScreen.dart';
import 'Screens/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nyansa App',
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: WelcomeScreen(),
      routes: {
        '/Login': (context) => LoginScreen(),
        '/Create': (context) => CreateScreen(),
        '/Proficiency': (context) => ProficiencyScreen(),
        '/Restriction': (context) => RestrictionScreen(),
        '/Timer': (context) => TimerScreen(),
        '/Final': (context) => FinalCreateScreen(),
      },
    );
  }
}
