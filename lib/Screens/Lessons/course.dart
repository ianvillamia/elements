import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/CourseModel.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Providers/courseProvider.dart';
import 'package:mynewapp/Screens/Lessons/lesson.dart';
import 'package:mynewapp/Services/courseService.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:provider/provider.dart';

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
  User firebaseUser;
  bool showBanner;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.course.subscribed) {
      setState(() {
        showBanner = false;
      });
    } else {
      setState(() {
        showBanner = true;
      });
    }
  }

  CourseProvider _courseProvider;
  @override
  Widget build(BuildContext context) {
    firebaseUser = context.watch<User>();
    _courseProvider = Provider.of<CourseProvider>(context);
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
                image: NetworkImage(widget.image), fit: BoxFit.cover)),
        height: size.height * .35,
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
    return Stack(
      children: [
        Container(
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
                              widget.course.title,
                              style: CustomTextStyles.customText(
                                  size: FontSizes.subHeading, isBold: true),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * .01),
                        Text(
                          widget.course.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
                            children: _courseProvider.currentCourse.lessons
                                .map(
                                    (lesson) => _lessonCard(lessonTemp: lesson))
                                .toList())))
              ],
            ),
          ),
        ),
        _buildBanner()
      ],
    );
  }

  _buildBanner() {
    return Visibility(
      visible: showBanner,
      child: Container(
        width: size.width,
        height: size.height * .75,
        decoration: BoxDecoration(
          color: Color.fromRGBO(195, 199, 213, .5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width,
              color: Colors.white,
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    showBanner = false;
                    CourseService().subscribeToCourse(
                        ref: firebaseUser.uid, courseID: widget.course.docId);
                  });

                  //update this
                },
                child: Text(
                  'Take Course',
                  style: TextStyle(
                      fontSize: FontSizes.medium, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _lessonCard({LessonModel lessonTemp}) {
    bool isFirst;
    bool allowCard = false;
    if (lessonTemp.sequence == 0) {
      isFirst = true;
    }
    //if first dont opacity even if iztaken sya
    if (lessonTemp.izUpdated == true) {
      allowCard = true;
    }
    if (lessonTemp.izTaken == true) {
      allowCard = true;
    }
    if (isFirst == true) {
      allowCard = true;
    }
    return IgnorePointer(
      ignoring: !allowCard,
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Opacity(
            opacity: allowCard ? 1 : .5,
            // opacity: lessonTemp.izTaken ? .5 : 1,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * .005),
                        child: Container(
                          width: size.width * .45,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  lessonTemp.title,
                                  style: CustomTextStyles.customText(
                                      size: FontSizes.medium, isBold: true),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //],
                      //),
                      Padding(
                          padding: EdgeInsets.only(bottom: size.height * .02),
                          child: _playIcon(lesson: lessonTemp))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _playIcon({@required LessonModel lesson}) {
    return ClipOval(
      child: Material(
        color: Colors.blueGrey,
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
