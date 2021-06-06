import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final Function press;
  final String label;
  const ProfileButton({
    Key key,
    this.label,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        shadowColor: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Icon(Icons.keyboard_arrow_right_rounded, size: 25),
        ],
      ),
    );
  }
}
