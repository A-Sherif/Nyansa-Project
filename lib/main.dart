import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nyansa/Models/userModel.dart';
import 'package:nyansa/Services/auth.dart';
import 'package:provider/provider.dart';
import 'package:nyansa/Screens/wrapper.dart';

import 'Screens/CreateAccount/CreateScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/HomePage.dart';
import 'Screens/FavoritesScreen.dart';
import 'Screens/SearchScreen.dart';
import 'Screens/ProfileScreen.dart';
import 'Screens/BookInfo.dart';
import 'Screens/ContentsScreen.dart';
import 'Screens/ParentalLock.dart';
import 'Screens/ReadScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey[200],
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        StreamProvider<Person>.value(
          value: AuthService().user,
          initialData: Person(),
          catchError: (context, error) {
            return null;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nyansa App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
          primaryColor: Colors.cyan,
          shadowColor: Colors.transparent,
        ),
        home: Wrapper(),
        routes: {
          '/Login': (context) => LoginScreen(),
          '/Create': (context) => CreateScreen(),
          '/Home': (context) => HomeScreen(),
          '/Favorites': (context) => FavoritesScreen(),
          '/Search': (context) => SearchScreen(),
          '/ParentalLock': (context) => ParentalLock(),
          '/Profile': (context) => ProfileScreen(),
          '/BookInfo': (context) => BookInfo(),
          '/Contents': (context) => ContentsScreen(),
          '/Read': (context) => ReadingScreensPage(),
        },
      ),
    );
  }
}
