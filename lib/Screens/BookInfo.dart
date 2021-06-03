import 'package:flutter/material.dart';

import 'components/Header.dart';
import 'components/BookInfoHeader.dart';

class BookInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(
              label: 'Go Back',
            ),
            Flexible(
              child: Container(
                child: ListView(
                  children: [
                    BookInfoHeader(size: size),
                    Flexible(
                      child: Container(
                        height: size.height,
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About this book',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                                'Libero vulputate risus, adipiscing eget at egestas pellentesque et. Pharetra blandit mollis proin pulvinar sed feugiat et. Congue lobortis pretium, facilisis vestibulum euismod ipsum faucibus. Scelerisque aliquam senectus diam vulputate ullamcorper felis elementum, tellus. ')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
