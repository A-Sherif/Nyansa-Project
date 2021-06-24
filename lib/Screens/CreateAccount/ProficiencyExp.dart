import 'package:flutter/material.dart';

import '../components/Header.dart';

class ProficiencyExplanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(
              label: 'Proficiency help',
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Scrollbar(
                  interactive: true,
                  child: ListView(physics: BouncingScrollPhysics(), children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                        bottom: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width,
                            margin: EdgeInsets.only(bottom: 15.0),
                            padding: EdgeInsets.only(bottom: 5.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 2.0),
                              ),
                            ),
                            child: Text(
                              'How is the proficiency level calculated ?',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            'Proficiency levels are calculated based on your child\'s age as well as the selected proficiency level (beginner, intermediate or advanced)',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                        bottom: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Proficiency Levels',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Beginner',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'Recommended for children between the ages of 4-5 or children now learning to read \nWhen selected only books teaching how to read would be shown. \nChildren would be able to learn the alphabets, numbers, two and three letter words and correct pronunciation ',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Intermediate',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'Recommended for children between the ages of 6-8 or children with average reading skills \nChildren would be introduced to story books which have simple words and are easy to understand. \nChildren would be able to learn more advanced words and would be able to develop a strong grammatical foundation',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Advanced',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'Recommended for children between the ages of 9-12 or children proficient in reading. \nChildren would be introduced to normal story books with easy to understand words. \nChildren would be able to learn new vocabulary as well as improve on their grammatical foundation',
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
