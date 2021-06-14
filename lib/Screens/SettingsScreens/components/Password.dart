import 'package:flutter/material.dart';

import 'SettingsHeader.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _obscureText = true;

  void _visible() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                children: [
                  SettingsHeader(label: 'Change Password'),
                  Container(
                    child: Form(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Current Password',
                                hintText: 'Current Password',
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
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'New Password',
                                hintText: 'New Password',
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
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Confirm New Password',
                                hintText: 'Confirm New Password',
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
