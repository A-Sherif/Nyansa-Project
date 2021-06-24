import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BookInfo.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({
    Key key,
  }) : super(key: key);

  @override
  _CompletedPageState createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BookInfo()),
            (route) => false);
        return false;
      },
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Positioned(
              child: Image.asset(
                'assets/images/JP_background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            right: size.width * 0.05,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                      color: Colors.white54,
                      offset: Offset(0, 0),
                      blurRadius: 15)
                ],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have completed the book',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: size.height * 0.45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Read');
                          },
                          child: Row(children: [
                            Icon(Icons.repeat_rounded),
                            Text('Read Again')
                          ]),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan[200],
                            onPrimary: Colors.cyan[800],
                            textStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookInfo()),
                              (route) => false);
                        },
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text('Continue'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_rounded,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan[200],
                          onPrimary: Colors.cyan[800],
                          textStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        // ),
      ),
    );
  }
}
