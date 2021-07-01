import 'package:flutter/material.dart';
import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Services/database.dart';
import 'package:provider/provider.dart';
import '../components/Header.dart';
import '../components/roundedButton.dart';

import 'AgeScreen.dart';

class NameScreen extends StatefulWidget {
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final _formKey = GlobalKey<FormState>();

  String userName;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Person>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(
              label: 'What is your child\'s name ?',
            ),
            StreamBuilder<UserData>(
              stream: DatabaseService(uid: user.uid).userData,
              builder: (context, snapshot) {
                UserData userData = snapshot.data;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.face),
                              labelText: 'Child\'s Name',
                              hintText: 'Nyansa',
                            ),
                            autofocus: false,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter your child\'s name';
                              } else if (value.length < 2) {
                                return 'Child\'s name cannot be less than 2 letters';
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                setState(() => userName = value),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: RoundedButton(
                          text: 'Continue',
                          primary: Colors.cyan[300],
                          onPrimary: Colors.cyan[800],
                          shadow: Colors.cyan[200],
                          fontSize: 18,
                          press: () async {
                            if (_formKey.currentState.validate()) {
                              await DatabaseService(uid: user.uid)
                                  .updateUserData(
                                      userData.email,
                                      userData.password,
                                      userName ?? userData.name,
                                      userData.age,
                                      userData.proficiency,
                                      userData.readingTime,
                                      userData.pin);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return AgeScreen();
                                }),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
