import 'package:flutter/material.dart';

import 'roundedButton.dart';
import 'outlinedButton.dart';
import 'WelcomeText.dart';

class WelcomeAssets extends StatelessWidget {
  const WelcomeAssets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              children: [
                WelcomeText(
                  text: 'Create an account your child',
                  fontsize: 19.0,
                  weight: FontWeight.bold,
                ),
                WelcomeText(
                  text: 'Only guardians can create an account for a child',
                  fontsize: 13.0,
                  weight: FontWeight.w300,
                ),
              ],
            ),
          ),
          RoundedButton(
            text: 'Create an account',
            primary: Colors.cyan,
            onPrimary: Colors.white,
            fontSize: 18.0,
            press: () {
              Navigator.pushNamed(
                context,
                '/Create',
              );
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: RoundedOutlineButton(
              text: 'Login',
              primary: Colors.cyan,
              borderColor: Colors.cyan,
              fontSize: 18.0,
              press: () {
                Navigator.pushNamed(
                  context,
                  '/Login',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
