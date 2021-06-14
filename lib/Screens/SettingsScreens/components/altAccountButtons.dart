import 'package:flutter/material.dart';

class AltAccountButtons extends StatelessWidget {
  const AltAccountButtons({
    Key key,
    this.link,
    this.label,
  }) : super(key: key);

  final Widget link;
  final String label;

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
            Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                label,
              ),
            ),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.red[400],
          shadowColor: Colors.red[200],
          elevation: 10,
          onPrimary: Colors.white,
          padding: EdgeInsets.all(10),
          textStyle: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
