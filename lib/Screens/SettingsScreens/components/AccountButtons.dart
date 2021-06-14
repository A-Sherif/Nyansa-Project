import 'package:flutter/material.dart';

class AccountButtons extends StatelessWidget {
  const AccountButtons({
    Key key,
    this.link,
    this.label,
    this.icon,
    this.color,
    this.shadow,
    this.current,
  }) : super(key: key);

  final Widget link;
  final String label, current;
  final Icon icon;

  final Color color, shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => link,
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                    boxShadow: [
                      BoxShadow(
                          color: shadow,
                          offset: Offset(0, 0),
                          blurRadius: 8,
                          spreadRadius: 1),
                    ],
                  ),
                  child: icon,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    label,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Text(
                    current,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.black,
          padding: EdgeInsets.all(0),
          textStyle: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
