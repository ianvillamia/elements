import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Lessons.dart';
import 'package:mynewapp/Screens/Lessons/questionItem.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:video_player/video_player.dart';

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

    _videoPlayerController = VideoPlayerController.network(lesson.video_url);
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        print('video Ended');
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Question(lesson: widget.lesson);
        }));
        //show quiz
      }
    });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,

      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    _chewieController.dispose();
    super.dispose();
  }

// Chewie(
//               controller: _chewieController,
//             ),
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
    return Hero(
      tag: lesson.ref,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(lesson.banner_url), fit: BoxFit.cover)),
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
                      Chewie(
                        controller: _chewieController,
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Text(
                        lesson.header ?? 'Error getting',
                        style:
                            CustomTextStyles.customText(size: FontSizes.large),
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
    );
  }
}
