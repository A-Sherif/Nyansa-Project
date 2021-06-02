import 'package:flutter/material.dart';

import 'components/FormInput.dart';
<<<<<<< Updated upstream
import '../globalComponents/Header.dart';
import '../globalComponents/roundedButton.dart';
=======
import '../components/Header.dart';
import '../components/roundedButton.dart';
import '../components/EmailFormField.dart';
import '../components/PasswordFormField.dart';
>>>>>>> Stashed changes
import 'components/termsText.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
<<<<<<< Updated upstream
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
=======
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
                  press: () {
                    Navigator.pushNamed(context, '/');
                  },
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
                      ]),
>>>>>>> Stashed changes
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
