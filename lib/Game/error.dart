import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class ErrorScreen extends StatefulWidget {
  ErrorScreen({Key key}) : super(key: key);

  @override
  _ErrorsState createState() => _ErrorsState();
}

class _ErrorsState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
    AudioCache player = new AudioCache();
    const alarmAudioPath = "GASP.mp3";
    player.play(alarmAudioPath);
  }

  String _animation = "action";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: size.width,
          height: size.height,
          color: Color.fromRGBO(68, 0, 154, 1),
          child: Stack(children: [
            FlareActor(
              "assets/error.flr",
              alignment: Alignment.center,
              //fit: BoxFit.contain,
              animation: _animation,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * .2,
                child: Swing(
                  child: Column(
                    children: [
                      Text(
                        'Ooops wrong answer',
                        style: CustomTextStyles.customText(
                            color: Colors.white,
                            isBold: true,
                            size: FontSizes.large),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'click to try again',
                        style: CustomTextStyles.customText(
                            color: Colors.white,
                            isBold: true,
                            size: FontSizes.small),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
