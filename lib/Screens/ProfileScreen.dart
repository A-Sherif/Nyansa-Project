import 'package:flutter/material.dart';

import 'components/ProfileButton.dart';

import 'SettingsScreen.dart';
import 'ParentalLock.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Column(
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 15,
                          ),
                          padding: EdgeInsets.all(
                            10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 10),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nyansa',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: size.width * 0.4),
                                child: Divider(
                                  thickness: 2,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Points: ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Earn points by reading',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: ProfileButton(
                            label: 'Settings',
                            icon: Icon(
                              Icons.settings_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            color: Colors.cyan[300],
                            shadow: Colors.cyan[200],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ParentalLock(),
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
            Container(
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red[200],
                    offset: Offset(0, 10),
                    blurRadius: 10.0,
                    spreadRadius: 1,
                  ),
                ],
              ),
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.all(20),
              child: Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
