import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Game/miniItems/arrows.dart';
import 'package:mynewapp/Game/miniItems/element.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Models/Element.dart';
import 'package:mynewapp/Providers/gameProvider.dart';
import 'package:mynewapp/Screens/Quiz/timer/timer.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:provider/provider.dart';

class Propanone extends StatefulWidget {
  Propanone({Key key}) : super(key: key);

  @override
  _Element1State createState() => _Element1State();
}

class _Element1State extends State<Propanone> {
  @override
  Widget build(BuildContext context) {
    // CH3-O-CH3
    return Stack(
      children: [
        Positioned(
            top: Element1Values.getCoordinate(order: 1).y,
            left: Element1Values.getCoordinate(order: 1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 1,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 2).y,
            left: Element1Values.getCoordinate(order: 2).x,
            child: ElementItem(
              correctElement: 'H',
              place: 2,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 2.1).y,
            left: Element1Values.getCoordinate(order: 2.1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 2.1,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 2.2).y,
            left: Element1Values.getCoordinate(order: 2.2).x,
            child: ElementItem(
              correctElement: 'H',
              place: 2.2,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 3).y,
            left: Element1Values.getCoordinate(order: 3).x,
            child: ElementItem(
              correctElement: 'H',
              place: 3,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 4).y,
            left: Element1Values.getCoordinate(order: 4).x,
            child: ElementItem(
              correctElement: 'H',
              place: 4,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 4.1).y,
            left: Element1Values.getCoordinate(order: 4.1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 4.1,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 4.2).y,
            left: Element1Values.getCoordinate(order: 4.2).x,
            child: ElementItem(
              correctElement: 'H',
              place: 4.2,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 5).y,
            left: Element1Values.getCoordinate(order: 5).x,
            child: ElementItem(
              correctElement: 'H',
              place: 4,
            )),
      ],
    );
  }
}

class Element1Values {
  static getCoordinate({double order}) {
    //spacing is 80
    if (order == 1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 100.02857142857144;
      coordinate.y = 170.99428571428572;
      return coordinate;
    } else if (order == 2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 180.02857142857144;
      coordinate.y = 120.99428571428572;
      return coordinate;
    } else if (order == 2.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 140.02857142857144;
      coordinate.y = 50.99428571428572;
      return coordinate;
    } else if (order == 2.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 220.02857142857144;
      coordinate.y = 190.99428571428572;
      return coordinate;
    } else if (order == 3) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 280.02857142857144;
      coordinate.y = 60.99428571428572;
      return coordinate;
    } else if (order == 4) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 380.02857142857144;
      coordinate.y = 120.99428571428572;
      return coordinate;
    } else if (order == 4.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 330.02857142857144;
      coordinate.y = 190.99428571428572;
      return coordinate;
    } else if (order == 4.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 430.02857142857144;
      coordinate.y = 60.99428571428572;
      return coordinate;
    } else if (order == 5) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 440.02857142857144;
      coordinate.y = 180.99428571428572;
      return coordinate;
    }
  }
}
