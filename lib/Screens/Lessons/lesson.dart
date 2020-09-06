import 'package:flutter/material.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:video_player/video_player.dart';

class Lesson extends StatefulWidget {
  final image;

  Lesson({@required this.image});
  @override
  _LessonState createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  Size size;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/uplearn-prod.appspot.com/o/courses%2FReOpening97%2FREO1%2FREO1_L1.mp4?alt=media&token=3b33682a-b5ad-4767-97e7-2201421a338c');

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
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
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
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
      tag: 'imageHero',
      child: Container(
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
                      'Introduction',
                      style: CustomTextStyles.customText(size: FontSizes.large),
                    ),
                    Text(
                        'When we talk about chemistry, what was the first thing that comes up into you mind as a student?'),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Text(
                        'Experimentations? Liquid Substances mixed together to create an explosion? If those things ever crossesyour mind as you hear the words Chemistry, then you’re starting it right'),
                    Text(
                        'The word Chemistry comes from the Greek word “Khēmeia” which means “to cast together” or “pour together”. To introduce you further to the concept of chemistry, we are going to look back on the most famous philosophers of all time, to see what triggers the birth of Chemistry.')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
