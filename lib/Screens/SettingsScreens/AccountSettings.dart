import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Header.dart';
import 'components/AccountButtons.dart';
import 'components/altAccountButtons.dart';

import 'components/Name.dart';
import 'components/Email.dart';
import 'components/Password.dart';
import 'components/AgeSettings.dart';

class AccountSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        current: 'Nyansa',
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
                        current: '4',
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
      ),
    );
  }
}
