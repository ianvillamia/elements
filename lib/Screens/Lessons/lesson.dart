import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Providers/courseProvider.dart';
import 'package:mynewapp/Screens/Lessons/quiz.dart';
import 'package:mynewapp/Services/courseService.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import './course.dart';

class Lesson extends StatefulWidget {
  final LessonModel lesson;

  Lesson({@required this.lesson});
  @override
  _LessonState createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  LessonModel lesson;
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController;

  ChewieController _chewieController;

  Size size;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lesson = widget.lesson;
    CourseProvider _courseProvider =
        Provider.of<CourseProvider>(context, listen: false);
    _videoPlayerController = VideoPlayerController.network(lesson.videoUrl);
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        //_showOnCompleteModal();
        _showQuiz();
        _finishLesson(_courseProvider);
      }
    });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
    );
  }

  _finishLesson(courseProvider) {
    CourseService cs = CourseService();
    print('finished lesson');
    cs.takeLesson(
        courseProvider: courseProvider,
        course: _courseProvider.currentCourse,
        userRef: firebaseUser.uid,
        lessonNumber: lesson.sequence);
  }

  _showQuiz() {
    if (widget.lesson.izTaken == false) {
      return Navigator.push(context,
          MaterialPageRoute(builder: (context) => Quiz(lesson: widget.lesson)));
    } else {
      print('already took quiz');
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    _chewieController.dispose();
    super.dispose();
  }

  CourseProvider _courseProvider;
  User firebaseUser;
  @override
  Widget build(BuildContext context) {
    firebaseUser = context.watch<User>();
    _courseProvider = Provider.of<CourseProvider>(context, listen: false);

    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(child: _topbar()),
            Positioned(top: size.height * .27, child: _body()),
          ],
        ),
      ),
    );
  }

  _topbar() {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(lesson.imageUrl),
          fit: BoxFit.contain,
        )),
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
                        // Navigator.pop(context);

                        // CourseService().takeLesson(
                        //     userRef: firebaseUser.uid,
                        //     course: null,
                        //     lessonNumber: null);
                        // Navigator.push(context, MaterialPageRoute(builder: (_) {
                        //   return Course(
                        //       image:
                        //           _courseProvider.currentCourse.courseImageUrl,
                        //       lessons: _courseProvider.currentCourse.lessons,
                        //       course: _courseProvider.currentCourse);
                        // }));
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
    return Card(
      elevation: 15,
      child: Container(
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
                        Chewie(
                          controller: _chewieController,
                        ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        Text(
                          lesson.title ?? 'Error getting',
                          style: CustomTextStyles.customText(
                              size: FontSizes.large),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            lesson.description,
                            textAlign: TextAlign.left,
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
