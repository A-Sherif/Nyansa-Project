import 'package:flutter/material.dart';

import '../components/Header.dart';
import 'components/Timer.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/Final');
        },
        backgroundColor: Colors.cyan,
        label: Text('Continue'),
      ),
      body: Container(
        child: Column(
          children: [
            Header(
              label: 'Set daily reading limit',
              press: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Timer(),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0.15,
                        20,
                        size.width * 0.15,
                        0,
                      ),
                      child: Text(
                        'Research has shown that the average reading time for children is 40 minutes',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
