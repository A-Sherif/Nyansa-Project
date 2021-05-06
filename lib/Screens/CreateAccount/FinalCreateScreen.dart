import 'package:flutter/material.dart';

import '../globalComponents/Header.dart';
import 'components/FinalAssets.dart';

class FinalCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        Header(
          label: 'Finalize',
          press: () {
            Navigator.pop(context);
          },
        ),
        FinalizeAssets(),
      ]),
    ));
  }
}
