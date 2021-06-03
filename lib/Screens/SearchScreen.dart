import 'package:flutter/material.dart';

import 'components/Header.dart';
import 'components/SearchBox.dart';
import 'components/SearchCategories.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: [
            Header(
              label: 'Search',
            ),
            SearchBox(),
            SearchCategories(),
          ],
        ),
      ),
    );
  }
}
