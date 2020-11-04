import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynewapp/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference courses =
      FirebaseFirestore.instance.collection('courses');
  addUserToCollection({UserModel user, String uid}) {
    user.ref = uid;
    this
        .users
        .doc(uid)
        .set(user.toMap())
        .then((value) => addCoursesToUser(uid));

    // this.users.add(user.toMap());
  }

  void addCoursesToUser(uid) async {
    await FirebaseFirestore.instance.collection('courses').get().then((value) {
      value.docs.forEach((element) async {
        print(element.data());
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('courses')
            .add(element.data());
      });
    });
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
