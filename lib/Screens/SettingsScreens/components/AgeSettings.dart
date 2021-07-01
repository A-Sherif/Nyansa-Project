import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Services/database.dart';
import 'package:provider/provider.dart';

import 'SettingsHeader.dart';

class AgeSettings extends StatefulWidget {
  @override
  _AgeSettingsState createState() => _AgeSettingsState();
}

class _AgeSettingsState extends State<AgeSettings> {
  int _currentValue = 4;
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
              body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: ListView(
                    children: [
                      SettingsHeader(
                        label: 'Change Age',
                        onPressed: () async {
                          Navigator.pop(context);
                          await DatabaseService(uid: user.uid).updateUserData(
                              userData.email,
                              userData.password,
                              userData.name,
                              _currentValue ?? userData.age,
                              userData.proficiency,
                              userData.readingTime,
                              userData.pin);
                        },
                      ),
                      Container(
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
                                            _currentValue =
                                                newValue.clamp(0, 12);
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
                                            _currentValue =
                                                newValue.clamp(0, 12);
                                          } else {
                                            _currentValue = 12;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
