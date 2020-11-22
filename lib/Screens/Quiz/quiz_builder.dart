import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Screens/Quiz/quizQuestion.dart';
import 'package:provider/provider.dart';

class QuizBuilder extends StatefulWidget {
  QuizBuilder({Key key}) : super(key: key);

  @override
  _QuizBuilderState createState() => _QuizBuilderState();
}

class _QuizBuilderState extends State<QuizBuilder> {
  @override
  Widget build(BuildContext context) {
    final _quizProvider = Provider.of<QuizProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;
    print(_quizProvider.quiz.questions.length);
    return Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            child: PageView.builder(
                controller: _quizProvider.controller,
                itemCount: _quizProvider.quiz.questions.length,
                itemBuilder: (context, position) {
                  print(position);
                  return QuizQuestion(
                    questionNumber: position,
                  );
                  // _quizProvider.quiz.questions
                  //     .map((questions) => QuizQuestion(question: questions));
                })));
  }
}
