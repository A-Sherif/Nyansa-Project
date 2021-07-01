import 'package:flutter/material.dart';
import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Services/database.dart';

import 'components/SearchBar.dart';
import 'components/CurrentlyReading.dart';
import 'components/HomeCategories.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning!';
    }
    if (hour < 17) {
      return 'Good Afternoon!';
    }
    return 'Good Evening!';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = Provider.of<Person>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              StreamBuilder<UserData>(
                  stream: DatabaseService(uid: user.uid).userData,
                  builder: (context, snapshot) {
                    UserData userData = snapshot.data;
                    return Container(
                      width: size.width,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                greeting(),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                userData.name ?? 'Nyansa',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
              SearchBar(),
              CurrentlyReading(),
              HomeCategories(),
            ],
          ),
        ),
      ),
    );
  }
}
