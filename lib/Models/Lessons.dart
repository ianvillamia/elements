import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mynewapp/Models/QuizModel.dart';

class LessonModel {
  String title;
  int sequence;
  String description;
  String videoUrl;
  String imageUrl;
  bool izTaken;
  bool izUpdated;
  String question;
  List choices;
  String correctAnswer;
  QuizModel quiz;
  LessonModel.getData(data) {
    //new Map<String, dynamic>.from(data['quiz']);
    this.question = data['question'];
    this.choices = data['choices'];
    this.correctAnswer = data['correctAnswer'];
    this.title = data['title'];
    this.sequence = data['sequence'];
    this.description = data['description'];
    this.imageUrl = data['imageUrl'];
    this.videoUrl = data['url'];
    this.izTaken = data['izTaken'];
    this.izUpdated = data['izUpdated'];
  }
  static toMap({@required LessonModel lesson}) {
    var map = {
      'title': lesson.title,
      'sequence': lesson.sequence,
      'description': lesson.description,
      'url': lesson.videoUrl,
      'imageUrl': lesson.imageUrl,
      'izTaken': lesson.izTaken,
      'question': lesson.question,
      'correctAnswer': lesson.correctAnswer,
      'choices': lesson.choices,
      'izUpdated': lesson.izUpdated
    };
    return map;
  }
}
