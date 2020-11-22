import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Question {
  int sequence;
  String correctAnswer;
  List choices;
  String question;

  Question.getData(data) {
    this.question = data['question'];
    this.choices = data['choices'];
    this.correctAnswer = data['correctAnswer'];
    this.sequence = data['sequence'];
  }
  Question() {}
}
