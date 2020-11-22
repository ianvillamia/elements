import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mynewapp/Models/QuizModel.dart';

class QuizProvider extends ChangeNotifier {
  final controller = PageController(initialPage: 0);
  int quizLength = 0;
  int score = 0;
  QuizModel quiz;

  void selectCurrentQuiz({@required DocumentSnapshot doc}) {
    QuizModel _quiz = QuizModel.get(doc: doc);
    this.quiz = _quiz;
    notifyListeners();
  }

  var screenSize;
  void animateToNextQuestion() {
    controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
