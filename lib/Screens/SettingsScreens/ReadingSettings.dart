import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Header.dart';
import '../components/ProfileButton.dart';

import 'ProficiencySettings.dart';
import 'RestrictionsSettings.dart';
import 'TimerSettings.dart';

class ReadingSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(
              label: 'Reading Settings',
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  ProfileButton(
                    label: 'Proficiency',
                    icon: Icon(
                      Icons.school,
                      size: 20,
                      color: Colors.white,
                    ),
                    color: Colors.blue[800],
                    shadow: Colors.blue[200],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProficiencySettings(),
                        ),
                      );
                    },
                  ),
                  ProfileButton(
                    label: 'Restrictions',
                    icon: Icon(
                      Icons.block_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                    color: Colors.blue[600],
                    shadow: Colors.blue[200],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestrictionsSettings(),
                        ),
                      );
                    },
                  ),
                  ProfileButton(
                    label: 'Timer',
                    icon: Icon(
                      Icons.timer,
                      size: 20,
                      color: Colors.white,
                    ),
                    color: Colors.blue[400],
                    shadow: Colors.blue[200],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TimerSettings(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
