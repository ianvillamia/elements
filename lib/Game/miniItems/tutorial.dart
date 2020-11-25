import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Game/elementBuilder.dart';
import 'package:video_player/video_player.dart';

class Tutorial extends StatefulWidget {
  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  VideoPlayerController _videoPlayerController;

  ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoPlayerController = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/final-elements.appspot.com/o/tutorial2.mp4?alt=media&token=e0881efc-c7b9-45fa-a106-204879fd23d1');

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        //_showOnCompleteModal();
        _returnBack();
      }
    });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      allowFullScreen: false,
      allowMuting: false,
      fullScreenByDefault: true,
      autoPlay: true,
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  _returnBack() {
    return Navigator.pop(context);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    _chewieController.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 8 / 6,
          child: Chewie(controller: _chewieController),
        ),
      ),
    );
  }
}
