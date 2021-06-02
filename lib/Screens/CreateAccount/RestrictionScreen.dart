import 'package:flutter/material.dart';

import '../globalComponents/Header.dart';
import 'components/FormInput.dart';
import 'components/RestrictionItems.dart';
import '../components/SearchBox.dart';

class RestrictionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  press: () {
                    Navigator.pop(context);
                  },
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
