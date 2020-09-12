import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Screens/Lessons/lesson.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class Course extends StatefulWidget {
  final String image;
  Course({@required this.image});

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
                image: AssetImage(widget.image), fit: BoxFit.fill)),
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
              alignment: Alignment.centerLeft,
              child: Hero(
                tag: 'imageHero',
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    height: size.height * .1,
                    child: Text(
                      'Course content',
                      style: CustomTextStyles.customText(
                          size: FontSizes.subHeading, isBold: true),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                width: size.width,
                height: size.height * .55,
                child: SingleChildScrollView(
                  child: StreamBuilder<QuerySnapshot>(
                      stream:
                          Firestore.instance.collection('lessons').snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                              children: snapshot.data.documents
                                  .map((doc) => _lessonCard(
                                        doc: doc,
                                      ))
                                  .toList());
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ))
          ],
        ),
      ),
    );
  }

  Widget _lessonCard({DocumentSnapshot doc}) {
    //accept data from fs
    LessonModel lesson = LessonModel.getData(doc: doc);

    return Hero(
      tag: 'toLesson',
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: size.width,
          height: size.height * .15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                lesson.sequence,
                style: CustomTextStyles.customText(
                    size: FontSizes.heading,
                    isBold: true,
                    color: Color.fromRGBO(228, 231, 244, 1)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    lesson.video_time,
                    style: CustomTextStyles.customText(
                        size: FontSizes.medium,
                        color: Color.fromRGBO(195, 199, 213, 1)),
                  ),
                  Text(
                    lesson.title,
                    style: CustomTextStyles.customText(size: FontSizes.large),
                  ),
                ],
              ),
              _playIcon(lesson: lesson)
            ],
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
            print(lesson.banner_url);
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
