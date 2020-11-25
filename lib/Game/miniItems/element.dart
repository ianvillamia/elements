import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Element.dart';

import 'package:mynewapp/Providers/gameProvider.dart';
import 'package:provider/provider.dart';

class ElementItem extends StatefulWidget {
  final double place;
  final String correctElement;
  ElementItem({@required this.place, @required this.correctElement});

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<ElementItem> {
  @override
  bool accepted = false;
  ElementModel _element = ElementModel();
  GameProvider _gameProvider;
  AudioCache player1 = new AudioCache();
  AudioCache player2 = new AudioCache();
  AudioPlayer audioPlayer;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DragTarget(
      builder: (context, List<String> candidateData, rejectedData) {
        _gameProvider = Provider.of<GameProvider>(context, listen: false);
        return accepted
            ? ElasticIn(
                key: UniqueKey(),
                child: ClipOval(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: _element.elementColor),
                    child: Center(
                      child: Text(
                        _element.element,
                        style: TextStyle(color: _element.fontColor),
                      ),
                    ),
                  ),
                ),
              )
            : ElasticIn(
                key: UniqueKey(),
                child: ClipOval(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
      },
      onWillAccept: (data) {
        const alarmAudioPath = "boop.mp3";
        //   audioPlayer = await player.play(url);
        //  player.play(alarmAudioPath);
        playLocal1(alarmAudioPath);
        return true;
      },
      onLeave: (data) {
        player1.clearCache();
      },
      onAccept: (data) {
        const alarmAudioPath = "DOWN.mp3";
        playLocal2(alarmAudioPath);
        _gameProvider.elementReader.change(
            element: widget.correctElement, targetElement: widget.place);

        setState(() {
          accepted = true;
          _element.element = _gameProvider.element.element;
          _element.fontColor = _gameProvider.element.fontColor;
          _element.elementColor = _gameProvider.element.elementColor;
        });
      },
    );
  }

  playLocal1(url) async {
    player1.clearCache();
    audioPlayer = await player1.play(url); //audio play function
  }

  playLocal2(url) async {
    player2.clearCache();
    audioPlayer = await player2.play(url); //audio play function
  }
}
