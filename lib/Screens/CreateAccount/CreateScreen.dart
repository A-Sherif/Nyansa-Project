import 'package:nyansa/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import '../components/Header.dart';
import '../components/roundedButton.dart';
import 'components/termsText.dart';
import 'NameScreen.dart';
import '../components/loading.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool _isValid = false;
  String email = '';
  bool _obscureText = true;
  String password = '';
  String error = '';
  bool loading = false;

  void _visible() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: loading
          ? Loading()
          : Scaffold(
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
                                  TextFormField(
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.email,
                                      ),
                                      labelText: 'Email',
                                      hintText: 'nyansa@nyansa.com',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) => {
                                      setState(() {
                                        _isValid =
                                            EmailValidator.validate(value);
                                        email = value;
                                      }),
                                    },
                                    validator: (value) =>
                                        _isValid ? null : 'Enter a valid email',
                                  ),
                                  Container(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.lock),
                                        labelText: 'Password',
                                        hintText: 'Password',
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            _visible();
                                          },
                                        ),
                                      ),
                                      obscureText: _obscureText,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return 'Please enter a password';
                                        } else if (value.length < 6) {
                                          return 'Password cannot be less than 6 letters';
                                        }
                                        return null;
                                      },
                                      onChanged: (val) =>
                                          setState(() => password = val),
                                    ),
                                  ),
                                  TermsAndConditionsText(),
                                  RoundedButton(
                                    text: 'Continue',
                                    primary: Colors.cyan[300],
                                    onPrimary: Colors.cyan[800],
                                    shadow: Colors.cyan[200],
                                    fontSize: 18,
                                    press: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => loading = true);
                                        dynamic result = await _auth
                                            .createAccount(email, password);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return NameScreen();
                                            },
                                          ),
                                        );

                                        if (result == null) {
                                          setState(() {
                                            error =
                                                'Please check email and password';
                                            loading = false;
                                          });
                                        }
                                      }
                                    },
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    error,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14.0),
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
