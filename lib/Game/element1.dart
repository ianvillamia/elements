import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Models/Element.dart';
import 'package:mynewapp/Providers/gameProvider.dart';
import 'package:mynewapp/Screens/Quiz/timer/timer.dart';
import 'package:provider/provider.dart';
import './gameItems.dart';

class Element1 extends StatefulWidget {
  Element1({Key key}) : super(key: key);

  @override
  _Element1State createState() => _Element1State();
}

class _Element1State extends State<Element1> {
  @override
  Widget build(BuildContext context) {
    // CH3-O-CH3
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text('CH3-O-CH3'),
        ),
        Positioned(
            top: 170.99428571428572, left: 120.02857142857144, child: Temp()),

        ElementItem(
          coordinate: Element1Values.getCoordinate(order: 2),
          element: GiveElement.carbon(),
        ),

        //children
        Positioned(
            top: 90.994285714285722, left: 200.02857142857144, child: Temp()),

        ElementItem(
          coordinate: Element1Values.getCoordinate(order: 2.2),
          element: GiveElement.hydrogen(),
        ),

        ElementItem(
          coordinate: Element1Values.getCoordinate(order: 3),
          element: GiveElement.oxygen(),
        ),
        ElementItem(
          coordinate: Element1Values.getCoordinate(order: 4),
          element: GiveElement.carbon(),
        ),
        ElementItem(
          coordinate: Element1Values.getCoordinate(order: 4.1),
          element: GiveElement.hydrogen(),
        ),
        ElementItem(
          coordinate: Element1Values.getCoordinate(order: 4.2),
          element: GiveElement.hydrogen(),
        ),

        ElementItem(
          coordinate: Element1Values.getCoordinate(order: 5),
          element: GiveElement.hydrogen(),
        ),
      ],
    );
  }
}

class Temp extends StatefulWidget {
  Temp({Key key}) : super(key: key);

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  bool accepted = false;
  ElementModel _element = ElementModel();
  GameProvider _gameProvider;

  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, List<String> candidateData, rejectedData) {
        _gameProvider = Provider.of<GameProvider>(context, listen: false);
        return accepted
            ? ElasticIn(
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
        return true;
      },
      onAccept: (data) {
        AudioCache player = new AudioCache();
        const alarmAudioPath = "DOWN.mp3";
        player.play(alarmAudioPath);
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

class Element1Values {
  static getCoordinate({double order}) {
    //spacing is 80
    if (order == 1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 120.02857142857144;
      coordinate.y = 170.99428571428572;
      return coordinate;
    } else if (order == 2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 200.02857142857144;
      coordinate.y = 170.99428571428572;
      return coordinate;
    } else if (order == 2.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 200.02857142857144;
      coordinate.y = 90.99428571428572;
      return coordinate;
    } else if (order == 2.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 200.02857142857144;
      coordinate.y = 250.99428571428572;
      return coordinate;
    } else if (order == 3) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 280.02857142857144;
      coordinate.y = 170.99428571428572;
      return coordinate;
    } else if (order == 4) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 360.02857142857144;
      coordinate.y = 170.99428571428572;
      return coordinate;
    } else if (order == 4.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 360.02857142857144;
      coordinate.y = 90.99428571428572;
      return coordinate;
    } else if (order == 4.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 360.02857142857144;
      coordinate.y = 250.99428571428572;
      return coordinate;
    } else if (order == 5) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 440.02857142857144;
      coordinate.y = 170.99428571428572;
      return coordinate;
    }
  }
}
