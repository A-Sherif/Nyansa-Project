import 'package:flutter/material.dart';

import 'globalComponents/Header.dart';
import 'globalComponents/roundedButton.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Header(
            label: 'Login',
            press: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/Logo.png',
                            width: size.width * 0.25,
                            height: size.height * 0.25,
                            alignment: Alignment.topCenter,
                          ),
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //     labelText: 'Username',
                          //     hintText: 'Nyansa',
                          //     icon: Icon(
                          //       Icons.face_outlined,
                          //     ),
                          //     border: OutlineInputBorder(
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(50)),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
