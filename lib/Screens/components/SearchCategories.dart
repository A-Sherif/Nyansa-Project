import 'package:flutter/material.dart';

List<Map> category = [
  {
    'name': 'Colors',
    'image': 'assets/images/Colors.png',
  },
  {
    'name': 'Animals',
    'image': 'assets/images/Animals.png',
  },
  {
    'name': 'Objects',
    'image': 'assets/images/Objects.png',
  },
  {
    'name': 'Dogs',
    'image': 'assets/images/Dogs.png',
  },
  {
    'name': 'Bears',
    'image': 'assets/images/Bears.png',
  }
];

class SearchCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Flexible(
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            itemCount: category.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(5, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      category[index]['image'],
                      height: size.height * 0.25,
                    ),
                    Text(
                      category[index]['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
