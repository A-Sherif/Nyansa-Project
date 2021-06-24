import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'components/SearchCategories.dart';
import 'components/SimilarBooks.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          partialResults: true,
          onResult: (val) => setState(
            () {
              _text = '${val.recognizedWords}';
            },
          ),
        );
      } else {
        setState(() => _isListening = false);
        _speech.stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.transparent,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 10),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            height: size.height * 0.3,
                            width: size.height * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  _text,
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      "I'm listening...",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: size.height * 0.15,
                          left: size.width * 0.19,
                          child: AvatarGlow(
                            animate: _isListening,
                            glowColor: Colors.cyan[300],
                            endRadius: 75.0,
                            duration: Duration(milliseconds: 2000),
                            repeat: true,
                            repeatPauseDuration: Duration(milliseconds: 100),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.cyan[500],
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: _listen,
                                icon: Icon(Icons.mic),
                                iconSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5.0, left: 15.0),
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
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
                      prefixIcon: Icon(Icons.search_rounded),
                      border: InputBorder.none,
                    ),
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: Search(),
                      );
                    },
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

class Search extends SearchDelegate {
  final categories = [
    'Colors',
    'Animals',
    'Objects',
    'Dogs',
    'Bears',
  ];
  final suggestionList = [
    'Colors',
    'Animals',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SimilarBooks();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? suggestionList
        : categories
            .where((search) => search.toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.search),
          title: RichText(
            text: TextSpan(
              text: suggestions[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: suggestions[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
