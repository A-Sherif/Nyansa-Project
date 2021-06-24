import 'package:flutter/material.dart';
import 'package:nyansa/Services/auth.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'Header.dart';
import 'loading.dart';

class LogOutLock extends StatefulWidget {
  @override
  _LogOutLockState createState() => _LogOutLockState();
}

class _LogOutLockState extends State<LogOutLock> {
  final _formKey = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final AuthService _auth = AuthService();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading() :SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Header(label: 'Log Out'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PinPut(
                        validator: (s) {
                          if (s.isEmpty || s.length < 4) {
                            return '';
                          }
                          return null;
                        },
                        useNativeKeyboard: false,
                        //autovalidateMode: AutovalidateMode.onUserInteraction,
                        withCursor: true,
                        fieldsCount: 4,
                        obscureText: '●',
                        fieldsAlignment: MainAxisAlignment.spaceEvenly,
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.cyan[200],
                        ),
                        preFilledWidget: Text(
                          '●',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey,
                          ),
                        ),
                        eachFieldMargin: EdgeInsets.symmetric(vertical: 10),
                        eachFieldAlignment: Alignment.center,
                        eachFieldWidth: 40.0,
                        eachFieldHeight: 40.0,
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        pinAnimationType: PinAnimationType.scale,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Enter Pin To Log Out',
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map((e) {
                            return RoundedButton(
                              title: '$e',
                              onTap: () {
                                _pinPutController.text =
                                    '${_pinPutController.text}$e';
                              },
                            );
                          }),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.cyan[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.cyan[100],
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0, 5.0),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(Icons.backspace_outlined),
                              color: Colors.cyan[800],
                              onPressed: () {
                                if (_pinPutController.text.isNotEmpty) {
                                  _pinPutController.text =
                                      _pinPutController.text.substring(
                                          0, _pinPutController.text.length - 1);
                                }
                              },
                            ),
                          ),
                          RoundedButton(
                            title: '0',
                            onTap: () {
                              _pinPutController.text =
                                  '${_pinPutController.text}0';
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.cyan[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.cyan[100],
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0, 5.0),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(Icons.check_rounded),
                              color: Colors.cyan[800],
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  await _auth.signOut();
                                } else {
                                  setState(() => loading = false);
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBar(
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.red[400],
                                        content: Container(
                                          height: 50,
                                          child: Center(
                                            child: Text(
                                              'Incorrect Pin',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  RoundedButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.cyan[200],
          boxShadow: [
            BoxShadow(
              color: Colors.cyan[100],
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0, 5.0),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          '$title',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.cyan[800],
          ),
        ),
      ),
    );
  }
}
