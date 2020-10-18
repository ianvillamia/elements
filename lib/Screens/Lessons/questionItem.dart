import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class QuestionItem extends StatefulWidget {
  final lesson;
  QuestionItem({@required this.lesson});

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionItem> {
  Size size;
  LessonModel lesson;
  @override
  Widget build(BuildContext context) {
    lesson = widget.lesson;
    size = MediaQuery.of(context).size;
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
    return Hero(
      tag: lesson.ref,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.quiz_time), fit: BoxFit.cover)),
          height: size.height * .3,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: size.height * .05,
                left: 5,
                child: ClipOval(
                  child: Material(
                    color: Colors.white,
                    elevation: 10,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
              ),
            ],
          )),
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * .65,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Text(
                        lesson.question,
                        style: CustomTextStyles.customText(
                            isBold: true, size: FontSizes.large),
                      ),
                      Container(
                        width: size.width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: lesson.choices
                                .map((e) => _button(choice: e))
                                .toList()),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _button({choice}) {
    return MaterialButton(
      onPressed: () {
        if (choice == lesson.correctAnswer) {
          print('correct');
        } else {
          print('wrong');
        }
      },
      child: Text(choice),
    );
  }
}
