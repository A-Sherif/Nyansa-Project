import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/Header.dart';
import 'components/SearchCategories.dart';
import 'components/SearchAudio.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.cyan[200],
                offset: Offset(0, 10),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: FloatingActionButton(
            child: SvgPicture.asset(
              'assets/icons/plain-microphone.svg',
              height: 24,
            ),
            backgroundColor: Colors.cyan[300],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SearchAudio();
                },
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Column(
            children: [
              Header(
                label: 'Search',
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.cyan, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Form(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Look for books',
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search_rounded),
                        onPressed: () {},
                      ),
                      border: InputBorder.none,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              SearchCategories(),
            ],
          ),
        ),
      ),
    );
  }
}
