import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    Key key,
    @required PageController controller,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  // @override
  // dispose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitDown,
  //     DeviceOrientation.portraitUp,
  //   ]);
  //   super.dispose();
  // }

  List<String> answers = <String>['Papa Bear', 'Mama Bear', 'The Boy'];

  // List<String> correctAnswer = <String>[];
  // bool isCheck = false;
  // void _selected(bool value, int index) {
  //   setState(() {
  //     if (answers.contains('Papa Bear')) {
  //       correctAnswer.add(answers[index]);
  //       isCheck = value;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
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
              top: 10,
              right: 10,
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    // widget._controller.nextPage(
                    //     duration: Duration(milliseconds: 200),
                    //     curve: Curves.easeIn);
                    showDialog(
                      context: context,
                      builder: (context) {
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
                                  height: size.height * 0.25,
                                  width: size.width * 0.4,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'You would not gain any',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: ' points',
                                          style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' if you skip',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: size.height * 0.2,
                                left: size.width * 0.37,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.cyan[200],
                                        offset: Offset(0, 0),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      widget._controller.nextPage(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeIn);
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Text('Skip'),
                                        Icon(Icons.double_arrow_rounded),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.cyan[300],
                                      onPrimary: Colors.white,
                                      padding: EdgeInsets.all(10.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.25,
                                right: size.width * 0.2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red[500],
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red[300],
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
                                    icon: Icon(Icons.close_rounded),
                                    iconSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Text('Skip'),
                      Icon(Icons.double_arrow_rounded),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 2.0),
                    padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.25,
              left: 10,
              child: Container(
                width: size.width * 0.45,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Blandit mauris, leo venenatis tempus. Etiam sit turpis ultricies posuere non gravida ut egestas.',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.25,
              right: 40,
              child: Container(
                height: size.height * 0.65,
                width: size.width * 0.45,
                padding: EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      // value: correctAnswer.contains(answers[index]),
                      onPressed: () {},
                      child: Text(
                        '${answers[index]}',
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white54,
                        onPrimary: Colors.white,
                        textStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
