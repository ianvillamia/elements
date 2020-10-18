import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Question {
  int sequence;
  String correctAnswer;
  List choices;
  String question;

  Question.set({@required DocumentSnapshot doc}) {
    this.sequence = doc.data()['sequence'];
    this.correctAnswer = doc.data()['correctAnswer'];
    this.choices = doc.data()['choices'];
    this.question = doc.data()['question'];
  }
  Question() {}
}
