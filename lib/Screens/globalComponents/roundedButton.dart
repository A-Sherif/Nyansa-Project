import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color primary, onPrimary;
  final Function press;
  final double fontSize;

  const RoundedButton({
    Key key,
    this.text,
    this.primary,
    this.onPrimary,
    this.press,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
            horizontal: size.width * 0.25,
            vertical: 15,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }
}
