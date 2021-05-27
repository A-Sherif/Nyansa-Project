import 'package:flutter/material.dart';
import 'CategoryButton.dart';

class Categories extends StatelessWidget {
  final List<String> categories = [
    'Action',
    'Adventure',
    'Folk Tales',
    'Fantasy',
    'Picture books',
  ];

  final List<Color> categoryColor = [
    Colors.red[400],
    Colors.blue[500],
    Colors.brown[400],
    Colors.purple[300],
    Colors.orange[200],
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      margin: EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: 130,
            margin: EdgeInsets.only(right: 10),
            child: CategoryButton(
              label: '${categories[index]}',
              background: categoryColor[index],
              fontSize: 16,
              press: () {},
            ),
          );
        },
      ),
    );
    // Container(
    //   height: 50,
    //   width: 130,
    //   margin: EdgeInsets.only(right: 10),
    //   child: CategoryButton(
    //     label: 'More',
    //     background: Colors.cyan,
    //     fontSize: 16,
    //     press: () {},
    //   ),
    // );
  }
}
