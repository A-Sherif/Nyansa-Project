import 'package:flutter/material.dart';

import '../../components/roundedButton.dart';
import '../../NavBar.dart';

class FinalizeAssets extends StatelessWidget {
  const FinalizeAssets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: size.width * 0.8,
                    margin: EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Text(
                      'You can now handoff the device to child',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  RoundedButton(
                    text: 'Continue',
                    fontSize: 16,
                    primary: Colors.cyan[300],
                    onPrimary: Colors.cyan[800],
                    shadow: Colors.cyan[200],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomTab(
                            initialPage: 0,
                          ),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    child: Text('Change Settings ?'),
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        primary: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        )),
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName('/Create'),
                      );
                    },
                  ),
                  Image.asset(
                    'assets/images/outlinedLogo.png',
                    width: size.width * 0.2,
                    height: size.height * 0.2,
                    alignment: Alignment.bottomCenter,
                    color: Colors.pink,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
