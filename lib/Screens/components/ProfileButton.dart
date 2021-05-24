import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String label;
  const ProfileButton({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
