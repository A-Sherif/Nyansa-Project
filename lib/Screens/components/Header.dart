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
    return SafeArea(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
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
          ])),
    );
  }
}
