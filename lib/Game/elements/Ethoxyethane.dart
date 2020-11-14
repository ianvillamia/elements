import 'package:flutter/material.dart';
import 'package:mynewapp/Game/miniItems/arrows.dart';
import 'package:mynewapp/Game/miniItems/element.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class Ethoxyethane extends StatefulWidget {
  Ethoxyethane({Key key}) : super(key: key);

  @override
  _EthoxyethaneState createState() => _EthoxyethaneState();
}

class _EthoxyethaneState extends State<Ethoxyethane> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: Element1Values.getCoordinate(order: 1).y,
            left: Element1Values.getCoordinate(order: 1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 1,
            )),
        Arrows.verticalLine(x: 140, y: 140),
        Arrows.verticalLine(x: 140, y: 220),
        Arrows.horizontalLine(x: 90, y: 190),
        Positioned(
            top: Element1Values.getCoordinate(order: 2).y,
            left: Element1Values.getCoordinate(order: 2).x,
            child: ElementItem(
              place: 2,
              correctElement: 'C',
            )),
        Arrows.verticalLine(x: 220, y: 140),
        Arrows.verticalLine(x: 220, y: 220),
        Arrows.horizontalLine(x: 170, y: 190),
        Positioned(
            top: Element1Values.getCoordinate(order: 2.1).y,
            left: Element1Values.getCoordinate(order: 2.1).x,
            child: ElementItem(
              place: 2.1,
              correctElement: 'H',
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 2.2).y,
            left: Element1Values.getCoordinate(order: 2.2).x,
            child: ElementItem(
              place: 2.2,
              correctElement: 'H',
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 3).y,
            left: Element1Values.getCoordinate(order: 3).x,
            child: ElementItem(
              place: 3,
              correctElement: 'O',
            )),
        Arrows.verticalLine(x: 300, y: 140),
        Arrows.verticalLine(x: 300, y: 220),
        Arrows.horizontalLine(x: 250, y: 190),
        Positioned(
            top: Element1Values.getCoordinate(order: 3.1).y,
            left: Element1Values.getCoordinate(order: 3.1).x,
            child: ElementItem(
              place: 3,
              correctElement: 'O',
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 3.2).y,
            left: Element1Values.getCoordinate(order: 3.2).x,
            child: ElementItem(
              place: 3,
              correctElement: 'O',
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 4).y,
            left: Element1Values.getCoordinate(order: 4).x,
            child: ElementItem(
              place: 4,
              correctElement: 'C',
            )),
        Arrows.verticalLine(x: 380, y: 140),
        Arrows.verticalLine(x: 380, y: 220),
        Arrows.horizontalLine(x: 330, y: 190),
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
              place: 5,
            )),
        Arrows.verticalLine(x: 460, y: 140),
        Arrows.verticalLine(x: 460, y: 220),
        Arrows.horizontalLine(x: 410, y: 190),
        Positioned(
            top: Element1Values.getCoordinate(order: 5.1).y,
            left: Element1Values.getCoordinate(order: 5.1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 5.1,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 5.2).y,
            left: Element1Values.getCoordinate(order: 5.2).x,
            child: ElementItem(
              correctElement: 'H',
              place: 5.2,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 6).y,
            left: Element1Values.getCoordinate(order: 6).x,
            child: ElementItem(
              correctElement: 'H',
              place: 6,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 6.1).y,
            left: Element1Values.getCoordinate(order: 6.1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 6.1,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 6.2).y,
            left: Element1Values.getCoordinate(order: 6.2).x,
            child: ElementItem(
              correctElement: 'H',
              place: 6.2,
            )),
        Arrows.horizontalLine(x: 490, y: 190),
        Positioned(
            top: Element1Values.getCoordinate(order: 7).y,
            left: Element1Values.getCoordinate(order: 7).x,
            child: ElementItem(
              correctElement: 'H',
              place: 7,
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
      coordinate.x = 40;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 120;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 2.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 120;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 2.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 120;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 3) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 200;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 3.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 200;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 3.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 200;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 4) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 280;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 4.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 280;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 4.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 280;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 5) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 360;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 5.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 360;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 5.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 360;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 6) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 440;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 6.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 440;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 6.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 440;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 7) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 520;
      coordinate.y = 170;
      return coordinate;
    }
  }
}
