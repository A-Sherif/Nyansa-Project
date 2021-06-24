import 'package:flutter/material.dart';

import 'SettingsScreens/AccountSettings.dart';
import 'SettingsScreens/ReadingSettings.dart';
import 'NavBar.dart';
import 'components/ProfileButton.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomTab(initialPage: 3)),
              (route) => false);
          return false;
        },
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BottomTab(initialPage: 3)),
                                  (route) => false);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 25.0,
                            ),
                            label: Text(
                              'Settings',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          ProfileButton(
                            label: 'Reading Settings',
                            icon: Icon(
                              Icons.menu_book_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                            color: Colors.blue[300],
                            shadow: Colors.blue[200],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReadingSettings(),
                                ),
                              );
                            },
                          ),
                          ProfileButton(
                            label: 'Account Settings',
                            icon: Icon(
                              Icons.face_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            color: Colors.purple[300],
                            shadow: Colors.purple[200],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AccountSettings(),
                                ),
                              );
                            },
                          ),
                          ProfileButton(
                            label: 'Notification Settings',
                            icon: Icon(
                              Icons.notifications_none_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                            color: Colors.green[300],
                            shadow: Colors.green[200],
                            press: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/images/Headphone_mic.png'),
                              height: 50,
                              width: 50,
                              color: Colors.cyan[800],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: size.width * 0.1),
                              child: Text('How can we help?',
                                  style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan[100],
                          onPrimary: Colors.cyan[800],
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: Text('Privacy Policy'),
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: Text('Terms and conditions'),
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
