import 'package:flutter/material.dart';

class Book {
  final String title;
  final cover;
  final Color primary, secondary;

  Book(
    this.title,
    this.cover,
    this.primary,
    this.secondary,
  );
}

class FavoriteBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, List<Book>> bookName = {
      'book 1': [
        Book(
          'Jungle Book',
          'assets/images/JP_cover.jpg',
          Colors.green[500],
          Colors.green[200],
        ),
      ],
      'book 2': [
        Book(
          'Charlotte\'s Web',
          'assets/images/CW.png',
          Colors.blue[500],
          Colors.blue[200],
        )
      ],
      'book 3': [
        Book(
          'Diary Of A Wimpy Kid',
          'assets/images/DOAWP.png',
          Colors.red[500],
          Colors.red[200],
        )
      ],
    };

    List<Book> vBook = [];
    bookName.values.forEach((books) {
      books.forEach((book) {
        vBook.add(book);
      });
    });

    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: vBook.length,
          itemBuilder: (context, index) {
            Book book = vBook[index];
            String title = book.title;
            var image = book.cover;
            Color primary = book.primary;
            Color secondary = book.secondary;

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/BookInfo');
              },
              child: Container(
                height: size.height * 0.3,
                width: size.width,
                padding: EdgeInsets.only(left: 5.0),
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: secondary,
                      offset: Offset(0, 5),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [primary, secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.3,
                            width: size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    // '${titles[index]}',
                                    title,
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Container(
                                            child: Icon(
                                              Icons.favorite_rounded,
                                              color: Colors.pink,
                                              size: 20,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.pink[50],
                                            onPrimary: Colors.pink[500],
                                            padding: EdgeInsets.all(0),
                                            shape: CircleBorder(
                                              side: BorderSide(
                                                color: Colors.pink[50],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/Read');
                                          },
                                          child: Row(
                                            children: [
                                              Icon(Icons.menu_book_outlined),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text('Read')),
                                            ],
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.amber,
                                            onPrimary: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.3,
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(-10, 0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.5,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
