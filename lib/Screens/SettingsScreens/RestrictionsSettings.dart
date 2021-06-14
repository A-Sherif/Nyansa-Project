import 'package:flutter/material.dart';

import '../components/Header.dart';
import 'components/RestrictionItems.dart';
import '../components/SearchBox.dart';

class RestrictionsSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(physics: NeverScrollableScrollPhysics(), children: [
            Column(
              children: [
                Header(
                  label: 'Change reading restriction',
                ),
                SearchBox(),
                RestrictionItems(),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
