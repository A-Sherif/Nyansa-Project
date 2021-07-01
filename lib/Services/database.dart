import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nyansa/Models/dataModel.dart';
import 'package:nyansa/Models/userModel.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

//collection reference
  final CollectionReference nyansaUsers =
      FirebaseFirestore.instance.collection('nyansaUsers');

  Future updateUserData(String email, String password, String name, int age, String proficiency,
      int readingTime, String pin) async {
    return await nyansaUsers
        .doc(uid)
        .set({
          'email':email,
          'password':password,
          'name': name,
          'age': age,
          'proficiency': proficiency,
          'time': readingTime,
          'pin': pin,
        })
        .then((value) => print('collection created'))
        .catchError((error) => print('Failed to add user: $error'));
  }

//get user list from snapshot
  List<Data> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Data(
        name: doc['name'] ?? '',
        age: doc['age'] ?? 4,
        proficiency: doc['proficiency'] ?? '',
        readingTime: doc['readingTime'] ?? 40,
        pin: doc['pin'] ?? '1234',
      );
    }).toList();
  }

  //userData from Snapshot
  UserData _userData(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      email: snapshot['email'],
      password: snapshot['password'],
      name: snapshot['name'],
      age: snapshot['age'],
      proficiency: snapshot['proficiency'],
      pin: snapshot['pin'],
    );
  }

  //get nyansaUsers stream
  Stream<List<Data>> get users {
    return nyansaUsers.snapshots().map(_userListFromSnapshot);
  }

  Stream<UserData> get userData {
    return nyansaUsers.doc(uid).snapshots().map(_userData);
  }
}
