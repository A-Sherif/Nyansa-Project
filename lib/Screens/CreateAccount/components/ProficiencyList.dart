import 'package:flutter/material.dart';

import 'selectedItem.dart';

class ProficiencyList extends StatelessWidget {
  const ProficiencyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          SelectedItem(
            text: 'Beginner',
            subtext: 'Recommended for children now learning to read',
          ),
          SelectedItem(
            text: 'Average',
            subtext: 'Recommeded for children who find it difficult to read',
          ),
          SelectedItem(
            text: 'Advanced',
            subtext: 'Recommended for children proficient in reading',
          ),
        ],
      ),
    );
  }
}
