import 'package:flutter/material.dart';

class SimilarBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map> book = [
      {
        'title': 'Charlotte\'s Web',
        'cover': 'assets/images/CW.png',
        'primary': Colors.blue[500],
        'secondary': Colors.blue[200],
      },
      {
        'title': 'Diary Of A Wimpy Kid',
        'cover': 'assets/images/DOAWP.png',
        'primary': Colors.red[500],
        'secondary': Colors.red[200],
      }
    ];

    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemCount: book.length,
        itemBuilder: (context, index) {
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
                    color: book[index]['secondary'],
                    offset: Offset(0, 5),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [book[index]['primary'], book[index]['secondary']],
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
                                  book[index]['title'],
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
                                          Navigator.pushNamed(context, '/Read');
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
                              image: AssetImage(book[index]['cover']),
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
    );
  }
}
