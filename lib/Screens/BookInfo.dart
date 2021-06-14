import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';

class BookInfo extends StatefulWidget {
  @override
  _BookInfoState createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/JP_background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          label: Text(
                            'Go Back',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: size.height * 0.3,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/JP_cover.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
            child: Row(
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Read');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.menu_book_outlined),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text('Read')),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        child: Icon(
                          Icons.favorite_border_rounded,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[50],
                        onPrimary: Colors.pink[500],
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(50.0),
                        // ),
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Colors.pink[50],
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            child: Text(
              'The Jungle Book',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: size.width * 0.3, left: 10),
            child: Divider(
              thickness: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'About this book',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
              child: Text(
                  'Blandit mauris, leo venenatis tempus. Etiam sit turpis ultricies posuere non gravida ut egestas. Nibh lacus interdum vitae lorem vitae purus nunc fames potenti. Volutpat egestas felis, ac nec rhoncus. Mi, metus urna magna tincidunt praesent cras eu lectus ut. Nulla sem viverra sed sit fermentum morbi sed. ',
                  style: TextStyle(fontSize: 16)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: size.width * 0.3, left: 10),
            child: Divider(
              thickness: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
            child: Text(
              'Similar Books',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/BookInfo');
                  },
                  child: Container(
                    height: size.height * 0.3,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.lightGreen,
                              Colors.lightGreen[800]
                            ]),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                              height: size.height * 0.15,
                              width: size.width * 0.6,
                              image: AssetImage(
                                'assets/images/JP_title.png',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0, bottom: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/Read');
                                },
                                child: Text('Read'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: size.width * 0.1,
                          top: size.height * 0.02,
                          child: Image(
                            height: size.height * 0.25,
                            image: AssetImage(
                              'assets/images/JP_bear.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
