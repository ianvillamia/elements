import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Providers/gameProvider.dart';

class GameClass {
  static spawnObject({Coordinates coordinates, Spawn spawn}) {
    if (spawn == Spawn.left) {
      Coordinates left = Coordinates();
      left.x = coordinates.x + 102.5;
      left.y = coordinates.y;
      return Positioned(
          top: coordinates.y,
          left: coordinates.x - 102.5,
          child: element(color: Colors.greenAccent, isNull: true));
    } else if (spawn == Spawn.right) {
      Coordinates right = Coordinates();
      right.x = coordinates.x + 112.08;
      right.y = coordinates.y;
      return Positioned(
          top: coordinates.y,
          left: coordinates.x + 112.08,
          child: element(color: Colors.blue, isNull: true));
    } else if (spawn == Spawn.top) {
      Coordinates top = Coordinates();
      top.x = coordinates.x;
      top.y = coordinates.y - 89.28;
      return Positioned(
          top: coordinates.y - 89.28,
          left: coordinates.x,
          child: element(color: Colors.grey, isNull: true));
    } else if (spawn == Spawn.bottom) {
      Coordinates bot = Coordinates();
      bot.x = coordinates.x;
      bot.y = coordinates.y + 89.28;
      return Positioned(
          top: coordinates.y + 89.28,
          left: coordinates.x,
          child: element(color: Colors.amber, isNull: true));
    } else {
      return Positioned(
          top: coordinates.y,
          left: coordinates.x,
          child: element(color: Colors.deepOrange, isNull: true));
    }
  }

  static element({Color color, @required bool isNull, gameProvider}) {
    return GestureDetector(
      onTap: () {
        //elemenclick
      },
      child: ElasticIn(
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isNull ? Colors.grey : gameProvider.element.elementColor,
            ),
            child: Center(
                child: Text(
              isNull ? '+' : gameProvider.element.element,
              style: TextStyle(
                  color:
                      isNull ? Colors.black : gameProvider.element.fontColor),
            )),
          ),
        ),
      ),
    );
  }
}
