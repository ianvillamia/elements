import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Game/miniItems/arrows.dart';
import 'package:mynewapp/Game/miniItems/element.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class Propoxybutane extends StatefulWidget {
  Propoxybutane({Key key}) : super(key: key);

  @override
  _EthoxyethaneState createState() => _EthoxyethaneState();
}

class _EthoxyethaneState extends State<Propoxybutane> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: Element1Values.getCoordinate(order: 0).y,
            left: Element1Values.getCoordinate(order: 0).x,
            child: ElementItem(
              correctElement: 'H',
              place: 0,
            )),
        Arrows.horizontalLine(x: 50, y: 190),
        Arrows.verticalLine(x: 100, y: 140),
        Arrows.verticalLine(x: 100, y: 220),
        Positioned(
            top: Element1Values.getCoordinate(order: 1).y,
            left: Element1Values.getCoordinate(order: 1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 1,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 1.1).y,
            left: Element1Values.getCoordinate(order: 1.1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 1.1,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 1.2).y,
            left: Element1Values.getCoordinate(order: 1.2).x,
            child: ElementItem(
              correctElement: 'H',
              place: 1.2,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 2).y,
            left: Element1Values.getCoordinate(order: 2).x,
            child: ElementItem(
              place: 2,
              correctElement: 'C',
            )),
        Arrows.horizontalLine(x: 130, y: 190),
        Arrows.verticalLine(x: 260, y: 140),
        Arrows.verticalLine(x: 260, y: 220),
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
        Arrows.horizontalLine(x: 210, y: 190),
        Arrows.verticalLine(x: 180, y: 140),
        Arrows.verticalLine(x: 180, y: 220),
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
        Arrows.horizontalLine(x: 290, y: 190),
        Positioned(
            top: Element1Values.getCoordinate(order: 5).y,
            left: Element1Values.getCoordinate(order: 5).x,
            child: ElementItem(
              correctElement: 'H',
              place: 5,
            )),
        Arrows.horizontalLine(x: 370, y: 190),
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
        Arrows.verticalLine(x: 420, y: 140),
        Arrows.verticalLine(x: 420, y: 220),
        Arrows.horizontalLine(x: 450, y: 190),
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
        Positioned(
            top: Element1Values.getCoordinate(order: 7).y,
            left: Element1Values.getCoordinate(order: 7).x,
            child: ElementItem(
              correctElement: 'H',
              place: 7,
            )),
        Arrows.verticalLine(x: 500, y: 140),
        Arrows.verticalLine(x: 500, y: 220),
        Arrows.horizontalLine(x: 530, y: 190),
        Positioned(
            top: Element1Values.getCoordinate(order: 7.1).y,
            left: Element1Values.getCoordinate(order: 7.1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 7.1,
            )),
        Arrows.verticalLine(x: 580, y: 140),
        Arrows.verticalLine(x: 580, y: 220),
        Positioned(
          top: 190,
          left: 610,
          child: ElasticIn(
            child: Container(
              width: 20,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black54,
              ),
            ),
          ),
        ),
        Positioned(
            top: Element1Values.getCoordinate(order: 7.2).y,
            left: Element1Values.getCoordinate(order: 7.2).x,
            child: ElementItem(
              correctElement: 'H',
              place: 7.2,
            )),
        Positioned(
            top: Element1Values.getCoordinate(order: 8).y,
            left: Element1Values.getCoordinate(order: 8).x,
            child: ElementItem(
              correctElement: 'H',
              place: 8,
            )),
      ],
    );
  }
}

class Element1Values {
  static getCoordinate({double order}) {
    //spacing is 80
    if (order == 0) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 0;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 80;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 1.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 80;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 1.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 80;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 160;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 2.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 160;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 2.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 160;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 3) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 240;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 3.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 240;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 3.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 240;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 4) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 320;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 4.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 320;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 4.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 320;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 5) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 400;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 5.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 400;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 5.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 400;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 6) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 480;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 6.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 480;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 6.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 480;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 7) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 560;
      coordinate.y = 170;
      return coordinate;
    } else if (order == 7.1) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 560;
      coordinate.y = 90;
      return coordinate;
    } else if (order == 7.2) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 560;
      coordinate.y = 250;
      return coordinate;
    } else if (order == 8) {
      Coordinates coordinate = Coordinates();
      coordinate.x = 630;
      coordinate.y = 170;
      return coordinate;
    }
  }
}
