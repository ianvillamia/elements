import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  FirebaseAuth auth = FirebaseAuth.instance;
  String firstName = '';
  String lastName = '';
  String email = '';
  String uid = '';

  UserModel.get(DocumentSnapshot doc) {
    this.firstName = doc.data()['firstName'] ?? '';
    this.lastName = doc.data()['lastName'] ?? '';
    this.email = doc.data()['email'] ?? '';
    this.uid = doc.data()['ref'] ?? '';
  }
  UserModel() {}
  toMap() {
    uid = auth.currentUser.uid.toString();
    return {'firstName': this.firstName, 'lastName': this.lastName, 'ref': uid};
  }
}
