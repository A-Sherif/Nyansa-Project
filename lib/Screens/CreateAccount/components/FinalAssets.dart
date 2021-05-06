import 'package:flutter/material.dart';

import '../../globalComponents/roundedButton.dart';

class FinalizeAssets extends StatelessWidget {
  const FinalizeAssets({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                        'One Last Step',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    RoundedButton(
                      text: 'Login',
                      fontSize: 16,
                      primary: Colors.cyan,
                      onPrimary: Colors.white,
                      press: () {
                        Navigator.pushNamed(context, '/Login');
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
                        Navigator.pushNamed(context, '/Create');
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
      ),
    );
  }
}
