import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Services/database.dart';
import 'package:provider/provider.dart';

import '../components/Header.dart';
import 'components/AccountButtons.dart';
import 'components/altAccountButtons.dart';

import 'components/changeName.dart';
import 'components/Email.dart';
import 'components/Password.dart';
import 'components/AgeSettings.dart';

class AccountSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Person>(context);

    return SafeArea(
      child: StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            UserData userData = snapshot.data;
            return Scaffold(
              body: ListView(
                children: [
                  Header(
                    label: 'Account Settings',
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            AccountButtons(
                              link: Name(),
                              label: 'Child\'s Name',
                              icon: Icon(
                                Icons.face_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              color: Colors.purple[800],
                              shadow: Colors.purple[200],
                              current: userData.name,
                            ),
                            AccountButtons(
                              link: Email(),
                              label: 'Email',
                              icon: Icon(
                                Icons.email_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              color: Colors.purple[600],
                              shadow: Colors.purple[200],
                              current: 'nyansa@nyansa.com',
                            ),
                            AccountButtons(
                              link: Password(),
                              label: 'Password',
                              icon: Icon(
                                Icons.lock_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              color: Colors.purple[400],
                              shadow: Colors.purple[200],
                              current: 'Change Password',
                            ),
                            AccountButtons(
                              link: AgeSettings(),
                              label: 'Age',
                              icon: Icon(
                                Icons.person_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              color: Colors.purple[300],
                              shadow: Colors.purple[200],
                              current: userData.age.toString(),
                            ),
                          ],
                        ),
                        Container(
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        AltAccountButtons(
                          link: Name(),
                          label: 'Delete Account',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
