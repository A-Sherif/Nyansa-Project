import 'package:flutter/material.dart';

import 'components/Header.dart';
import 'components/roundedButton.dart';
import 'components/PasswordFormField.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
                          horizontal: 20,
                        ),
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Logo.png',
                              width: size.height / 3,
                              height: size.height / 3,
                              alignment: Alignment.center,
                            ),
                            Container(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.email),
                                        labelText: 'Email',
                                        hintText: 'nyansa@nyansa.com',
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Email cannot be empty';
                                        } else if (value.length <= 6) {
                                          return 'Enter a valid Email';
                                        }
                                      },
                                    ),
                                    PasswordFormField(
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return 'Password cannot be empty';
                                        } else if (value.length <= 5) {
                                          return 'Password cannot be less than 6 characters';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 25.0),
                              child: RoundedButton(
                                text: 'Login',
                                fontSize: 19,
                                primary: Colors.cyan,
                                press: () {
                                  _formKey.currentState.validate()
                                      ? Navigator.pushNamed(
                                          context,
                                          '/NavBar',
                                        )
                                      : null;
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
