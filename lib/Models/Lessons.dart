import 'package:cloud_firestore/cloud_firestore.dart';

class LessonModel {
  String ref;
  String sequence;
  String title;
  String video_time;
  String video_url;
  String header;
  String description;
  String banner_url;
  List lessons_list;
  String question;
  List choices;
  String correctAnswer;

  LessonModel.getData({DocumentSnapshot doc}) {
    this.ref = doc.data()['ref'];
    this.sequence = doc.data()['sequence'];
    this.title = doc.data()['title'];
    this.video_time = doc.data()['video_time'];
    this.video_url = doc.data()['video_url'];
    this.header = doc.data()['header'];
    this.description = doc.data()['description'];
    this.banner_url = doc.data()['banner_url'];
    this.lessons_list = doc.data()['lessons'];
    this.question = doc.data()['question'];
    this.choices = doc.data()['choices'];
    this.correctAnswer = doc.data()['correctAnswer'];
  }
}
