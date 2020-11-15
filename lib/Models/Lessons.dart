import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynewapp/Models/QuizModel.dart';

class LessonModel {
  String title;
  int sequence;
  String description;
  String videoUrl;
  String imageUrl;
  bool izTaken;
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
  }
}
