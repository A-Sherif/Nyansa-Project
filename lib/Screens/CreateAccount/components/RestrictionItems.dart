import 'package:flutter/material.dart';

class RestrictionItems extends StatefulWidget {
  const RestrictionItems({
    Key key,
  }) : super(key: key);

  @override
  _RestrictionItemsState createState() => _RestrictionItemsState();
}

class _RestrictionItemsState extends State<RestrictionItems> {
  final List<String> restrictions = <String>[
    'LGBT+',
    'Islam',
    'Christian',
    'War',
    'Islam',
    'Christian',
    'War',
    'Islam',
    'Christian',
    'War',
    'Islam',
    'Christian',
    'War'
  ];

  bool selected = false;
  void selectedIndex() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.1,
          0,
          size.width * 0.1,
          size.width * 0.2,
        ),
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(
                  50,
                ),
                child: ListTile(
                  title: Text('${restrictions[index]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                      )),
                  selected: false,
                  tileColor: selected ? Colors.white : Colors.cyan,
                  onTap: () {
                    selectedIndex();
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: restrictions.length),
      ),
    );
  }
}
