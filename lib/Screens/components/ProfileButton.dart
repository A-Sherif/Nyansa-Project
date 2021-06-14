import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key key,
    this.label,
    this.icon,
    this.press,
    this.color,
    this.shadow,
  }) : super(key: key);

  final String label;
  final Function press;
  final Icon icon;
  final Color color, shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        onPressed: press,
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
                    child: icon,),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.black,
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
