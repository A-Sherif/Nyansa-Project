import 'package:flutter/material.dart';

class SearchAudio extends StatelessWidget {
  const SearchAudio({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              height: size.height * 0.3,
              width: size.height * 0.3,
              child: Icon(Icons.graphic_eq_rounded, size: 100),
            ),
          ),
          Positioned(
            bottom: size.height * 0.23,
            left: size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.cyan[500],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan[300],
                    offset: Offset(0, 0),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.mic),
                iconSize: 50,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
