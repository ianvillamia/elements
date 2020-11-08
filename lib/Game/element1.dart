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
          child: Text('METHOXYMETHANE'),
        ),
        Positioned(
            top: Element1Values.getCoordinate(order: 1).y,
            left: Element1Values.getCoordinate(order: 1).x,
            child: Temp()),

        Positioned(
            top: Element1Values.getCoordinate(order: 2).y,
            left: Element1Values.getCoordinate(order: 2).x,
            child: Temp()),

        Positioned(
            top: Element1Values.getCoordinate(order: 2.1).y,
            left: Element1Values.getCoordinate(order: 2.1).x,
            child: Temp()),
        Positioned(
            top: Element1Values.getCoordinate(order: 2.2).y,
            left: Element1Values.getCoordinate(order: 2.2).x,
            child: Temp()),

        Positioned(
            top: Element1Values.getCoordinate(order: 3).y,
            left: Element1Values.getCoordinate(order: 3).x,
            child: Temp()),
        // ElementItem(
        //   coordinate: Element1Values.getCoordinate(order: 3),
        //   element: GiveElement.oxygen(),
        // ),
        Positioned(
            top: Element1Values.getCoordinate(order: 4).y,
            left: Element1Values.getCoordinate(order: 4).x,
            child: Temp()),

        Positioned(
            top: Element1Values.getCoordinate(order: 4.1).y,
            left: Element1Values.getCoordinate(order: 4.1).x,
            child: Temp()),

        Positioned(
            top: Element1Values.getCoordinate(order: 4.2).y,
            left: Element1Values.getCoordinate(order: 4.2).x,
            child: Temp()),
        Positioned(
            top: Element1Values.getCoordinate(order: 5).y,
            left: Element1Values.getCoordinate(order: 5).x,
            child: Temp()),
        // ElementItem(
        //   coordinate: Element1Values.getCoordinate(order: 5),
        //   element: GiveElement.hydrogen(),
        // ),
      ],
    );
  }
}

class Temp extends StatefulWidget {
  final double place;
  Temp({this.place});

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
        return true;
      },
      onAccept: (data) {
        setState(() {});
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

class ElementReader {
  bool condition1 = false;
  bool condition2 = false;
  bool condition21 = false;
  bool condition22 = false;
  bool condition3 = false;
  bool condition4 = false;
  bool condition41 = false;
  bool condition42 = false;
  bool condition5 = false;
  bool elementCorrect = false;
  change({double targetElement, ElementModel element}) {
    if (targetElement == 1 && element.element == 'H') {
      this.condition1 = true;
    } else if (targetElement == 2) {
    } else if (targetElement == 2.1) {
    } else if (targetElement == 2.2) {
    } else if (targetElement == 3) {
    } else if (targetElement == 4) {
    } else if (targetElement == 4.1) {
    } else if (targetElement == 4.2) {}
  }

  checkIfCorrect() {
    if (condition1 == true &&
        condition2 == true &&
        condition21 == true &&
        condition22 == true &&
        condition3 == true &&
        condition4 == true &&
        condition41 == true &&
        condition42 == true &&
        condition5 == true) {
      elementCorrect = true;
    }
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
