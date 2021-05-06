import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String label;
  final Function press;

  const Header({
    Key key,
    this.label,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 25, 10, 0),
        child: Column(children: [
          Container(
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: press,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25.0,
                  ),
                  label: Text(label,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      )),
                )
              ],
            ),
          )
        ]));
  }
}
