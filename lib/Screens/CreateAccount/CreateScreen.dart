import 'package:flutter/material.dart';

import 'components/FormInput.dart';

import '../components/Header.dart';
import '../components/roundedButton.dart';
import '../components/EmailFormField.dart';
import '../components/PasswordFormField.dart';
import 'components/termsText.dart';

class CreateScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: GestureDetector(
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
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Form(
                        key: _formKey,
                        child: ListView(children: [
                          Column(
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
                              EmailFormField(),
                              PasswordFormField(
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a password';
                                  } else if (value.length < 6) {
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
                                  if (_formKey.currentState.validate()) {
                                    Navigator.pushNamed(
                                      context,
                                      '/Proficiency',
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
