import 'package:flutter/material.dart';

import '../components/Header.dart';
import 'components/RestrictionItems.dart';
import '../components/SearchBox.dart';

class RestrictionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/Timer');
          },
          backgroundColor: Colors.cyan,
          label: Text('Continue'),
        ),
        body: SafeArea(
          child: ListView(physics: NeverScrollableScrollPhysics(), children: [
            Column(
              children: [
                Header(
                  label: 'Add reading restriction',
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
