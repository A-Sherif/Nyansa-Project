import 'package:flutter/material.dart';
import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Screens/CreateAccount/ProficiencyExp.dart';
import 'package:nyansa/Services/database.dart';
import 'package:provider/provider.dart';

import '../components/Header.dart';

class ProficiencySettings extends StatefulWidget {
  @override
  _ProficiencySettingsState createState() => _ProficiencySettingsState();
}

class _ProficiencySettingsState extends State<ProficiencySettings> {
  final List<String> proficiencies = <String>[
    'Beginner',
    'Intermediate',
    'Advanced'
  ];

  final List<String> subtext = <String>[
    'Recommended for children now learning to read',
    'Recommeded for children who find it difficult to read',
    'Recommended for children proficient in reading',
  ];

  String selectedText;
  int selectedIndex;
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
              backgroundColor: Colors.white,
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () async {
                  await DatabaseService(uid: user.uid).updateUserData(
                      userData.email,
                      userData.password,
                      userData.name,
                      userData.age,
                      selectedText ?? userData.proficiency,
                      userData.readingTime,
                      userData.pin);
                  Navigator.pop(context);
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
                height: size.height,
                child: Column(
                  children: [
                    Header(
                      label: 'Set child\'s reading proficiency',
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.25,
                              vertical: 10,
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProficiencyExplanation();
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.help_outline),
                                    Text(
                                        'Get help understanding \nchild\'s proficiency level')
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey.withOpacity(0.1),
                                  onPrimary: Colors.black,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Text(
                              'Set your child\s reading level',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            height: 300,
                            width: 500,
                            padding: EdgeInsets.fromLTRB(
                              size.width * 0.1,
                              0,
                              size.width * 0.1,
                              0,
                            ),
                            child: ListView.builder(
                              itemCount: proficiencies.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: size.width * 0.9,
                                          child: ListTile(
                                            title: Center(
                                              child: Text(
                                                  '${proficiencies[index]}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  )),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            tileColor: selectedIndex == index
                                                ? Colors.cyan[300]
                                                : Colors.grey[500],
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = index;
                                                selectedText = proficiencies
                                                    .elementAt(selectedIndex);
                                                print(selectedText);
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 20,
                                          ),
                                          child: Visibility(
                                            visible: selectedIndex == index
                                                ? true
                                                : false,
                                            child: Text(
                                              '${subtext[index]}',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
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
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
