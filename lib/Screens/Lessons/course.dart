import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/CourseModel.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Screens/Lessons/lesson.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class Course extends StatefulWidget {
  final String image;
  final List lessons;
  final CourseModel course;
  Course({@required this.image, @required this.lessons, @required this.course});

  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  Size size;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.image), fit: BoxFit.fill)),
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
            Positioned(
              top: 20,
              right: 0,
              child: ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(icon: Icon(Icons.sort), onPressed: () {}),
                ),
              ),
            ),
          ],
        ));
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
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: widget.course.title,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          'Chemistry for Beginners',
                          style: CustomTextStyles.customText(
                              size: FontSizes.subHeading, isBold: true),
                        ),
                      ),
                    ),
                    Text(
                      'Lessons in chemistry for beginners is to learn chemisty and more about the stuff and more stuff',
                      style: CustomTextStyles.customText(
                          size: FontSizes.small, isBold: true),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                        children: widget.lessons
                            .map((lesson) => _lessonCard(lessonTemp: lesson))
                            .toList())))
          ],
        ),
      ),
    );
  }

  Widget _lessonCard({LessonModel lessonTemp}) {
    //accept data from fs
    print(lessonTemp);
    //  LessonModel lesson = LessonModel.getData(doc: doc);
    // return Container();
    print(lessonTemp.imageUrl);
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Container(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: size.width * .4,
                    height: size.height * .15,
                    child: FadeInImage.assetNetwork(
                        placeholder: Images.loading,
                        image: lessonTemp.imageUrl),
                  ),
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      lessonTemp.sequence.toString(),
                      style: CustomTextStyles.customText(
                          size: FontSizes.heading,
                          isBold: true,
                          color: Color.fromRGBO(228, 231, 244, 1)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   lesson.video_time,
                        //   style: CustomTextStyles.customText(
                        //       size: FontSizes.medium, color: Colors.red),
                        // ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 25),
                          child: Container(
                            width: size.width * .45,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    lessonTemp.title,
                                    style: CustomTextStyles.customText(
                                        size: FontSizes.large, isBold: true),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    _playIcon(lesson: lessonTemp)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _playIcon({@required LessonModel lesson}) {
    return ClipOval(
      child: Material(
        color: Color.fromRGBO(73, 204, 150, 1),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return Lesson(
                lesson: lesson,
              );
            }));
          },
          splashColor: Colors.blue,
          child: Container(
            width: 50,
            height: 50,
            child: Center(
              child: Icon(Icons.play_arrow),
            ),
          ),
        ),
      ),
    );
  }
}
