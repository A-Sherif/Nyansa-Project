import 'package:flutter/material.dart';
import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Services/database.dart';
import 'package:provider/provider.dart';

import 'SettingsHeader.dart';

class Name extends StatefulWidget {
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  final _formKey = GlobalKey<FormState>();
  String userName;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Person>(context);
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
                            label: 'Change Name',
                            onPressed: () async {
                              await DatabaseService(uid: user.uid)
                                  .updateUserData(
                                    userData.email,
                    userData.password,
                                userName ?? userData.name,
                                userData.age,
                                userData.proficiency,
                                userData.readingTime,
                                userData.pin,
                              );
                              Navigator.pop(context);
                            }),
                        Form(
                            key: _formKey,
                            child: TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.face),
                                labelText: 'Child\'s Name',
                                hintText: 'Nyansa',
                              ),
                              initialValue: userData.name,
                              maxLines: 1,
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
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
