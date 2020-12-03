import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Screens/Lessons/lesson.dart';

class CourseModel {
  String title;
  String description;
  String organizationName;
  String courseImageUrl;
  bool subscribed;
  String docId;
  String ref;
  int score;
  // List<String,LessonModel> lessons;
  List<LessonModel> lessons = [];
  CourseModel.getData({DocumentSnapshot doc}) {
    this.title = doc.data()['title'];
    this.docId = doc.reference.id;
    this.courseImageUrl = doc.data()['courseImageUrl'];
    this.description = doc.data()['description'];
    this.organizationName = doc.data()['organizationName'];
    this.subscribed = doc.data()['subscribed'];
    this.score = doc.data()['score'];
    this.ref = doc.data()['ref'];
    for (var item in doc.data()['lessons']) {
      // this.lessons.add(lesson);
      LessonModel less = LessonModel.getData(item);
      //print(less.runtimeType);
      lessons.add(less);
    }
    // print(lessons.length);
  }
}
