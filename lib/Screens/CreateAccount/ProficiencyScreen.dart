import 'package:flutter/material.dart';

import '../globalComponents/Header.dart';
import 'components/ProficiencyList.dart';

class ProficiencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/Restriction');
        },
        backgroundColor: Colors.cyan,
        label: Text('Continue'),
      ),
      body: Container(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(
                  label: 'Set child\'s reading proficiency',
                  press: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Set your child\s reading level',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                ProficiencyList(),
              ],
            ),
          )),
    );
  }
}
