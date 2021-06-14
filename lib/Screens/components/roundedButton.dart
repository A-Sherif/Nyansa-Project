import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color primary, onPrimary, shadow;
  final Function press;
  final double fontSize;

  const RoundedButton({
    Key key,
    this.text,
    this.primary,
    this.onPrimary,
    this.shadow,
    this.press,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(0, 5.0),
          ),
        ],
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ElevatedButton(
        onPressed: press,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: primary,
          onPrimary: onPrimary,
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }
}
