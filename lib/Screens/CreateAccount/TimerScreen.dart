import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Services/database.dart';
import 'package:provider/provider.dart';

import '../components/Header.dart';

import 'PinScreen.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _currentTime = 40;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Person>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            UserData userData = snapshot.data;
            return Scaffold(
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () async {
                  await DatabaseService(uid: user.uid).updateUserData(
                      userData.email,
                      userData.password,
                      userData.name,
                      userData.age,
                      userData.proficiency,
                      _currentTime ?? userData.readingTime,
                      userData.pin);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PinScreen();
                      },
                    ),
                  );
                },
                backgroundColor: Colors.cyan[200],
                label: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.cyan[800],
                  ),
                ),
              ),
              body: Container(
                child: Column(
                  children: [
                    Header(
                      label: 'Set daily reading limit',
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.cyan[200]),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_drop_up,
                                            color: Colors.cyan[800],
                                          ),
                                          iconSize: 50,
                                          onPressed: () {
                                            setState(() {
                                              final newValue = _currentTime - 1;
                                              _currentTime =
                                                  newValue.clamp(0, 60);
                                            });
                                          },
                                        ),
                                      ),
                                      NumberPicker(
                                        value: _currentTime,
                                        minValue: 0,
                                        maxValue: 60,
                                        onChanged: (value) => setState(
                                            () => _currentTime = value),
                                        selectedTextStyle: TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        itemWidth: 80,
                                        itemCount: 3,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.cyan, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.0),
                                        child:
                                            Text('Current Time: $_currentTime'),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.cyan[200]),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.cyan[800],
                                          ),
                                          iconSize: 50,
                                          alignment: Alignment.center,
                                          onPressed: () {
                                            setState(() {
                                              final newValue = _currentTime + 1;
                                              _currentTime =
                                                  newValue.clamp(0, 60);
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                size.width * 0.15,
                                20,
                                size.width * 0.15,
                                0,
                              ),
                              child: Text(
                                'Research has shown that the average reading time for children is 40 minutes',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
