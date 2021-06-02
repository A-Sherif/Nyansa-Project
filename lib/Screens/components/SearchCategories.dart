import 'package:flutter/material.dart';

import 'CategoryButton.dart';

class SearchCategories extends StatelessWidget {
  final List<String> categories = [
    'Action',
    'Adventure',
    'Folk Tales',
    'Fantasy',
    'Picture books',
    'Mystery',
    'Sci-fi',
    'Nature'
  ];

  final List<Color> categoryColor = [
    Colors.red[400],
    Colors.blue[500],
    Colors.brown[400],
    Colors.lightGreen[400],
    Colors.orange[200],
    Colors.indigo[400],
    Colors.deepPurple[500],
    Colors.green[500],
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: size.height,
        width: size.width,
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        padding: EdgeInsets.only(bottom: 15),
        alignment: Alignment.center,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 800,
                child: CategoryButton(
                  label: '${categories[index]}',
                  background: categoryColor[index],
                  fontSize: 20,
                  press: () {},
                ),
              );
            }),
      ),
    );
  }
}
