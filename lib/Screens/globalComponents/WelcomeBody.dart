import 'package:flutter/material.dart';

import 'WelcomeAssets.dart';

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
                      width: size.width * 0.5,
                      height: size.height * 0.5,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: WelcomeAssets(),
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
