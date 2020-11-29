import 'package:animate_do/animate_do.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Global/magicwand.dart';
import 'package:mynewapp/Models/Question.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynewapp/Strings/routes.dart';
import 'package:provider/provider.dart';

class QuizQuestion extends StatefulWidget {
  final int questionNumber;
  QuizQuestion({@required this.questionNumber});
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuizQuestion>
    with AutomaticKeepAliveClientMixin {
  Size size;
  String selected = '';
  Question _question;
  bool isVisible = false;
  int group = -1;
  QuizProvider _quizProvider;
  @override
  void initState() {
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    _quizProvider = Provider.of<QuizProvider>(context, listen: false);
    size = MediaQuery.of(context).size;
    _question = _quizProvider.quiz.questions[widget.questionNumber];
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(child: _topbar()),
            Positioned(top: size.height * .27, child: _body())
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
      height: size.height * .7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Text(_question.question,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontSize: 22, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: size.height * .015,
          ),
          Container(
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _listTile(text: _question.choices[0], val: 1),
                  _listTile(text: _question.choices[1], val: 2),
                  _listTile(text: _question.choices[2], val: 3),
                  _listTile(text: _question.choices[3], val: 4),
                  Visibility(
                      visible: isVisible,
                      child: ElasticIn(
                        child: MaterialButton(
                          color: Color.fromRGBO(245, 47, 89, 1),
                          onPressed: () {
                            if (_question.correctAnswer == selected) {
                              print('correct');
                              _quizProvider.quiz.score += 1;
                              _quizProvider.animateToNextQuestion();
                            } else {
                              _quizProvider.animateToNextQuestion();
                            }
                            if (_question.sequence ==
                                _quizProvider.quiz.questions.length - 1) {
                              print('end of quiz');
                              for (var i = 1;
                                  i < _quizProvider.quiz.questions.length;
                                  i++) {
                                print('pop' + i.toString());
                              }

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  settings:
                                      RouteSettings(name: Routes.quizLoading),
                                  builder: (context) => MagicWandSplashScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _listTile({String text, int val}) {
    return ListTile(
      title: Text(StringUtils.capitalize(text)),
      leading: Radio(
        value: val,
        groupValue: group,
        onChanged: (i) {
          setState(() {
            isVisible = true;
            selected = text;
            group = i;
          });
        },
      ),
    );
  }
}
