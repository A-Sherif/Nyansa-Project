import 'package:flutter/material.dart';

import 'globalComponents/Header.dart';
import 'components/SearchBox.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                  label: 'Search',
                  press: () {
                    Navigator.pushNamed(context, '/NavBar');
                  },
                ),
                SearchBox(),
              ],
            ),
          ),
        ));
  }
}
