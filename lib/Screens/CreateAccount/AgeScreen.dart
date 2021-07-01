import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Services/database.dart';
import 'package:provider/provider.dart';

import '../components/Header.dart';
import '../components/roundedButton.dart';

import 'ProficiencyScreen.dart';

class AgeScreen extends StatefulWidget {
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int _currentValue = 4;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Person>(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(
              label: 'What is your child\s age',
            ),
            Expanded(
              child: StreamBuilder<UserData>(
                  stream: DatabaseService(uid: user.uid).userData,
                  builder: (context, snapshot) {
                    UserData userData = snapshot.data;

                    return Container(
                      height: size.height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () => setState(
                                      () {
                                        if (_currentValue > 4) {
                                          int newValue = _currentValue - 1;
                                          _currentValue = newValue.clamp(0, 12);
                                        } else {
                                          _currentValue = 4;
                                        }
                                      },
                                    ),
                                  ),
                                  NumberPicker(
                                    value: _currentValue,
                                    minValue: 4,
                                    maxValue: 12,
                                    haptics: true,
                                    axis: Axis.horizontal,
                                    itemWidth: 50,
                                    selectedTextStyle: TextStyle(
                                      color: Colors.cyan,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.cyan, width: 2),
                                      shape: BoxShape.circle,
                                    ),
                                    onChanged: (value) =>
                                        setState(() => _currentValue = value),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () => setState(
                                      () {
                                        if (_currentValue <= 12) {
                                          int newValue = _currentValue + 1;
                                          _currentValue = newValue.clamp(0, 12);
                                        } else {
                                          _currentValue = 12;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: RoundedButton(
                                  text: 'Continue',
                                  primary: Colors.cyan[300],
                                  onPrimary: Colors.cyan[800],
                                  shadow: Colors.cyan[200],
                                  fontSize: 18,
                                  press: () async {
                                    await DatabaseService(uid: user.uid)
                                        .updateUserData(
                                            userData.email,
                                            userData.password,
                                            userData.name,
                                            _currentValue ?? userData.age,
                                            userData.proficiency,
                                            userData.readingTime,
                                            userData.pin);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return ProficiencyScreen();
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
