import 'package:flutter/cupertino.dart';

class QuizProvider extends ChangeNotifier {
  final controller = PageController(initialPage: 0);
  int quizLength = 0;
  int score = 0;
  List elementStack = [];
  var screenSize;
  void animateToNextQuestion() {
    controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
