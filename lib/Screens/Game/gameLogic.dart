import 'package:animate_do/animate_do.dart';
import 'package:mynewapp/Models/Coordinates.dart';
import 'package:mynewapp/Providers/gameProvider.dart';
import 'package:flutter/material.dart';
import 'element.dart' as element;

class GameLogic {
  identifyGroup(
      {@required String element, @required GameProvider gameProvider}) {
    //separates groups of bonds
    List elementGroup = [];
    elementGroup = element.split(" ");
    //isolate elements
    for (var element in elementGroup) {
      List drawItems = [];
      // print(element);
      for (int x = 0; x < element.length; x++) {
        drawItems.add(element[x]);
        if (isNumeric(element[x])) {
          drawItems.remove(element[x - 1]);
          drawItems.remove(element[x]);
          drawItems.add(element[x - 1] + element[x]);
        }
      }
      //  print(drawItems);
      _drawElements(drawItems: drawItems, gameProvider: gameProvider);
      //isolated groups
    }
  }
}

_drawElements({drawItems, GameProvider gameProvider}) {
  Coordinates origin = Coordinates();
  origin.x = 205.02857142857144;
  origin.y = 150.99428571428572;

  for (var item in drawItems) {
    print(item);
    if (elementLoop(item)) {
      _drawChildren(item: item, origin: origin, gameProvider: gameProvider);
      //draw element item loop
    } else {
      // print(item);

      //spawn C

      gameProvider.addElement(ElementItem(
        coordinate: origin,
        element: item,
      ));
    }
  }
}

_drawChildren({item, origin, GameProvider gameProvider}) {
  List things = [];
  //always value of 2 one for the element one for the loop number
  for (int x = 0; x < item.length; x++) {
    things.add(item[x]);
  }
  int loopElement = int.parse(things[1]);
  String element = things[0];
  for (var i = 1; i <= loopElement; i++) {
    if (i == 1) {
      //top
      Coordinates top = Coordinates();
      top.x = origin.x;
      top.y = origin.y - 89.28;
      gameProvider.addElement(ElementItem(
        coordinate: top,
        element: element,
      ));
    } else if (i == 2) {
      //left
      Coordinates left = Coordinates();
      left.x = origin.x - 102.5;
      left.y = origin.y;
      gameProvider.addElement(ElementItem(
        coordinate: left,
        element: element,
      ));
    } else if (i == 3) {
      Coordinates bot = Coordinates();
      bot.x = origin.x;
      bot.y = origin.y + 89.28;
      gameProvider.addElement(ElementItem(
        element: element,
        coordinate: bot,
      ));
      //bottom
    } else if (i == 4) {
      //right
    }
  }
}

class ElementItem extends StatefulWidget {
  final Coordinates coordinate;
  final String element;
  ElementItem({this.coordinate, this.element});

  @override
  _ElementItemState createState() => _ElementItemState();
}

class _ElementItemState extends State<ElementItem> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.coordinate.y,
      left: widget.coordinate.x,
      child: ElasticIn(
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: Colors.grey),
            child: Center(
              child: Text(
                widget.element ?? '+',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*****************************************************************************************************/
//regex'es
bool elementLoop(String x) {
  RegExp _numeric = RegExp(r'\d');
  return _numeric.hasMatch(x);
}

/// check if the string contains only numbers
bool isNumeric(String str) {
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  return _numeric.hasMatch(str);
}
