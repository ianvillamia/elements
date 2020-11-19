import 'package:animate_do/animate_do.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:mynewapp/Strings/images.dart';

class Quiz extends StatefulWidget {
  final LessonModel lesson;
  Quiz({@required this.lesson});

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int group = -1;
  String selected = '';
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'POP QUIZ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * .08),
                    Flexible(
                      child: Text(
                          StringUtils.capitalize(widget.lesson.question),
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.openSans(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Container(
                      width: size.width,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _listTile(text: widget.lesson.choices[0], val: 1),
                            _listTile(text: widget.lesson.choices[1], val: 2),
                            _listTile(text: widget.lesson.choices[2], val: 3),
                            _listTile(text: widget.lesson.choices[3], val: 4),
                            SizedBox(
                              height: size.height * .05,
                            ),
                            ElasticIn(
                              child: MaterialButton(
                                color: Color.fromRGBO(245, 47, 89, 1),
                                onPressed: () {
                                  //update isQuizTaken
                                  if (selected.toLowerCase() ==
                                      widget.lesson.correctAnswer
                                          .toLowerCase()) {
                                    //update lesson is taken
                                    //update dependents?
                                    _showOnCompleteModal();
                                  }
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
            )));
  }

  _listTile({String text, int val}) {
    return ListTile(
        title: Text(StringUtils.capitalize(text)),
        leading: Radio(
            value: val,
            groupValue: group,
            onChanged: (i) {
              setState(() {
                //  isVisible = true;
                selected = text;
                group = i;
              });
            }));
  }

  void _showOnCompleteModal() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          context: context,
          builder: (builder) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                  height: size.height * .3,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ElasticIn(
                          child: Image.asset(
                            Images.success,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Lesson Completed',
                        style: CustomTextStyles.customText(
                            isBold: true, size: FontSizes.large),
                      ),
                      Text(
                        'Click to Continue',
                        style:
                            CustomTextStyles.customText(size: FontSizes.medium),
                      ),
                    ],
                  )),
            );
          });
    });
  }
}
