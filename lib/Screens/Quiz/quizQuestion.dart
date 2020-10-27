import 'package:animate_do/animate_do.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Global/magicwand.dart';
import 'package:mynewapp/Models/Question.dart';
import 'package:mynewapp/Providers/quizProvider.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class QuizQuestion extends StatefulWidget {
  final DocumentSnapshot doc;
  QuizQuestion({@required this.doc});
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
    super.build(context);
    _quizProvider = Provider.of<QuizProvider>(context, listen: false);
    _question = Question.set(doc: widget.doc);
    size = MediaQuery.of(context).size;
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * .15,
          ),
          Text(_question.question,
              style: GoogleFonts.openSans(
                  fontSize: 30, fontWeight: FontWeight.bold)),
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
                            if (selected == '') {
                              //please select something

                            }
                            if (_question.correctAnswer == selected) {
                              print('correct');

                              _quizProvider.score += 1;
                              _quizProvider.animateToNextQuestion();
                              print(_quizProvider.score);
                            } else {
                              _quizProvider.animateToNextQuestion();
                            }
                            if (_question.sequence ==
                                _quizProvider.quizLength) {
                              //compute & show loading
                              print(_quizProvider.score);
                              print('end of quiz');
                              for (var i = 1;
                                  i < _quizProvider.quizLength;
                                  i++) {
                                print('pop' + i.toString());
                                Navigator.pop(context);
                              }

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MagicWandSplashScreen()));
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
