import 'package:flutter/material.dart';

import 'roundedButton.dart';
import 'outlinedButton.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/NyansaLogo.png',
                      width: size.width * 0.6,
                      height: size.height * 0.6,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          RoundedButton(
                            text: 'Login',
                            primary: Colors.cyan[400],
                            onPrimary: Colors.white,
                            shadow: Colors.cyan[200],
                            fontSize: 18.0,
                            press: () {
                              Navigator.pushNamed(
                                context,
                                '/Login',
                              );
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: RoundedOutlineButton(
                              text: 'Create an account',
                              primary: Colors.cyan,
                              borderColor: Colors.cyan,
                              fontSize: 18.0,
                              press: () {
                                Navigator.pushNamed(
                                  context,
                                  '/Create',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
