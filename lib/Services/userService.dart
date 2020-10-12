import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynewapp/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  addUserToCollection({UserModel user}) {
    this.users.add(user.toMap());
  }

  getUser({User user}) async {
    await users.doc(user.uid).get().then((DocumentSnapshot doc) {
      if (doc.exists) {
        return UserModel.get(doc);
      }
      // return UserModel.get(doc);
    });
  }
}
