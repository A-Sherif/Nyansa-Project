import 'package:flutter/material.dart';

import 'ProfileButton.dart';

class ProfileGroups extends StatelessWidget {
  final String title;
  final Widget child;
  const ProfileGroups({
    Key key,
    this.title,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ProfileButton(label: 'Edit Profile'),
          ProfileButton(label: 'Reading Settings'),
          ProfileButton(label: 'Account Settings'),
        ],
      ),
    );
  }
}
