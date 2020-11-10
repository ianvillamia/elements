import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:nima/nima_actor.dart';

class Success extends StatefulWidget {
  Success({Key key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  String _animation = "Tadaaah";
  @override
  void initState() {
    super.initState();
    AudioCache player = new AudioCache();
    const alarmAudioPath = "TADA.mp3";
    player.play(alarmAudioPath);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          print('tapped');
          Navigator.pop(context);
        },
        child: Container(
          width: size.width,
          height: size.height,
          color: Color.fromRGBO(68, 0, 154, 1),
          child: Stack(children: [
            FlareActor(
              "assets/Tadaaah.flr",
              alignment: Alignment.center,
              //fit: BoxFit.contain,
              animation: _animation,
            ),
            NimaActor("assets/robo2",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "Flight"),
            Align(
              alignment: Alignment.center,
              child: JelloIn(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CONGRATS ',
                      style: CustomTextStyles.customText(
                          isBold: true,
                          color: Colors.white,
                          size: FontSizes.heading),
                    ),
                    Text(
                      "you've got it",
                      style: CustomTextStyles.customText(
                          isBold: true,
                          color: Colors.white,
                          size: FontSizes.heading),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "press anywhere to continue",
                      style: CustomTextStyles.customText(
                          isBold: true,
                          color: Colors.white,
                          size: FontSizes.small),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
