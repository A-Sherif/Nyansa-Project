import 'package:flutter/material.dart';

class SetTimer extends StatefulWidget {
  const SetTimer({
    Key key,
  }) : super(key: key);

  @override
  _SetTimerState createState() => _SetTimerState();
}

class _SetTimerState extends State<SetTimer> {
  double _counter = 40.00;

  void _increaseTime() {
    setState(() {
      _counter++;
    });
  }

  void _reduceTime() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      } else {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        child: GestureDetector(
          child: Icon(
            Icons.keyboard_arrow_up,
            size: 60,
          ),
          onTap: () {
            _increaseTime();
          },
        ),
      ),
      Container(
        child: Text(
          '$_counter',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
      Container(
        child: GestureDetector(
          child: Icon(
            Icons.keyboard_arrow_down,
            size: 60,
          ),
          onTap: () {
            _reduceTime();
          },
          onLongPress: () {
            setState(() {
              _counter = 0;
            });
          },
        ),
      ),
    ]));
  }
}
