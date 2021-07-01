import 'package:firebase_auth/firebase_auth.dart';
import 'package:nyansa/Services/database.dart';
import '../Models/userModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Person _user(User user) {
    return _user != null
        ? Person(
            uid: user.uid,
          )
        : null;
  }

  //auth change user stream
  Stream<Person> get user {
    return _auth.authStateChanges().map(_user);
  }

  //create account
  Future createAccount(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = result.user;

//Create new docuument for user
      await DatabaseService(
        uid: user.uid,
      ).updateUserData(
        'nyansa@nyansa.com',
        'nyansa1234',
        'Nyansa',
        4,
        'beginner',
        40,
        '1234',
      );
      return _user(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = result.user;
      return _user(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
