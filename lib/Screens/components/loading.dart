import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan[200],
      child: Center(
        child: SpinKitSquareCircle(
color: Colors.cyan[300],
size: 50.0,

        ),
      )
    );
  }
}