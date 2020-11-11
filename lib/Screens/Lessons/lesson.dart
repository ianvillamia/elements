import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Lessons.dart';
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

    _videoPlayerController = VideoPlayerController.network(lesson.videoUrl);
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        _showOnCompleteModal();
      }
    });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    _chewieController.dispose();
    super.dispose();
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
                    ],
                  )),
            );
          });
    });
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
          image: NetworkImage(lesson.imageUrl),
          fit: BoxFit.fitWidth,
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
