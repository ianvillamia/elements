import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Game/elements/gameClass/gameClassMethoxyMethane.dart';
import 'package:mynewapp/Game/miniItems/arrows.dart';
import 'package:mynewapp/Game/miniItems/element.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Models/Element.dart';
import 'package:mynewapp/Providers/gameProvider.dart';
import 'package:mynewapp/Screens/Quiz/timer/timer.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:provider/provider.dart';

class Methoxymethane extends StatefulWidget {
  Methoxymethane({Key key}) : super(key: key);

  @override
  _Element1State createState() => _Element1State();
}

class _Element1State extends State<Methoxymethane> {
  @override
  Widget build(BuildContext context) {
    // CH3-O-CH3
    return Stack(
      children: [
        Positioned(
            top: MethoxymethaneClass.getCoordinate(order: 1).y,
            left: MethoxymethaneClass.getCoordinate(order: 1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 1,
            )),
        Arrows.horizontalLine(x: 170, y: 190),
        Positioned(
            top: MethoxymethaneClass.getCoordinate(order: 2).y,
            left: MethoxymethaneClass.getCoordinate(order: 2).x,
            child: ElementItem(
              place: 2,
              correctElement: 'C',
            )),
        Arrows.horizontalLine(x: 250, y: 190),
        Arrows.verticalLine(x: 220, y: 141),
        Arrows.verticalLine(x: 220, y: 221),
        Positioned(
            top: MethoxymethaneClass.getCoordinate(order: 2.1).y,
            left: MethoxymethaneClass.getCoordinate(order: 2.1).x,
            child: ElementItem(
              place: 2.1,
              correctElement: 'H',
            )),
        Positioned(
            top: MethoxymethaneClass.getCoordinate(order: 2.2).y,
            left: MethoxymethaneClass.getCoordinate(order: 2.2).x,
            child: ElementItem(
              place: 2.2,
              correctElement: 'H',
            )),
        Positioned(
            top: MethoxymethaneClass.getCoordinate(order: 3).y,
            left: MethoxymethaneClass.getCoordinate(order: 3).x,
            child: ElementItem(
              place: 3,
              correctElement: 'O',
            )),
        Arrows.horizontalLine(x: 330, y: 190),
        Positioned(
            top: MethoxymethaneClass.getCoordinate(order: 4).y,
            left: MethoxymethaneClass.getCoordinate(order: 4).x,
            child: ElementItem(
              place: 4,
              correctElement: 'C',
            )),
        Arrows.horizontalLine(x: 410, y: 190),
        Arrows.verticalLine(x: 380, y: 141),
        Arrows.verticalLine(x: 380, y: 221),
        Positioned(
            top: MethoxymethaneClass.getCoordinate(order: 4.1).y,
            left: MethoxymethaneClass.getCoordinate(order: 4.1).x,
            child: ElementItem(
              correctElement: 'H',
              place: 4.1,
            )),
        Positioned(
            top: MethoxymethaneClass.getCoordinate(order: 4.2).y,
            left: MethoxymethaneClass.getCoordinate(order: 4.2).x,
            child: ElementItem(
              correctElement: 'H',
              place: 4.2,
            )),
        Positioned(
            top: MethoxymethaneClass.getCoordinate(order: 5).y,
            left: MethoxymethaneClass.getCoordinate(order: 5).x,
            child: ElementItem(
              correctElement: 'H',
              place: 5,
            )),
      ],
    );
  }
}
