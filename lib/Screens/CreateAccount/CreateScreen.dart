import 'package:flutter/material.dart';

import 'components/FormInput.dart';
import '../globalComponents/Header.dart';
import '../globalComponents/roundedButton.dart';
import 'components/termsText.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              height: size.height,
              child: Column(
                children: [
                  Header(
                    label: 'Create an account',
                    press: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        FormInput(
                          icon: Icon(Icons.face),
                          labelText: 'Child\'s Name',
                          hintText: 'Nyansa',
                          autofocus: true,
                          hide: false,
                        ),
                        FormInput(
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                          hintText: 'nyansa@nyansa.com',
                          autofocus: true,
                          hide: false,
                        ),
                        FormInput(
                          icon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility),
                          labelText: 'Password',
                          hintText: 'password',
                          autofocus: true,
                          hide: true,
                        ),
                        TermsAndConditionsText(),
                        RoundedButton(
                          text: 'Continue',
                          primary: Colors.cyan,
                          onPrimary: Colors.white,
                          fontSize: 18,
                          press: () {
                            Navigator.pushNamed(
                              context,
                              '/Proficiency',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
