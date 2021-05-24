import 'package:flutter/material.dart';

import 'globalComponents/Header.dart';
import 'globalComponents/roundedButton.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          child: Column(
            children: [
              Header(
                label: 'Login',
                press: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Container(
                  height: size.height,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Logo.png',
                              width: size.width * 0.5,
                              height: size.height * 0.5,
                              alignment: Alignment.center,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                labelText: 'Email',
                                hintText: 'nyansa@nyansa.com',
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                labelText: 'Password',
                                hintText: 'Password',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 25.0),
                              child: RoundedButton(
                                text: 'Login',
                                fontSize: 19,
                                primary: Colors.cyan,
                                press: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/NavBar',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
