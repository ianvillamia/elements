import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audio_cache.dart';
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
        AudioCache player = new AudioCache();
        const alarmAudioPath = "boop.mp3";
        player.play(alarmAudioPath);
        return true;
      },
      onLeave: (data) {
        AudioCache player = new AudioCache();
        player.clearCache();
      },
      onAccept: (data) {
        AudioCache player = new AudioCache();
        const alarmAudioPath = "DOWN.mp3";
        player.play(alarmAudioPath);
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
}
