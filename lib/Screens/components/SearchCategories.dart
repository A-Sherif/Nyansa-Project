import 'package:flutter/material.dart';

class Category {
  final String title;
  final String image;

  Category(this.title, this.image);
}

class SearchCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map<String, List<Category>> category = {
      'category': [
        Category(
          'Colors',
          'assets/images/Colors.png',
        ),
        Category(
          'Animals',
          'assets/images/Animals.png',
        ),
        Category(
          'Objects',
          'assets/images/Objects.png',
        ),
        Category(
          'Dogs',
          'assets/images/Dogs.png',
        ),
        Category(
          'Bears',
          'assets/images/Bears.png',
        ),
      ],
    };

    List<Category> categoryTile = [];
    category.values.forEach((categories) {
      categories.forEach((category) {
        categoryTile.add(category);
      });
    });
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
            itemCount: categoryTile.length,
            itemBuilder: (context, index) {
              Category category = categoryTile[index];
              String title = category.title;
              String image = category.image;
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
                      image,
                      height: size.height * 0.25,
                    ),
                    Text(
                      title,
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
