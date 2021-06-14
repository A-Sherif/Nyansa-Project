import 'package:flutter/material.dart';

import 'SettingsHeader.dart';
import 'Age.dart';

class AgeSettings extends StatefulWidget {
  @override
  _AgeSettingsState createState() => _AgeSettingsState();
}

class _AgeSettingsState extends State<AgeSettings> {
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
                SettingsHeader(label: 'Change Age'),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Age(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
