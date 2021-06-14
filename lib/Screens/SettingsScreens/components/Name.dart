import 'package:flutter/material.dart';

import 'SettingsHeader.dart';

class Name extends StatefulWidget {
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
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
                  SettingsHeader(label: 'Change Name'),
                  Container(
                    child: Form(
                      child: TextFormField(
                        initialValue: 'Nyansa',
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
