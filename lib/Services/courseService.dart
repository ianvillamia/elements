import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CourseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void subscribeToCourse(
      {@required String ref, @required String courseID}) async {
    await users
        .doc(ref)
        .collection('courses')
        .doc(courseID)
        .update({'subscribed': true});
  }
}
