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
  static getData({DocumentSnapshot doc}) {
    var lesson = LessonModel();
    lesson.ref = doc.data['ref'];
    lesson.sequence = doc.data['sequence'];
    lesson.title = doc.data['title'];
    lesson.video_time = doc.data['video_time'];
    lesson.video_url = doc.data['video_url'];
    lesson.header = doc.data['header'];
    lesson.description = doc.data['description'];
    lesson.banner_url = doc.data['banner_url'];
    lesson.lessons_list = doc.data['lessons'];
    lesson.question = doc.data['question'];
    lesson.choices = doc.data['choices'];
    lesson.correctAnswer = doc.data['correctAnswer'];
    return lesson;
  }
}
