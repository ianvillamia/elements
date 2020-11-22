import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Question.dart';

class QuizModel {
  String title;
  String level;
  bool isTaken;
  List<Question> questions = [];
  QuizModel.get({@required DocumentSnapshot doc}) {
    this.title = doc.data()['title'];
    this.level = doc.data()['level'];
    this.isTaken = doc.data()['isTaken'];

    for (var item in doc.data()['questions']) {
      // this.lessons.add(lesson);
      Question less = Question.getData(item);
      //print(less.runtimeType);
      this.questions.add(less);
    }
  }
}
