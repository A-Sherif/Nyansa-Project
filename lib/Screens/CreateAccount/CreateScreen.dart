import 'package:flutter/material.dart';

import 'components/FormInput.dart';
import '../components/Header.dart';
import '../components/roundedButton.dart';
import '../components/PasswordFormField.dart';
import 'components/termsText.dart';

class CreateScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormInput(
                            icon: Icon(Icons.face),
                            labelText: 'Child\'s Name',
                            hintText: 'Nyansa',
                            autofocus: true,
                            hide: false,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your child\'s name';
                              } else if (value.length <= 2) {
                                return 'Child\'s name cannot be less than 2 letters';
                              }
                            },
                          ),
                          FormInput(
                            icon: Icon(Icons.email),
                            labelText: 'Email',
                            hintText: 'nyansa@nyansa.com',
                            autofocus: true,
                            hide: false,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Please enter an email';
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
                                return 'Password cannot be less than 6 letters';
                              }
                            },
                          ),
                          TermsAndConditionsText(),
                          RoundedButton(
                            text: 'Continue',
                            primary: Colors.cyan,
                            onPrimary: Colors.white,
                            fontSize: 18,
                            press: () {
                              _formKey.currentState.validate()
                                  ? Navigator.pushNamed(
                                      context,
                                      '/Proficiency',
                                    )
                                  : null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
