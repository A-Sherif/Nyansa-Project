import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  double _currentDoubleValue = 0.40;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DecimalNumberPicker(
            value: _currentDoubleValue,
            minValue: 0,
            maxValue: 24,
            decimalPlaces: 2,
            onChanged: (value) => setState(() => _currentDoubleValue = value),
          ),
          Text('Current Time: $_currentDoubleValue'),
        ],
      ),
    );
  }
}
