import 'package:flutter/material.dart';

import '../components/Header.dart';
import 'components/ProficiencyList.dart';
import 'components/Age.dart';

class ProficiencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/Restriction');
        },
        backgroundColor: Colors.cyan,
        label: Text('Continue'),
      ),
      body: Container(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(
                  label: 'Set child\'s reading proficiency',
                  press: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Set your child\s age',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Age(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          'Set your child\s reading level',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Proficiency(),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.2,
                          vertical: 10,
                        ),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                Icon(Icons.help_outline),
                                Text(
                                    'Get help understanding child\'s proficiency level')
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                              padding: EdgeInsets.all(10.0),
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
