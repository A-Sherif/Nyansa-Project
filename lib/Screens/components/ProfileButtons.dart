import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: EdgeInsets.only(top: 10.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ElevatedButton(
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.history_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                Text('History', style: TextStyle(fontSize: 10.0))
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue[300],
              onPrimary: Colors.white,
              fixedSize: Size(70, 70),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.hourglass_bottom_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                Text('Timer', style: TextStyle(fontSize: 10.0))
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple[300],
              onPrimary: Colors.white,
              fixedSize: Size(70, 70),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 40,
                ),
                Text('Help', style: TextStyle(fontSize: 10.0))
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.green[300],
              onPrimary: Colors.white,
              fixedSize: Size(70, 70),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.priority_high,
                  color: Colors.white,
                  size: 40,
                ),
                Text('Report', style: TextStyle(fontSize: 10.0))
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.red[300],
              onPrimary: Colors.white,
              fixedSize: Size(70, 70),
            ),
          ),
        ]));
  }
}
