import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/Header.dart';

class ReadingScreen extends StatefulWidget {
  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  bool _visible = true;

  void _isVisible() {
    setState(() {
      _visible = !_visible;
    });
  }

  String value =
      'Blandit mauris, leo venenatis tempus. Etiam sit turpis ultricies posuere non gravida ut egestas. Nibh lacus interdum vitae lorem vitae purus nunc fames potenti. Volutpat egestas felis, ac nec rhoncus. Mi, metus urna magna tincidunt praesent cras eu lectus ut. Nulla sem viverra sed sit fermentum morbi sed. ';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          _isVisible();
        },
        child: Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Header(label: 'Back'),
                Container(
                  child: Positioned(
                    top: size.height * 0.2,
                    child: Image.asset(
                      'assets/images/Logo.png',
                      width: size.width * 0.5,
                      height: size.height * 0.5,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.2,
                  right: 40,
                  child: Container(
                      width: size.width * 0.5,
                      padding: EdgeInsets.all(10.0),
                      child: SelectableText(
                        value,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        onTap: () {
                          _isVisible();
                        },
                      )),
                ),
                Positioned(
                  right: 20,
                  top: size.height * 0.8,
                  child: Visibility(
                    visible: _visible,
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 6,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.music_note_outlined),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_circle_sharp),
                            iconSize: 30,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline),
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
