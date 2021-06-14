import 'package:flutter/material.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({
    Key key,
    this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      label,
                    ),
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Done'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[200],
                      onPrimary: Colors.cyan[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    )),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.black,
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
