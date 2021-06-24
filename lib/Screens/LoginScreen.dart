import 'package:flutter/material.dart';
import 'package:nyansa/Services/auth.dart';
import 'package:email_validator/email_validator.dart';

import 'components/Header.dart';
import 'components/roundedButton.dart';
import 'components/loading.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  bool loading = false;

  bool _isValid = false;
  String email = '';
  bool _obscureText = true;
  String password = '';
  String error = '';

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
                                                icon: Icon(
                                                  Icons.email,
                                                ),
                                                labelText: 'Email',
                                                hintText: 'nyansa@nyansa.com',
                                              ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              onChanged: (value) => {
                                                setState(() {
                                                  _isValid =
                                                      EmailValidator.validate(
                                                          value);
                                                  email = value;
                                                }),
                                              },
                                              validator: (value) => _isValid
                                                  ? null
                                                  : 'Enter a valid email',
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
                                                onChanged: (val) => setState(
                                                    () => password = val),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(top: 25.0),
                                              child: RoundedButton(
                                                text: 'Login',
                                                fontSize: 18,
                                                primary: Colors.cyan[300],
                                                onPrimary: Colors.white,
                                                shadow: Colors.cyan[200],
                                                press: () async {
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    setState(
                                                        () => loading = true);
                                                    dynamic result =
                                                        await _auth.signIn(
                                                            email, password);
                                                    if (result == null) {
                                                      setState(() {
                                                        error =
                                                            'Invalid email or password';
                                                        loading = false;
                                                      });
                                                    }
                                                  }
                                                  // else {
                                                  //   Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) {
                                                  //       return BottomTab(
                                                  //         initialPage: 0,
                                                  //       );
                                                  //     }),
                                                  //   );
                                                  // }
                                                },
                                              ),
                                            ),
                                            SizedBox(height: 12),
                                            Text(
                                              error,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14.0),
                                            ),
                                          ],
                                        ),
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
            ),
    );
  }
}
