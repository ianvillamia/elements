import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Models/Question.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/parent.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizScore extends StatefulWidget {
  @override
  _QuizScoreState createState() => _QuizScoreState();
}

class _QuizScoreState extends State<QuizScore> {
  Size size;
  QuizProvider _quizProvider;
  Question _question;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _quizProvider = Provider.of<QuizProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(child: _topbar()),
            Positioned(top: size.height * .25, child: _body())
          ],
        ),
      ),
    );
  }

  _topbar() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Images.quiz_time), fit: BoxFit.fill)),
      height: size.height * .3,
      width: size.width,
    );
  }

  _body() {
    return Container(
      width: size.width,
      height: size.height * .75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score',
              style: TextStyle(
                  fontSize: size.height * .05, fontWeight: FontWeight.w800),
            ),
            _score(),
            SizedBox(
              height: size.height * 0.05,
            ),
            // _message(),
            SizedBox(
              height: size.height * 0.08,
            ),
            MaterialButton(
              color: Color.fromRGBO(245, 47, 89, 1),
              child: Text(
                'End',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home', (Route<dynamic> route) => false);
              },
            )
          ]),
    );
  }

  _score() {
    double score =
        (_quizProvider.quiz.score / _quizProvider.quiz.questions.length);
    return Container(
      child: CircularPercentIndicator(
        radius: 130.0,
        animation: true,
        animationDuration: 1200,
        lineWidth: 15.0,
        percent: score,
        center: new Text(
          _quizProvider.quiz.score.toString() +
              "/" +
              _quizProvider.quiz.questions.length.toString(),
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: Colors.red[100],
        progressColor: Colors.red[700],
      ),
    );
  }

  _message() {
    if (_quizProvider.score / _quizProvider.quizLength == 1) {
      return Text(
        "You Did Very Well..",
        style:
            TextStyle(fontSize: size.height * .03, fontWeight: FontWeight.w800),
      );
    } else if (_quizProvider.score / _quizProvider.quizLength >= 0.5 &&
        _quizProvider.score / _quizProvider.quizLength <= 0.99) {
      return Text("You Can Do Better..",
          style: TextStyle(
              fontSize: size.height * .03, fontWeight: FontWeight.w800));
    } else {
      return Text("You Should Try Hard..",
          style: TextStyle(
              fontSize: size.height * .03, fontWeight: FontWeight.w800));
    }
  }
}
